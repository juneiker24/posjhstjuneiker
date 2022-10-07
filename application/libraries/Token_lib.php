<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once(APPPATH . 'models/tokens/Token.php');

/**
 * Token library
 *
 * Library with utilities to manage tokens
 */

class Token_lib
{
	private $CI;

	public function __construct()
	{
		$this->CI =& get_instance();
	}

	/**
	 * Expands all of the tokens found in a given text string and returns the results.
	 */
	public function render($tokened_text, $tokens = array(), $save = TRUE)
	{
		// Apply the transformation for the "%" tokens if any are used
		if(strpos($tokened_text, '%') !== FALSE)
		{
			$tokened_text = strftime($tokened_text);
		}

		// Call scan to build an array of all of the tokens used in the text to be transformed
		$token_tree = $this->scan($tokened_text);

		if(empty($token_tree))
		{
			if(strpos($tokened_text, '%') !== FALSE)
			{
				return strftime($tokened_text);
			}
			else
			{
				return $tokened_text;
			}
		}

		$token_values = array();
		$tokens_to_replace = array();
		$this->generate($token_tree, $tokens_to_replace, $token_values, $tokens, $save);

		return str_replace($tokens_to_replace, $token_values, $tokened_text);
	}

	/**
	 * Parses out the all of the tokens enclosed in braces {} and subparses on the colon : character where supplied
	 */
	public function scan($text)
	{
		// Matches tokens with the following pattern: [$token:$length]
		preg_match_all('/
				\{             # [ - pattern start
				([^\s\{\}:]+)  # match $token not containing whitespace : { or }
				(?:
				:              # : - separator
				([^\s\{\}:]+)     # match $length not containing whitespace : { or }
				)?
				\}             # ] - pattern end
				/x', $text, $matches);

		$tokens = $matches[1];
		$lengths = $matches[2];

		$token_tree = array();
		for($i = 0; $i < count($tokens); $i++)
		{
			$token_tree[$tokens[$i]][$lengths[$i]] = $matches[0][$i];
		}

		return $token_tree;
	}

	public function parse_barcode(&$quantity, &$price,  &$item_id_or_number_or_item_kit_or_receipt)
	{
		$barcode_formats = json_decode($this->CI->config->item('barcode_formats'));
		$barcode_tokens = Token::get_barcode_tokens();

		if(!empty($barcode_formats))
		{
			foreach($barcode_formats as $barcode_format)
			{
				$parsed_results = $this->parse($item_id_or_number_or_item_kit_or_receipt, $barcode_format, $barcode_tokens);
				$quantity = (isset($parsed_results['W'])) ? (int) $parsed_results['W'] / 1000 : 1;
				$item_id_or_number_or_item_kit_or_receipt = (isset($parsed_results['I'])) ?
					$parsed_results['I'] : $item_id_or_number_or_item_kit_or_receipt;
				$price = (isset($parsed_results['P'])) ? (double) $parsed_results['P'] : NULL;
			}
		}
		else 
		{
			$quantity = 1;
		}
	
	}

	public function parse($string, $pattern, $tokens = array())
	{
		$token_tree = $this->scan($pattern);

		$found_tokens = array();
		foreach ($token_tree as $token_id => $token_length)
		{
			foreach ($tokens as $token)
			{
				if ($token->token_id() == $token_id)
				{
					$found_tokens[] = $token;
					$keys = array_keys($token_length);
					$length = array_shift($keys);
					$pattern = str_replace(array_shift($token_length), "({$token->get_value()}{".$length."})", $pattern);
				}
			}
		}

		$results = array();

		if (preg_match("/$pattern/", $string, $matches))
		{
			foreach($found_tokens as $token)
			{
				$index = array_search($token, $found_tokens);
				$match = $matches[$index+1];
				$results[$token->token_id()] = $match;
			}
		}

		return $results;
	}

	public function generate($used_tokens, &$tokens_to_replace, &$token_values, $tokens, $save = TRUE)
	{
		foreach($used_tokens as $token_code => $token_info)
		{
			// Generate value here based on the key value
			$token_value = $this->resolve_token($token_code, array(), $save);

			foreach($token_info as $length => $token_spec)
			{
				$tokens_to_replace[] = $token_spec;
				if(!empty($length))
				{
					$token_values[] = str_pad($token_value, $length, '0', STR_PAD_LEFT);
				}
				else
				{
					$token_values[] = $token_value;
				}
			}
		}

		return $token_values;
	}

	private function resolve_token($token_code, $tokens = array(), $save = TRUE)
	{
		foreach(array_merge($tokens, Token::get_tokens()) as $token)
		{
			if($token->token_id() == $token_code)
			{
				return $token->get_value($save);
			}
		}

		return '';
	}
}

?>
