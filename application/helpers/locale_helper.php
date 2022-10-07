<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

const DEFAULT_LANGUAGE = 'english';
const DEFAULT_LANGUAGE_CODE = 'en-US';

define('NOW', time());
define('MAX_PRECISION', 1e14);
define('DEFAULT_PRECISION', 2);
define('DEFAULT_DATE', mktime(0, 0, 0, 1, 1, 2010));
define('DEFAULT_DATETIME', mktime(0, 0, 0, 1, 1, 2010));

/**
 * Currency locale helper
 */

function current_language_code($load_system_language = FALSE)
{
	$employee = get_instance()->Employee;

	// Returns the language code of the employee if set or system language code if not
	if($employee->is_logged_in() && $load_system_language != TRUE)
	{
		$employee_info = $employee->get_logged_in_employee_info();

		if(property_exists($employee_info, 'language_code') && !empty($employee_info->language_code))
		{
			return $employee_info->language_code;
		}
	}

	$language_code = get_instance()->config->item('language_code');

	return empty($language_code) ? DEFAULT_LANGUAGE_CODE : $language_code;
}

function current_language($load_system_language = FALSE)
{
	$employee = get_instance()->Employee;

	// Returns the language of the employee if set or system language if not
	if($employee->is_logged_in() && $load_system_language != TRUE)
	{
		$employee_info = $employee->get_logged_in_employee_info();
		if(property_exists($employee_info, 'language') && !empty($employee_info->language))
		{
			return $employee_info->language;
		}
	}

	$language = get_instance()->config->item('language');

	return empty($language) ? DEFAULT_LANGUAGE : $language;
}

function get_languages()
{
	return array(

		'en-US:english' => 'English (United States)',
		'es:spanish' => 'Spanish',
		'es-MX:spanish' => 'Spanish (Mexico)',
		'fr:french' => 'French',

	);
}

function load_language($load_system_language = FALSE, array $lang_array)
{
	$lang = get_instance()->lang;

	if($load_system_language = TRUE)
	{
		foreach($lang_array as $language_file)
		{
			$lang->load($language_file, current_language_code(TRUE));
		}
	}
	else
	{
		foreach($lang_array as $language_file)
		{
			$lang->load($language_file, current_language_code());
		}
	}
}

function get_timezones()
{
	return array(
		'America/Caracas' => '(GMT-04:30) Caracas/Venezuela',		
		'Pacific/Midway' => '(GMT-11:00) Midway Island, Samoa',
		'America/Adak' => '(GMT-10:00) Hawaii-Aleutian',
		'Etc/GMT+10' => '(GMT-10:00) Hawaii',
		'Pacific/Marquesas' => '(GMT-09:30) Marquesas Islands',
		'Pacific/Gambier' => '(GMT-09:00) Gambier Islands',
		'America/Anchorage' => '(GMT-09:00) Alaska',
		'America/Ensenada' => '(GMT-08:00) Tijuana, Baja California',
		'Etc/GMT+8' => '(GMT-08:00) Pitcairn Islands',
		'America/Los_Angeles' => '(GMT-08:00) Pacific Time (US & Canada)',
		'America/Denver' => '(GMT-07:00) Mountain Time (US & Canada)',
		'America/Chihuahua' => '(GMT-07:00) Chihuahua, La Paz, Mazatlan',
		'America/Dawson_Creek' => '(GMT-07:00) Arizona',
		'America/Belize' => '(GMT-06:00) Saskatchewan, Central America',
		'America/Mexico_City' => '(GMT-06:00) Guadalajara, Mexico City, Monterrey',
		'Chile/EasterIsland' => '(GMT-06:00) Easter Island',
		'America/Chicago' => '(GMT-06:00) Central Time (US & Canada)',
		'America/New_York' => '(GMT-05:00) Eastern Time (US & Canada)',
		'America/Cancun' => '(GMT-05:00) Cancun',
		'America/Havana' => '(GMT-05:00) Cuba',
		'America/Bogota' => '(GMT-05:00) Bogota, Lima, Quito, Rio Branco',

	);
}

function get_dateformats()
{
	return array(
		'd/m/Y' => 'dd/mm/yyyy',
		'd.m.Y' => 'dd.mm.yyyy',
		'm/d/Y' => 'mm/dd/yyyy',
		'Y/m/d' => 'yyyy/mm/dd',
		'd/m/y' => 'dd/mm/yy',
		'm/d/y' => 'mm/dd/yy',
		'y/m/d' => 'yy/mm/dd'
	);
}

function get_timeformats()
{
	return array(
		'H:i:s' => 'hh:mm:ss (24 Horas)',
		'h:i:s a' => 'hh:mm:ss am/pm',
		'h:i:s A' => 'hh:mm:ss AM/PM'
	);
}


/*
 Gets the payment options
 */
