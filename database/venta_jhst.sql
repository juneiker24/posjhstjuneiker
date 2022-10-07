-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2022 a las 13:55:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `venta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_app_config`
--

CREATE TABLE `jhst_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_app_config`
--

INSERT INTO `jhst_app_config` (`key`, `value`) VALUES
('address', '123 Nowhere street'),
('allow_duplicate_barcodes', '0'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_formats', '[]'),
('barcode_generate_if_empty', '0'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'Code39'),
('barcode_width', '250'),
('cash_decimals', '2'),
('cash_rounding_code', '1'),
('category_dropdown', '0'),
('company', 'COBECA SISTEMA DE VENTAS'),
('company_logo', 'company_logo1.png'),
('country_codes', 've'),
('currency_code', 'Bolivar'),
('currency_decimals', '2'),
('currency_symbol', 'Bs'),
('customer_reward_enable', '0'),
('dateformat', 'm/d/Y'),
('date_or_time_format', ''),
('default_receivings_discount', '0'),
('default_receivings_discount_type', '0'),
('default_register_mode', 'sale'),
('default_sales_discount', '0'),
('default_sales_discount_type', '0'),
('default_tax_1_name', ''),
('default_tax_1_rate', ''),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_category', 'Standard'),
('default_tax_code', ''),
('default_tax_jurisdiction', ''),
('default_tax_rate', '8'),
('derive_sale_quantity', '0'),
('dinner_table_enable', '0'),
('email', 'CORREOS@cobeca.com'),
('email_receipt_check_behaviour', 'last'),
('enforce_privacy', ''),
('fax', ''),
('financial_year', '1'),
('gcaptcha_enable', '0'),
('gcaptcha_secret_key', ''),
('gcaptcha_site_key', ''),
('giftcard_number', 'series'),
('image_allowed_types', 'jpg|gif|svg|png'),
('image_max_height', '480'),
('image_max_size', '128'),
('image_max_width', '640'),
('include_hsn', '0'),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear {CU}, In attachment the receipt for sale {ISEQ}'),
('invoice_enable', '1'),
('invoice_type', 'invoice'),
('language', 'spanish'),
('language_code', 'es'),
('last_used_invoice_number', '0'),
('last_used_quote_number', '0'),
('last_used_work_order_number', '0'),
('lines_per_page', '50'),
('line_sequence', '0'),
('login_form', 'floating_labels'),
('mailpath', '/usr/sbin/sendmail'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('multi_pack_enabled', '0'),
('notify_horizontal_position', 'center'),
('notify_vertical_position', 'bottom'),
('number_locale', 'en_US'),
('payment_options_order', 'cashdebitcredit'),
('phone', '04247031765'),
('print_bottom_margin', '0'),
('print_delay_autoreturn', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_receipt_check_behaviour', 'last'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('protocol', 'mail'),
('quantity_decimals', '0'),
('quote_default_comments', 'This is a default quote comment'),
('receipt_font_size', '12'),
('receipt_show_company_name', '1'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_taxes', '0'),
('receipt_show_tax_ind', '0'),
('receipt_show_total_discount', '1'),
('receipt_template', 'receipt_default'),
('receiving_calculate_average_price', '0'),
('recv_invoice_format', '{CO}'),
('return_policy', 'Test'),
('sales_invoice_format', '{CO}'),
('sales_quote_format', 'Q%y{QSEQ:6}'),
('smtp_crypto', 'ssl'),
('smtp_host', ''),
('smtp_pass', ''),
('smtp_port', '465'),
('smtp_timeout', '5'),
('smtp_user', ''),
('suggestions_first_column', 'name'),
('suggestions_second_column', ''),
('suggestions_third_column', ''),
('tax_decimals', '2'),
('tax_id', ''),
('tax_included', '0'),
('theme', 'flatly'),
('thousands_separator', '1'),
('timeformat', 'H:i:s'),
('timezone', 'America/Caracas'),
('use_destination_based_tax', '0'),
('website', 'grupocobeca.com'),
('work_order_enable', '0'),
('work_order_format', 'W%y{WSEQ:6}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_attribute_definitions`
--

CREATE TABLE `jhst_attribute_definitions` (
  `definition_id` int(10) NOT NULL,
  `definition_name` varchar(255) NOT NULL,
  `definition_type` varchar(45) NOT NULL,
  `definition_unit` varchar(16) DEFAULT NULL,
  `definition_flags` tinyint(1) NOT NULL,
  `definition_fk` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_attribute_links`
--

CREATE TABLE `jhst_attribute_links` (
  `attribute_id` int(11) DEFAULT NULL,
  `definition_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `receiving_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_attribute_values`
--

CREATE TABLE `jhst_attribute_values` (
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `attribute_date` date DEFAULT NULL,
  `attribute_decimal` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_cash_up`
--

CREATE TABLE `jhst_cash_up` (
  `cashup_id` int(10) NOT NULL,
  `open_date` timestamp NULL DEFAULT current_timestamp(),
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` int(1) NOT NULL,
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `open_employee_id` int(10) NOT NULL,
  `close_employee_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `closed_amount_due` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--cobeca 2022 juneiker y yoel reatiga 
--
-- Estructura de tabla para la tabla `jhst_customers`
--

CREATE TABLE `jhst_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT 1,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `employee_id` int(10) NOT NULL,
  `consent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_customers_packages`
--

CREATE TABLE `jhst_customers_packages` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--2021 araibel gomez y juneiker en drogerias mafarta
-- Volcado de datos para la tabla `jhst_customers_packages`
--

INSERT INTO `jhst_customers_packages` (`package_id`, `package_name`, `points_percent`, `deleted`) VALUES
(1, 'Default', 0, 0),
(2, 'Bronze', 10, 0),
(3, 'Silver', 20, 0),
(4, 'Gold', 30, 0),
(5, 'Premium', 50, 0);

-- --------------------------------------------------------

--vicky (orbis) para juneiker y mi persona usamos la tabla en el sistema cpad para ver un orden las personas por customer para crear un orden del cliente cree el id por factor 
-- Estructura de tabla para la tabla `jhst_customers_points`
--

CREATE TABLE `jhst_customers_points` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_dinner_tables`
--

CREATE TABLE `jhst_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_dinner_tables`
--

INSERT INTO `jhst_dinner_tables` (`dinner_table_id`, `name`, `status`, `deleted`) VALUES
(1, 'Delivery', 0, 0),
(2, 'Take Away', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_employees`
--

CREATE TABLE `jhst_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `hash_version` tinyint(1) NOT NULL DEFAULT 2,
  `language` varchar(48) DEFAULT NULL,
  `language_code` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_employees`mi ultima clase de undemy crear un hash de contraseña encriptada con lenguae bajo vulcan
--

INSERT INTO `jhst_employees` (`username`, `password`, `person_id`, `deleted`, `hash_version`, `language`, `language_code`) VALUES
('admin', '$2y$10$O0WcfccO65jwWnMoCjp04u4AMQylE/f0Hem346CBAWhe2CJBBk2Mu', 1, 0, 2, 'spanish', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_expenses`
--

CREATE TABLE `jhst_expenses` (
  `expense_id` int(10) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `supplier_tax_code` varchar(255) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_expense_categories` datos de las categories para ver nombres u las id de cada una estas pueden pasar a estatus 1 o 0 para no mostrar en la web 
--

CREATE TABLE `jhst_expense_categories` (
  `expense_category_id` int(10) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_giftcards`
--

CREATE TABLE `jhst_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `giftcard_id` int(11) NOT NULL,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `person_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_grants`
--

CREATE TABLE `jhst_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) DEFAULT 'home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_grants`
--

INSERT INTO `jhst_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('attributes', 1, 'office'),
('cashups', 1, 'home'),
('config', 1, 'office'),
('customers', 1, 'home'),
('employees', 1, 'office'),
('expenses', 1, 'home'),
('expenses_categories', 1, 'office'),
('giftcards', 1, 'home'),
('home', 1, 'office'),
('items', 1, 'home'),
('items_stock', 1, '--'),
('item_kits', 1, 'home'),
('messages', 1, 'home'),
('office', 1, 'home'),
('receivings', 1, 'home'),
('receivings_stock', 1, '--'),
('reports', 1, 'home'),
('reports_categories', 1, '--'),
('reports_customers', 1, '--'),
('reports_discounts', 1, '--'),
('reports_employees', 1, '--'),
('reports_expenses_categories', 1, '--'),
('reports_inventory', 1, '--'),
('reports_items', 1, '--'),
('reports_payments', 1, '--'),
('reports_receivings', 1, '--'),
('reports_sales', 1, '--'),
('reports_sales_taxes', 1, '--'),
('reports_suppliers', 1, '--'),
('reports_taxes', 1, '--'),
('sales', 1, 'home'),
('sales_change_price', 1, '--'),
('sales_delete', 1, '--'),
('sales_stock', 1, '--'),
('suppliers', 1, 'home'),
('taxes', 1, 'office');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_inventory`
--

CREATE TABLE `jhst_inventory` (
  `trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT 0,
  `trans_user` int(11) NOT NULL DEFAULT 0,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_items`
--

CREATE TABLE `jhst_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT 0.000,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT 1.000,
  `item_id` int(10) NOT NULL,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_type` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `tax_category_id` int(10) DEFAULT NULL,
  `qty_per_pack` decimal(15,3) NOT NULL DEFAULT 1.000,
  `pack_name` varchar(8) DEFAULT 'Each',
  `low_sell_item_id` int(10) DEFAULT 0,
  `hsn_code` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_items_taxes`
--

CREATE TABLE `jhst_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_item_kits`
--

CREATE TABLE `jhst_item_kits` (
  `item_kit_id` int(11) NOT NULL,
  `item_kit_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `kit_discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `kit_discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `price_option` tinyint(1) NOT NULL DEFAULT 0,
  `print_option` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_item_kit_items`
--

CREATE TABLE `jhst_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_item_quantities`
--

CREATE TABLE `jhst_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_migrations`
--

CREATE TABLE `jhst_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_migrations`
--

INSERT INTO `jhst_migrations` (`version`) VALUES
(20210714140000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_modules`
--

CREATE TABLE `jhst_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_modules`
--

INSERT INTO `jhst_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_attributes', 'module_attributes_desc', 107, 'attributes'),
('module_cashups', 'module_cashups_desc', 110, 'cashups'),
('module_config', 'module_config_desc', 900, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_expenses', 'module_expenses_desc', 108, 'expenses'),
('module_expenses_categories', 'module_expenses_categories_desc', 109, 'expenses_categories'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_home', 'module_home_desc', 1, 'home'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_messages', 'module_messages_desc', 98, 'messages'),
('module_office', 'module_office_desc', 999, 'office'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers'),
('module_taxes', 'module_taxes_desc', 105, 'taxes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_people`
--

CREATE TABLE `jhst_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_people`
--

INSERT INTO `jhst_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('Super', 'Admin', 1, '04247031765', 'jrtecnologit@example.com', 'direccion 1', '', '', '', '', 'venezuela', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_permissions`
--

CREATE TABLE `jhst_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_permissions`
--

INSERT INTO `jhst_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('attributes', 'attributes', NULL),
('cashups', 'cashups', NULL),
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('expenses', 'expenses', NULL),
('expenses_categories', 'expenses_categories', NULL),
('giftcards', 'giftcards', NULL),
('home', 'home', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('messages', 'messages', NULL),
('office', 'office', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_expenses_categories', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_sales_taxes', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_change_price', 'sales', NULL),
('sales_delete', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL),
('taxes', 'taxes', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_receivings`
--

CREATE TABLE `jhst_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_receivings_items`
--

CREATE TABLE `jhst_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT 1.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales`
--

CREATE TABLE `jhst_sales` (
  `sale_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL,
  `sale_status` tinyint(1) NOT NULL DEFAULT 0,
  `dinner_table_id` int(11) DEFAULT NULL,
  `work_order_number` varchar(32) DEFAULT NULL,
  `sale_type` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales_items`
--

CREATE TABLE `jhst_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales_items_taxes`
--

CREATE TABLE `jhst_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_type` tinyint(1) NOT NULL DEFAULT 0,
  `rounding_code` tinyint(1) NOT NULL DEFAULT 0,
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales_payments`
--

CREATE TABLE `jhst_sales_payments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT 0.00,
  `cash_adjustment` tinyint(4) NOT NULL DEFAULT 0,
  `employee_id` int(11) DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_code` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales_reward_points`
--

CREATE TABLE `jhst_sales_reward_points` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sales_taxes`
--

CREATE TABLE `jhst_sales_taxes` (
  `sales_taxes_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `rounding_code` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_sessions`
--

CREATE TABLE `jhst_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_sessions`
--

INSERT INTO `jhst_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('f21lutnbn7p3o20seab3dtc4unjvq3fh', '::1', 1658490310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635383439303331303b),
('la44qci98l5d1i78llvj4hdtai7al6hu', '::1', 1658490310, ''),
('do18uo3kegso671e4dsvcus9f9kdeofp', '::1', 1658490434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635383439303332353b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a363a226f6666696365223b),
('1bfcclpqu79gunor5ntjsrb64f0dtan8', '::1', 1658490889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635383439303838393b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a363a226f6666696365223b),
('c8gvepp4oglgmopb793ealn69ng4jufe', '::1', 1658490907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635383439303838393b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_stock_locations`
--

CREATE TABLE `jhst_stock_locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jhst_stock_locations`
--

INSERT INTO `jhst_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_suppliers`
--

CREATE TABLE `jhst_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_tax_categories`
--

CREATE TABLE `jhst_tax_categories` (
  `tax_category_id` int(10) NOT NULL,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_tax_codes`
--

CREATE TABLE `jhst_tax_codes` (
  `tax_code_id` int(11) NOT NULL,
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_tax_jurisdictions`
--

CREATE TABLE `jhst_tax_jurisdictions` (
  `jurisdiction_id` int(11) NOT NULL,
  `jurisdiction_name` varchar(255) DEFAULT NULL,
  `tax_group` varchar(32) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jhst_tax_rates`
--

CREATE TABLE `jhst_tax_rates` (
  `tax_rate_id` int(11) NOT NULL,
  `rate_tax_code_id` int(11) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `rate_jurisdiction_id` int(11) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_rounding_code` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jhst_app_config`
--
ALTER TABLE `jhst_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `jhst_attribute_definitions`
--
ALTER TABLE `jhst_attribute_definitions`
  ADD PRIMARY KEY (`definition_id`),
  ADD KEY `definition_fk` (`definition_fk`),
  ADD KEY `definition_name` (`definition_name`),
  ADD KEY `definition_type` (`definition_type`);

--
-- Indices de la tabla `jhst_attribute_links`
--
ALTER TABLE `jhst_attribute_links`
  ADD UNIQUE KEY `attribute_links_uq1` (`attribute_id`,`definition_id`,`item_id`,`sale_id`,`receiving_id`),
  ADD UNIQUE KEY `attribute_links_uq2` (`item_id`,`sale_id`,`receiving_id`,`definition_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `definition_id` (`definition_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indices de la tabla `jhst_attribute_values`
--
ALTER TABLE `jhst_attribute_values`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `attribute_value` (`attribute_value`),
  ADD UNIQUE KEY `attribute_date` (`attribute_date`),
  ADD UNIQUE KEY `attribute_decimal` (`attribute_decimal`);

--
-- Indices de la tabla `jhst_cash_up`
--
ALTER TABLE `jhst_cash_up`
  ADD PRIMARY KEY (`cashup_id`),
  ADD KEY `open_employee_id` (`open_employee_id`),
  ADD KEY `close_employee_id` (`close_employee_id`);

--
-- Indices de la tabla `jhst_customers`
--
ALTER TABLE `jhst_customers`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sales_tax_code_id` (`sales_tax_code_id`),
  ADD KEY `company_name` (`company_name`);

--
-- Indices de la tabla `jhst_customers_packages`
--
ALTER TABLE `jhst_customers_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indices de la tabla `jhst_customers_points`
--
ALTER TABLE `jhst_customers_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indices de la tabla `jhst_dinner_tables`
--
ALTER TABLE `jhst_dinner_tables`
  ADD PRIMARY KEY (`dinner_table_id`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `jhst_employees`
--
ALTER TABLE `jhst_employees`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `jhst_expenses`
--
ALTER TABLE `jhst_expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_category_id` (`expense_category_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `jhst_expenses_ibfk_3` (`supplier_id`),
  ADD KEY `date` (`date`),
  ADD KEY `payment_type` (`payment_type`),
  ADD KEY `amount` (`amount`);

--
-- Indices de la tabla `jhst_expense_categories`
--
ALTER TABLE `jhst_expense_categories`
  ADD PRIMARY KEY (`expense_category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD KEY `category_description` (`category_description`);

--
-- Indices de la tabla `jhst_giftcards`
--
ALTER TABLE `jhst_giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `giftcard_number` (`giftcard_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `jhst_grants`
--
ALTER TABLE `jhst_grants`
  ADD PRIMARY KEY (`permission_id`,`person_id`),
  ADD KEY `jhst_grants_ibfk_2` (`person_id`);

--
-- Indices de la tabla `jhst_inventory`
--
ALTER TABLE `jhst_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_items` (`trans_items`),
  ADD KEY `trans_user` (`trans_user`),
  ADD KEY `trans_location` (`trans_location`),
  ADD KEY `trans_date` (`trans_date`);

--
-- Indices de la tabla `jhst_items`
--
ALTER TABLE `jhst_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `items_uq1` (`supplier_id`,`item_id`,`deleted`,`item_type`),
  ADD KEY `item_number` (`item_number`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `deleted` (`deleted`,`item_type`);

--
-- Indices de la tabla `jhst_items_taxes`
--
ALTER TABLE `jhst_items_taxes`
  ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indices de la tabla `jhst_item_kits`
--
ALTER TABLE `jhst_item_kits`
  ADD PRIMARY KEY (`item_kit_id`),
  ADD KEY `item_kit_number` (`item_kit_number`),
  ADD KEY `name` (`name`,`description`);

--
-- Indices de la tabla `jhst_item_kit_items`
--
ALTER TABLE `jhst_item_kit_items`
  ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  ADD KEY `jhst_item_kit_items_ibfk_2` (`item_id`);

--
-- Indices de la tabla `jhst_item_quantities`
--
ALTER TABLE `jhst_item_quantities`
  ADD PRIMARY KEY (`item_id`,`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indices de la tabla `jhst_modules`
--
ALTER TABLE `jhst_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indices de la tabla `jhst_people`
--
ALTER TABLE `jhst_people`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `email` (`email`),
  ADD KEY `first_name` (`first_name`,`last_name`,`email`,`phone_number`);

--
-- Indices de la tabla `jhst_permissions`
--
ALTER TABLE `jhst_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `jhst_permissions_ibfk_2` (`location_id`);

--
-- Indices de la tabla `jhst_receivings`
--
ALTER TABLE `jhst_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `receiving_time` (`receiving_time`);

--
-- Indices de la tabla `jhst_receivings_items`
--
ALTER TABLE `jhst_receivings_items`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `jhst_sales`
--
ALTER TABLE `jhst_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sale_time` (`sale_time`),
  ADD KEY `dinner_table_id` (`dinner_table_id`);

--
-- Indices de la tabla `jhst_sales_items`
--
ALTER TABLE `jhst_sales_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_location` (`item_location`);

--
-- Indices de la tabla `jhst_sales_items_taxes`
--
ALTER TABLE `jhst_sales_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `jhst_sales_payments`
--
ALTER TABLE `jhst_sales_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_sale` (`sale_id`,`payment_type`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `payment_time` (`payment_time`);

--
-- Indices de la tabla `jhst_sales_reward_points`
--
ALTER TABLE `jhst_sales_reward_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indices de la tabla `jhst_sales_taxes`
--
ALTER TABLE `jhst_sales_taxes`
  ADD PRIMARY KEY (`sales_taxes_id`),
  ADD KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_group`);

--
-- Indices de la tabla `jhst_sessions`
--
ALTER TABLE `jhst_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`),
  ADD KEY `id` (`id`),
  ADD KEY `ip_address` (`ip_address`);

--
-- Indices de la tabla `jhst_stock_locations`
--
ALTER TABLE `jhst_stock_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indices de la tabla `jhst_suppliers`
--
ALTER TABLE `jhst_suppliers`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `category` (`category`),
  ADD KEY `company_name` (`company_name`,`deleted`);

--
-- Indices de la tabla `jhst_tax_categories`
--
ALTER TABLE `jhst_tax_categories`
  ADD PRIMARY KEY (`tax_category_id`);

--
-- Indices de la tabla `jhst_tax_codes`
--
ALTER TABLE `jhst_tax_codes`
  ADD PRIMARY KEY (`tax_code_id`);

--
-- Indices de la tabla `jhst_tax_jurisdictions`
--
ALTER TABLE `jhst_tax_jurisdictions`
  ADD PRIMARY KEY (`jurisdiction_id`),
  ADD UNIQUE KEY `tax_jurisdictions_uq1` (`tax_group`);

--
-- Indices de la tabla `jhst_tax_rates`
--
ALTER TABLE `jhst_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `rate_tax_category_id` (`rate_tax_category_id`),
  ADD KEY `rate_tax_code_id` (`rate_tax_code_id`),
  ADD KEY `rate_jurisdiction_id` (`rate_jurisdiction_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `jhst_attribute_definitions`
--
ALTER TABLE `jhst_attribute_definitions`
  MODIFY `definition_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_attribute_values`
--
ALTER TABLE `jhst_attribute_values`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_cash_up`
--
ALTER TABLE `jhst_cash_up`
  MODIFY `cashup_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_customers_packages`
--
ALTER TABLE `jhst_customers_packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `jhst_customers_points`
--
ALTER TABLE `jhst_customers_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_dinner_tables`
--
ALTER TABLE `jhst_dinner_tables`
  MODIFY `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jhst_expenses`
--
ALTER TABLE `jhst_expenses`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_expense_categories`
--
ALTER TABLE `jhst_expense_categories`
  MODIFY `expense_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_giftcards`
--
ALTER TABLE `jhst_giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_inventory`
--
ALTER TABLE `jhst_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_items`
--
ALTER TABLE `jhst_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_item_kits`
--
ALTER TABLE `jhst_item_kits`
  MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_people`
--
ALTER TABLE `jhst_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jhst_receivings`
--
ALTER TABLE `jhst_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_sales`
--
ALTER TABLE `jhst_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_sales_payments`
--
ALTER TABLE `jhst_sales_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_sales_reward_points`
--
ALTER TABLE `jhst_sales_reward_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_sales_taxes`
--
ALTER TABLE `jhst_sales_taxes`
  MODIFY `sales_taxes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_stock_locations`
--
ALTER TABLE `jhst_stock_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jhst_tax_categories`
--
ALTER TABLE `jhst_tax_categories`
  MODIFY `tax_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_tax_codes`
--
ALTER TABLE `jhst_tax_codes`
  MODIFY `tax_code_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_tax_jurisdictions`
--
ALTER TABLE `jhst_tax_jurisdictions`
  MODIFY `jurisdiction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jhst_tax_rates`
--
ALTER TABLE `jhst_tax_rates`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jhst_attribute_definitions`
--
ALTER TABLE `jhst_attribute_definitions`
  ADD CONSTRAINT `fk_jhst_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `jhst_attribute_definitions` (`definition_id`);

--
-- Filtros para la tabla `jhst_attribute_links`
--
ALTER TABLE `jhst_attribute_links`
  ADD CONSTRAINT `jhst_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `jhst_attribute_definitions` (`definition_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `jhst_attribute_values` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_attribute_links_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`),
  ADD CONSTRAINT `jhst_attribute_links_ibfk_4` FOREIGN KEY (`receiving_id`) REFERENCES `jhst_receivings` (`receiving_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_attribute_links_ibfk_5` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales` (`sale_id`);

--
-- Filtros para la tabla `jhst_cash_up`
--
ALTER TABLE `jhst_cash_up`
  ADD CONSTRAINT `jhst_cash_up_ibfk_1` FOREIGN KEY (`open_employee_id`) REFERENCES `jhst_employees` (`person_id`),
  ADD CONSTRAINT `jhst_cash_up_ibfk_2` FOREIGN KEY (`close_employee_id`) REFERENCES `jhst_employees` (`person_id`);

--
-- Filtros para la tabla `jhst_customers`
--
ALTER TABLE `jhst_customers`
  ADD CONSTRAINT `jhst_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `jhst_people` (`person_id`),
  ADD CONSTRAINT `jhst_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `jhst_customers_packages` (`package_id`),
  ADD CONSTRAINT `jhst_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `jhst_tax_codes` (`tax_code_id`);

--
-- Filtros para la tabla `jhst_customers_points`
--
ALTER TABLE `jhst_customers_points`
  ADD CONSTRAINT `jhst_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `jhst_customers` (`person_id`),
  ADD CONSTRAINT `jhst_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `jhst_customers_packages` (`package_id`),
  ADD CONSTRAINT `jhst_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales` (`sale_id`);

--
-- Filtros para la tabla `jhst_employees`
--
ALTER TABLE `jhst_employees`
  ADD CONSTRAINT `jhst_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `jhst_people` (`person_id`);

--
-- Filtros para la tabla `jhst_expenses`
--
ALTER TABLE `jhst_expenses`
  ADD CONSTRAINT `jhst_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `jhst_expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `jhst_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `jhst_employees` (`person_id`),
  ADD CONSTRAINT `jhst_expenses_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `jhst_suppliers` (`person_id`);

--
-- Filtros para la tabla `jhst_giftcards`
--
ALTER TABLE `jhst_giftcards`
  ADD CONSTRAINT `jhst_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `jhst_people` (`person_id`);

--
-- Filtros para la tabla `jhst_grants`
--
ALTER TABLE `jhst_grants`
  ADD CONSTRAINT `jhst_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `jhst_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `jhst_employees` (`person_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jhst_inventory`
--
ALTER TABLE `jhst_inventory`
  ADD CONSTRAINT `jhst_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `jhst_items` (`item_id`),
  ADD CONSTRAINT `jhst_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `jhst_employees` (`person_id`),
  ADD CONSTRAINT `jhst_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `jhst_stock_locations` (`location_id`);

--
-- Filtros para la tabla `jhst_items`
--
ALTER TABLE `jhst_items`
  ADD CONSTRAINT `jhst_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `jhst_suppliers` (`person_id`);

--
-- Filtros para la tabla `jhst_items_taxes`
--
ALTER TABLE `jhst_items_taxes`
  ADD CONSTRAINT `jhst_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jhst_item_kit_items`
--
ALTER TABLE `jhst_item_kit_items`
  ADD CONSTRAINT `jhst_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `jhst_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jhst_item_quantities`
--
ALTER TABLE `jhst_item_quantities`
  ADD CONSTRAINT `jhst_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`),
  ADD CONSTRAINT `jhst_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `jhst_stock_locations` (`location_id`);

--
-- Filtros para la tabla `jhst_permissions`
--
ALTER TABLE `jhst_permissions`
  ADD CONSTRAINT `jhst_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `jhst_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jhst_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `jhst_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jhst_receivings`
--
ALTER TABLE `jhst_receivings`
  ADD CONSTRAINT `jhst_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `jhst_employees` (`person_id`),
  ADD CONSTRAINT `jhst_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `jhst_suppliers` (`person_id`);

--
-- Filtros para la tabla `jhst_receivings_items`
--
ALTER TABLE `jhst_receivings_items`
  ADD CONSTRAINT `jhst_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`),
  ADD CONSTRAINT `jhst_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `jhst_receivings` (`receiving_id`);

--
-- Filtros para la tabla `jhst_sales`
--
ALTER TABLE `jhst_sales`
  ADD CONSTRAINT `jhst_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `jhst_employees` (`person_id`),
  ADD CONSTRAINT `jhst_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `jhst_customers` (`person_id`),
  ADD CONSTRAINT `jhst_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `jhst_dinner_tables` (`dinner_table_id`);

--
-- Filtros para la tabla `jhst_sales_items`
--
ALTER TABLE `jhst_sales_items`
  ADD CONSTRAINT `jhst_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`),
  ADD CONSTRAINT `jhst_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales` (`sale_id`),
  ADD CONSTRAINT `jhst_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `jhst_stock_locations` (`location_id`);

--
-- Filtros para la tabla `jhst_sales_items_taxes`
--
ALTER TABLE `jhst_sales_items_taxes`
  ADD CONSTRAINT `jhst_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales_items` (`sale_id`),
  ADD CONSTRAINT `jhst_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `jhst_items` (`item_id`);

--
-- Filtros para la tabla `jhst_sales_payments`
--
ALTER TABLE `jhst_sales_payments`
  ADD CONSTRAINT `jhst_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales` (`sale_id`),
  ADD CONSTRAINT `jhst_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `jhst_employees` (`person_id`);

--
-- Filtros para la tabla `jhst_sales_reward_points`
--
ALTER TABLE `jhst_sales_reward_points`
  ADD CONSTRAINT `jhst_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `jhst_sales` (`sale_id`);

--
-- Filtros para la tabla `jhst_suppliers`
--
ALTER TABLE `jhst_suppliers`
  ADD CONSTRAINT `jhst_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `jhst_people` (`person_id`);

--
-- Filtros para la tabla `jhst_tax_rates`
--
ALTER TABLE `jhst_tax_rates`
  ADD CONSTRAINT `jhst_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `jhst_tax_categories` (`tax_category_id`),
  ADD CONSTRAINT `jhst_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `jhst_tax_codes` (`tax_code_id`),
  ADD CONSTRAINT `jhst_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `jhst_tax_jurisdictions` (`jurisdiction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