function get_payment_options()
{
	$config = get_instance()->config;
	$lang = get_instance()->lang;

	$payments = [];


	if($config->item('payment_options_order') == 'debitcreditcash')
	{
		$payments[$lang->line('sales_debit')] = $lang->line('sales_debit');
		$payments[$lang->line('sales_credit')] = $lang->line('sales_credit');
		$payments[$lang->line('sales_cash')] = $lang->line('sales_cash');
	}
	elseif($config->item('payment_options_order') == 'debitcashcredit')
	{
		$payments[$lang->line('sales_debit')] = $lang->line('sales_debit');
		$payments[$lang->line('sales_cash')] = $lang->line('sales_cash');
		$payments[$lang->line('sales_credit')] = $lang->line('sales_credit');
	}
	elseif($config->item('payment_options_order') == 'creditdebitcash')
	{
		$payments[$lang->line('sales_credit')] = $lang->line('sales_credit');
		$payments[$lang->line('sales_debit')] = $lang->line('sales_debit');
		$payments[$lang->line('sales_cash')] = $lang->line('sales_cash');
	}
	elseif($config->item('payment_options_order') == 'creditcashdebit')
	{
		$payments[$lang->line('sales_credit')] = $lang->line('sales_credit');
		$payments[$lang->line('sales_cash')] = $lang->line('sales_cash');
		$payments[$lang->line('sales_debit')] = $lang->line('sales_debit');
	}
	else // default: if($config->item('payment_options_order') == 'cashdebitcredit')
	{
		$payments[$lang->line('sales_cash')] = $lang->line('sales_cash');
		$payments[$lang->line('sales_debit')] = $lang->line('sales_debit');
		$payments[$lang->line('sales_credit')] = $lang->line('sales_credit');
	}

	$payments[$lang->line('sales_due')] = $lang->line('sales_due');
	$payments[$lang->line('sales_check')] = $lang->line('sales_check');

	// If India (list of country codes include India) then include Unified Payment Interface
	if (stripos(get_instance()->config->item('country_codes'), 'IN') !== false)
	{
		$payments[$lang->line('sales_upi')] = $lang->line('sales_upi');
	}

	return $payments;
}

function currency_side()
{
	$config = get_instance()->config;

	$fmt = new \NumberFormatter($config->item('number_locale'), \NumberFormatter::CURRENCY);
	$fmt->setSymbol(\NumberFormatter::CURRENCY_SYMBOL, $config->item('currency_symbol'));

	return !preg_match('/^¤/', $fmt->getPattern());
}

function quantity_decimals()
{
	$config = get_instance()->config;

	return $config->item('quantity_decimals') ? $config->item('quantity_decimals') : 0;
}

function totals_decimals()
{
	$config = get_instance()->config;

	return $config->item('currency_decimals') ? $config->item('currency_decimals') : 0;
}

function cash_decimals()
{
	$config = get_instance()->config;

	return $config->item('cash_decimals') ? $config->item('cash_decimals') : 0;
}

function tax_decimals()
{
	$config = get_instance()->config;

	return $config->item('tax_decimals') ? $config->item('tax_decimals') : 0;
}

function to_date($date = DEFAULT_DATE)
{
	$config = get_instance()->config;

	return date($config->item('dateformat'), $date);
}

function to_datetime($datetime = DEFAULT_DATETIME)
{
	$config = get_instance()->config;

	return date($config->item('dateformat') . ' ' . $config->item('timeformat'), $datetime);
}

function to_currency($number)
{
	return to_decimals($number, 'currency_decimals', \NumberFormatter::CURRENCY);
}

function to_currency_no_money($number)
{
	return to_decimals($number, 'currency_decimals');
}

function to_currency_tax($number)
{
	$config = get_instance()->config;

	if($config->item('tax_included') == '1')
	{
		return to_decimals($number, 'tax_decimals', \NumberFormatter::CURRENCY);
	}
	else
	{
		return to_decimals($number, 'currency_decimals', \NumberFormatter::CURRENCY);
	}
}

function to_tax_decimals($number)
{
	// taxes that are NULL, '' or 0 don't need to be displayed
	// NOTE: do not remove this line otherwise the items edit form will show a tax with 0 and it will save it
	if(empty($number))
	{
		return $number;
	}

	return to_decimals($number, 'tax_decimals');
}

function to_quantity_decimals($number)
{
	return to_decimals($number, 'quantity_decimals');
}

function to_decimals($number, $decimals = NULL, $type=\NumberFormatter::DECIMAL)
{
	// ignore empty strings and return
	// NOTE: do not change it to empty otherwise tables will show a 0 with no decimal nor currency symbol
	if(!isset($number))
	{
		return $number;
	}

	$config = get_instance()->config;
	$fmt = new \NumberFormatter($config->item('number_locale'), $type);
	$fmt->setAttribute(\NumberFormatter::MIN_FRACTION_DIGITS, empty($decimals) ? DEFAULT_PRECISION : $config->item($decimals));
	$fmt->setAttribute(\NumberFormatter::MAX_FRACTION_DIGITS, empty($decimals) ? DEFAULT_PRECISION : $config->item($decimals));

	if(empty($config->item('thousands_separator')))
	{
		$fmt->setAttribute(\NumberFormatter::GROUPING_SEPARATOR_SYMBOL, '');
	}
	$fmt->setSymbol(\NumberFormatter::CURRENCY_SYMBOL, $config->item('currency_symbol'));

	return $fmt->format($number);
}

function parse_quantity($number)
{
	return parse_decimals($number, quantity_decimals());
}

function parse_tax($number)
{
	return parse_decimals($number, tax_decimals());
}

function parse_decimals($number, $decimals = NULL)
{
	// ignore empty strings and return
	if(empty($number))
	{
		return $number;
	}

	if ($number > MAX_PRECISION)
	{
		return FALSE;
	}

	if ($number > 1.e14)
	{
		return FALSE;
	}

	$config = get_instance()->config;

	if($decimals === NULL)
	{
		$decimals = $config->item('currency_decimals');
	}

	$fmt = new \NumberFormatter($config->item('number_locale'), \NumberFormatter::DECIMAL);

	if(empty($config->item('thousands_separator')))
	{
		$fmt->setAttribute(\NumberFormatter::GROUPING_SEPARATOR_SYMBOL, '');
	}

	try
	{
		return $fmt->parse($number);
	}
	catch(Exception $e)
	{
		return FALSE;
	}
}

/*
 * Time locale conversion utility
 */

function dateformat_momentjs($php_format)
{
	$SYMBOLS_MATCHING = array(
		'd' => 'DD',
		'D' => 'ddd',
		'j' => 'D',
		'l' => 'dddd',
		'N' => 'E',
		'S' => 'o',
		'w' => 'e',
		'z' => 'DDD',
		'W' => 'W',
		'F' => 'MMMM',
		'm' => 'MM',
		'M' => 'MMM',
		'n' => 'M',
		't' => '', // no equivalent
		'L' => '', // no equivalent
		'o' => 'YYYY',
		'Y' => 'YYYY',
		'y' => 'YY',
		'a' => 'a',
		'A' => 'A',
		'B' => '', // no equivalent
		'g' => 'h',
		'G' => 'H',
		'h' => 'hh',
		'H' => 'HH',
		'i' => 'mm',
		's' => 'ss',
		'u' => 'SSS',
		'e' => 'zz', // deprecated since version $1.6.0 of moment.js
		'I' => '', // no equivalent
		'O' => '', // no equivalent
		'P' => '', // no equivalent
		'T' => '', // no equivalent
		'Z' => '', // no equivalent
		'c' => '', // no equivalent
		'r' => '', // no equivalent
		'U' => 'X'
	);

	return strtr($php_format, $SYMBOLS_MATCHING);
}

function dateformat_mysql()
{
	$config = get_instance()->config;
	$php_format = $config->item('dateformat');

	$SYMBOLS_MATCHING = array(
		// Day
		'd' => '%d',
		'D' => '%a',
		'j' => '%e',
		'l' => '%W',
		'N' => '',
		'S' => '',
		'w' => '',
		'z' => '',
		// Week
		'W' => '',
		// Month
		'F' => '',
		'm' => '%m',
		'M' => '%b',
		'n' => '%c',
		't' => '',
		// Year
		'L' => '',
		'o' => '',
		'Y' => '%Y',
		'y' => '%y',
		// Time
		'a' => '',
		'A' => '%p',
		'B' => '',
		'g' => '%l',
		'G' => '%k',
		'h' => '%H',
		'H' => '%k',
		'i' => '%i',
		's' => '%S',
		'u' => '%f'
	);

	return strtr($php_format, $SYMBOLS_MATCHING);
}

function dateformat_bootstrap($php_format)
{
	$SYMBOLS_MATCHING = array(
		// Day
		'd' => 'dd',
		'D' => 'd',
		'j' => 'd',
		'l' => 'dd',
		'N' => '',
		'S' => '',
		'w' => '',
		'z' => '',
		// Week
		'W' => '',
		// Month
		'F' => 'MM',
		'm' => 'mm',
		'M' => 'M',
		'n' => 'm',
		't' => '',
		// Year
		'L' => '',
		'o' => '',
		'Y' => 'yyyy',
		'y' => 'yy',
		// Time
		'a' => 'p',
		'A' => 'P',
		'B' => '',
		'g' => 'H',
		'G' => 'h',
		'h' => 'HH',
		'H' => 'hh',
		'i' => 'ii',
		's' => 'ss',
		'u' => ''
	);

	return strtr($php_format, $SYMBOLS_MATCHING);
}

function valid_date($date)
{
	$config = get_instance()->Appconfig;
	return (DateTime::createFromFormat($config->get('dateformat'), $date));
}

function valid_decimal($decimal)
{
	return (preg_match('/^(\d*\.)?\d+$/', $decimal) === 1);
}

?>
