-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2025 at 09:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_table_track_latest_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `branch_id`, `area_name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Roof Top', '2025-08-02 07:33:31', '2025-08-02 07:33:31'),
(2, 4, 'Members Area', '2025-01-20 22:20:05', '2025-01-20 22:21:20'),
(3, 4, 'Non-Member Area', '2025-01-20 22:21:36', '2025-01-20 22:21:36'),
(4, 4, 'VIP LONGE', '2025-01-21 09:11:44', '2025-01-21 09:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_hash` varchar(64) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `cloned_branch_name` varchar(191) DEFAULT NULL,
  `cloned_branch_id` varchar(191) DEFAULT NULL,
  `is_menu_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_item_categories_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_menu_items_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_item_modifiers_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_reservation_settings` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_delivery_settings` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_kot_setting` tinyint(1) NOT NULL DEFAULT 0,
  `is_modifiers_groups_clone` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `unique_hash`, `restaurant_id`, `name`, `cloned_branch_name`, `cloned_branch_id`, `is_menu_clone`, `is_item_categories_clone`, `is_menu_items_clone`, `is_item_modifiers_clone`, `is_clone_reservation_settings`, `is_clone_delivery_settings`, `is_clone_kot_setting`, `is_modifiers_groups_clone`, `address`, `created_at`, `updated_at`, `lat`, `lng`) VALUES
(1, '783a85a756cd28dc0e3a', 1, 'East Juliana', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '5240 Hodkiewicz Unions Apt. 349\nKameronton, MA 21900', '2025-08-01 09:37:55', '2025-08-01 09:37:55', NULL, NULL),
(2, '15dcf4a297fd46088716', 1, 'Isadorechester', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '45534 Hauck Village Suite 090\nSouth Opal, MO 27100', '2025-08-01 09:37:57', '2025-08-01 09:37:57', NULL, NULL),
(3, '9bbcb2ba3c9dfa875f0b', 2, 'Uluberia Branch', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'Station Road. Uluberia. Howrah', '2025-08-02 07:33:06', '2025-08-02 07:33:06', NULL, NULL),
(4, '85627962180e4e18ecdc', 3, 'PSK - Laxmi Nagar', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '14, District Centre, Vikas Marg, Laxmi Nagar, New Delhi, Delhi, 110092', '2025-08-02 12:31:23', '2025-08-02 12:31:23', 26.9125000, 75.7875000);

-- --------------------------------------------------------

--
-- Table structure for table `branch_delivery_settings`
--

CREATE TABLE `branch_delivery_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `max_radius` decimal(8,2) NOT NULL DEFAULT 5.00,
  `unit` enum('km','miles') NOT NULL DEFAULT 'km',
  `fee_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `fixed_fee` decimal(8,2) DEFAULT NULL,
  `per_distance_rate` decimal(8,2) DEFAULT NULL,
  `free_delivery_over_amount` decimal(8,2) DEFAULT NULL,
  `free_delivery_within_radius` double DEFAULT NULL,
  `delivery_schedule_start` time DEFAULT NULL,
  `delivery_schedule_end` time DEFAULT NULL,
  `prep_time_minutes` int(11) NOT NULL DEFAULT 20,
  `additional_eta_buffer_time` int(11) DEFAULT NULL,
  `avg_delivery_speed_kmh` int(11) NOT NULL DEFAULT 30,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_company` varchar(191) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `language_setting_id`, `email`, `contact_company`, `image`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'support@example.com', 'Bond Hobbs Inc', NULL, '957 Jamie Station, Lamontborough, SD 27319-9459', '2025-08-01 09:37:59', '2025-08-01 09:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `countries_code` char(2) NOT NULL,
  `countries_name` varchar(191) NOT NULL,
  `phonecode` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countries_code`, `countries_name`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', '93'),
(2, 'AX', 'Åland Islands', '358'),
(3, 'AL', 'Albania', '355'),
(4, 'DZ', 'Algeria', '213'),
(5, 'AS', 'American Samoa', '1684'),
(6, 'AD', 'Andorra', '376'),
(7, 'AO', 'Angola', '244'),
(8, 'AI', 'Anguilla', '1264'),
(9, 'AQ', 'Antarctica', '0'),
(10, 'AG', 'Antigua and Barbuda', '1268'),
(11, 'AR', 'Argentina', '54'),
(12, 'AM', 'Armenia', '374'),
(13, 'AW', 'Aruba', '297'),
(14, 'AU', 'Australia', '61'),
(15, 'AT', 'Austria', '43'),
(16, 'AZ', 'Azerbaijan', '994'),
(17, 'BS', 'Bahamas', '1242'),
(18, 'BH', 'Bahrain', '973'),
(19, 'BD', 'Bangladesh', '880'),
(20, 'BB', 'Barbados', '1246'),
(21, 'BY', 'Belarus', '375'),
(22, 'BE', 'Belgium', '32'),
(23, 'BZ', 'Belize', '501'),
(24, 'BJ', 'Benin', '229'),
(25, 'BM', 'Bermuda', '1441'),
(26, 'BT', 'Bhutan', '975'),
(27, 'BO', 'Bolivia, Plurinational State of', '591'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', '599'),
(29, 'BA', 'Bosnia and Herzegovina', '387'),
(30, 'BW', 'Botswana', '267'),
(31, 'BV', 'Bouvet Island', '0'),
(32, 'BR', 'Brazil', '55'),
(33, 'IO', 'British Indian Ocean Territory', '246'),
(34, 'BN', 'Brunei Darussalam', '673'),
(35, 'BG', 'Bulgaria', '359'),
(36, 'BF', 'Burkina Faso', '226'),
(37, 'BI', 'Burundi', '257'),
(38, 'KH', 'Cambodia', '855'),
(39, 'CM', 'Cameroon', '237'),
(40, 'CA', 'Canada', '1'),
(41, 'CV', 'Cape Verde', '238'),
(42, 'KY', 'Cayman Islands', '1345'),
(43, 'CF', 'Central African Republic', '236'),
(44, 'TD', 'Chad', '235'),
(45, 'CL', 'Chile', '56'),
(46, 'CN', 'China', '86'),
(47, 'CX', 'Christmas Island', '61'),
(48, 'CC', 'Cocos (Keeling) Islands', '672'),
(49, 'CO', 'Colombia', '57'),
(50, 'KM', 'Comoros', '269'),
(51, 'CG', 'Congo', '242'),
(52, 'CD', 'Congo, the Democratic Republic of the', '242'),
(53, 'CK', 'Cook Islands', '682'),
(54, 'CR', 'Costa Rica', '506'),
(55, 'CI', 'Côte d\'Ivoire', '225'),
(56, 'HR', 'Croatia', '385'),
(57, 'CU', 'Cuba', '53'),
(58, 'CW', 'Curaçao', '599'),
(59, 'CY', 'Cyprus', '357'),
(60, 'CZ', 'Czech Republic', '420'),
(61, 'DK', 'Denmark', '45'),
(62, 'DJ', 'Djibouti', '253'),
(63, 'DM', 'Dominica', '1767'),
(64, 'DO', 'Dominican Republic', '1809'),
(65, 'EC', 'Ecuador', '593'),
(66, 'EG', 'Egypt', '20'),
(67, 'SV', 'El Salvador', '503'),
(68, 'GQ', 'Equatorial Guinea', '240'),
(69, 'ER', 'Eritrea', '291'),
(70, 'EE', 'Estonia', '372'),
(71, 'ET', 'Ethiopia', '251'),
(72, 'FK', 'Falkland Islands (Malvinas)', '500'),
(73, 'FO', 'Faroe Islands', '298'),
(74, 'FJ', 'Fiji', '679'),
(75, 'FI', 'Finland', '358'),
(76, 'FR', 'France', '33'),
(77, 'GF', 'French Guiana', '594'),
(78, 'PF', 'French Polynesia', '689'),
(79, 'TF', 'French Southern Territories', '0'),
(80, 'GA', 'Gabon', '241'),
(81, 'GM', 'Gambia', '220'),
(82, 'GE', 'Georgia', '995'),
(83, 'DE', 'Germany', '49'),
(84, 'GH', 'Ghana', '233'),
(85, 'GI', 'Gibraltar', '350'),
(86, 'GR', 'Greece', '30'),
(87, 'GL', 'Greenland', '299'),
(88, 'GD', 'Grenada', '1473'),
(89, 'GP', 'Guadeloupe', '590'),
(90, 'GU', 'Guam', '1671'),
(91, 'GT', 'Guatemala', '502'),
(92, 'GG', 'Guernsey', '44'),
(93, 'GN', 'Guinea', '224'),
(94, 'GW', 'Guinea-Bissau', '245'),
(95, 'GY', 'Guyana', '592'),
(96, 'HT', 'Haiti', '509'),
(97, 'HM', 'Heard Island and McDonald Islands', '0'),
(98, 'VA', 'Holy See (Vatican City State)', '39'),
(99, 'HN', 'Honduras', '504'),
(100, 'HK', 'Hong Kong', '852'),
(101, 'HU', 'Hungary', '36'),
(102, 'IS', 'Iceland', '354'),
(103, 'IN', 'India', '91'),
(104, 'ID', 'Indonesia', '62'),
(105, 'IR', 'Iran, Islamic Republic of', '98'),
(106, 'IQ', 'Iraq', '964'),
(107, 'IE', 'Ireland', '353'),
(108, 'IM', 'Isle of Man', '44'),
(109, 'IL', 'Israel', '972'),
(110, 'IT', 'Italy', '39'),
(111, 'JM', 'Jamaica', '1876'),
(112, 'JP', 'Japan', '81'),
(113, 'JE', 'Jersey', '44'),
(114, 'JO', 'Jordan', '962'),
(115, 'KZ', 'Kazakhstan', '7'),
(116, 'KE', 'Kenya', '254'),
(117, 'KI', 'Kiribati', '686'),
(118, 'KP', 'Korea, Democratic People\'s Republic of', '850'),
(119, 'KR', 'Korea, Republic of', '82'),
(120, 'KW', 'Kuwait', '965'),
(121, 'KG', 'Kyrgyzstan', '996'),
(122, 'LA', 'Lao People\'s Democratic Republic', '856'),
(123, 'LV', 'Latvia', '371'),
(124, 'LB', 'Lebanon', '961'),
(125, 'LS', 'Lesotho', '266'),
(126, 'LR', 'Liberia', '231'),
(127, 'LY', 'Libya', '218'),
(128, 'LI', 'Liechtenstein', '423'),
(129, 'LT', 'Lithuania', '370'),
(130, 'LU', 'Luxembourg', '352'),
(131, 'MO', 'Macao', '853'),
(132, 'MK', 'Macedonia, the Former Yugoslav Republic of', '389'),
(133, 'MG', 'Madagascar', '261'),
(134, 'MW', 'Malawi', '265'),
(135, 'MY', 'Malaysia', '60'),
(136, 'MV', 'Maldives', '960'),
(137, 'ML', 'Mali', '223'),
(138, 'MT', 'Malta', '356'),
(139, 'MH', 'Marshall Islands', '692'),
(140, 'MQ', 'Martinique', '596'),
(141, 'MR', 'Mauritania', '222'),
(142, 'MU', 'Mauritius', '230'),
(143, 'YT', 'Mayotte', '269'),
(144, 'MX', 'Mexico', '52'),
(145, 'FM', 'Micronesia, Federated States of', '691'),
(146, 'MD', 'Moldova, Republic of', '373'),
(147, 'MC', 'Monaco', '377'),
(148, 'MN', 'Mongolia', '976'),
(149, 'ME', 'Montenegro', '382'),
(150, 'MS', 'Montserrat', '1664'),
(151, 'MA', 'Morocco', '212'),
(152, 'MZ', 'Mozambique', '258'),
(153, 'MM', 'Myanmar', '95'),
(154, 'NA', 'Namibia', '264'),
(155, 'NR', 'Nauru', '674'),
(156, 'NP', 'Nepal', '977'),
(157, 'NL', 'Netherlands', '31'),
(158, 'NC', 'New Caledonia', '687'),
(159, 'NZ', 'New Zealand', '64'),
(160, 'NI', 'Nicaragua', '505'),
(161, 'NE', 'Niger', '227'),
(162, 'NG', 'Nigeria', '234'),
(163, 'NU', 'Niue', '683'),
(164, 'NF', 'Norfolk Island', '672'),
(165, 'MP', 'Northern Mariana Islands', '1670'),
(166, 'NO', 'Norway', '47'),
(167, 'OM', 'Oman', '968'),
(168, 'PK', 'Pakistan', '92'),
(169, 'PW', 'Palau', '680'),
(170, 'PS', 'Palestine, State of', '970'),
(171, 'PA', 'Panama', '507'),
(172, 'PG', 'Papua New Guinea', '675'),
(173, 'PY', 'Paraguay', '595'),
(174, 'PE', 'Peru', '51'),
(175, 'PH', 'Philippines', '63'),
(176, 'PN', 'Pitcairn', '0'),
(177, 'PL', 'Poland', '48'),
(178, 'PT', 'Portugal', '351'),
(179, 'PR', 'Puerto Rico', '1787'),
(180, 'QA', 'Qatar', '974'),
(181, 'RE', 'Réunion', '262'),
(182, 'RO', 'Romania', '40'),
(183, 'RU', 'Russian Federation', '7'),
(184, 'RW', 'Rwanda', '250'),
(185, 'BL', 'Saint Barthélemy', '590'),
(186, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', '290'),
(187, 'KN', 'Saint Kitts and Nevis', '1869'),
(188, 'LC', 'Saint Lucia', '1758'),
(189, 'MF', 'Saint Martin (French part)', '590'),
(190, 'PM', 'Saint Pierre and Miquelon', '508'),
(191, 'VC', 'Saint Vincent and the Grenadines', '1784'),
(192, 'WS', 'Samoa', '684'),
(193, 'SM', 'San Marino', '378'),
(194, 'ST', 'Sao Tome and Principe', '239'),
(195, 'SA', 'Saudi Arabia', '966'),
(196, 'SN', 'Senegal', '221'),
(197, 'RS', 'Serbia', '381'),
(198, 'SC', 'Seychelles', '248'),
(199, 'SL', 'Sierra Leone', '232'),
(200, 'SG', 'Singapore', '65'),
(201, 'SX', 'Sint Maarten (Dutch part)', '1'),
(202, 'SK', 'Slovakia', '421'),
(203, 'SI', 'Slovenia', '386'),
(204, 'SB', 'Solomon Islands', '677'),
(205, 'SO', 'Somalia', '252'),
(206, 'ZA', 'South Africa', '27'),
(207, 'GS', 'South Georgia and the South Sandwich Islands', '0'),
(208, 'SS', 'South Sudan', '211'),
(209, 'ES', 'Spain', '34'),
(210, 'LK', 'Sri Lanka', '94'),
(211, 'SD', 'Sudan', '249'),
(212, 'SR', 'Suriname', '597'),
(213, 'SJ', 'Svalbard and Jan Mayen', '47'),
(214, 'SZ', 'Swaziland', '268'),
(215, 'SE', 'Sweden', '46'),
(216, 'CH', 'Switzerland', '41'),
(217, 'SY', 'Syrian Arab Republic', '963'),
(218, 'TW', 'Taiwan, Province of China', '886'),
(219, 'TJ', 'Tajikistan', '992'),
(220, 'TZ', 'Tanzania, United Republic of', '255'),
(221, 'TH', 'Thailand', '66'),
(222, 'TL', 'Timor-Leste', '670'),
(223, 'TG', 'Togo', '228'),
(224, 'TK', 'Tokelau', '690'),
(225, 'TO', 'Tonga', '676'),
(226, 'TT', 'Trinidad and Tobago', '1868'),
(227, 'TN', 'Tunisia', '216'),
(228, 'TR', 'Turkey', '90'),
(229, 'TM', 'Turkmenistan', '7370'),
(230, 'TC', 'Turks and Caicos Islands', '1649'),
(231, 'TV', 'Tuvalu', '688'),
(232, 'UG', 'Uganda', '256'),
(233, 'UA', 'Ukraine', '380'),
(234, 'AE', 'United Arab Emirates', '971'),
(235, 'GB', 'United Kingdom', '44'),
(236, 'US', 'United States', '1'),
(237, 'UM', 'United States Minor Outlying Islands', '1'),
(238, 'UY', 'Uruguay', '598'),
(239, 'UZ', 'Uzbekistan', '998'),
(240, 'VU', 'Vanuatu', '678'),
(241, 'VE', 'Venezuela, Bolivarian Republic of', '58'),
(242, 'VN', 'Viet Nam', '84'),
(243, 'VG', 'Virgin Islands, British', '1284'),
(244, 'VI', 'Virgin Islands, U.S.', '1340'),
(245, 'WF', 'Wallis and Futuna', '681'),
(246, 'EH', 'Western Sahara', '212'),
(247, 'YE', 'Yemen', '967'),
(248, 'ZM', 'Zambia', '260'),
(249, 'ZW', 'Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `thousand_separator` varchar(191) DEFAULT ',',
  `decimal_separator` varchar(191) DEFAULT '.',
  `exchange_rate` decimal(16,2) DEFAULT NULL,
  `usd_price` decimal(16,2) DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `restaurant_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `usd_price`, `is_cryptocurrency`) VALUES
(1, 1, 'Dollars', 'USD', '$', 'left', 2, ',', '.', NULL, NULL, 'no'),
(2, 1, 'Rupee', 'INR', '₹', 'left', 2, ',', '.', NULL, NULL, 'no'),
(3, 1, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(4, 1, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no'),
(5, 2, 'Dollars', 'USD', '$', 'left', 2, ',', '.', NULL, NULL, 'no'),
(6, 2, 'Rupee', 'INR', '₹', 'left', 2, ',', '.', NULL, NULL, 'no'),
(7, 2, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(8, 2, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no'),
(9, 3, 'Dollars', 'USD', '$', 'left', 2, ',', '.', NULL, NULL, 'no'),
(10, 3, 'Rupee', 'INR', '₹', 'left', 2, ',', '.', NULL, NULL, 'no'),
(11, 3, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(12, 3, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_otp` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `restaurant_id`, `name`, `phone`, `email`, `email_otp`, `created_at`, `updated_at`, `delivery_address`) VALUES
(3, 2, 'Tanya M.', '98989898978', NULL, NULL, '2025-01-13 23:52:35', '2025-01-18 08:50:58', NULL),
(8, 3, 'JAI MATA DI', '9711359797', 'CHETANGUPT780@gmail.com', NULL, '2025-01-21 03:15:22', '2025-01-21 03:15:22', ''),
(9, 2, 'ranjan', '09999999999', 'kumar00004k@gmail.com', NULL, '2025-02-05 05:42:08', '2025-02-05 05:42:08', NULL),
(13, 2, 'Muskan S', '86426xxxx', 'muskans@gmail.com', NULL, '2025-02-06 02:32:40', '2025-02-06 23:17:00', 'Delhi, India'),
(15, 2, 'Shreya', '96375xxxx', 'shera@gmail.com', NULL, '2025-02-06 22:51:58', '2025-02-06 22:51:58', NULL),
(16, 2, 'test one', '9989809890', NULL, NULL, '2025-02-07 00:45:31', '2025-02-07 00:45:31', NULL),
(17, 2, 'John', '84656xxxx', 'john@usa.com', NULL, '2025-02-07 01:46:52', '2025-02-07 01:46:52', 'USA'),
(20, 3, 'S.C.CHADHA', '9810721192', 'test1@gmail.com', NULL, '2025-06-09 23:29:26', '2025-06-09 23:29:26', NULL),
(21, 3, 'RAJIV AGARWAL', '9811162834', 'rajiv.agarwal62@gmail.com', NULL, '2025-06-09 23:29:26', '2025-06-09 23:29:26', NULL),
(22, 3, 'NEERAJ KUMAR SINGAL', '9810068590', 'nks@semcoindia.com', NULL, '2025-06-09 23:29:26', '2025-06-09 23:29:26', NULL),
(23, 3, 'ASHOK BABU', '9811224639', 'test2@gmail.com', NULL, '2025-06-09 23:29:26', '2025-06-09 23:29:26', NULL),
(24, 3, 'NASEEB SINGH', '9810126989', 'test3@gmail.com', NULL, '2025-06-09 19:10:08', '2025-06-09 19:10:08', NULL),
(25, 3, 'RAKESH JOSHI', '9818146606', 'drrakeshjoshi@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(26, 3, 'Y.K. SAXENA', '26327630,   9810312340', 'y.k.saxena@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:54:43', NULL),
(27, 3, 'NAVEEN JAIN', '9899404860', 'njainfca@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(28, 3, 'SUBHASH JAIN', '22548586,  9810004855', 'gargi_elect@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-10 23:55:53', NULL),
(29, 3, 'SHASHI GUPTA', '9313006697', 'shashifca@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(30, 3, 'SANJAY AGGARWAL', '9810074888', 'aggprop@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(31, 3, 'ARVINDH AGARWAL', '9313373741', 'test4@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(32, 3, 'SUSHIL JINDAL', '9810744334', 'sushilkumarjindal@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(33, 3, 'ALOK AGARWAL', '32331071', 'test5@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:56:57', NULL),
(34, 3, 'PRASHANT AHUJA', '9818017921', 'prashantahuja@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(35, 3, 'RAJNEESH KUMAR SOOD', '9891671417', 'test6@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(36, 3, 'SUBHASH AGARWAL', '9810130441', 'drsagarwal21@gmail.com ', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(37, 3, 'SUBHASH CHANDRA SINGHAL', '9810114589', 'singhalassoc@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(38, 3, 'RAKESH CHANDRA RASTOGI', '9811033198', 'test7@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(39, 3, 'VIREDER KHANNA', '9810039192', 'krishnasons26fa@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(40, 3, 'RAHUL PAUL', '9810292498', 'drrahulpaul@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(41, 3, 'PREM PRAKASH GUPTA', '9811167850', 'guptappgk71@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(42, 3, 'ASHOK KUMAR JALAN', '9811039708', 'info@jalanca.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(43, 3, 'RAJENDER GUPTA ', '9810002504', 'rmsc007@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(44, 3, 'S.P. SINGH', '9811151154', 'dr.spsing@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(45, 3, 'MADHU CHANDA PAKRASHI', '9811141270', 'apakrashi@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(46, 3, 'SHANTI LAL JAIN', '9818036024', 'shantilal63@yahoo.co.in                            shantilal63@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(47, 3, 'HARENDER SINGH', '9810079459', 'test8@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(48, 3, 'RAMESH BHANDARI', '9313088430,  9999199639', 'ramesh.sel16@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:57:39', NULL),
(49, 3, 'KRISHAN KUMAR GOYAL', '9810235006', 'goyalkk2012@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(50, 3, 'ALOK JAIN', '9818093365', 'test9@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(51, 3, 'P.D. GARG', '9811109048', 'pdgarg@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(52, 3, 'SHARDA JAIN', '32344808', 'test10@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:58:03', NULL),
(53, 3, 'MOHIT GAMBHIR', '9810075702', 'mohit.gambhir77@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(54, 3, 'R.R.GUPTA', '9811467641', 'test11@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(55, 3, 'MUKESH KUMAR JAIN', '9810187001', 'mukeshjain1950@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(56, 3, 'AMIT MITTAL', '9891966700', 'amitmittal@icai.org', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(57, 3, 'SEEMA JAIN', '22508788', 'test12@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:58:31', NULL),
(58, 3, 'RAHUL AGARWAL', '9810512114', 'test13@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(59, 3, 'SUBHASH CHAND JAIN', '9810531388', 'test14@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(60, 3, 'P.C. BINDAL', '9810013280', 'pcbindal@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(61, 3, 'RAJEEV PASSEI', '9810178588', 'drrpassey@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(62, 3, 'VIKAS ARORA', '9811414440', 'vikasvicky@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(63, 3, 'ANURUP SHARMA', '9811081063', 'anurups@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(64, 3, 'RAKESH GUPTA', '9811066168', 'thenest.rg@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(65, 3, 'ANIL KUMAR GUPTA', '9312215009', 'kansalents@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(66, 3, 'NEERAJ AGARWAL', '9810634401', 'neeraj@ambitec.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(67, 3, 'RAKESH GOEL', '9810883938', 'delichemhardware@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(68, 3, 'RAJENDRA SINGH', '9810201901', 'test15@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(69, 3, 'AJAY GUPTA', '9810003679', 'ajay22delhi@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(70, 3, 'NARENDER WADHWA', '9810008640', 'nwadhwa@ski.net', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(71, 3, 'KAILASH ARORA', '9811098861', 'arorakailash@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(72, 3, 'ASHUTOSH VERMA', '9868252720', 'test16@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(73, 3, 'SUNIL KUMAR AGARWAL', '9811253763', 'vkj_delhi@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(74, 3, 'SHANKAR LAL SINGHANIA', '9811039847', 'shankarsinghania@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(75, 3, 'SURESH KUMAR TANEJA', '9810660436', 'sktaneja1@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(76, 3, 'J.R. DUGGAL', '9810612249', 'duggal.jr@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(77, 3, 'INDER SANJEEV VARMA', '22541851', 'test17@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-10 23:59:03', NULL),
(78, 3, 'SAUMYA GUPTA', '9810560352', 'sgupta@newagepublishers.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(79, 3, 'PRAVEEN CHAKRAVARTY', '9810236186', 'sunilchakerverty87@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(80, 3, 'A.K. GUPTA', '9810421739', 'anilnupur@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(81, 3, 'J.K. CHAWLA', '9810521722', 'jkchawla.jkc.@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(82, 3, 'KAMAL BAHRI', '9810136827', 'cakamalbahri@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(83, 3, 'GULSHAN DHINGRA', '9810219797', 'robinsteps1972@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(84, 3, 'ARVIND GUPTA', '9840096299', 'test18@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(85, 3, 'RAM SINGH AHLUWALIA ', '9811204277', 'test19@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(86, 3, 'P.K. AGWARWAL', '9811161375', 'pkagrawalca@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(87, 3, 'RAMESH B. SHARMA', '9810244760', 'rb.sharma@shrirampistons.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(88, 3, 'V.K. SONI', '9313885218', 'test20@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(89, 3, 'S.K. SRIVASTAVA', '9810287920', 'skumar08@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(90, 3, 'NARINDER VASHISHT', '9891245733', 'narendra_vashisht@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(91, 3, 'SATPAL SINGH', '9810045240', 'brij.newdelhi@hpgas.hpcl.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(92, 3, 'KANWAR SAIN YADAV', '9810161126', 'test21@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(93, 3, 'ANUSUYA SALWAN', '9811225368', 'anusalwan@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(94, 3, 'SANJEEV AGARWAL', '9810134136', 'sanjeevdda@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(95, 3, 'DINESH GUPTA', '9811866866', 'test22@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(96, 3, 'VARUN DUTT GUPTA', '9312435166', 'varundg72@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(97, 3, 'TARUN K. GUPTA', '9810173992', 'tarun@capolytech.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(98, 3, 'AJIJUR RAHAMAN', '9810003598', 'test23@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(99, 3, 'RAKESH MITTAL', '9810030340', 'test24@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(100, 3, 'YOGESH MITTAL', '9891111968', 'test25@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(101, 3, 'GYAN PARKASH AGARWAL', '9811077499', 'gyanprak2006@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(102, 3, 'MANOJ AGARWAL', '9811539972', 'manoj_ag@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(103, 3, 'SAMUNDAR VIJAY JAIN', '9811130620', 'samundar8899@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(104, 3, 'SUDHENDU OJHA', '9868108713', 'sudhenduojha@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(105, 3, 'PRADEEP SINGH VERMA', '9810098127', 'test26@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(106, 3, 'PREETAM JAIN', '9312209145', 'test27@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(107, 3, 'DEEPAK V. SHETH', '9810009949', 'deepakvsheth@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(108, 3, 'P.V. SHETH', '9811125125', 'pankajvsheth@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(109, 3, 'MAHENDER B SHAH', '9312271556', 'mbshah1954@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(110, 3, 'MANOJ GUPTA', '9810138948', 'test28@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(111, 3, 'SAT PAUL BANSAL', '9312282112', 'test29@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(112, 3, 'PRADEEP SARDANA', '9811112627', 'pradeepsardana@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(113, 3, 'SANJAY DIWAN', '9810069257', 'sanjay.diwan10@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(114, 3, 'ATUL LUTHRA', '9810272362', 'librase@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(115, 3, 'ASHO GUPTA', '9350261121', 'test30@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(116, 3, 'TANMAY TALUKDAR', '9868483056', 'test31@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(117, 3, 'A.S. BHARTI', '9810512766', 'apinderbharti@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(118, 3, 'HARBANS LAL PASSI', '9351014343', 'test32@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(119, 3, 'NEERAJ GOVIL', '9810033393', 'test33@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(120, 3, 'RAJ CHAWLA', '9811081083', 'rajchawlaca@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(121, 3, 'HEMANSHU GUPTA', '9810289270', 'swarups1@vsnl.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(122, 3, 'SANJEEV SINGLA ', '9811013703', 'sanjeevsingla1966@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(123, 3, 'RAKESH KUMAR', '9810039740', 'rakeshklk@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(124, 3, 'VEENA VIRMANI', '9810130031', 'rajinder_vermani@yahoo.co.in                            vermanirajinder16@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(125, 3, 'S.P. SHARMA', '9811044547', 'test34@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(126, 3, 'KULJEET SINGH CHAHAL', '9811123041', 'kuljeetsinghchahal@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(127, 3, 'SANJAY MOONA', '9810001671', 'sanjaymoona@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(128, 3, 'AMARJEET SINGH', '20553588', 'test35@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-11 00:00:47', NULL),
(129, 3, 'RAJINDER KUMAR GUPTA', '9810555338', 'test36@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(130, 3, 'ASHOK SHARMA', '9811158914', 'aksharma138@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(131, 3, 'VEENA KUMARI', '9818757530', 'karan_83kumar@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(132, 3, 'AJAY SRIVASTAVA', '9810088562', 'test37@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(133, 3, 'AJAY SINGH', '9811140003', 'test38@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(134, 3, 'NAYAN KUMAR JAVERI', '9811047936', 'hdsc_47@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(135, 3, 'V.K.SHALI', '9810753056', 'test39@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(136, 3, 'G.K.MARWAH', '9818807343', 'gkm1146@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(137, 3, 'AJIT KUMAR SINGH', '9868180518', 'test40@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(138, 3, 'ANJALI MATHUR', '9868127340', 'drnnmathur@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(139, 3, 'SATYA PRAKASH BANSAL', '9811140794', 'acaditm@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(140, 3, 'JETHANAND NAGDEV', '9891097000', 'jnagdev27@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(141, 3, 'ANIL AGGARWAL ', '9810157817', 'anilagarwaladvocate@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(142, 3, 'HANS RAJ BHASHANI', '9810014274', 'shkkind@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(143, 3, 'PRAMOD KUMAR SINGH', '9810003904', 'pks.asap@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(144, 3, 'SANJEEV KUMAR GUPTA', '9868260620', 'ssg_ca@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(145, 3, 'NARESH GUPTA ', '9891663664', 'test41@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(146, 3, 'ATUL GUPTA', '9810127018', 'atul@bluecircle.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(147, 3, 'S.N.MUKHERJEE', '22523178,   9871552448', 'esenem28@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-11 00:01:15', NULL),
(148, 3, 'SURENDER KUMAR GAMBHIR', '9810029705', 'skgambhir@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(149, 3, 'PRADEEP KUMAR GUPTA                                 ', '9810093297', 'pguptasm@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(150, 3, 'DALIP KUMAR NAGDEV', '9891096000', 'nagdevdk@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(151, 3, 'MANOJ MITTAL', '9810414972', 'test42@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(152, 3, 'SATISH KUMAR AGGARWAL', '9810066665', 'sggarwal@vtipl.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(153, 3, 'ACHAL SHANKAR DAVE', '9810036662', 'davesurbhi@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(154, 3, 'RAVINDRA ARORA', '9811079541', 'dr.ravi.arora@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(155, 3, 'PREETI KATIAL', '9891027271', 'pkatial74@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(156, 3, 'AMITABH MISHRA', '9810159495', 'test43@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(157, 3, 'BHARAT BHUSHAN', '9818773747', 'bdr.bhushan@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(158, 3, 'PRABHAT KUMAR ', '9811033318', 'prabhatbooks@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(159, 3, 'SHYAM KUMAR KOHLI', '9810141392', 'shyam.kohli.sk@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(160, 3, 'NEERAJ PANDIT ', '9810469475', 'drneerajpandit@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(161, 3, 'VIKAS VERMA', '9810013419', 'vikas_verma22@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(162, 3, 'AJAY JAIN ', '9810038428', 'ajay72jain@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(163, 3, 'IQBAL SINGH JAGDEVA', '9810011757', 'iqbal1175@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(164, 3, 'VISHAL GROVER', '9811027284', 'vishalgrover@me.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(165, 3, 'INDU BHATIA', '9811196111', 'bhatia_kamalindu@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(166, 3, 'SUBHASH ANAND', '9312405095', 'test45@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(167, 3, 'JAGDISH RAI MITTAL', '9818351600', 'novaplasmold@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(168, 3, 'VINAY AGGARWAL', '9811050403', 'vinayaggar@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(169, 3, 'AJAY KHEMANI', '9810118344', 'ajaykhemani@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(170, 3, 'SUNIL BHANSALI', '9811078457', 'casunil@oswalsunil.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(171, 3, 'YATENDER SHARMA', '9868035100', 'yatendrasharma_2000@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(172, 3, 'PRADEEP CHAUDHARY', '9810190645', 'choudhary1976advocate@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(173, 3, 'RAKESH KUMAR CHOUDHARY', '9810679331', 'rkchaudhary60@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(174, 3, 'SHRI RAM YADAV', '9811018006', 'shriramyadava@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(175, 3, 'PANKAJ DIWAN', '9810117711', 'test46@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(176, 3, 'RAM KUMAR GUPTA', '9811226095', 'r.k.guptaco@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(177, 3, 'R.P.CHOUDHARY', '9810286488', 'chaudharyadvocate@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(178, 3, 'DEEPAK SALUJA', '9810018137', 'deepak.saluja1008@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(179, 3, 'DINESH KUMAR ', '9810755994', 'dineshdrk@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(180, 3, 'MUKESH KUMAR NARULA', '9810059299', 'test47@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(181, 3, 'VINOD KUMAR AGGARWAL', '9810082505', 'agarwal486@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(182, 3, 'GURINDER SINGH SIKKA', '9811078022', 'test48@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(183, 3, 'D.P.GUPTA', '9891049044', 'dwarka1942@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(184, 3, 'ASHWANI KUMAR VATTA', '9811554949', 'akvatta@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(185, 3, 'SUSHIL KUMAR', '9810156972', 'sstraders@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(186, 3, 'SUBASH CHAND DHINGRA', '9810012233', 'test49@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(187, 3, 'SHASHANK BINDAL', '9811366887', 'bindal.shashank@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(188, 3, 'VIKAS ARORA', '9811422661', 'test50@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(189, 3, 'ADITYA ARORA', '9810036139', 'apjc57@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(190, 3, 'ANIL KUMAR', '9810790445', 'test51@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(191, 3, 'PANCHI JAIN', '9810819650', 'test52@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(192, 3, 'ANIL MOHAN', '9868489711', 'test53@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(193, 3, 'PRAVEEN KUMAR JAIN', '9811432741', 'pkjain57@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(194, 3, 'SUBHASH CHAWLA', '9811095873', 'silvoindia@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(195, 3, 'AJAY VERMA', '9810288721', 'test54@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(196, 3, 'SANDEEP KHANNA', '9811407820', 'test55@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(197, 3, 'SANJEEV KARAN SINGH', '9312411000', 'test56@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(198, 3, 'SURESH CHAND', '9811205078', 'promila@proemp.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(199, 3, 'NARENDER KUMAR GUPTA', '9810112322', 'test57@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(200, 3, 'S.S. CHAUHAN', '9811552414', 'alcon0029@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(201, 3, 'AKHIL KHANNA', '9810065435', 'akhil.capricorn@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(202, 3, 'RAJIV BINDRA', '9810890173', 'rajeev.bindra@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(203, 3, 'VIJAY KUMAR SHUKLA ', '9810120927', 'vijaykumarshuklaadv@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(204, 3, 'MUKESH JAIN', '9312832582', 'mukesh.jain6010@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(205, 3, 'SURINDER KAPUR', '9810898898', 'sk1950@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(206, 3, 'MADHU K SRIVASTAV', '9313992793', 'test58@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(207, 3, 'HARVINDER SINGH SIKKA', '9810003990', 'harvindersikka@sikka.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(208, 3, 'YOGENDER PAL TYAGI', '9810402997', 'yptsahitya@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(209, 3, 'DEEPAK JAIN ', '9810267801', 'test59@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(210, 3, 'DIWAS JAIN', '9810607802', 'test60@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(211, 3, 'RAJESH KHANDELWAL', '9810311229', 'sprpapers@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(212, 3, 'CHETAN KAPOOR', '9818351000', 'kapoorchetan@hotmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(213, 3, 'PRAMOD KUMAR ASTHANA', '9811523515', 'pkasthana@live.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(214, 3, 'PRAMOD GUPTA', '9810500666', 'image.buildco@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(215, 3, 'RAJEEV AHUJA', '9810013429', 'rajeev.ahuja@hcl.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(216, 3, 'DHANESH GUPTA', '9810168795', 'jaidurgaenterprises.dg@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(217, 3, 'PARVEEN KUMAR AASTHA', '9811120004', 'test61@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(218, 3, 'SANJEEV BHASIN ', '9891199457', 'sanjeev@sportychef.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(219, 3, 'SANJAY PODDAR', '9810119145', 'sprrk@me.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(220, 3, 'P.K.SHARDA', '000', 'test63@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-11 00:03:22', NULL),
(221, 3, 'SANDEEP MATHUR', '9810301733', 'triveni.noida@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(222, 3, 'AMARJEET  CHHABRA', '9868182849', 'test64@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(223, 3, 'GIRISH C AGGARWAL', '7000000000', 'test65@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(224, 3, 'SURYA PRAKASH GARG', '9812664766', 'test66@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(225, 3, 'RAJINDER GUPTA', '9811417690', 'rgupta70@rediffmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(226, 3, 'THAKUR DALIP SINGH', '9810994444', 'test67@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(227, 3, 'PRABHAT ARORA', '9868364267', 'test68@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(228, 3, 'BHARAT AHUJA', '8000000000', 'test69@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(229, 3, 'ANUP. K. GOSAIN', '9811039355', 'gosainanoop@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(230, 3, 'GURMEET SINGH TANEJA', '9810048840', 'highwaytravelindia@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(231, 3, 'ARUN KUMAR SRIVASTAV', '9810108801', 'arunkumarjdu@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(232, 3, 'DHANANJAY M PARANJPAI', '9000000000', 'test70@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(233, 3, 'RAKESH AHUJA', '9811204204', 'test71@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(234, 3, 'SURENDRA KR. JAIN', '9810124987', 'test72@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(235, 3, 'O.P. ARORA', '9811010654', 'test73@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(236, 3, 'H.C.SHARMA', '9312406457', 'hcs_advocate@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(237, 3, 'S.P.SINGH', '1100000000', 'test74@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(238, 3, 'MUKUL JAIN', '9810033353', 'mukuljain.co@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(239, 3, 'VIJAY GOEL', '9350101820', 'vijaygoel_2009@yahoo.co.in', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(240, 3, 'AMARJEET SINGH BAMMI', '9810436080', 'gsservicestation@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(241, 3, 'RAMESH PANDIT', '9871004789', 'rameshpanditfansclub@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(242, 3, 'BHRAMAJIT SINGH RANDHAWA', '9818148966', 'bsr@speedofer.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(243, 3, 'ANUJ BERRY', '9810000073', 'test75@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(244, 3, 'RAJ BIRBAL', '9810073751', 'rajbirbal53@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(245, 3, 'NANDITA KUMAR', '9899810140', 'kumarnandita@yahoo.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(246, 3, 'RAKESH TIWARI', '9811554359', 'test76@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(247, 3, 'SANJAY KUMAR ARORA', '9811048768', 'aroraassociates43@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(248, 3, 'G.S.AHUWALIA', '9891256919', 'test77@gmail.com', NULL, '2025-06-09 19:10:09', '2025-06-09 19:10:09', NULL),
(249, 3, 'HINA GHELANI', '9810137954', 'sew4@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(250, 3, 'ASHITA GHELANI', '9810047859', 'test78@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(251, 3, 'SANTOSH KUMAR BAGLA', '9810114104', 'santosh_bagla@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(252, 3, 'RAJNISH KUMAR AGGARWAL', '9810595649', 'test79@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(253, 3, 'USHA RANI KAUSHIK', '9810137888', 'test80@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(254, 3, 'ANIL GOYAL', '9811101454', 'drgoyalhospital@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(255, 3, 'BHARAT ANAND', '9810092369', 'test81@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(256, 3, 'RAJESH PANDEY', '9812226020', 'test82@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(257, 3, 'SURINDER KUMAR WADHWA', '9811052424', 'wadhwasuren@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(258, 3, 'VIDYA SAGAR GADHOK', '9811117876', 'rekha4960@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(259, 3, 'SUDHIR KUMAR GUPTA ', '9313850223', 'test83@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(260, 3, 'MEENU BATRA', '27550811', 'bristalhelthcare@yahoo.in', NULL, '2025-06-09 19:10:10', '2025-06-11 00:05:07', NULL),
(261, 3, 'PRADEEP GUPTA', '9810150326', 'mayfairmedicals@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(262, 3, 'MANISH JAIN', '9810258997', 'manishjain.options@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(263, 3, 'MOHD. IMRAN AMIN', '9810337765', 'md.imran.amin@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(264, 3, 'ASHWANI SETIA', '9891042944', 'ashwaniisetia@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(265, 3, 'DINESH KAPOOR', '9810028269', 'dinesh@fitness-world.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(266, 3, 'KRISHAN KUMAR DHINGRA', '9811015117', 'kkdhingra@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(267, 3, 'BRIJESH KAUSHIK', '9810270437', 'test84@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(268, 3, 'SHASHANK JAIN', '9811255066', 'sjaca1@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(269, 3, 'RENU LAHORIA', '9818494083', 'renudav@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(270, 3, 'RAJESH DANG', '9818692197', 'test85@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(271, 3, 'PANKAJ VERMA', '9818221787', 'pankajroster@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(272, 3, 'PIYUSH KUMAR GUPTA', '9810330854', 'saneh.comp@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(273, 3, 'ANJNA BUDHIRAJA', '9811054780', 'harvinderbudhiraja@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(274, 3, 'RAJNISH GUPTA', '9811243053', 'r_guptaco@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(275, 3, 'JAGDISH CHAND CHAWLA', '9837072779', 'test86@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(276, 3, 'S.C.BAWEJA', '9811046450', 'scbaveja@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(277, 3, 'GIRISH SHARMA', '9810257584', 'breqco@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(278, 3, 'S.K. CHAUDHARY ', '9810172172', 'skyclear.skc@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(279, 3, 'RAVINDER GOEL', '9810153896', 'test87@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(280, 3, 'SHYAM R VERMA', '9811012117', 'smhcp1995@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(281, 3, 'HARISH CHAND AGGARWAL ', '9811084654', 'hca@insecticidesindia.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(282, 3, 'ANIL KUMAR SARDANA', '9818100900', 'test88@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(283, 3, 'A.S. PARMAR', '9811119293', 'test89@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(284, 3, 'J.S. PARMAR', '9899889293', 'test90@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(285, 3, 'A.S.BERAR', '1300000000', 'test91@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(286, 3, 'S.K MADAN ', '9868176556', 'madansatish@yahoo.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(287, 3, 'PROMOD KUMAR MISHRA', '9868025309', 'test92@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(288, 3, 'POMPA GHOSH', '1400000000', 'test93@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(289, 3, 'S.R GUPTA', '9811893040', 'test94@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(290, 3, 'GOPAL KISHOR SARAN', '9868106868', 'test95@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(291, 3, 'SURESH BANSAL', '9810272709', 'bansalsk@indianoti.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(292, 3, 'HEM SHARMA', '9810338597', 'hemsharma10@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(293, 3, 'SANJAY JAIN', '27662455,   9910387766', 'anusanjayjain@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:05:43', NULL),
(294, 3, 'BHARAT PARASHAR ', '9910384747', 'bharatp158@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(295, 3, 'DINESH KR. WADHWA', '9810163115', 'dinesh_wad@hotmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(296, 3, 'V.K MANCHANDA', '9810094771', 'vkm9may@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(297, 3, 'SUNIL TANEJA', '9868474033', 'suniltaneja.2008@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(298, 3, 'O.P VERMA', '9810145389', 'opverma025@yahoo.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(299, 3, 'BALVINDER SINGH SOKHI', '9810207215', 'moureenindia@hotmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(300, 3, 'NARINDER LAL ANAND', '9811785543', 'test96@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(301, 3, 'SANDEEP GOEL ', '9810172490', 'dcsgoel@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(302, 3, 'RAKESH PANDEY', '31008845', 'test97@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:06:06', NULL),
(303, 3, 'SUSHIL ANEJA', '9810019506', 'nmjdsgi@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(304, 3, 'SURYAKANT SINGLA', '9810075888', 'singla_sk@hotmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(305, 3, 'N.C.Goyal', '9810220142', 'ncgoyal12@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(306, 3, 'ABHISHEK ARORA', '9811039267', 'abhi22_arora@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(307, 3, 'SUNIL AGGARWAL', '9810097098', 'saggarwal13@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(308, 3, 'R.K.VATS', '9810088354', 'bbvats@gmai.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(309, 3, 'RAKESH KUMAR GARG', '9810067637', 'test98@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(310, 3, 'MAHADEV MALHOTRA', '9971721309', 'mahadev.malhotra@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(311, 3, 'VIJAY KUMAR DOD', '9811206654', 'vijaykumar4779@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(312, 3, 'RAKESH Kr. SABHARWAL', '9811142882', 'sabharwalrakesh29@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(313, 3, 'VIKAS GUPTA', '9811031854', 'vgupta64@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(314, 3, 'KAMAL CHHABRA', '9810408818', 'kamal.chhabra3@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(315, 3, 'HARI SHANKAR SINGH', '9868755059', 'hareesh_singh48@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(316, 3, 'HEERA VALLABH SHARMA', '9213206461', 'test99@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(317, 3, 'AKHILESH BIDALIA', '9650546214', 'akhileshbidalia@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(318, 3, 'SURINDER MOHAN PATHAK', '9810154530', 'test100@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(319, 3, 'SATISH KUMAR AHLUWALIA', '9810163463', 'test101@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(320, 3, 'VIJAY PAL SINGH', '9810825253', 'test102@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(321, 3, 'SANJAY ARORA', '9810505130', 'sanjayarora2605@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(322, 3, 'RAJENDRA PRASAD  ', '9350685742', 'test103@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(323, 3, 'SURINDER SINGH KAKKAR', '9868391050', 'susik63@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(324, 3, 'NISHA AGGARWAL', '9899282232', 'test104@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(325, 3, 'SURESH KR. KOSHAL', '981012566', 'test105@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:06:25', NULL),
(326, 3, 'NARENDER NATH', '9810606056', 'test106@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(327, 3, 'RAKESH KUMAR JAIN', '9810027891', 'rkjain@uptelelinks.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(328, 3, 'D.K. ANAND', '9811227755', 'test107@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(329, 3, 'PRASANNA SATHE', '9891745803', 'pssathe@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(330, 3, 'ASHOK BATHWAL', '9810002411', 'ashok@technocab.in', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(331, 3, 'PYARA LAL BEHL', '9811524443', 'test108@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(332, 3, 'RAJESH SETH', '9810039973', 'info@vandanagraphics.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(333, 3, 'SUDESH RATAN', '9871050241', 'test109@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(334, 3, 'SANTOSH KUMAR', '9810056376', 'santosh@amsinform.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(335, 3, 'P. N. SWAROOP', '9811076796', 'test110@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(336, 3, 'RAJ KUMAR JAIN', '9811033504', 'info@risinggroupindia.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(337, 3, 'PEEYUSH AGGARWAL', '9312432201', 'peeyush@indialiaison.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(338, 3, 'SHISHIR AGARWAL', '9312240290', 'test111@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(339, 3, 'SHIV KR. BANSAL', '9350340008', 'test112@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(340, 3, 'PUNEET ARORA', '9811605065', 'apt1210@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(341, 3, 'ANIL SACHDEVA', '9810176475', 'anilsachdeva@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(342, 3, 'KAPIL DEV SURI', '9312249838', 'test113@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(343, 3, 'MAHESH KUMAR TALWAR', '9811052675', 'info@unisurg.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(344, 3, 'PRADEEP AGARWAL', '9811685550', 'test114@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(345, 3, 'MANISH AGARWAL', '9810335220', 'test115@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(346, 3, 'SHMAR PAL SINGH', '9810825250', 'spsingh5757@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(347, 3, 'V.B.Sexena', '22497308', 'vbsaxena1@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:06:46', NULL),
(348, 3, 'R.S. Jaswal', '22451595', 'jaswalrs1954@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:07:03', NULL),
(349, 3, 'Jyoti Shankar Choudhary', '0120-2451353', 'jschoudhary@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:07:22', NULL),
(350, 3, 'Gautam Basu', '9910795557', 'basug@who.int', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(351, 3, 'Iqbal Singh Matharoo', '9650291332', 'ibs1558@gmail.com ', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(352, 3, 'H.K.Kapoor', '9868165972', 'test116@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(353, 3, 'Dharam Raj', '1900000000', 'test117@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(354, 3, 'A.K.Kapoor', '2100000000', 'test118@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(355, 3, 'AMARJEET SINGH', '9810085099,  22753951', 'dramarjeet.200@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:07:54', NULL),
(356, 3, 'DHARMA DATTA VERMA', '9899644061,   22247716', 'test119@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:08:15', NULL),
(357, 3, 'RADHA CHARAN', '9868892086,   22481584', 'test120@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:08:38', NULL),
(358, 3, 'PARSHOTTAM LAL AGGARWAL', '9811114907,  2880045', 'plagrawal62@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:09:31', NULL),
(359, 3, 'SUSHIL CHAND AGARWAL', '9811032280,   22376214', 'test121@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:09:55', NULL),
(360, 3, 'RAJESH KUMAR GOYAL', '9810229150,   4119150', 'test122@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:10:20', NULL),
(361, 3, 'NARESH KUMAR SHARMA', '9810543472,   22450576', 'test124@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:10:41', NULL),
(362, 3, 'RENU SHARMA', '9818271476,  26116192', 'test123@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:13:34', NULL),
(363, 3, 'M L MADAAN', '9868521626,   2252666', 'madanmadaan@rediffmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:14:04', NULL),
(364, 3, 'ANSHUMAN YADAV', '9871732068,   22441147', 'anshumanapeksha@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:14:23', NULL),
(365, 3, 'R N RAJPOOT', '23363880,   9717630314', 'errajput@yahoo.co.in', NULL, '2025-06-09 19:10:10', '2025-06-11 00:15:37', NULL),
(366, 3, 'CHARAN SINGH', '27573304,   20445263', 'charansingh10313@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:16:01', NULL),
(367, 3, 'MANISH GUPTA', '22423191,   9811025871', 'manish.gupta@nareshkgupta.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:16:25', NULL),
(368, 3, 'NITIN GUPTA', '42444879,   9810213137', 'nitin.gupta@nareshkgupta.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:16:55', NULL),
(369, 3, 'NITIN MITTAL', '22724139,   9810147514', 'nitin@nmcindia.net', NULL, '2025-06-09 19:10:10', '2025-06-11 00:17:18', NULL),
(370, 3, 'FUDAN KUMAR JHA', '23811849,   9810055432', 'fkjhaadvocate@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:17:39', NULL),
(371, 3, 'MANISH GUPTA', '22778570,   9811402142', 'manish_g30@yahoo.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:18:01', NULL),
(372, 3, 'AMIT GOEL', '22249243,   9971906622', 'hiamitgoel@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:18:20', NULL),
(373, 3, 'CHANDER SHEKHAR PANDY', '22247041,  9810465431', 'hrtindia91@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:18:38', NULL),
(374, 3, 'A.BIRMANI', '43053699,   9958573399', 'vivek.associate08@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:18:58', NULL),
(375, 3, 'RAJAT BHALLA', '9811508988', 'rajatbhalla12@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-09 19:10:10', NULL),
(376, 3, 'MANISH GOEL', '9560555788,    9560555788', 'designerghar@gmail.com', NULL, '2025-06-09 19:10:10', '2025-06-11 00:19:34', NULL),
(377, 3, 'P.S.BHANDARI', '0', 'testps@gmail.com', NULL, '2025-06-11 00:02:35', '2025-06-11 00:02:35', NULL),
(378, 3, 'RANJNA KAPOOR', '22018750,  9868488613', 'testr@gmail.com', NULL, '2025-06-11 00:15:15', '2025-06-11 00:15:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `label` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_menus`
--

CREATE TABLE `custom_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(191) NOT NULL,
  `menu_slug` varchar(191) NOT NULL,
  `menu_content` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `position` enum('header','footer') NOT NULL DEFAULT 'header',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_executives`
--

CREATE TABLE `delivery_executives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` enum('available','on_delivery','inactive') NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_fee_tiers`
--

CREATE TABLE `delivery_fee_tiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `min_distance` double DEFAULT NULL,
  `max_distance` double DEFAULT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desktop_applications`
--

CREATE TABLE `desktop_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `windows_file_path` varchar(191) DEFAULT NULL,
  `mac_intel_file_path` varchar(191) DEFAULT NULL,
  `linux_file_path` varchar(191) DEFAULT NULL,
  `mac_silicon_file_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `desktop_applications`
--

INSERT INTO `desktop_applications` (`id`, `windows_file_path`, `mac_intel_file_path`, `linux_file_path`, `mac_silicon_file_path`, `created_at`, `updated_at`) VALUES
(1, 'https://envato.froid.works/app/download/windows', 'https://envato.froid.works/app/download/macos-intel', 'https://envato.froid.works/app/download/linux', 'https://envato.froid.works/app/download/macos-silicon', '2025-08-01 09:37:42', '2025-08-01 09:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_from_name` varchar(191) DEFAULT NULL,
  `mail_from_email` varchar(191) DEFAULT NULL,
  `enable_queue` enum('yes','no') NOT NULL DEFAULT 'no',
  `mail_driver` enum('mail','smtp') NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(191) DEFAULT NULL,
  `smtp_port` varchar(191) DEFAULT NULL,
  `smtp_encryption` varchar(191) DEFAULT NULL,
  `mail_username` varchar(191) DEFAULT NULL,
  `mail_password` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `mail_from_name`, `mail_from_email`, `enable_queue`, `mail_driver`, `smtp_host`, `smtp_port`, `smtp_encryption`, `mail_username`, `mail_password`, `created_at`, `updated_at`, `email_verified`, `verified`) VALUES
(1, 'TableTrack', 'from@email.com', 'no', 'smtp', 'smtp.gmail.com', '465', 'ssl', 'myemail@gmail.com', NULL, '2025-08-01 09:38:00', '2025-08-01 09:38:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `expense_title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `receipt_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storage`
--

CREATE TABLE `file_storage` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `filename` varchar(191) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `storage_location` enum('local','aws_s3','digitalocean','wasabi','minio') NOT NULL DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storage`
--

INSERT INTO `file_storage` (`id`, `restaurant_id`, `path`, `filename`, `type`, `size`, `storage_location`, `created_at`, `updated_at`) VALUES
(1, 1, 'qrcodes', 'qrcode-branch-1-1.png', 'image/png', 2602, 'local', '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(2, 1, 'qrcodes', 'qrcode-branch-1-1.png', 'image/png', 2602, 'local', '2025-08-01 09:37:57', '2025-08-01 09:37:57'),
(3, 1, 'qrcodes', 'qrcode-branch-2-1.png', 'image/png', 2611, 'local', '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(4, 1, 'qrcodes', 'qrcode-branch-2-1.png', 'image/png', 2611, 'local', '2025-08-01 09:37:59', '2025-08-01 09:37:59'),
(5, 2, 'qrcodes', 'qrcode-branch-3-2.png', 'image/png', 2577, 'local', '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(6, 2, 'qrcodes', 'qrcode-3-r01.png', 'image/png', 4703, 'local', '2025-08-02 07:33:47', '2025-08-02 07:33:47'),
(7, 2, 'item', 'fdb2a1566f73c1c7dc62f6f76e770370.jpg', 'image/jpeg', 283600, 'local', '2025-08-02 07:56:53', '2025-08-02 07:56:53'),
(8, 2, 'item', 'a78b86713990bed762da2876f0bfee9b.jpg', 'image/jpeg', 137866, 'local', '2025-08-02 08:02:13', '2025-08-02 08:02:13'),
(9, 2, 'item', 'c4675913048217e0064f6108d9d3cc5f.jpeg', 'image/jpeg', 21765, 'local', '2025-08-02 08:13:35', '2025-08-02 08:13:35'),
(10, 3, 'qrcodes', 'qrcode-branch-4-3.png', 'image/png', 2536, 'local', '2025-08-02 12:31:23', '2025-08-02 12:31:23'),
(11, 3, 'logo', 'a7cd310301f3def89819406cfa9fabaf.jpg', 'image/jpeg', 39211, 'local', '2025-08-02 12:48:59', '2025-08-02 12:48:59'),
(12, 3, 'qrcodes', 'qrcode-4-m1.png', 'image/png', 4383, 'local', '2025-08-02 14:57:58', '2025-08-02 14:57:58'),
(13, 3, 'qrcodes', 'qrcode-4-m2.png', 'image/png', 4722, 'local', '2025-08-02 14:58:14', '2025-08-02 14:58:14'),
(14, 3, 'qrcodes', 'qrcode-4-m3.png', 'image/png', 4754, 'local', '2025-08-02 14:58:31', '2025-08-02 14:58:31'),
(15, 3, 'qrcodes', 'qrcode-4-m4.png', 'image/png', 4506, 'local', '2025-08-02 14:59:47', '2025-08-02 14:59:47'),
(16, 3, 'qrcodes', 'qrcode-4-m5.png', 'image/png', 4647, 'local', '2025-08-02 15:00:15', '2025-08-02 15:00:15'),
(17, 3, 'qrcodes', 'qrcode-4-m6.png', 'image/png', 4825, 'local', '2025-08-02 15:00:25', '2025-08-02 15:00:25'),
(18, 3, 'qrcodes', 'qrcode-4-m7.png', 'image/png', 4536, 'local', '2025-08-02 15:00:42', '2025-08-02 15:00:42'),
(19, 3, 'qrcodes', 'qrcode-4-m8.png', 'image/png', 4840, 'local', '2025-08-02 15:01:08', '2025-08-02 15:01:08'),
(20, 3, 'qrcodes', 'qrcode-4-m9.png', 'image/png', 4820, 'local', '2025-08-02 15:01:27', '2025-08-02 15:01:27'),
(21, 3, 'qrcodes', 'qrcode-4-m10.png', 'image/png', 4954, 'local', '2025-08-02 15:01:43', '2025-08-02 15:01:43'),
(22, 3, 'qrcodes', 'qrcode-4-t1.png', 'image/png', 4301, 'local', '2025-08-02 15:02:46', '2025-08-02 15:02:46'),
(23, 3, 'qrcodes', 'qrcode-4-t2.png', 'image/png', 4584, 'local', '2025-08-02 15:02:58', '2025-08-02 15:02:58'),
(24, 3, 'qrcodes', 'qrcode-4-t3.png', 'image/png', 4576, 'local', '2025-08-02 15:03:08', '2025-08-02 15:03:08'),
(25, 3, 'qrcodes', 'qrcode-4-t4.png', 'image/png', 4428, 'local', '2025-08-02 15:03:17', '2025-08-02 15:03:17'),
(26, 3, 'qrcodes', 'qrcode-4-t5.png', 'image/png', 4554, 'local', '2025-08-02 15:03:27', '2025-08-02 15:03:27'),
(27, 3, 'qrcodes', 'qrcode-4-t6.png', 'image/png', 4682, 'local', '2025-08-02 15:04:17', '2025-08-02 15:04:17'),
(28, 3, 'qrcodes', 'qrcode-4-t7.png', 'image/png', 4409, 'local', '2025-08-02 15:04:25', '2025-08-02 15:04:25'),
(29, 3, 'qrcodes', 'qrcode-4-t8.png', 'image/png', 4665, 'local', '2025-08-02 15:04:33', '2025-08-02 15:04:33'),
(30, 3, 'qrcodes', 'qrcode-4-t9.png', 'image/png', 4723, 'local', '2025-08-02 15:04:40', '2025-08-02 15:04:40'),
(31, 3, 'qrcodes', 'qrcode-4-t10.png', 'image/png', 4764, 'local', '2025-08-02 15:04:49', '2025-08-02 15:04:49'),
(32, 3, 'qrcodes', 'qrcode-4-t11.png', 'image/png', 4398, 'local', '2025-08-02 15:04:57', '2025-08-02 15:04:57'),
(33, 3, 'qrcodes', 'qrcode-4-t12.png', 'image/png', 4775, 'local', '2025-08-02 15:05:31', '2025-08-02 15:05:31'),
(34, 3, 'qrcodes', 'qrcode-4-t13.png', 'image/png', 4791, 'local', '2025-08-02 15:05:39', '2025-08-02 15:05:39'),
(35, 3, 'qrcodes', 'qrcode-4-t14.png', 'image/png', 4626, 'local', '2025-08-02 15:05:47', '2025-08-02 15:05:47'),
(36, 3, 'qrcodes', 'qrcode-4-t15.png', 'image/png', 4714, 'local', '2025-08-02 15:05:55', '2025-08-02 15:05:55'),
(37, 3, 'qrcodes', 'qrcode-4-t16.png', 'image/png', 4843, 'local', '2025-08-02 15:06:03', '2025-08-02 15:06:03'),
(38, 3, 'qrcodes', 'qrcode-4-t17.png', 'image/png', 4577, 'local', '2025-08-02 15:06:37', '2025-08-02 15:06:37'),
(39, 3, 'qrcodes', 'qrcode-4-t18.png', 'image/png', 4781, 'local', '2025-08-02 15:06:45', '2025-08-02 15:06:45'),
(40, 3, 'qrcodes', 'qrcode-4-t19.png', 'image/png', 4844, 'local', '2025-08-02 15:06:53', '2025-08-02 15:06:53'),
(41, 3, 'qrcodes', 'qrcode-4-t20.png', 'image/png', 5029, 'local', '2025-08-02 15:07:20', '2025-08-02 15:07:20'),
(42, 3, 'qrcodes', 'qrcode-4-vip-area.png', 'image/png', 4822, 'local', '2025-08-02 15:07:58', '2025-08-02 15:07:58'),
(43, 3, 'item', '9a576d4577e1c41dee262a662a3fc039.jpg', 'image/jpeg', 39755, 'local', '2025-08-02 16:22:34', '2025-08-02 16:22:34'),
(44, 3, 'item', 'b8920237aefd24b48f7bd82422b01fb5.jpg', 'image/jpeg', 24355, 'local', '2025-08-02 17:31:22', '2025-08-02 17:31:22'),
(45, 3, 'item', '2482e1f36ba6681ba249279c48e2b2f8.jpg', 'image/jpeg', 80110, 'local', '2025-08-02 17:33:46', '2025-08-02 17:33:46'),
(46, 3, 'item', 'a893054c4409c2534a3b1b21ea17f2f9.jpg', 'image/jpeg', 34025, 'local', '2025-08-02 17:36:05', '2025-08-02 17:36:05'),
(47, 3, 'item', 'c626b95826c3eb0e7d8d51d7f7b339fd.jpg', 'image/jpeg', 76791, 'local', '2025-08-02 17:37:56', '2025-08-02 17:37:56'),
(48, 3, 'item', '00c0cf32a588ef7e9abb21e76d28723b.png', 'image/png', 294848, 'local', '2025-08-02 17:39:54', '2025-08-02 17:39:54'),
(49, 3, 'item', '67cfc3b6d45bc64c65a7e7a196a32d2d.jpg', 'image/jpeg', 37090, 'local', '2025-08-02 17:41:32', '2025-08-02 17:41:32'),
(50, 3, 'item', 'e99fd9d8121ce36669cf975a455d8ff2.jpg', 'image/jpeg', 80869, 'local', '2025-08-02 17:46:17', '2025-08-02 17:46:17'),
(51, 3, 'item', '8ffa0ad56a75a5385d53abcdbd40b6ce.jpg', 'image/jpeg', 24355, 'local', '2025-08-02 17:48:27', '2025-08-02 17:48:27'),
(52, 3, 'item', 'ad0f4af0d6668af722aa512960300d78.jpg', 'image/jpeg', 23940, 'local', '2025-08-02 17:51:57', '2025-08-02 17:51:57'),
(53, 3, 'item', '4eb6010bdffc0c1e5dd7cfec5d171d67.jpg', 'image/jpeg', 29567, 'local', '2025-08-02 17:55:21', '2025-08-02 17:55:21'),
(54, 3, 'item', '88663b934d554728c2c86cfd96990d1f.jpeg', 'image/jpeg', 46828, 'local', '2025-08-02 17:58:05', '2025-08-02 17:58:05'),
(55, 3, 'item', '38cc7b780c26e15929d603103562d5fd.jpg', 'image/jpeg', 23971, 'local', '2025-08-02 17:59:43', '2025-08-02 17:59:43'),
(56, 3, 'item', '874d91540341aaea62afacb282087144.png', 'image/png', 451509, 'local', '2025-08-02 18:02:07', '2025-08-02 18:02:07'),
(57, 3, 'item', 'd1f0231db2c9249c0f50db7ecc95cc11.jpg', 'image/jpeg', 31034, 'local', '2025-08-02 18:05:56', '2025-08-02 18:05:56'),
(58, 3, 'item', 'cbfb4eb4f9cc6ebba6fef06bfa0e2340.jpg', 'image/jpeg', 57848, 'local', '2025-08-02 18:11:15', '2025-08-02 18:11:15'),
(59, 3, 'item', 'da72041716124c150aa3b7075e840d51.png', 'image/png', 679233, 'local', '2025-08-02 18:12:33', '2025-08-02 18:12:33'),
(60, 3, 'item', '1f8eb3b7b335bcc137e47776637f8024.png', 'image/png', 490108, 'local', '2025-08-02 18:14:10', '2025-08-02 18:14:10'),
(61, 3, 'item', '819a27531d04d13dd78c65979171edcd.png', 'image/png', 339312, 'local', '2025-08-02 18:16:55', '2025-08-02 18:16:55'),
(62, 3, 'item', 'b68a75a396e13b2e6141ca94d88aee8d.png', 'image/png', 238582, 'local', '2025-08-02 18:19:20', '2025-08-02 18:19:20'),
(63, 3, 'item', '5cdf0c2d41fff790fded6539f25ee7e1.png', 'image/png', 334876, 'local', '2025-08-02 18:20:54', '2025-08-02 18:20:54'),
(64, 3, 'item', 'feef5a60623484fecb0ee07e426d10c0.png', 'image/png', 478947, 'local', '2025-08-02 18:23:23', '2025-08-02 18:23:23'),
(65, 3, 'item', 'd37de989709420d33e47c7271bbed59a.jpg', 'image/jpeg', 59085, 'local', '2025-08-02 18:26:51', '2025-08-02 18:26:51'),
(66, 3, 'item', '3ba98f7fcb41096997a125236cfafd80.png', 'image/png', 367046, 'local', '2025-08-02 18:28:00', '2025-08-02 18:28:00'),
(67, 3, 'item', '34e98785439caaebe64952da0ef79c8f.png', 'image/png', 358020, 'local', '2025-08-02 18:45:05', '2025-08-02 18:45:05'),
(68, 3, 'item', 'dd1cd05ba2b80082b3f198aacd0f4833.png', 'image/png', 325231, 'local', '2025-08-02 18:47:24', '2025-08-02 18:47:24'),
(69, 3, 'item', '880485e40a901eb28afa27fb21abc85f.png', 'image/png', 535256, 'local', '2025-08-02 18:49:37', '2025-08-02 18:49:37'),
(70, 3, 'item', 'a8ec8fab7ef4eb4f408661ddf2ecaa22.jpg', 'image/jpeg', 278779, 'local', '2025-08-02 18:53:12', '2025-08-02 18:53:12'),
(71, 3, 'item', '9bb90d97f11bfe2e821492f2828c5c1c.png', 'image/png', 492142, 'local', '2025-08-02 18:56:04', '2025-08-02 18:56:04'),
(72, 3, 'item', '0ca1d5d35a8c77ffb7dede14e4720a46.png', 'image/png', 687025, 'local', '2025-08-02 19:02:50', '2025-08-02 19:02:50'),
(73, NULL, 'logo', '2b0678d0fe06be49a3c1f7671520fb7e.jpg', 'image/jpeg', 39211, 'local', '2025-08-02 19:14:43', '2025-08-02 19:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

CREATE TABLE `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `filesystem` varchar(191) NOT NULL,
  `auth_keys` text DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storage_settings`
--

INSERT INTO `file_storage_settings` (`id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, 'local', NULL, 'enabled', '2025-08-01 09:36:02', '2025-08-01 09:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `capital` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `continent` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flags`
--

INSERT INTO `flags` (`id`, `capital`, `code`, `continent`, `name`) VALUES
(1, 'Kabul', 'af', 'Asia', 'Afghanistan'),
(2, 'Mariehamn', 'ax', 'Europe', 'Aland Islands'),
(3, 'Tirana', 'al', 'Europe', 'Albania'),
(4, 'Algiers', 'dz', 'Africa', 'Algeria'),
(5, 'Pago Pago', 'as', 'Oceania', 'American Samoa'),
(6, 'Andorra la Vella', 'ad', 'Europe', 'Andorra'),
(7, 'Luanda', 'ao', 'Africa', 'Angola'),
(8, 'The Valley', 'ai', 'North America', 'Anguilla'),
(9, '', 'aq', '', 'Antarctica'),
(10, 'St. John\'s', 'ag', 'North America', 'Antigua and Barbuda'),
(11, 'Buenos Aires', 'ar', 'South America', 'Argentina'),
(12, 'Yerevan', 'am', 'Asia', 'Armenia'),
(13, 'Oranjestad', 'aw', 'South America', 'Aruba'),
(14, 'Georgetown', 'ac', 'Africa', 'Ascension Island'),
(15, 'Canberra', 'au', 'Oceania', 'Australia'),
(16, 'Vienna', 'at', 'Europe', 'Austria'),
(17, 'Baku', 'az', 'Asia', 'Azerbaijan'),
(18, 'Nassau', 'bs', 'North America', 'Bahamas'),
(19, 'Manama', 'bh', 'Asia', 'Bahrain'),
(20, 'Dhaka', 'bd', 'Asia', 'Bangladesh'),
(21, 'Bridgetown', 'bb', 'North America', 'Barbados'),
(22, 'Minsk', 'by', 'Europe', 'Belarus'),
(23, 'Brussels', 'be', 'Europe', 'Belgium'),
(24, 'Belmopan', 'bz', 'North America', 'Belize'),
(25, 'Porto-Novo', 'bj', 'Africa', 'Benin'),
(26, 'Hamilton', 'bm', 'North America', 'Bermuda'),
(27, 'Thimphu', 'bt', 'Asia', 'Bhutan'),
(28, 'Sucre', 'bo', 'South America', 'Bolivia'),
(29, 'Kralendijk', 'bq', 'South America', 'Bonaire, Sint Eustatius and Saba'),
(30, 'Sarajevo', 'ba', 'Europe', 'Bosnia and Herzegovina'),
(31, 'Gaborone', 'bw', 'Africa', 'Botswana'),
(32, '', 'bv', '', 'Bouvet Island'),
(33, 'Brasília', 'br', 'South America', 'Brazil'),
(34, 'Diego Garcia', 'io', 'Asia', 'British Indian Ocean Territory'),
(35, 'Bandar Seri Begawan', 'bn', 'Asia', 'Brunei Darussalam'),
(36, 'Sofia', 'bg', 'Europe', 'Bulgaria'),
(37, 'Ouagadougou', 'bf', 'Africa', 'Burkina Faso'),
(38, 'Bujumbura', 'bi', 'Africa', 'Burundi'),
(39, 'Praia', 'cv', 'Africa', 'Cabo Verde'),
(40, 'Phnom Penh', 'kh', 'Asia', 'Cambodia'),
(41, 'Yaoundé', 'cm', 'Africa', 'Cameroon'),
(42, 'Ottawa', 'ca', 'North America', 'Canada'),
(43, '', 'ic', '', 'Canary Islands'),
(44, '', 'es-ct', '', 'Catalonia'),
(45, 'George Town', 'ky', 'North America', 'Cayman Islands'),
(46, 'Bangui', 'cf', 'Africa', 'Central African Republic'),
(47, '', 'cefta', '', 'Central European Free Trade Agreement'),
(48, '', 'ea', '', 'Ceuta & Melilla'),
(49, 'N\'Djamena', 'td', 'Africa', 'Chad'),
(50, 'Santiago', 'cl', 'South America', 'Chile'),
(51, 'Beijing', 'cn', 'Asia', 'China'),
(52, 'Flying Fish Cove', 'cx', 'Asia', 'Christmas Island'),
(53, '', 'cp', '', 'Clipperton Island'),
(54, 'West Island', 'cc', 'Asia', 'Cocos (Keeling) Islands'),
(55, 'Bogotá', 'co', 'South America', 'Colombia'),
(56, 'Moroni', 'km', 'Africa', 'Comoros'),
(57, 'Avarua', 'ck', 'Oceania', 'Cook Islands'),
(58, 'San José', 'cr', 'North America', 'Costa Rica'),
(59, 'Zagreb', 'hr', 'Europe', 'Croatia'),
(60, 'Havana', 'cu', 'North America', 'Cuba'),
(61, 'Willemstad', 'cw', 'South America', 'Curaçao'),
(62, 'Nicosia', 'cy', 'Europe', 'Cyprus'),
(63, 'Prague', 'cz', 'Europe', 'Czech Republic'),
(64, 'Yamoussoukro', 'ci', 'Africa', 'Côte d\'Ivoire'),
(65, 'Kinshasa', 'cd', 'Africa', 'Democratic Republic of the Congo'),
(66, 'Copenhagen', 'dk', 'Europe', 'Denmark'),
(67, '', 'dg', '', 'Diego Garcia'),
(68, 'Djibouti', 'dj', 'Africa', 'Djibouti'),
(69, 'Roseau', 'dm', 'North America', 'Dominica'),
(70, 'Santo Domingo', 'do', 'North America', 'Dominican Republic'),
(71, 'Quito', 'ec', 'South America', 'Ecuador'),
(72, 'Cairo', 'eg', 'Africa', 'Egypt'),
(73, 'San Salvador', 'sv', 'North America', 'El Salvador'),
(74, 'London', 'gb-eng', 'Europe', 'England'),
(75, 'Malabo', 'gq', 'Africa', 'Equatorial Guinea'),
(76, 'Asmara', 'er', 'Africa', 'Eritrea'),
(77, 'Tallinn', 'ee', 'Europe', 'Estonia'),
(78, 'Lobamba, Mbabane', 'sz', 'Africa', 'Eswatini'),
(79, 'Addis Ababa', 'et', 'Africa', 'Ethiopia'),
(80, '', 'eu', '', 'Europe'),
(81, 'Stanley', 'fk', 'South America', 'Falkland Islands'),
(82, 'Tórshavn', 'fo', 'Europe', 'Faroe Islands'),
(83, 'Palikir', 'fm', 'Oceania', 'Federated States of Micronesia'),
(84, 'Suva', 'fj', 'Oceania', 'Fiji'),
(85, 'Helsinki', 'fi', 'Europe', 'Finland'),
(86, 'Paris', 'fr', 'Europe', 'France'),
(87, 'Cayenne', 'gf', 'South America', 'French Guiana'),
(88, 'Papeete', 'pf', 'Oceania', 'French Polynesia'),
(89, 'Saint-Pierre, Réunion', 'tf', 'Africa', 'French Southern Territories'),
(90, 'Libreville', 'ga', 'Africa', 'Gabon'),
(91, '', 'es-ga', '', 'Galicia'),
(92, 'Banjul', 'gm', 'Africa', 'Gambia'),
(93, 'Tbilisi', 'ge', 'Asia', 'Georgia'),
(94, 'Berlin', 'de', 'Europe', 'Germany'),
(95, 'Accra', 'gh', 'Africa', 'Ghana'),
(96, 'Gibraltar', 'gi', 'Europe', 'Gibraltar'),
(97, 'Athens', 'gr', 'Europe', 'Greece'),
(98, 'Nuuk', 'gl', 'North America', 'Greenland'),
(99, 'St. George\'s', 'gd', 'North America', 'Grenada'),
(100, 'Basse-Terre', 'gp', 'North America', 'Guadeloupe'),
(101, 'Hagåtña', 'gu', 'Oceania', 'Guam'),
(102, 'Guatemala City', 'gt', 'North America', 'Guatemala'),
(103, 'Saint Peter Port', 'gg', 'Europe', 'Guernsey'),
(104, 'Conakry', 'gn', 'Africa', 'Guinea'),
(105, 'Bissau', 'gw', 'Africa', 'Guinea-Bissau'),
(106, 'Georgetown', 'gy', 'South America', 'Guyana'),
(107, 'Port-au-Prince', 'ht', 'North America', 'Haiti'),
(108, '', 'hm', '', 'Heard Island and McDonald Islands'),
(109, 'Vatican City', 'va', 'Europe', 'Holy See'),
(110, 'Tegucigalpa', 'hn', 'North America', 'Honduras'),
(111, 'Hong Kong', 'hk', 'Asia', 'Hong Kong'),
(112, 'Budapest', 'hu', 'Europe', 'Hungary'),
(113, 'Reykjavik', 'is', 'Europe', 'Iceland'),
(114, 'New Delhi', 'in', 'Asia', 'India'),
(115, 'Jakarta', 'id', 'Asia', 'Indonesia'),
(116, 'Tehran', 'ir', 'Asia', 'Iran'),
(117, 'Baghdad', 'iq', 'Asia', 'Iraq'),
(118, 'Dublin', 'ie', 'Europe', 'Ireland'),
(119, 'Douglas', 'im', 'Europe', 'Isle of Man'),
(120, 'Jerusalem', 'il', 'Asia', 'Israel'),
(121, 'Rome', 'it', 'Europe', 'Italy'),
(122, 'Kingston', 'jm', 'North America', 'Jamaica'),
(123, 'Tokyo', 'jp', 'Asia', 'Japan'),
(124, 'Saint Helier', 'je', 'Europe', 'Jersey'),
(125, 'Amman', 'jo', 'Asia', 'Jordan'),
(126, 'Astana', 'kz', 'Asia', 'Kazakhstan'),
(127, 'Nairobi', 'ke', 'Africa', 'Kenya'),
(128, 'South Tarawa', 'ki', 'Oceania', 'Kiribati'),
(129, 'Pristina', 'xk', 'Europe', 'Kosovo'),
(130, 'Kuwait City', 'kw', 'Asia', 'Kuwait'),
(131, 'Bishkek', 'kg', 'Asia', 'Kyrgyzstan'),
(132, 'Vientiane', 'la', 'Asia', 'Laos'),
(133, 'Riga', 'lv', 'Europe', 'Latvia'),
(134, 'Beirut', 'lb', 'Asia', 'Lebanon'),
(135, 'Maseru', 'ls', 'Africa', 'Lesotho'),
(136, 'Monrovia', 'lr', 'Africa', 'Liberia'),
(137, 'Tripoli', 'ly', 'Africa', 'Libya'),
(138, 'Vaduz', 'li', 'Europe', 'Liechtenstein'),
(139, 'Vilnius', 'lt', 'Europe', 'Lithuania'),
(140, 'Luxembourg City', 'lu', 'Europe', 'Luxembourg'),
(141, 'Macau', 'mo', 'Asia', 'Macau'),
(142, 'Antananarivo', 'mg', 'Africa', 'Madagascar'),
(143, 'Lilongwe', 'mw', 'Africa', 'Malawi'),
(144, 'Kuala Lumpur', 'my', 'Asia', 'Malaysia'),
(145, 'Malé', 'mv', 'Asia', 'Maldives'),
(146, 'Bamako', 'ml', 'Africa', 'Mali'),
(147, 'Valletta', 'mt', 'Europe', 'Malta'),
(148, 'Majuro', 'mh', 'Oceania', 'Marshall Islands'),
(149, 'Fort-de-France', 'mq', 'North America', 'Martinique'),
(150, 'Nouakchott', 'mr', 'Africa', 'Mauritania'),
(151, 'Port Louis', 'mu', 'Africa', 'Mauritius'),
(152, 'Mamoudzou', 'yt', 'Africa', 'Mayotte'),
(153, 'Mexico City', 'mx', 'North America', 'Mexico'),
(154, 'Chișinău', 'md', 'Europe', 'Moldova'),
(155, 'Monaco', 'mc', 'Europe', 'Monaco'),
(156, 'Ulaanbaatar', 'mn', 'Asia', 'Mongolia'),
(157, 'Podgorica', 'me', 'Europe', 'Montenegro'),
(158, 'Little Bay, Brades, Plymouth', 'ms', 'North America', 'Montserrat'),
(159, 'Rabat', 'ma', 'Africa', 'Morocco'),
(160, 'Maputo', 'mz', 'Africa', 'Mozambique'),
(161, 'Naypyidaw', 'mm', 'Asia', 'Myanmar'),
(162, 'Windhoek', 'na', 'Africa', 'Namibia'),
(163, 'Yaren District', 'nr', 'Oceania', 'Nauru'),
(164, 'Kathmandu', 'np', 'Asia', 'Nepal'),
(165, 'Amsterdam', 'nl', 'Europe', 'Netherlands'),
(166, 'Nouméa', 'nc', 'Oceania', 'New Caledonia'),
(167, 'Wellington', 'nz', 'Oceania', 'New Zealand'),
(168, 'Managua', 'ni', 'North America', 'Nicaragua'),
(169, 'Niamey', 'ne', 'Africa', 'Niger'),
(170, 'Abuja', 'ng', 'Africa', 'Nigeria'),
(171, 'Alofi', 'nu', 'Oceania', 'Niue'),
(172, 'Kingston', 'nf', 'Oceania', 'Norfolk Island'),
(173, 'Pyongyang', 'kp', 'Asia', 'North Korea'),
(174, 'Skopje', 'mk', 'Europe', 'North Macedonia'),
(175, 'Belfast', 'gb-nir', 'Europe', 'Northern Ireland'),
(176, 'Saipan', 'mp', 'Oceania', 'Northern Mariana Islands'),
(177, 'Oslo', 'no', 'Europe', 'Norway'),
(178, 'Muscat', 'om', 'Asia', 'Oman'),
(179, 'Islamabad', 'pk', 'Asia', 'Pakistan'),
(180, 'Ngerulmud', 'pw', 'Oceania', 'Palau'),
(181, 'Panama City', 'pa', 'North America', 'Panama'),
(182, 'Port Moresby', 'pg', 'Oceania', 'Papua New Guinea'),
(183, 'Asunción', 'py', 'South America', 'Paraguay'),
(184, 'Lima', 'pe', 'South America', 'Peru'),
(185, 'Manila', 'ph', 'Asia', 'Philippines'),
(186, 'Adamstown', 'pn', 'Oceania', 'Pitcairn'),
(187, 'Warsaw', 'pl', 'Europe', 'Poland'),
(188, 'Lisbon', 'pt', 'Europe', 'Portugal'),
(189, 'San Juan', 'pr', 'North America', 'Puerto Rico'),
(190, 'Doha', 'qa', 'Asia', 'Qatar'),
(191, 'Brazzaville', 'cg', 'Africa', 'Republic of the Congo'),
(192, 'Bucharest', 'ro', 'Europe', 'Romania'),
(193, 'Moscow', 'ru', 'Europe', 'Russia'),
(194, 'Kigali', 'rw', 'Africa', 'Rwanda'),
(195, 'Saint-Denis', 're', 'Africa', 'Réunion'),
(196, 'Gustavia', 'bl', 'North America', 'Saint Barthélemy'),
(197, 'Jamestown', 'sh', 'Africa', 'Saint Helena, Ascension and Tristan da Cunha'),
(198, 'Basseterre', 'kn', 'North America', 'Saint Kitts and Nevis'),
(199, 'Castries', 'lc', 'North America', 'Saint Lucia'),
(200, 'Marigot', 'mf', 'North America', 'Saint Martin'),
(201, 'Saint-Pierre', 'pm', 'North America', 'Saint Pierre and Miquelon'),
(202, 'Kingstown', 'vc', 'North America', 'Saint Vincent and the Grenadines'),
(203, 'Apia', 'ws', 'Oceania', 'Samoa'),
(204, 'San Marino', 'sm', 'Europe', 'San Marino'),
(205, 'São Tomé', 'st', 'Africa', 'Sao Tome and Principe'),
(206, 'Riyadh', 'sa', 'Asia', 'Saudi Arabia'),
(207, 'Edinburgh', 'gb-sct', 'Europe', 'Scotland'),
(208, 'Dakar', 'sn', 'Africa', 'Senegal'),
(209, 'Belgrade', 'rs', 'Europe', 'Serbia'),
(210, 'Victoria', 'sc', 'Africa', 'Seychelles'),
(211, 'Freetown', 'sl', 'Africa', 'Sierra Leone'),
(212, 'Singapore', 'sg', 'Asia', 'Singapore'),
(213, 'Philipsburg', 'sx', 'North America', 'Sint Maarten'),
(214, 'Bratislava', 'sk', 'Europe', 'Slovakia'),
(215, 'Ljubljana', 'si', 'Europe', 'Slovenia'),
(216, 'Honiara', 'sb', 'Oceania', 'Solomon Islands'),
(217, 'Mogadishu', 'so', 'Africa', 'Somalia'),
(218, 'Pretoria', 'za', 'Africa', 'South Africa'),
(219, 'King Edward Point', 'gs', 'Antarctica', 'South Georgia and the South Sandwich Islands'),
(220, 'Seoul', 'kr', 'Asia', 'South Korea'),
(221, 'Juba', 'ss', 'Africa', 'South Sudan'),
(222, 'Madrid', 'es', 'Europe', 'Spain'),
(223, 'Sri Jayawardenepura Kotte, Colombo', 'lk', 'Asia', 'Sri Lanka'),
(224, 'Ramallah', 'ps', 'Asia', 'State of Palestine'),
(225, 'Khartoum', 'sd', 'Africa', 'Sudan'),
(226, 'Paramaribo', 'sr', 'South America', 'Suriname'),
(227, 'Longyearbyen', 'sj', 'Europe', 'Svalbard and Jan Mayen'),
(228, 'Stockholm', 'se', 'Europe', 'Sweden'),
(229, 'Bern', 'ch', 'Europe', 'Switzerland'),
(230, 'Damascus', 'sy', 'Asia', 'Syria'),
(231, 'Taipei', 'tw', 'Asia', 'Taiwan'),
(232, 'Dushanbe', 'tj', 'Asia', 'Tajikistan'),
(233, 'Dodoma', 'tz', 'Africa', 'Tanzania'),
(234, 'Bangkok', 'th', 'Asia', 'Thailand'),
(235, 'Dili', 'tl', 'Asia', 'Timor-Leste'),
(236, 'Lomé', 'tg', 'Africa', 'Togo'),
(237, 'Nukunonu, Atafu,Tokelau', 'tk', 'Oceania', 'Tokelau'),
(238, 'Nukuʻalofa', 'to', 'Oceania', 'Tonga'),
(239, 'Port of Spain', 'tt', 'South America', 'Trinidad and Tobago'),
(240, '', 'ta', '', 'Tristan da Cunha'),
(241, 'Tunis', 'tn', 'Africa', 'Tunisia'),
(242, 'Ankara', 'tr', 'Asia', 'Turkey'),
(243, 'Ashgabat', 'tm', 'Asia', 'Turkmenistan'),
(244, 'Cockburn Town', 'tc', 'North America', 'Turks and Caicos Islands'),
(245, 'Funafuti', 'tv', 'Oceania', 'Tuvalu'),
(246, 'Kampala', 'ug', 'Africa', 'Uganda'),
(247, 'Kiev', 'ua', 'Europe', 'Ukraine'),
(248, 'Abu Dhabi', 'ae', 'Asia', 'United Arab Emirates'),
(249, 'London', 'gb', 'Europe', 'United Kingdom'),
(250, '', 'un', '', 'United Nations'),
(251, 'Washington, D.C.', 'um', 'North America', 'United States Minor Outlying Islands'),
(252, 'Washington, D.C.', 'us', 'North America', 'United States of America'),
(253, '', 'xx', '', 'Unknown'),
(254, 'Montevideo', 'uy', 'South America', 'Uruguay'),
(255, 'Tashkent', 'uz', 'Asia', 'Uzbekistan'),
(256, 'Port Vila', 'vu', 'Oceania', 'Vanuatu'),
(257, 'Caracas', 've', 'South America', 'Venezuela'),
(258, 'Hanoi', 'vn', 'Asia', 'Vietnam'),
(259, 'Road Town', 'vg', 'North America', 'Virgin Islands (British)'),
(260, 'Charlotte Amalie', 'vi', 'North America', 'Virgin Islands (U.S.)'),
(261, 'Cardiff', 'gb-wls', 'Europe', 'Wales'),
(262, 'Mata-Utu', 'wf', 'Oceania', 'Wallis and Futuna'),
(263, 'Laayoune', 'eh', 'Africa', 'Western Sahara'),
(264, 'Sana\'a', 'ye', 'Asia', 'Yemen'),
(265, 'Lusaka', 'zm', 'Africa', 'Zambia'),
(266, 'Harare', 'zw', 'Africa', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `flutterwave_payments`
--

CREATE TABLE `flutterwave_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flutterwave_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_details`
--

CREATE TABLE `front_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `header_title` varchar(200) DEFAULT NULL,
  `header_description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `feature_with_image_heading` varchar(191) DEFAULT NULL,
  `review_heading` varchar(191) DEFAULT NULL,
  `feature_with_icon_heading` varchar(191) DEFAULT NULL,
  `comments_heading` varchar(191) DEFAULT NULL,
  `price_heading` varchar(191) DEFAULT NULL,
  `price_description` varchar(191) DEFAULT NULL,
  `faq_heading` varchar(191) DEFAULT NULL,
  `faq_description` text DEFAULT NULL,
  `contact_heading` text DEFAULT NULL,
  `footer_copyright_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_details`
--

INSERT INTO `front_details` (`id`, `language_setting_id`, `header_title`, `header_description`, `image`, `feature_with_image_heading`, `review_heading`, `feature_with_icon_heading`, `comments_heading`, `price_heading`, `price_description`, `faq_heading`, `faq_description`, `contact_heading`, `footer_copyright_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Restaurant POS software made simple!', 'Easily manage orders, menus, and tables in one place. Save time, reduce errors, and grow your business faster', NULL, 'Take Control of Your Restaurant', 'What Restaurant Owners Are Saying', 'Powerful Features Built to Elevate Your Restaurant Operations', NULL, 'Simple, Transparent Pricing', 'Get everything you need to manage your restaurant with one affordable plan.', 'Your questions, answered', 'Answers to the most frequently asked questions.', 'Contact', '© 2025 TableTrack. All Rights Reserved.', '2025-08-01 09:37:59', '2025-08-01 09:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `front_faq_settings`
--

CREATE TABLE `front_faq_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_faq_settings`
--

INSERT INTO `front_faq_settings` (`id`, `language_setting_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'How can I contact customer support 1?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(2, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(3, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(4, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(5, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(6, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_features`
--

CREATE TABLE `front_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `icon` longtext DEFAULT NULL,
  `type` enum('image','icon','task','bills','team','apps') NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_features`
--

INSERT INTO `front_features` (`id`, `language_setting_id`, `title`, `description`, `image`, `icon`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Streamline Order Management', 'Never lose track of an order again. All your customer orders—from dine-in to takeout—are organized and easily accessible in one place.\n                                Speed up service and keep your kitchen running smoothly.', NULL, NULL, 'image', NULL, NULL),
(2, 1, 'Optimize Table Reservations', 'Maximize seating efficiency with real-time table tracking and reservations. Reduce wait times and ensure no table sits empty during peak hours, improving customer experience and turnover.', NULL, NULL, 'image', NULL, NULL),
(3, 1, 'Effortless Menu Management', 'Easily add, edit, or remove items from your menu on the go. Highlight specials, update prices, and keep everything in sync across all platforms, so your staff and customers always see the latest offerings.', NULL, NULL, 'image', NULL, NULL),
(4, 1, 'QR Code Menu', 'Contactless Ordering Made Easy', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                            class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                            <path\n                                d=\"M0 .5A.5.5 0 0 1 .5 0h3a.5.5 0 0 1 0 1H1v2.5a.5.5 0 0 1-1 0zm12 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0V1h-2.5a.5.5 0 0 1-.5-.5M.5 12a.5.5 0 0 1 .5.5V15h2.5a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H15v-2.5a.5.5 0 0 1 .5-.5M4 4h1v1H4z\" />\n                            <path d=\"M7 2H2v5h5zM3 3h3v3H3zm2 8H4v1h1z\" />\n                            <path d=\"M7 9H2v5h5zm-4 1h3v3H3zm8-6h1v1h-1z\" />\n                            <path\n                                d=\"M9 2h5v5H9zm1 1v3h3V3zM8 8v2h1v1H8v1h2v-2h1v2h1v-1h2v-1h-3V8zm2 2H9V9h1zm4 2h-1v1h-2v1h3zm-4 2v-1H8v1z\" />\n                            <path d=\"M12 9h2V8h-2z\" />\n                        </svg>', 'bi-qr-code', 'icon', NULL, NULL),
(5, 1, 'Payment Gateway Integration', 'Fast, Secure, and Flexible Payments using Stripe and Razorpay', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path\n                            d=\"M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.226 5.385c-.584 0-.937.164-.937.593 0 .468.607.674 1.36.93 1.228.415 2.844.963 2.851 2.993C11.5 11.868 9.924 13 7.63 13a7.7 7.7 0 0 1-3.009-.626V9.758c.926.506 2.095.88 3.01.88.617 0 1.058-.165 1.058-.671 0-.518-.658-.755-1.453-1.041C6.026 8.49 4.5 7.94 4.5 6.11 4.5 4.165 5.988 3 8.226 3a7.3 7.3 0 0 1 2.734.505v2.583c-.838-.45-1.896-.703-2.734-.703\" />\n                    </svg>', 'bi-credit-card', 'icon', NULL, NULL),
(6, 1, 'Staff Management', 'Separate login for every staff role with different permissions.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path\n                            d=\"M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4\" />\n                    </svg>', 'bi-people', 'icon', NULL, NULL),
(7, 1, 'POS (Point of Sale)', 'Complete POS Integration', '<svg class=\"size-6 transition duration-75 text-skin-base dark:text-skin-base\" fill=\"currentColor\"\n                        viewBox=\"0 -0.5 25 25\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\n                        <g id=\"SVGRepo_bgCarrier\" stroke-width=\"0\"></g>\n                        <g id=\"SVGRepo_tracerCarrier\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></g>\n                        <g id=\"SVGRepo_iconCarrier\">\n                            <path fill-rule=\"evenodd\"\n                                d=\"M16,6 L20,6 C21.1045695,6 22,6.8954305 22,8 L22,16 C22,17.1045695 21.1045695,18 20,18 L16,18 L16,19.9411765 C16,21.0658573 15.1177541,22 14,22 L4,22 C2.88224586,22 2,21.0658573 2,19.9411765 L2,4.05882353 C2,2.93414267 2.88224586,2 4,2 L14,2 C15.1177541,2 16,2.93414267 16,4.05882353 L16,6 Z M20,11 L16,11 L16,16 L20,16 L20,11 Z M14,19.9411765 L14,4.05882353 C14,4.01396021 13.9868154,4 14,4 L4,4 C4.01318464,4 4,4.01396021 4,4.05882353 L4,19.9411765 C4,19.9860398 4.01318464,20 4,20 L14,20 C13.9868154,20 14,19.9860398 14,19.9411765 Z M5,19 L5,17 L7,17 L7,19 L5,19 Z M8,19 L8,17 L10,17 L10,19 L8,19 Z M11,19 L11,17 L13,17 L13,19 L11,19 Z M5,16 L5,14 L7,14 L7,16 L5,16 Z M8,16 L8,14 L10,14 L10,16 L8,16 Z M11,16 L11,14 L13,14 L13,16 L11,16 Z M13,5 L13,13 L5,13 L5,5 L13,5 Z M7,7 L7,11 L11,11 L11,7 L7,7 Z M20,9 L20,8 L16,8 L16,9 L20,9 Z\">\n                            </path>\n                        </g>\n                    </svg>', 'bi-pos', 'icon', NULL, NULL),
(8, 1, 'Custom Floor Plans', 'Design Your Restaurants Layout.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path\n                            d=\"M8.235 1.559a.5.5 0 0 0-.47 0l-7.5 4a.5.5 0 0 0 0 .882L3.188 8 .264 9.559a.5.5 0 0 0 0 .882l7.5 4a.5.5 0 0 0 .47 0l7.5-4a.5.5 0 0 0 0-.882L12.813 8l2.922-1.559a.5.5 0 0 0 0-.882zm3.515 7.008L14.438 10 8 13.433 1.562 10 4.25 8.567l3.515 1.874a.5.5 0 0 0 .47 0zM8 9.433 1.562 6 8 2.567 14.438 6z\" />\n                    </svg>', 'bi-grid-3x3-gap', 'icon', NULL, NULL),
(9, 1, 'Kitchen Order Tickets (KOT)', 'Efficient Kitchen Workflow.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path\n                            d=\"M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5M11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1z\" />\n                        <path\n                            d=\"M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118z\" />\n                    </svg>', 'bi-receipt', 'icon', NULL, NULL),
(10, 1, 'Bill Printing', 'Quick and Accurate Billing.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path d=\"M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1\" />\n                        <path\n                            d=\"M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1\" />\n                    </svg>', 'bi-printer', 'icon', NULL, NULL),
(11, 1, 'Reports', 'Data-Driven Decisions.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                    <path fill-rule=\"evenodd\" d=\"M0 0h1v15h15v1H0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5\"></path>\n                    </svg>', 'bi-arrow-right-circle-fill', 'icon', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_review_settings`
--

CREATE TABLE `front_review_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews` text DEFAULT NULL,
  `reviewer_name` varchar(191) DEFAULT NULL,
  `reviewer_designation` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_review_settings`
--

INSERT INTO `front_review_settings` (`id`, `language_setting_id`, `reviews`, `reviewer_name`, `reviewer_designation`, `created_at`, `updated_at`) VALUES
(1, 1, '\" It has completely transformed how we operate. Managing orders, tables, and staff all from one platform has reduced our workload and made everything run more smoothly. \"', 'John Martin', 'Owner of Riverbend Bistro', NULL, NULL),
(2, 1, '\" The QR Code menu and payment integration have made a huge difference for us, especially after the pandemic. Customers love the ease, and we’ve seen faster table turnover.\"', 'Emily Thompson', 'Manager at Lakeside Grill', NULL, NULL),
(3, 1, '\" We are able to track every order in real time, keep our menu updated, and quickly manage payments. It is like having an extra set of hands in the restaurant.\"', 'Michael Scott', 'Owner of Downtown Eats', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_currencies`
--

CREATE TABLE `global_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `exchange_rate` decimal(16,2) DEFAULT NULL,
  `usd_price` decimal(16,2) DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no',
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `thousand_separator` varchar(191) DEFAULT NULL,
  `decimal_separator` varchar(191) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_currencies`
--

INSERT INTO `global_currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dollars', '$', 'USD', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-08-01 09:35:25', '2025-08-01 09:35:25', NULL),
(2, 'Rupee', '₹', 'INR', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-08-01 09:35:25', '2025-08-01 09:35:25', NULL),
(3, 'Pounds', '£', 'GBP', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-08-01 09:35:26', '2025-08-01 09:35:26', NULL),
(4, 'Euros', '€', 'EUR', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-08-01 09:35:26', '2025-08-01 09:35:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_invoices`
--

CREATE TABLE `global_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `global_subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `signature` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `event_id` varchar(191) DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) DEFAULT NULL,
  `billing_interval` varchar(191) DEFAULT NULL,
  `recurring` enum('yes','no') DEFAULT NULL,
  `plan_id` varchar(191) DEFAULT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `invoice_id` varchar(191) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `stripe_invoice_number` varchar(191) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `gateway_name` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `m_payment_id` varchar(191) DEFAULT NULL,
  `pf_payment_id` varchar(191) DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_invoices`
--

INSERT INTO `global_invoices` (`id`, `restaurant_id`, `currency_id`, `package_id`, `global_subscription_id`, `offline_method_id`, `signature`, `token`, `transaction_id`, `event_id`, `package_type`, `sub_total`, `total`, `billing_frequency`, `billing_interval`, `recurring`, `plan_id`, `subscription_id`, `invoice_id`, `amount`, `stripe_invoice_number`, `pay_date`, `next_pay_date`, `gateway_name`, `status`, `created_at`, `updated_at`, `m_payment_id`, `pf_payment_id`, `payfast_plan`) VALUES
(1, 1, 1, 5, 1, NULL, NULL, NULL, 'IX3PKUIIL55RGJX', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-01 15:07:54', '2025-08-31 15:07:54', 'offline', 'active', '2025-08-01 09:37:54', '2025-08-01 09:37:54', NULL, NULL, NULL),
(2, 2, 1, 5, 2, NULL, NULL, NULL, 'LQA2LIMGMSWTIB6', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:03:05', '2025-09-01 13:03:05', 'offline', 'active', '2025-08-02 07:33:05', '2025-08-02 07:33:05', NULL, NULL, NULL),
(3, 3, 1, 5, 3, NULL, NULL, NULL, 'GQYKWSNY7A6S6AS', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 18:01:22', '2025-09-01 18:01:22', 'offline', 'active', '2025-08-02 12:31:22', '2025-08-02 12:31:22', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_code` varchar(80) DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `last_license_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `theme_hex` varchar(191) DEFAULT NULL,
  `theme_rgb` varchar(191) DEFAULT NULL,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `license_type` varchar(191) DEFAULT NULL,
  `hide_cron_job` tinyint(1) NOT NULL DEFAULT 0,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `purchased_on` timestamp NULL DEFAULT NULL,
  `timezone` varchar(191) DEFAULT 'Asia/Kolkata',
  `disable_landing_site` tinyint(1) NOT NULL DEFAULT 0,
  `landing_type` varchar(191) NOT NULL DEFAULT 'static',
  `landing_site_type` enum('theme','custom') NOT NULL DEFAULT 'theme',
  `landing_site_url` varchar(191) DEFAULT NULL,
  `installed_url` tinytext DEFAULT NULL,
  `requires_approval_after_signup` tinyint(1) NOT NULL DEFAULT 0,
  `facebook_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `yelp_link` varchar(255) DEFAULT NULL,
  `default_currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_logo_text` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `upload_fav_icon_android_chrome_192` varchar(191) DEFAULT NULL,
  `upload_fav_icon_android_chrome_512` varchar(191) DEFAULT NULL,
  `upload_fav_icon_apple_touch_icon` varchar(191) DEFAULT NULL,
  `upload_favicon_16` varchar(191) DEFAULT NULL,
  `upload_favicon_32` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `webmanifest` varchar(191) DEFAULT NULL,
  `is_pwa_install_alert_show` varchar(191) NOT NULL DEFAULT '0',
  `google_map_api_key` varchar(191) DEFAULT NULL,
  `session_driver` enum('file','database') NOT NULL DEFAULT 'database',
  `enable_stripe` tinyint(1) NOT NULL DEFAULT 1,
  `enable_razorpay` tinyint(1) NOT NULL DEFAULT 1,
  `enable_flutterwave` tinyint(1) NOT NULL DEFAULT 1,
  `enable_payfast` tinyint(1) NOT NULL DEFAULT 1,
  `enable_paypal` tinyint(1) NOT NULL DEFAULT 1,
  `enable_paystack` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `purchase_code`, `supported_until`, `last_license_verified_at`, `email`, `created_at`, `updated_at`, `name`, `logo`, `theme_hex`, `theme_rgb`, `locale`, `license_type`, `hide_cron_job`, `last_cron_run`, `system_update`, `purchased_on`, `timezone`, `disable_landing_site`, `landing_type`, `landing_site_type`, `landing_site_url`, `installed_url`, `requires_approval_after_signup`, `facebook_link`, `instagram_link`, `twitter_link`, `yelp_link`, `default_currency_id`, `show_logo_text`, `meta_title`, `meta_keyword`, `meta_description`, `upload_fav_icon_android_chrome_192`, `upload_fav_icon_android_chrome_512`, `upload_fav_icon_apple_touch_icon`, `upload_favicon_16`, `upload_favicon_32`, `favicon`, `hash`, `webmanifest`, `is_pwa_install_alert_show`, `google_map_api_key`, `session_driver`, `enable_stripe`, `enable_razorpay`, `enable_flutterwave`, `enable_payfast`, `enable_paypal`, `enable_paystack`) VALUES
(1, NULL, NULL, NULL, NULL, '2025-08-01 09:37:46', '2025-08-02 19:14:43', 'TableTrack', '2b0678d0fe06be49a3c1f7671520fb7e.jpg', '#A78BFA', '167, 139, 250', 'en', NULL, 0, NULL, 1, NULL, 'Asia/Kolkata', 0, 'static', 'theme', NULL, 'http://tabletrack.updated.local', 0, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com/', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '430ceb7206de7658960aca912c5130bb', NULL, '0', NULL, 'database', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `global_subscriptions`
--

CREATE TABLE `global_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `plan_type` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `user_id` varchar(191) DEFAULT NULL,
  `quantity` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `razorpay_id` varchar(191) DEFAULT NULL,
  `razorpay_plan` varchar(191) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `stripe_status` varchar(191) DEFAULT NULL,
  `stripe_price` varchar(191) DEFAULT NULL,
  `gateway_name` varchar(191) DEFAULT NULL,
  `trial_ends_at` varchar(191) DEFAULT NULL,
  `subscription_status` enum('active','inactive') DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `subscribed_on_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `flutterwave_id` varchar(191) DEFAULT NULL,
  `flutterwave_payment_ref` varchar(191) DEFAULT NULL,
  `flutterwave_status` varchar(191) DEFAULT NULL,
  `flutterwave_customer_id` varchar(191) DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL,
  `payfast_status` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_subscriptions`
--

INSERT INTO `global_subscriptions` (`id`, `restaurant_id`, `package_id`, `currency_id`, `package_type`, `plan_type`, `transaction_id`, `name`, `user_id`, `quantity`, `token`, `razorpay_id`, `razorpay_plan`, `stripe_id`, `stripe_status`, `stripe_price`, `gateway_name`, `trial_ends_at`, `subscription_status`, `ends_at`, `subscribed_on_date`, `created_at`, `updated_at`, `subscription_id`, `customer_id`, `flutterwave_id`, `flutterwave_payment_ref`, `flutterwave_status`, `flutterwave_customer_id`, `payfast_plan`, `payfast_status`) VALUES
(1, 1, 5, 1, 'trial', NULL, 'IX3PKUIIL55RGJX', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-08-31 15:07:54', 'active', '2025-08-31 15:07:54', '2025-08-01 15:07:54', '2025-08-01 09:37:54', '2025-08-01 09:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 5, 1, 'trial', NULL, 'LQA2LIMGMSWTIB6', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-09-01 13:03:05', 'active', '2025-09-01 13:03:05', '2025-08-02 13:03:05', '2025-08-02 07:33:05', '2025-08-02 07:33:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 5, 1, 'trial', NULL, 'GQYKWSNY7A6S6AS', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-09-01 18:01:22', 'active', '2025-09-01 18:01:22', '2025-08-02 18:01:22', '2025-08-02 12:31:22', '2025-08-02 12:31:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `branch_id`, `category_name`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"en\":\"Soup\"}', 0, '2025-08-02 07:46:49', '2025-08-02 07:46:49'),
(2, 3, '{\"en\":\"Indian Main Course\"}', 0, '2025-08-02 07:47:42', '2025-08-02 07:47:42'),
(3, 3, '{\"en\":\"South Indian Starter\"}', 0, '2025-08-02 07:48:27', '2025-08-02 07:48:27'),
(4, 3, '{\"en\":\"Indian Starter\"}', 0, '2025-08-02 07:49:00', '2025-08-02 07:49:00'),
(5, 3, '{\"en\":\"Chinese Starter\"}', 0, '2025-08-02 07:49:15', '2025-08-02 07:49:15'),
(6, 3, '{\"en\":\"Mocktails\"}', 0, '2025-08-02 08:11:16', '2025-08-02 08:11:16'),
(7, 4, '{\"en\": \"Mocktails\"}', 0, '2025-01-14 12:14:08', '2025-01-14 12:14:08'),
(8, 4, '{\"en\": \"Hot Beverages\"}', 0, '2025-01-14 13:14:02', '2025-02-06 01:04:55'),
(9, 4, '{\"en\": \"Deserts\"}', 0, '2025-01-14 13:19:20', '2025-01-14 13:19:20'),
(10, 4, '{\"en\": \"Pastas\"}', 0, '2025-01-15 04:50:42', '2025-01-15 04:50:42'),
(11, 4, '{\"en\": \"Pizzas\"}', 0, '2025-01-15 04:56:58', '2025-01-15 04:56:58'),
(12, 4, '{\"en\": \"Noodles\"}', 0, '2025-01-15 05:41:07', '2025-01-15 05:41:07'),
(13, 4, '{\"en\": \"Soup\"}', 0, '2025-01-15 05:52:12', '2025-01-15 05:52:12'),
(14, 4, '{\"en\": \"Salads and Bowls\"}', 0, '2025-01-15 06:56:18', '2025-01-15 06:56:18'),
(15, 4, '{\"en\": \"Raita Bar\"}', 0, '2025-01-15 07:18:31', '2025-02-06 04:44:50'),
(16, 4, '{\"en\": \"Indian Breads\"}', 0, '2025-01-15 07:23:37', '2025-01-15 07:23:37'),
(17, 4, '{\"en\": \"Rice\"}', 0, '2025-01-15 07:32:33', '2025-01-15 07:32:33'),
(18, 4, '{\"en\": \"Indian Starters\"}', 0, '2025-01-15 07:40:06', '2025-01-15 07:40:06'),
(19, 4, '{\"en\": \"Chinese Starters\"}', 0, '2025-01-15 08:02:06', '2025-01-15 08:02:06'),
(20, 4, '{\"en\": \"Indian Main Course\"}', 0, '2025-01-15 08:11:55', '2025-01-15 08:11:55'),
(21, 4, '{\"en\": \"Chinese Main Course\"}', 0, '2025-01-15 08:12:12', '2025-01-15 08:12:12'),
(22, 4, '{\"en\": \"Cold Beverages\"}', 0, '2025-02-06 01:05:05', '2025-02-06 01:05:05'),
(23, 4, '{\"en\": \"Burger\"}', 0, '2025-02-06 03:34:49', '2025-02-06 03:34:49'),
(24, 4, '{\"en\": \"Sandwich\"}', 0, '2025-02-06 03:34:58', '2025-02-06 03:34:58'),
(25, 4, '{\"en\": \"Kathi Roll\"}', 0, '2025-02-06 03:35:06', '2025-02-06 03:35:06'),
(26, 4, '{\"en\":\"MR ANUJ 2 JULY BIRTHDAY PARTY\"}', 0, '2025-06-30 09:14:46', '2025-06-30 09:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `item_modifiers`
--

CREATE TABLE `item_modifiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `modifier_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `allow_multiple_selection` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kots`
--

CREATE TABLE `kots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kot_number` varchar(191) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('pending_confirmation','in_kitchen','food_ready','served','cancelled') NOT NULL DEFAULT 'in_kitchen',
  `cancel_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancel_reason_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kots`
--

INSERT INTO `kots` (`id`, `branch_id`, `kot_number`, `order_id`, `transaction_id`, `note`, `status`, `cancel_reason_id`, `cancel_reason_text`, `created_at`, `updated_at`) VALUES
(1, 3, '2', 1, NULL, NULL, 'food_ready', NULL, NULL, '2025-08-02 08:03:06', '2025-08-02 08:15:47'),
(2, 3, '4', 2, NULL, NULL, 'food_ready', NULL, NULL, '2025-08-02 08:14:38', '2025-08-02 08:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `kot_cancel_reasons`
--

CREATE TABLE `kot_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` varchar(191) NOT NULL,
  `cancel_order` tinyint(1) NOT NULL DEFAULT 0,
  `cancel_kot` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_cancel_reasons`
--

INSERT INTO `kot_cancel_reasons` (`id`, `restaurant_id`, `reason`, `cancel_order`, `cancel_kot`, `created_at`, `updated_at`) VALUES
(1, 1, 'Customer changed their mind', 1, 0, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(2, 1, 'Customer requested to cancel', 1, 0, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(3, 1, 'Payment issues', 1, 0, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(4, 1, 'Customer no longer wants the order', 1, 0, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(5, 1, 'Ingredient not available', 0, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04'),
(6, 1, 'Preparation time too long', 0, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04'),
(7, 1, 'Quality issue with ingredients', 0, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04'),
(8, 1, 'System error/Technical issue', 1, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04'),
(9, 1, 'Restaurant closing early', 1, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04'),
(10, 1, 'Other', 1, 1, '2025-08-01 09:38:04', '2025-08-01 09:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `kot_items`
--

CREATE TABLE `kot_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kot_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('pending','cooking','ready') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_items`
--

INSERT INTO `kot_items` (`id`, `kot_id`, `transaction_id`, `menu_item_id`, `menu_item_variation_id`, `note`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, NULL, '', 2, 'ready', '2025-08-02 08:03:06', '2025-08-02 08:15:47'),
(2, 1, NULL, 1, NULL, '', 2, 'ready', '2025-08-02 08:03:06', '2025-08-02 08:15:47'),
(3, 2, NULL, 3, NULL, '', 2, 'ready', '2025-08-02 08:14:38', '2025-08-02 08:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `kot_item_modifier_options`
--

CREATE TABLE `kot_item_modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kot_item_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kot_places`
--

CREATE TABLE `kot_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_places`
--

INSERT INTO `kot_places` (`id`, `printer_id`, `branch_id`, `name`, `type`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default Kitchen', 'food', 1, 1, '2025-08-01 09:37:56', '2025-08-01 09:37:57'),
(2, 2, 2, 'Default Kitchen', 'food', 1, 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(3, 3, 3, 'Default Kitchen', 'food', 1, 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(4, 4, 4, 'Default Kitchen', 'food', 1, 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `kot_settings`
--

CREATE TABLE `kot_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `default_status` enum('pending','cooking') NOT NULL DEFAULT 'pending',
  `enable_item_level_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_settings`
--

INSERT INTO `kot_settings` (`id`, `branch_id`, `default_status`, `enable_item_level_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'pending', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(2, 1, 'pending', 1, '2025-08-01 09:37:57', '2025-08-01 09:37:57'),
(3, 2, 'pending', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(4, 2, 'pending', 1, '2025-08-01 09:37:59', '2025-08-01 09:37:59'),
(5, 3, 'pending', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(6, 4, 'pending', 1, '2025-08-02 12:31:23', '2025-08-02 12:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

CREATE TABLE `language_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_code` varchar(191) NOT NULL,
  `language_name` varchar(191) NOT NULL,
  `flag_code` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `flag_code`, `active`, `is_rtl`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'gb', 1, 0, NULL, NULL),
(2, 'ar', 'Arabic', 'sa', 0, 1, NULL, NULL),
(3, 'de', 'German', 'de', 0, 0, NULL, NULL),
(4, 'es', 'Spanish', 'es', 0, 0, NULL, NULL),
(5, 'et', 'Estonian', 'et', 0, 0, NULL, NULL),
(6, 'fa', 'Farsi', 'ir', 0, 1, NULL, NULL),
(7, 'fr', 'French', 'fr', 0, 0, NULL, NULL),
(8, 'gr', 'Greek', 'gr', 0, 0, NULL, NULL),
(9, 'it', 'Italian', 'it', 0, 0, NULL, NULL),
(10, 'nl', 'Dutch', 'nl', 0, 0, NULL, NULL),
(11, 'pl', 'Polish', 'pl', 0, 0, NULL, NULL),
(12, 'pt', 'Portuguese', 'pt', 0, 0, NULL, NULL),
(13, 'pt-br', 'Portuguese (Brazil)', 'br', 0, 0, NULL, NULL),
(14, 'ro', 'Romanian', 'ro', 0, 0, NULL, NULL),
(15, 'ru', 'Russian', 'ru', 0, 0, NULL, NULL),
(16, 'tr', 'Turkish', 'tr', 0, 0, NULL, NULL),
(17, 'zh-CN', 'Chinese (S)', 'cn', 0, 0, NULL, NULL),
(18, 'zh-TW', 'Chinese (T)', 'cn', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `menu_name` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `branch_id`, `menu_name`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"en\":\"South Indian\"}', 0, '2025-08-02 02:13:38', '2025-08-02 02:13:38'),
(2, 3, '{\"en\":\"Starter\"}', 0, '2025-08-02 02:14:33', '2025-08-02 02:14:33'),
(3, 3, '{\"en\":\"Main Course\"}', 0, '2025-08-02 02:14:43', '2025-08-02 02:14:43'),
(4, 3, '{\"en\":\"Chinese\"}', 0, '2025-08-02 02:15:33', '2025-08-02 02:15:33'),
(5, 3, '{\"en\":\"Beverages\"}', 0, '2025-08-02 02:40:33', '2025-08-02 02:40:33'),
(11, 4, '{\"en\": \"Beverages\"}', 0, '2025-02-05 18:39:33', '2025-02-05 18:40:02'),
(12, 4, '{\"en\": \"Starters\"}', 0, '2025-02-05 21:16:15', '2025-02-05 21:16:15'),
(13, 4, '{\"en\": \"Main Coarse\"}', 0, '2025-02-05 21:16:32', '2025-02-05 21:16:32'),
(14, 4, '{\"en\": \"Quick Bites\"}', 0, '2025-02-05 21:17:14', '2025-02-05 21:17:14'),
(15, 4, '{\"en\": \"Italian\"}', 0, '2025-02-05 21:30:45', '2025-02-05 21:30:45'),
(16, 4, '{\"en\": \"Chinese\"}', 0, '2025-02-05 21:32:44', '2025-02-05 21:32:44'),
(17, 4, '{\"en\": \"Sugary Treats\"}', 0, '2025-02-05 23:20:30', '2025-02-05 23:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kot_place_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` enum('veg','non-veg','egg','drink','other') NOT NULL DEFAULT 'veg',
  `price` decimal(16,2) DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preparation_time` int(11) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `show_on_customer_site` tinyint(1) NOT NULL DEFAULT 1,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tax_inclusive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `branch_id`, `kot_place_id`, `item_name`, `image`, `description`, `type`, `price`, `menu_id`, `item_category_id`, `created_at`, `updated_at`, `preparation_time`, `is_available`, `show_on_customer_site`, `in_stock`, `sort_order`, `tax_inclusive`) VALUES
(1, 3, NULL, 'Idli', 'fdb2a1566f73c1c7dc62f6f76e770370.jpg', 'Famous South Indian Dish', 'non-veg', 50.00, 1, 3, '2025-08-02 07:56:52', '2025-08-02 07:56:53', 30, 1, 1, 1, 0, 0),
(2, 3, NULL, 'Dhosa', 'a78b86713990bed762da2876f0bfee9b.jpg', 'Famous South Indian Dish', 'non-veg', 60.00, 1, 3, '2025-08-02 08:01:25', '2025-08-02 08:02:13', 20, 1, 1, 1, 0, 0),
(3, 3, NULL, 'Fresh Lime Soda', 'c4675913048217e0064f6108d9d3cc5f.jpeg', NULL, 'drink', 140.00, 5, 6, '2025-08-02 08:13:35', '2025-08-02 08:13:35', 15, 1, 1, 1, 0, 0),
(4, 4, NULL, 'The Zest Cinnamon Blast', '9a576d4577e1c41dee262a662a3fc039.jpg', 'Apple chunks, apple juice, cinnamon syrup, white pepper top of soda', 'drink', 199.00, 11, 7, '2025-08-02 16:09:59', '2025-08-02 16:22:34', 15, 1, 1, 1, 0, 0),
(5, 4, NULL, 'The Zest Sessonal Fresh Juice', 'b8920237aefd24b48f7bd82422b01fb5.jpg', NULL, 'drink', 299.00, 11, 7, '2025-08-02 17:31:21', '2025-08-02 17:31:22', 15, 1, 1, 1, 0, 0),
(6, 4, NULL, 'Maya', '2482e1f36ba6681ba249279c48e2b2f8.jpg', 'Strawberry drink with ginger ale and Lemonde', 'drink', 199.00, 11, 7, '2025-08-02 17:33:45', '2025-08-02 17:33:47', 15, 1, 1, 1, 0, 0),
(7, 4, NULL, 'The Zest Sunrise', 'a893054c4409c2534a3b1b21ea17f2f9.jpg', 'Orange juice and pineapple juice with grenadine syrup', 'drink', 199.00, 11, 7, '2025-08-02 17:36:05', '2025-08-02 17:36:06', 15, 1, 1, 1, 0, 0),
(8, 4, NULL, 'Madagascar', 'c626b95826c3eb0e7d8d51d7f7b339fd.jpg', 'Mango crush,melon syrup,pineapple juice,amrettro syrup', 'drink', 199.00, 11, 7, '2025-08-02 17:37:56', '2025-08-02 17:37:56', 15, 1, 1, 1, 0, 0),
(9, 4, NULL, 'The Zest Punch', '00c0cf32a588ef7e9abb21e76d28723b.png', 'Blend of mix of juices with vanilla ice cream& strawberry crush', 'drink', 199.00, 11, 7, '2025-08-02 17:39:53', '2025-08-02 17:39:54', 15, 1, 1, 1, 0, 0),
(10, 4, NULL, 'Virgin Pina Colada', '67cfc3b6d45bc64c65a7e7a196a32d2d.jpg', 'Pineapple juice with coconut cream', 'drink', 199.00, 11, 7, '2025-08-02 17:41:32', '2025-08-02 17:41:32', 15, 1, 1, 1, 0, 0),
(11, 4, NULL, 'The Zest Sangrita', 'e99fd9d8121ce36669cf975a455d8ff2.jpg', 'It\'s like virgin sangria', 'drink', 0.00, 11, 7, '2025-08-02 17:46:16', '2025-08-02 17:46:17', 15, 1, 1, 1, 0, 0),
(12, 4, NULL, 'Orange and Kafir Lime', '8ffa0ad56a75a5385d53abcdbd40b6ce.jpg', 'Fresh kaffir leaves, orange chunks and juice with top up soda', 'drink', 0.00, 11, 7, '2025-08-02 17:48:27', '2025-08-02 17:48:27', 15, 1, 1, 1, 0, 0),
(13, 4, NULL, 'Strawberry and Basil Mojito', 'ad0f4af0d6668af722aa512960300d78.jpg', '', 'drink', 0.00, 11, 7, '2025-08-02 17:51:56', '2025-08-02 17:51:57', 15, 1, 1, 1, 0, 0),
(14, 4, NULL, 'Watermelon Mojito', '4eb6010bdffc0c1e5dd7cfec5d171d67.jpg', '', 'drink', 0.00, 11, 7, '2025-08-02 17:55:21', '2025-08-02 17:55:21', 15, 1, 1, 1, 0, 0),
(15, 4, NULL, 'Apple and Mint Mojito', '88663b934d554728c2c86cfd96990d1f.jpeg', '', 'drink', 0.00, 11, 7, '2025-08-02 17:58:05', '2025-08-02 17:58:05', 15, 1, 1, 1, 0, 0),
(16, 4, NULL, 'Mineral Water', '38cc7b780c26e15929d603103562d5fd.jpg', '', 'drink', 60.00, 11, 22, '2025-08-02 17:59:43', '2025-08-02 17:59:43', NULL, 1, 1, 1, 0, 0),
(17, 4, NULL, 'Cappuccino', '874d91540341aaea62afacb282087144.png', NULL, 'drink', 199.00, 11, 8, '2025-08-02 18:02:07', '2025-08-02 18:02:08', NULL, 1, 1, 1, 0, 0),
(18, 4, NULL, 'Tea', 'd1f0231db2c9249c0f50db7ecc95cc11.jpg', '', 'drink', 125.00, 11, 8, '2025-08-02 18:05:55', '2025-08-02 18:05:56', 10, 1, 1, 1, 0, 0),
(19, 4, NULL, 'Ice Cream', 'cbfb4eb4f9cc6ebba6fef06bfa0e2340.jpg', '', 'veg', 0.00, 17, 9, '2025-08-02 18:11:15', '2025-08-02 18:11:15', 10, 1, 1, 1, 0, 0),
(20, 4, NULL, 'Moong Dal Halwa', 'da72041716124c150aa3b7075e840d51.png', '', 'veg', 199.00, 17, 9, '2025-08-02 18:12:33', '2025-08-02 18:12:33', 20, 1, 1, 1, 0, 0),
(21, 4, NULL, 'Kesari Phirni', '1f8eb3b7b335bcc137e47776637f8024.png', '', 'veg', 249.00, 17, 9, '2025-08-02 18:14:10', '2025-08-02 18:14:10', 20, 1, 1, 1, 0, 0),
(22, 4, NULL, 'Ras Malai', '819a27531d04d13dd78c65979171edcd.png', '', 'veg', 249.00, 17, 9, '2025-08-02 18:16:54', '2025-08-02 18:16:55', 20, 1, 1, 1, 0, 0),
(23, 4, NULL, 'Gulab Jamun', 'b68a75a396e13b2e6141ca94d88aee8d.png', '', 'veg', 199.00, 17, 9, '2025-08-02 18:19:20', '2025-08-02 18:19:20', 20, 1, 1, 1, 0, 0),
(24, 4, NULL, 'Alfredo', '5cdf0c2d41fff790fded6539f25ee7e1.png', 'Mushroom and Cheese', 'veg', 399.00, 15, 10, '2025-08-02 18:20:53', '2025-08-02 18:20:54', 30, 1, 1, 1, 0, 0),
(25, 4, NULL, 'Alfredo Chicken', 'feef5a60623484fecb0ee07e426d10c0.png', 'Mushroom and Cheese with chicken', 'non-veg', 575.00, 15, 10, '2025-08-02 18:23:23', '2025-08-02 18:23:23', 30, 1, 1, 1, 0, 0),
(26, 4, NULL, 'Arrabiata', 'd37de989709420d33e47c7271bbed59a.jpg', '', 'veg', 399.00, 15, 10, '2025-08-02 18:26:51', '2025-08-02 18:26:51', 30, 1, 1, 1, 0, 0),
(27, 4, NULL, 'Arrabiata Chicken', '3ba98f7fcb41096997a125236cfafd80.png', '', 'non-veg', 575.00, 15, 10, '2025-08-02 18:27:59', '2025-08-02 18:28:00', 30, 1, 1, 1, 0, 0),
(28, 4, NULL, 'Mama Rosa', '34e98785439caaebe64952da0ef79c8f.png', NULL, 'veg', 399.00, 15, 10, '2025-08-02 18:45:04', '2025-08-02 18:45:05', 30, 1, 1, 1, 0, 0),
(29, 4, NULL, 'Mama Rosa Chicken', 'dd1cd05ba2b80082b3f198aacd0f4833.png', '', 'non-veg', 575.00, 15, 10, '2025-08-02 18:47:24', '2025-08-02 18:47:24', 30, 1, 1, 1, 0, 0),
(30, 4, NULL, 'Indiana', '880485e40a901eb28afa27fb21abc85f.png', 'Char grilled paneer,,onion,pepper,mozzarella', 'veg', 375.00, 15, 11, '2025-08-02 18:49:37', '2025-08-02 18:49:37', 30, 1, 1, 1, 0, 0),
(31, 4, NULL, 'Classic margherita', 'a8ec8fab7ef4eb4f408661ddf2ecaa22.jpg', 'Tomato basil and mozzarella', 'veg', 375.00, 15, 11, '2025-08-02 18:53:11', '2025-08-02 18:53:39', 30, 1, 1, 1, 0, 0),
(32, 4, NULL, 'Fungi Basco', '9bb90d97f11bfe2e821492f2828c5c1c.png', 'Mozzarella, mushroom, cheese', 'veg', 375.00, 15, 11, '2025-08-02 18:56:04', '2025-08-02 18:56:04', 30, 1, 1, 1, 0, 0),
(33, 4, NULL, 'Vedure', '0ca1d5d35a8c77ffb7dede14e4720a46.png', 'Tomato, feta cheese, olives, green capsicum, oregano & capers', 'veg', 375.00, 15, 11, '2025-08-02 19:02:49', '2025-08-02 19:02:50', 30, 1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_tax`
--

CREATE TABLE `menu_item_tax` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_translations`
--

INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `locale`, `item_name`, `description`) VALUES
(1, 1, 'en', 'Idli', 'Famous South Indian Dish'),
(2, 2, 'en', 'Dhosa', 'Famous South Indian Dish'),
(3, 3, 'en', 'Fresh Lime Soda', NULL),
(4, 4, 'en', 'The Zest Cinnamon Blast', 'Apple chunks, apple juice, cinnamon syrup, white pepper top of soda'),
(5, 5, 'en', 'The Zest Sessonal Fresh Juice', NULL),
(6, 6, 'en', 'Maya', 'Strawberry drink with ginger ale and Lemonde'),
(7, 7, 'en', 'The Zest Sunrise', 'Orange juice and pineapple juice with grenadine syrup'),
(8, 8, 'en', 'Madagascar', 'Mango crush,melon syrup,pineapple juice,amrettro syrup'),
(9, 9, 'en', 'The Zest Punch', 'Blend of mix of juices with vanilla ice cream& strawberry crush'),
(10, 10, 'en', 'Virgin Pina Colada', 'Pineapple juice with coconut cream'),
(11, 11, 'en', 'The Zest Sangrita', 'It\'s like virgin sangria'),
(12, 12, 'en', 'Orange and Kafir Lime', 'Fresh kaffir leaves, orange chunks and juice with top up soda'),
(13, 13, 'en', 'Strawberry and Basil Mojito', ''),
(14, 14, 'en', 'Watermelon Mojito', ''),
(15, 15, 'en', 'Apple and Mint Mojito', ''),
(16, 16, 'en', 'Mineral Water', ''),
(17, 17, 'en', 'Cappuccino', NULL),
(18, 18, 'en', 'Tea', ''),
(19, 19, 'en', 'Ice Cream', ''),
(20, 20, 'en', 'Moong Dal Halwa', ''),
(21, 21, 'en', 'Kesari Phirni', ''),
(22, 22, 'en', 'Ras Malai', ''),
(23, 23, 'en', 'Gulab Jamun', ''),
(24, 24, 'en', 'Alfredo', 'Mushroom and Cheese'),
(25, 25, 'en', 'Alfredo Chicken', 'Mushroom and Cheese with chicken'),
(26, 26, 'en', 'Arrabiata', ''),
(27, 27, 'en', 'Arrabiata Chicken', ''),
(28, 28, 'en', 'Mama Rosa', NULL),
(29, 29, 'en', 'Mama Rosa Chicken', ''),
(30, 30, 'en', 'Indiana', 'Char grilled paneer,,onion,pepper,mozzarella'),
(31, 31, 'en', 'Classic margherita', 'Tomato basil and mozzarella'),
(32, 32, 'en', 'Fungi Basco', 'Mozzarella, mushroom, cheese'),
(33, 33, 'en', 'Vedure', 'Tomato, feta cheese, olives, green capsicum, oregano & capers');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_variations`
--

CREATE TABLE `menu_item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation` varchar(191) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_variations`
--

INSERT INTO `menu_item_variations` (`id`, `variation`, `price`, `menu_item_id`, `created_at`, `updated_at`) VALUES
(1, 'Glass', 199.00, 11, '2025-08-02 17:46:17', '2025-08-02 17:46:17'),
(2, 'Pitcher', 649.00, 11, '2025-08-02 17:46:17', '2025-08-02 17:46:17'),
(3, 'Glass', 199.00, 12, '2025-08-02 17:48:27', '2025-08-02 17:48:27'),
(4, 'Pitcher', 649.00, 12, '2025-08-02 17:48:27', '2025-08-02 17:48:27'),
(5, 'Glass', 199.00, 13, '2025-08-02 17:51:57', '2025-08-02 17:51:57'),
(6, 'Pitcher', 599.00, 13, '2025-08-02 17:51:57', '2025-08-02 17:51:57'),
(7, 'Glass', 199.00, 14, '2025-08-02 17:55:21', '2025-08-02 17:55:21'),
(8, 'Pitcher', 599.00, 14, '2025-08-02 17:55:21', '2025-08-02 17:55:21'),
(9, 'Glass', 199.00, 15, '2025-08-02 17:58:05', '2025-08-02 17:58:05'),
(10, 'Pitcher', 599.00, 15, '2025-08-02 17:58:05', '2025-08-02 17:58:05'),
(11, 'Strawberry', 149.00, 19, '2025-08-02 18:11:15', '2025-08-02 18:11:15'),
(12, 'Vanilla', 149.00, 19, '2025-08-02 18:11:15', '2025-08-02 18:11:15'),
(13, 'Choclate', 149.00, 19, '2025-08-02 18:11:15', '2025-08-02 18:11:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_04_02_193005_create_translations_table', 1),
(5, '2024_01_01_create_printers_table', 1),
(6, '2024_03_13_000002_create_expense_categories_table', 1),
(7, '2024_07_01_060651_add_two_factor_columns_to_users_table', 1),
(8, '2024_07_01_060707_create_personal_access_tokens_table', 1),
(9, '2024_07_02_064204_create_menus_table', 1),
(10, '2024_07_12_070634_create_areas_table', 1),
(11, '2024_07_16_103816_create_orders_table', 1),
(12, '2024_07_21_083459_add_user_type_column', 1),
(13, '2024_07_24_131631_create_payments_table', 1),
(14, '2024_07_31_081306_add_email_otp_column', 1),
(15, '2024_08_02_061808_create_countries_table', 1),
(16, '2024_08_02_071637_create_restaurant_settings_table', 1),
(17, '2024_08_04_104258_create_razorpay_payments_table', 1),
(18, '2024_08_05_092258_create_stripe_payments_table', 1),
(19, '2024_08_05_110157_create_payment_gateway_credentials_table', 1),
(20, '2024_08_13_033139_create_global_settings_table', 1),
(21, '2024_08_13_073129_update_settings_add_envato_key', 1),
(22, '2024_08_13_073129_update_settings_add_support_key', 1),
(23, '2024_08_14_073129_update_settings_add_email', 1),
(24, '2024_08_14_073129_update_settings_add_last_verified_key', 1),
(25, '2024_09_13_081726_create_modules_table', 1),
(26, '2024_09_14_130619_create_permission_tables', 1),
(27, '2024_09_27_071339_create_reservations_table', 1),
(28, '2024_10_02_090924_create_email_settings_table', 1),
(29, '2024_10_03_073837_create_notification_settings_table', 1),
(30, '2024_10_11_100539_create_branches_table', 1),
(31, '2024_10_14_121135_create_onboarding_steps_table', 1),
(32, '2024_10_15_071238_add_restaurant_hash_column', 1),
(33, '2024_10_15_071238_storage', 1),
(34, '2024_10_15_100639_create_restaurant_payments_table', 1),
(35, '2024_10_27_101326_create_packages_table', 1),
(36, '2024_11_02_112920_create_language_settings_table', 1),
(37, '2024_11_02_120314_create_flags_table', 1),
(38, '2024_11_02_120314_email_settings_table', 1),
(39, '2024_11_08_071617_add_customer_login_required_column', 1),
(40, '2024_11_08_093032_create_superadmin_payment_gateways_table', 1),
(41, '2024_11_08_133506_add_stripe_column_for_license', 1),
(42, '2024_11_12_055119_create_delivery_executives_table', 1),
(43, '2024_11_12_055632_add_order_types_column', 1),
(44, '2024_11_12_060500_create_order_histories_table', 1),
(45, '2024_11_12_060500_global_license_type_table', 1),
(46, '2024_11_12_060500_global_purchase_on_table', 1),
(47, '2024_11_12_060500_global_setting_timezone_table', 1),
(48, '2024_11_17_052707_currency_position', 1),
(49, '2024_11_17_052707_move_qr_code', 1),
(50, '2024_11_19_113852_add_is_active_to_restaurants_table', 1),
(51, '2024_11_20_114816_add_staff_welcome_email_notification', 1),
(52, '2024_11_25_061322_create_pusher_settings_table', 1),
(53, '2024_11_26_090216_create_global_currencies_table', 1),
(54, '2024_12_03_085842_add_about_us_column', 1),
(55, '2024_12_03_104817_add_currency_id_packages', 1),
(56, '2024_12_04_080223_add_allow_customer_delivery_orders', 1),
(57, '2024_12_04_115601_add_preparation_time_column', 1),
(58, '2024_12_11_110000_create_tables_for_subscription_table', 1),
(59, '2024_12_11_131225_add_disable_landing_site_columns', 1),
(60, '2024_12_12_090840_create_waiter_requests_table', 1),
(61, '2024_12_13_090840_add_domain_global_setting', 1),
(62, '2024_12_16_080201_create_lifetime_subscriptions_for_paid_restaurants', 1),
(63, '2024_12_23_124452_add_payment_enabled_columns_to_payment_settings_table', 1),
(64, '2024_12_27_054246_add_table_reservation_default_status_to_restaurants_table', 1),
(65, '2024_12_30_074018_create_split_orders_table', 1),
(66, '2024_12_30_200942_create_restaurant_settings_table', 1),
(67, '2025_01_03_050139_add_social_media_links_to_reataurants_table', 1),
(68, '2025_01_03_093938_add_social_media_links_to_global_settings_table', 1),
(69, '2025_01_06_111550_create_receipt_settings_table', 1),
(70, '2025_01_09_073145_generate_qr_codes_for_existing_branches', 1),
(71, '2025_01_09_115652_update_receipt_settings_for_existing_restaurants', 1),
(72, '2025_01_10_064103_add_table_required_column_to_customer_settings_table', 1),
(73, '2025_01_10_100552_insert_to_file_storage_settings_default_values', 1),
(74, '2025_01_11_063817_add_default_currency_column', 1),
(75, '2025_01_16_125322_add_is_enabled_to_menu_items_table', 1),
(76, '2025_01_16_131100_regenrate_qr_codes', 1),
(77, '2025_01_20_000000_add_restaurant_id_to_roles', 1),
(78, '2025_01_20_071544_add_branch_limit_to_packages_table', 1),
(79, '2025_01_20_091630_update_item_type', 1),
(80, '2025_01_20_125429_add_discount_columns_to_orders_table', 1),
(81, '2025_01_21_064139_add_show_logo_text_column', 1),
(82, '2025_01_21_064256_add_offline_payment', 1),
(83, '2025_01_21_132218_fix_user_roles', 1),
(84, '2025_01_22_114720_add_show_tax_to_receipt_setting', 1),
(85, '2025_01_23_065746_create_modifier_groups_table', 1),
(86, '2025_01_23_085333_create_restaurant_taxes_table', 1),
(87, '2025_01_23_090554_create_modifier_options_table', 1),
(88, '2025_01_23_094318_create_item_modifiers_table', 1),
(89, '2025_01_23_121154_create_order_item_modifier_options_table', 1),
(90, '2025_01_27_065822_add_balance_column_to_payment', 1),
(91, '2025_01_28_111039_add_allow_dine_in_orders_to_restaurant', 1),
(92, '2025_01_30_050755_add_yelp_icon_to_global_settings', 1),
(93, '2025_01_30_055744_add_yelp_link_to_restaurants', 1),
(94, '2025_01_30_100556_fix_package_price_length', 1),
(95, '2025_01_30_104043_add_meta_data_to_global_settings', 1),
(96, '2025_01_31_000001_create_predefined_amounts_table', 1),
(97, '2025_02_03_062109_add_is_cash_payment_enabled_to_payment', 1),
(98, '2025_02_04_140538_add_transaction_id_kot', 1),
(99, '2025_02_15_121956_add_hide_new_orders_option_to_restaurant', 1),
(100, '2025_02_17_052801_create_restaurant_charges_settings_table', 1),
(101, '2025_02_17_093729_add_favicon_to_restaurant', 1),
(102, '2025_02_19_091730_update_menu_name_to_json', 1),
(103, '2025_02_20_095321_add_waiter_request_options_to_restaurant', 1),
(104, '2025_02_21_051534_add_hash_to_global_settings_table', 1),
(105, '2025_02_21_102116_add_column_to_settings', 1),
(106, '2025_02_24_063827_add_payment_qr_to_receipt_settings', 1),
(107, '2025_02_24_111946_add_permissions_to_customers', 1),
(108, '2025_03_04_114535_add_is_enabled_to_restaurant_charges', 1),
(109, '2025_03_10_055100_add_tip_column_to_orders_table', 1),
(110, '2025_03_10_100727_add_is_pwa_intall_alert_show_column_in_restaurants_table', 1),
(111, '2025_03_17_090450_add_meta_title_to_global_settings', 1),
(112, '2025_03_18_044410_create_expenses_table', 1),
(113, '2025_03_19_092459_create_custom_menus_table', 1),
(114, '2025_03_19_103047_update_additional_modules', 1),
(115, '2025_03_24_084350_add_show_payments_column_to_receipt_settings_table', 1),
(116, '2025_04_01_050059_add_branch_id_to_expense_category', 1),
(117, '2025_04_01_051356_add_branch_id_to_expenses', 1),
(118, '2025_04_02_071911_update_kot_status_enum', 1),
(119, '2025_04_07_112351_add_payment_recived_status_to_orders_table', 1),
(120, '2025_04_08_063624_update_meta_keywords', 1),
(121, '2025_04_10_065753_add_flutterwave_payment_gateway_columns_and_tables', 1),
(122, '2025_04_15_084543_create_front_details_table', 1),
(123, '2025_04_22_065157_create_front_reviews_setting_table', 1),
(124, '2025_04_22_091055_create_branch_delivery_settings_table', 1),
(125, '2025_04_22_091146_create_customer_addresses_table', 1),
(126, '2025_04_22_091223_create_delivery_fee_tiers_table', 1),
(127, '2025_04_22_091258_add_delivery_columns_to_orders_table', 1),
(128, '2025_04_29_102014_add_landing_type_column_in_global_settings_table', 1),
(129, '2025_04_29_114538_add_front_data_in_front_details_table', 1),
(130, '2025_05_14_094039_update_printers_settings_columns_to_printers_table', 1),
(131, '2025_05_15_071027_create_kot_places_table', 1),
(132, '2025_05_23_124746_add_in_stock_column', 1),
(133, '2025_05_26_105151_relocate_map_api_key_to_superadmin_settings', 1),
(134, '2025_05_26_114443_modify_kot_places_table', 1),
(135, '2025_05_30_081624_add_show_item_on_customer_site_to_menu_items', 1),
(136, '2025_06_02_081928_add_session_driver_column_to_global_settings', 1),
(137, '2025_06_02_112147_add_columns_to_superadmin_payment_gateways_table', 1),
(138, '2025_06_02_112903_add_paypal_payment_column_to_payment_gateway_credentials', 1),
(139, '2025_06_02_113108_create_paypal_payments_table', 1),
(140, '2025_06_02_114326_add_paypal_payment_in_payment_method_to_payments', 1),
(141, '2025_06_03_095923_add_status_column_kot_item', 1),
(142, '2025_06_04_065130_add_columns_payfast_in_superadmin_payment_gateways_table', 1),
(143, '2025_06_05_063256_add_sort_order_columns_in_menu_and_items', 1),
(144, '2025_06_05_112055_create_kot_settings_table', 1),
(145, '2025_06_06_050159_add_payfast_payment_column_to_payment_gateway_credentials', 1),
(146, '2025_06_06_051204_create_payfast_payments_table', 1),
(147, '2025_06_10_093131_change_delete_cascade_for_orders', 1),
(148, '2025_06_11_061716_add_uuid_to_orders_table', 1),
(149, '2025_06_11_062354_add_columns_paystack_in_superadmin_payment_gateways_table', 1),
(150, '2025_06_13_112612_add_phone_to_users', 1),
(151, '2025_06_13_113200_add_column_paystack_payments_to_payment_gateway_credentials', 1),
(152, '2025_06_13_113240_create_paystack_payments_table', 1),
(153, '2025_06_16_104533_add_note_columns_to_kot_items_and_order_items', 1),
(154, '2025_06_18_112425_add_payment_gateways_to_restaurants_table', 1),
(155, '2025_06_19_070518_add_position_to_custom_menus_table', 1),
(156, '2025_06_20_060452_add_columns_to_branch_table', 1),
(157, '2025_06_20_092521_add_others_type_to_payments_table', 1),
(158, '2025_06_23_101041_create_kot_cancel_reasons_table', 1),
(159, '2025_06_23_120021_update_kot_place_id_in_menu_items', 1),
(160, '2025_06_24_092521_disable_printer', 1),
(161, '2025_06_24_092811_add_column_cancel_kot_reason_to_kots_table', 1),
(162, '2025_06_24_102830_update_enum_status_to_kots_table', 1),
(163, '2025_06_25_094311_add_column_cancellation_reason_to_orders_table', 1),
(164, '2025_06_27_084541_insert_sample_kot_cancel_reasons_data', 1),
(165, '2025_07_01_112529_create_print_jobs_table', 1),
(166, '2025_07_01_133114_add_placed_via_column_orders_table', 1),
(167, '2025_07_02_105440_add_translations_columns_for_modifier_group', 1),
(168, '2025_07_02_114040_add_unique_hash_to_branches_table', 1),
(169, '2025_07_03_123829_update_kot_place_id_for_cloned_menu_items', 1),
(170, '2025_07_04_081809_add_tax_mode_to_restaurants_table', 1),
(171, '2025_07_04_131541_create_desktop_applications_table', 1),
(172, '2025_07_07_070122_add_pusher_broadcast_to_pusher_settings_table', 1),
(173, '2025_07_07_110131_create_menu_item_taxes_table', 1),
(174, '2025_07_14_082950_add_columns_to_restaurants_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(6, 'App\\Models\\User', 4),
(10, 'App\\Models\\User', 5),
(11, 'App\\Models\\User', 6),
(12, 'App\\Models\\User', 7),
(12, 'App\\Models\\User', 8),
(12, 'App\\Models\\User', 9),
(12, 'App\\Models\\User', 10),
(12, 'App\\Models\\User', 11),
(13, 'App\\Models\\User', 12),
(13, 'App\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `modifier_groups`
--

CREATE TABLE `modifier_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modifier_group_translations`
--

CREATE TABLE `modifier_group_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modifier_group_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modifier_options`
--

CREATE TABLE `modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modifier_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` decimal(16,2) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_preselected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Menu', NULL, NULL),
(2, 'Menu Item', NULL, NULL),
(3, 'Item Category', NULL, NULL),
(4, 'Area', NULL, NULL),
(5, 'Table', NULL, NULL),
(6, 'Reservation', NULL, NULL),
(7, 'KOT', NULL, NULL),
(8, 'Order', NULL, NULL),
(9, 'Customer', NULL, NULL),
(10, 'Staff', NULL, NULL),
(11, 'Payment', NULL, NULL),
(12, 'Report', NULL, NULL),
(13, 'Settings', NULL, NULL),
(14, 'Delivery Executive', NULL, NULL),
(15, 'Waiter Request', NULL, NULL),
(16, 'Expense', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `send_email` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `restaurant_id`, `type`, `send_email`, `created_at`, `updated_at`) VALUES
(1, 1, 'order_received', 1, NULL, NULL),
(2, 1, 'reservation_confirmed', 1, NULL, NULL),
(3, 1, 'new_reservation', 1, NULL, NULL),
(4, 1, 'order_bill_sent', 1, NULL, NULL),
(5, 1, 'staff_welcome', 1, NULL, NULL),
(6, 2, 'order_received', 1, NULL, NULL),
(7, 2, 'reservation_confirmed', 1, NULL, NULL),
(8, 2, 'new_reservation', 1, NULL, NULL),
(9, 2, 'order_bill_sent', 1, NULL, NULL),
(10, 2, 'staff_welcome', 1, NULL, NULL),
(11, 3, 'order_received', 1, NULL, NULL),
(12, 3, 'reservation_confirmed', 1, NULL, NULL),
(13, 3, 'new_reservation', 1, NULL, NULL),
(14, 3, 'order_bill_sent', 1, NULL, NULL),
(15, 3, 'staff_welcome', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_plan_changes`
--

CREATE TABLE `offline_plan_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `package_type` varchar(191) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `status` enum('verified','pending','rejected') NOT NULL DEFAULT 'pending',
  `remark` text DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onboarding_steps`
--

CREATE TABLE `onboarding_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `add_area_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_table_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_menu_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_menu_items_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `onboarding_steps`
--

INSERT INTO `onboarding_steps` (`id`, `branch_id`, `add_area_completed`, `add_table_completed`, `add_menu_completed`, `add_menu_items_completed`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, '2025-08-01 09:37:55', '2025-08-01 09:37:55'),
(2, 1, 0, 0, 0, 0, '2025-08-01 09:37:57', '2025-08-01 09:37:57'),
(3, 2, 0, 0, 0, 0, '2025-08-01 09:37:57', '2025-08-01 09:37:57'),
(4, 2, 0, 0, 0, 0, '2025-08-01 09:37:59', '2025-08-01 09:37:59'),
(5, 3, 1, 1, 1, 1, '2025-08-02 07:33:06', '2025-08-02 08:13:37'),
(6, 4, 0, 0, 0, 0, '2025-08-02 12:31:23', '2025-08-02 12:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_number` varchar(191) NOT NULL,
  `date_time` datetime NOT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_pax` int(11) DEFAULT NULL,
  `waiter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('draft','kot','billed','paid','canceled','payment_due','ready','out_for_delivery','delivered','pending_verification') NOT NULL DEFAULT 'kot',
  `placed_via` enum('pos','shop') DEFAULT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `tip_amount` decimal(16,2) DEFAULT 0.00,
  `total_tax_amount` decimal(16,2) DEFAULT 0.00,
  `tip_note` text DEFAULT NULL,
  `total` decimal(16,2) NOT NULL,
  `amount_paid` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_type` enum('dine_in','delivery','pickup') NOT NULL DEFAULT 'dine_in',
  `delivery_executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `estimated_delivery_time` datetime DEFAULT NULL,
  `split_type` enum('even','custom','items') DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_value` decimal(16,2) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `order_status` varchar(191) NOT NULL DEFAULT 'placed',
  `delivery_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `customer_lat` decimal(10,7) DEFAULT NULL,
  `customer_lng` decimal(10,7) DEFAULT NULL,
  `is_within_radius` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_started_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `estimated_eta_min` int(11) DEFAULT NULL,
  `estimated_eta_max` int(11) DEFAULT NULL,
  `cancel_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancel_reason_text` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uuid`, `branch_id`, `order_number`, `date_time`, `table_id`, `customer_id`, `number_of_pax`, `waiter_id`, `status`, `placed_via`, `sub_total`, `tip_amount`, `total_tax_amount`, `tip_note`, `total`, `amount_paid`, `created_at`, `updated_at`, `order_type`, `delivery_executive_id`, `delivery_address`, `delivery_time`, `estimated_delivery_time`, `split_type`, `discount_type`, `discount_value`, `discount_amount`, `order_status`, `delivery_fee`, `customer_lat`, `customer_lng`, `is_within_radius`, `delivery_started_at`, `delivered_at`, `estimated_eta_min`, `estimated_eta_max`, `cancel_reason_id`, `cancel_reason_text`) VALUES
(1, '4719cff4-c1c0-44ff-b218-a9122788dcb2', 3, '1', '2025-08-02 13:33:05', NULL, NULL, 1, 4, 'paid', 'pos', 220.00, 0.00, 0.00, NULL, 264.00, 264.00, '2025-08-02 08:03:05', '2025-08-02 08:03:26', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ddf5c8c8-a6b3-4abb-9d6e-c59c8b45be3a', 3, '2', '2025-08-02 13:44:37', NULL, NULL, 1, 4, 'paid', 'pos', 280.00, 0.00, 0.00, NULL, 336.00, 336.00, '2025-08-02 08:14:37', '2025-08-02 08:15:00', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_charges`
--

CREATE TABLE `order_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `charge_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_charges`
--

INSERT INTO `order_charges` (`id`, `order_id`, `charge_id`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `tax_percentage` decimal(8,4) DEFAULT NULL,
  `tax_breakup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tax_breakup`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `branch_id`, `order_id`, `transaction_id`, `menu_item_id`, `menu_item_variation_id`, `note`, `quantity`, `price`, `amount`, `tax_amount`, `tax_percentage`, `tax_breakup`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, 2, NULL, NULL, 2, 60.00, 120.00, NULL, NULL, NULL, '2025-08-02 08:03:06', '2025-08-02 08:03:06'),
(2, 3, 1, NULL, 1, NULL, NULL, 2, 50.00, 100.00, NULL, NULL, NULL, '2025-08-02 08:03:06', '2025-08-02 08:03:06'),
(3, 3, 2, NULL, 3, NULL, NULL, 2, 140.00, 280.00, NULL, NULL, NULL, '2025-08-02 08:14:39', '2025-08-02 08:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_modifier_options`
--

CREATE TABLE `order_item_modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_places`
--

CREATE TABLE `order_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_places`
--

INSERT INTO `order_places` (`id`, `printer_id`, `branch_id`, `name`, `type`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-08-01 09:37:56', '2025-08-01 09:37:57'),
(2, 2, 2, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(3, 3, 3, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(4, 4, 4, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_taxes`
--

CREATE TABLE `order_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_taxes`
--

INSERT INTO `order_taxes` (`id`, `order_id`, `tax_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 3),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(191) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `annual_price` decimal(16,2) DEFAULT NULL,
  `monthly_price` decimal(16,2) DEFAULT NULL,
  `monthly_status` varchar(191) DEFAULT '1',
  `annual_status` varchar(191) DEFAULT '1',
  `stripe_annual_plan_id` varchar(191) DEFAULT NULL,
  `stripe_monthly_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) DEFAULT NULL,
  `flutterwave_annual_plan_id` varchar(191) DEFAULT NULL,
  `flutterwave_monthly_plan_id` varchar(191) DEFAULT NULL,
  `paystack_annual_plan_id` varchar(191) DEFAULT NULL,
  `paystack_monthly_plan_id` varchar(191) DEFAULT NULL,
  `stripe_lifetime_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_lifetime_plan_id` varchar(191) DEFAULT NULL,
  `billing_cycle` tinyint(3) UNSIGNED DEFAULT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `package_type` varchar(191) NOT NULL DEFAULT 'standard',
  `trial_status` tinyint(1) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `trial_notification_before_days` int(11) DEFAULT NULL,
  `trial_message` varchar(191) DEFAULT NULL,
  `additional_features` longtext DEFAULT NULL,
  `branch_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `price`, `created_at`, `updated_at`, `currency_id`, `description`, `annual_price`, `monthly_price`, `monthly_status`, `annual_status`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `razorpay_annual_plan_id`, `razorpay_monthly_plan_id`, `flutterwave_annual_plan_id`, `flutterwave_monthly_plan_id`, `paystack_annual_plan_id`, `paystack_monthly_plan_id`, `stripe_lifetime_plan_id`, `razorpay_lifetime_plan_id`, `billing_cycle`, `sort_order`, `is_private`, `is_free`, `is_recommended`, `package_type`, `trial_status`, `trial_days`, `trial_notification_before_days`, `trial_message`, `additional_features`, `branch_limit`) VALUES
(1, 'Default', 0.00, '2025-08-01 09:37:47', '2025-08-01 09:37:47', 1, 'Its a default package and cannot be deleted', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 0, 1, 0, 'default', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Subscription Package', 0.00, '2025-08-01 09:37:48', '2025-08-01 09:37:48', 1, 'This is a subscription package', 100.00, 10.00, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 0, 0, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Life Time', 199.00, '2025-08-01 09:37:48', '2025-08-01 09:37:48', 1, 'This is a lifetime access package', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 1, 'lifetime', NULL, NULL, NULL, NULL, '[\"Change Branch\",\"Export Report\",\"Table Reservation\",\"Payment Gateway Integration\",\"Theme Setting\"]', NULL),
(4, 'Private Package', 0.00, '2025-08-01 09:37:50', '2025-08-01 09:37:50', 1, 'This is a private package', 50.00, 5.00, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 4, 1, 0, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Trial Package', 0.00, '2025-08-01 09:37:51', '2025-08-01 09:37:51', 1, 'This is a trial package', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 0, 'trial', 1, 30, 5, '30 Days Free Trial', '[\"Change Branch\",\"Export Report\",\"Table Reservation\",\"Payment Gateway Integration\",\"Theme Setting\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_modules`
--

CREATE TABLE `package_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_modules`
--

INSERT INTO `package_modules` (`id`, `package_id`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 2, 1, NULL, NULL),
(18, 2, 2, NULL, NULL),
(19, 2, 3, NULL, NULL),
(20, 2, 4, NULL, NULL),
(21, 2, 5, NULL, NULL),
(22, 2, 6, NULL, NULL),
(23, 2, 7, NULL, NULL),
(24, 2, 8, NULL, NULL),
(25, 2, 9, NULL, NULL),
(26, 2, 10, NULL, NULL),
(27, 2, 11, NULL, NULL),
(28, 2, 12, NULL, NULL),
(29, 2, 13, NULL, NULL),
(30, 2, 14, NULL, NULL),
(31, 2, 15, NULL, NULL),
(32, 2, 16, NULL, NULL),
(33, 3, 1, NULL, NULL),
(34, 3, 2, NULL, NULL),
(35, 3, 3, NULL, NULL),
(36, 3, 4, NULL, NULL),
(37, 3, 5, NULL, NULL),
(38, 3, 6, NULL, NULL),
(39, 3, 7, NULL, NULL),
(40, 3, 8, NULL, NULL),
(41, 3, 9, NULL, NULL),
(42, 3, 10, NULL, NULL),
(43, 3, 11, NULL, NULL),
(44, 3, 12, NULL, NULL),
(45, 3, 13, NULL, NULL),
(46, 3, 14, NULL, NULL),
(47, 3, 15, NULL, NULL),
(48, 3, 16, NULL, NULL),
(49, 4, 1, NULL, NULL),
(50, 4, 2, NULL, NULL),
(51, 4, 3, NULL, NULL),
(52, 4, 4, NULL, NULL),
(53, 4, 5, NULL, NULL),
(54, 4, 6, NULL, NULL),
(55, 4, 7, NULL, NULL),
(56, 4, 8, NULL, NULL),
(57, 4, 9, NULL, NULL),
(58, 4, 10, NULL, NULL),
(59, 4, 11, NULL, NULL),
(60, 4, 12, NULL, NULL),
(61, 4, 13, NULL, NULL),
(62, 4, 14, NULL, NULL),
(63, 4, 15, NULL, NULL),
(64, 4, 16, NULL, NULL),
(65, 5, 1, NULL, NULL),
(66, 5, 2, NULL, NULL),
(67, 5, 3, NULL, NULL),
(68, 5, 4, NULL, NULL),
(69, 5, 5, NULL, NULL),
(70, 5, 6, NULL, NULL),
(71, 5, 7, NULL, NULL),
(72, 5, 8, NULL, NULL),
(73, 5, 9, NULL, NULL),
(74, 5, 10, NULL, NULL),
(75, 5, 11, NULL, NULL),
(76, 5, 12, NULL, NULL),
(77, 5, 13, NULL, NULL),
(78, 5, 14, NULL, NULL),
(79, 5, 15, NULL, NULL),
(80, 5, 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payfast_payments`
--

CREATE TABLE `payfast_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payfast_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('cash','upi','card','due','stripe','razorpay','flutterwave','paypal','payfast','others') NOT NULL DEFAULT 'cash',
  `amount` decimal(16,2) NOT NULL,
  `balance` decimal(16,2) DEFAULT 0.00,
  `transaction_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `branch_id`, `order_id`, `payment_method`, `amount`, `balance`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'cash', 264.00, 0.00, NULL, '2025-08-02 08:03:26', '2025-08-02 08:03:26'),
(2, 3, 2, 'cash', 336.00, 0.00, NULL, '2025-08-02 08:14:53', '2025-08-02 08:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `razorpay_key` text DEFAULT NULL,
  `razorpay_secret` text DEFAULT NULL,
  `razorpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text DEFAULT NULL,
  `stripe_secret` text DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_dine_in_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_delivery_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_pickup_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_cash_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_qr_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_offline_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `offline_payment_detail` varchar(191) DEFAULT NULL,
  `qr_code_image` varchar(191) DEFAULT NULL,
  `flutterwave_status` tinyint(1) NOT NULL DEFAULT 0,
  `flutterwave_mode` enum('test','live') NOT NULL DEFAULT 'test',
  `test_flutterwave_key` varchar(191) DEFAULT NULL,
  `test_flutterwave_secret` varchar(191) DEFAULT NULL,
  `test_flutterwave_hash` varchar(191) DEFAULT NULL,
  `live_flutterwave_key` varchar(191) DEFAULT NULL,
  `live_flutterwave_secret` varchar(191) DEFAULT NULL,
  `live_flutterwave_hash` varchar(191) DEFAULT NULL,
  `flutterwave_webhook_secret_hash` varchar(191) DEFAULT NULL,
  `paypal_client_id` varchar(191) DEFAULT NULL,
  `paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 0,
  `paypal_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `sandbox_paypal_client_id` varchar(191) DEFAULT NULL,
  `sandbox_paypal_secret` varchar(191) DEFAULT NULL,
  `payfast_merchant_id` varchar(191) DEFAULT NULL,
  `payfast_merchant_key` varchar(191) DEFAULT NULL,
  `payfast_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_status` tinyint(1) NOT NULL DEFAULT 0,
  `test_payfast_merchant_id` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) DEFAULT NULL,
  `paystack_key` varchar(191) DEFAULT NULL,
  `paystack_secret` varchar(191) DEFAULT NULL,
  `paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_status` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `test_paystack_key` varchar(191) DEFAULT NULL,
  `test_paystack_secret` varchar(191) DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `restaurant_id`, `razorpay_key`, `razorpay_secret`, `razorpay_status`, `stripe_key`, `stripe_secret`, `stripe_status`, `created_at`, `updated_at`, `is_dine_in_payment_enabled`, `is_delivery_payment_enabled`, `is_pickup_payment_enabled`, `is_cash_payment_enabled`, `is_qr_payment_enabled`, `is_offline_payment_enabled`, `offline_payment_detail`, `qr_code_image`, `flutterwave_status`, `flutterwave_mode`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_webhook_secret_hash`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `paypal_mode`, `sandbox_paypal_client_id`, `sandbox_paypal_secret`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `payfast_mode`, `payfast_status`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`, `paystack_key`, `paystack_secret`, `paystack_merchant_email`, `paystack_status`, `paystack_mode`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`) VALUES
(1, 1, NULL, NULL, 0, NULL, NULL, 0, '2025-08-01 09:37:53', '2025-08-01 09:37:53', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(2, 1, NULL, NULL, 0, NULL, NULL, 0, '2025-08-01 09:38:00', '2025-08-01 09:38:00', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(3, 2, 'eyJpdiI6IlJ6b2N6REtVMk9MellDc1JhMXV0ckE9PSIsInZhbHVlIjoiRUEyTjlGVWNSNTNFYTlBNStzU0J5SE9ERmZiM0MxMnpwSXJQUHgxWW9IWT0iLCJtYWMiOiJmODg3ODZmMTAzNTU1MTk0Y2I2YzM0N2QxODNlODg2NTRiYzJjMmFkZTY5ZjAyZDc1MGI4MTVkMTdmOTU1OGVkIiwidGFnIjoiIn0=', 'eyJpdiI6ImMwSmk2NDNJNENjaEhvSUlHYk5tVkE9PSIsInZhbHVlIjoieXROMmlzYm1rT1FnQmhXeWVVMjVLKzdQWks5aFFDeVRTVzUxazFxT2JFMD0iLCJtYWMiOiI0MDUzMjg5YWFhMDc3ZTYwNDZiMTVlMzA3YjdlMzNhYmJkNjA5YWM2NmYwYTNkOGU4YWI3M2JlYTExZWU2OGU1IiwidGFnIjoiIn0=', 1, NULL, NULL, 0, '2025-08-02 07:33:05', '2025-08-02 07:39:14', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(4, 3, 'eyJpdiI6ImJRWEFoTFp4NGI0czYyMkZXWjMxWmc9PSIsInZhbHVlIjoiR3JLN1J1NzhabW9MKzZoVis2K2R2ME9BK3E1U1UxVG1YOG5jMTQ0VW56VT0iLCJtYWMiOiIxMWY2ZGQ2OTBiZGI4ZDA0MjU5YzM3YzNkNTIxZTI1MDE5YzY2MTMwM2RlNmY5NTQ2NjA3NWZlZTMwODg2ODk4IiwidGFnIjoiIn0=', 'eyJpdiI6Ik9paFJsYkozOVhrMlZwemlCS2ZnZHc9PSIsInZhbHVlIjoia24zdW9GZnZORkRIN1V2dVNtYm9UQVBoeFhSdXlZOXI0ZDJTSlFxZTVXcz0iLCJtYWMiOiIyODQzYjY4ZDZjMzI2NDNhNDczOGQ3NzE2ZmJjYmI2NDVlNGU0MGE1NTMxMDA4MTMyNDFkZTFiOWNhMTNiNTRhIiwidGFnIjoiIn0=', 1, NULL, NULL, 0, '2025-08-02 12:31:21', '2025-08-02 12:40:26', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE `paypal_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paypal_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_payments`
--

CREATE TABLE `paystack_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paystack_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 'Create Menu', 'web', 1, NULL, NULL),
(2, 'Show Menu', 'web', 1, NULL, NULL),
(3, 'Update Menu', 'web', 1, NULL, NULL),
(4, 'Delete Menu', 'web', 1, NULL, NULL),
(5, 'Create Menu Item', 'web', 2, NULL, NULL),
(6, 'Show Menu Item', 'web', 2, NULL, NULL),
(7, 'Update Menu Item', 'web', 2, NULL, NULL),
(8, 'Delete Menu Item', 'web', 2, NULL, NULL),
(9, 'Create Item Category', 'web', 3, NULL, NULL),
(10, 'Show Item Category', 'web', 3, NULL, NULL),
(11, 'Update Item Category', 'web', 3, NULL, NULL),
(12, 'Delete Item Category', 'web', 3, NULL, NULL),
(13, 'Create Area', 'web', 4, NULL, NULL),
(14, 'Show Area', 'web', 4, NULL, NULL),
(15, 'Update Area', 'web', 4, NULL, NULL),
(16, 'Delete Area', 'web', 4, NULL, NULL),
(17, 'Create Table', 'web', 5, NULL, NULL),
(18, 'Show Table', 'web', 5, NULL, NULL),
(19, 'Update Table', 'web', 5, NULL, NULL),
(20, 'Delete Table', 'web', 5, NULL, NULL),
(21, 'Create Reservation', 'web', 6, NULL, NULL),
(22, 'Show Reservation', 'web', 6, NULL, NULL),
(23, 'Update Reservation', 'web', 6, NULL, NULL),
(24, 'Delete Reservation', 'web', 6, NULL, NULL),
(25, 'Manage KOT', 'web', 7, NULL, NULL),
(26, 'Create Order', 'web', 8, NULL, NULL),
(27, 'Show Order', 'web', 8, NULL, NULL),
(28, 'Update Order', 'web', 8, NULL, NULL),
(29, 'Delete Order', 'web', 8, NULL, NULL),
(30, 'Create Customer', 'web', 9, NULL, NULL),
(31, 'Show Customer', 'web', 9, NULL, NULL),
(32, 'Update Customer', 'web', 9, NULL, NULL),
(33, 'Delete Customer', 'web', 9, NULL, NULL),
(34, 'Create Staff Member', 'web', 10, NULL, NULL),
(35, 'Show Staff Member', 'web', 10, NULL, NULL),
(36, 'Update Staff Member', 'web', 10, NULL, NULL),
(37, 'Delete Staff Member', 'web', 10, NULL, NULL),
(38, 'Create Delivery Executive', 'web', 14, NULL, NULL),
(39, 'Show Delivery Executive', 'web', 14, NULL, NULL),
(40, 'Update Delivery Executive', 'web', 14, NULL, NULL),
(41, 'Delete Delivery Executive', 'web', 14, NULL, NULL),
(42, 'Show Payments', 'web', 11, NULL, NULL),
(43, 'Show Reports', 'web', 12, NULL, NULL),
(44, 'Manage Settings', 'web', 13, NULL, NULL),
(45, 'Manage Waiter Request', 'web', 15, NULL, NULL),
(46, 'Create Expense', 'web', 16, NULL, NULL),
(47, 'Show Expense', 'web', 16, NULL, NULL),
(48, 'Update Expense', 'web', 16, NULL, NULL),
(49, 'Delete Expense', 'web', 16, NULL, NULL),
(50, 'Create Expense Category', 'web', 16, NULL, NULL),
(51, 'Show Expense Category', 'web', 16, NULL, NULL),
(52, 'Update Expense Category', 'web', 16, NULL, NULL),
(53, 'Delete Expense Category', 'web', 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `predefined_amounts`
--

CREATE TABLE `predefined_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predefined_amounts`
--

INSERT INTO `predefined_amounts` (`id`, `restaurant_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 50.00, '2025-08-01 09:37:54', '2025-08-01 09:37:54'),
(2, 1, 100.00, '2025-08-01 09:37:54', '2025-08-01 09:37:54'),
(3, 1, 500.00, '2025-08-01 09:37:54', '2025-08-01 09:37:54'),
(4, 1, 1000.00, '2025-08-01 09:37:54', '2025-08-01 09:37:54'),
(5, 2, 50.00, '2025-08-02 07:33:05', '2025-08-02 07:33:05'),
(6, 2, 100.00, '2025-08-02 07:33:05', '2025-08-02 07:33:05'),
(7, 2, 500.00, '2025-08-02 07:33:05', '2025-08-02 07:33:05'),
(8, 2, 1000.00, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(9, 3, 50.00, '2025-08-02 12:31:22', '2025-08-02 12:31:22'),
(10, 3, 100.00, '2025-08-02 12:31:22', '2025-08-02 12:31:22'),
(11, 3, 500.00, '2025-08-02 12:31:22', '2025-08-02 12:31:22'),
(12, 3, 1000.00, '2025-08-02 12:31:22', '2025-08-02 12:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `printing_choice` varchar(191) DEFAULT NULL,
  `kots` text DEFAULT NULL,
  `orders` text DEFAULT NULL,
  `print_format` varchar(191) DEFAULT NULL,
  `invoice_qr_code` int(11) DEFAULT NULL,
  `open_cash_drawer` enum('yes','no') DEFAULT NULL,
  `ipv4_address` varchar(191) DEFAULT NULL,
  `thermal_or_nonthermal` varchar(191) DEFAULT NULL,
  `share_name` varchar(191) DEFAULT NULL,
  `type` enum('network','windows','linux','default') DEFAULT NULL,
  `profile` enum('default','simple','SP2000','TEP-200M','P822D') DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `char_per_line` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `printer_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `restaurant_id`, `branch_id`, `name`, `printing_choice`, `kots`, `orders`, `print_format`, `invoice_qr_code`, `open_cash_drawer`, `ipv4_address`, `thermal_or_nonthermal`, `share_name`, `type`, `profile`, `is_active`, `is_default`, `char_per_line`, `ip_address`, `port`, `path`, `printer_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default Thermal Printer', 'browserPopupPrint', '[1]', '[1]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-01 09:37:57', '2025-08-01 09:37:57'),
(2, 1, 2, 'Default Thermal Printer', 'browserPopupPrint', '[2]', '[2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(3, 2, 3, 'Default Thermal Printer', 'browserPopupPrint', '[3]', '[3]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(4, 3, 4, 'Default Thermal Printer', 'browserPopupPrint', '[4]', '[4]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-02 12:31:24', '2025-08-02 12:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `print_jobs`
--

CREATE TABLE `print_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `response_printer` varchar(191) DEFAULT NULL,
  `payload` longtext NOT NULL,
  `printed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusher_settings`
--

CREATE TABLE `pusher_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beamer_status` tinyint(1) NOT NULL DEFAULT 0,
  `instance_id` varchar(191) DEFAULT NULL,
  `beam_secret` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pusher_broadcast` tinyint(1) NOT NULL DEFAULT 0,
  `pusher_app_id` varchar(191) DEFAULT NULL,
  `pusher_key` varchar(191) DEFAULT NULL,
  `pusher_secret` varchar(191) DEFAULT NULL,
  `pusher_cluster` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pusher_settings`
--

INSERT INTO `pusher_settings` (`id`, `beamer_status`, `instance_id`, `beam_secret`, `created_at`, `updated_at`, `pusher_broadcast`, `pusher_app_id`, `pusher_key`, `pusher_secret`, `pusher_cluster`) VALUES
(1, 0, NULL, NULL, '2025-08-01 09:35:24', '2025-08-01 09:35:24', 0, NULL, NULL, NULL, NULL),
(2, 0, NULL, NULL, '2025-08-01 09:38:00', '2025-08-01 09:38:00', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_payments`
--

CREATE TABLE `razorpay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `payment_status` enum('pending','requested','declined','completed') NOT NULL DEFAULT 'pending',
  `payment_error_response` text DEFAULT NULL,
  `razorpay_order_id` varchar(191) DEFAULT NULL,
  `razorpay_payment_id` varchar(191) DEFAULT NULL,
  `razorpay_signature` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_settings`
--

CREATE TABLE `receipt_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_customer_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer_address` tinyint(1) NOT NULL DEFAULT 0,
  `show_table_number` tinyint(1) NOT NULL DEFAULT 0,
  `payment_qr_code` varchar(191) DEFAULT NULL,
  `show_payment_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `show_waiter` tinyint(1) NOT NULL DEFAULT 0,
  `show_total_guest` tinyint(1) NOT NULL DEFAULT 0,
  `show_restaurant_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax` tinyint(1) NOT NULL DEFAULT 0,
  `show_payment_details` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipt_settings`
--

INSERT INTO `receipt_settings` (`id`, `restaurant_id`, `show_customer_name`, `show_customer_address`, `show_table_number`, `payment_qr_code`, `show_payment_qr_code`, `show_waiter`, `show_total_guest`, `show_restaurant_logo`, `show_tax`, `show_payment_details`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, '2025-08-01 09:37:54', '2025-08-01 09:37:54'),
(2, 2, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1, '2025-08-02 07:33:05', '2025-08-02 07:37:16'),
(3, 3, 1, 0, 1, NULL, 0, 1, 1, 0, 1, 1, '2025-08-02 12:31:22', '2025-08-02 12:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reservation_date_time` datetime NOT NULL,
  `party_size` int(11) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `reservation_status` enum('Pending','Confirmed','Checked_In','Cancelled','No_Show') NOT NULL DEFAULT 'Confirmed',
  `reservation_slot_type` enum('Breakfast','Lunch','Dinner') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_settings`
--

CREATE TABLE `reservation_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL,
  `time_slot_difference` int(11) NOT NULL,
  `slot_type` enum('Breakfast','Lunch','Dinner') NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservation_settings`
--

INSERT INTO `reservation_settings` (`id`, `branch_id`, `day_of_week`, `time_slot_start`, `time_slot_end`, `time_slot_difference`, `slot_type`, `available`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(2, 1, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(3, 1, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(4, 1, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(5, 1, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(6, 1, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(7, 1, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(8, 1, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(9, 1, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(10, 1, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(11, 1, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(12, 1, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(13, 1, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(14, 1, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(15, 1, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(16, 1, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(17, 1, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(18, 1, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(19, 1, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(20, 1, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(21, 1, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:56', '2025-08-01 09:37:56'),
(22, 2, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(23, 2, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(24, 2, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(25, 2, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(26, 2, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(27, 2, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(28, 2, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(29, 2, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(30, 2, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(31, 2, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(32, 2, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(33, 2, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(34, 2, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(35, 2, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(36, 2, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(37, 2, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(38, 2, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(39, 2, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(40, 2, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(41, 2, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(42, 2, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:37:58', '2025-08-01 09:37:58'),
(43, 1, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(44, 1, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(45, 1, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(46, 1, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(47, 1, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(48, 1, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(49, 1, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(50, 1, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(51, 1, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(52, 1, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(53, 1, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(54, 1, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(55, 1, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(56, 1, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(57, 1, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(58, 1, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(59, 1, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(60, 1, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:02', '2025-08-01 09:38:02'),
(61, 1, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(62, 1, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(63, 1, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-01 09:38:03', '2025-08-01 09:38:03'),
(64, 3, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(65, 3, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(66, 3, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(67, 3, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(68, 3, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(69, 3, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(70, 3, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(71, 3, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(72, 3, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(73, 3, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(74, 3, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(75, 3, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(76, 3, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(77, 3, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(78, 3, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(79, 3, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(80, 3, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(81, 3, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(82, 3, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(83, 3, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(84, 3, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 07:33:06', '2025-08-02 07:33:06'),
(85, 4, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 0, '2025-08-02 12:31:23', '2025-08-02 12:56:24'),
(86, 4, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:23', '2025-08-02 12:56:24'),
(87, 4, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:23', '2025-08-02 12:56:24'),
(88, 4, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(89, 4, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(90, 4, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(91, 4, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(92, 4, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(93, 4, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(94, 4, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(95, 4, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(96, 4, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(97, 4, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(98, 4, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(99, 4, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(100, 4, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(101, 4, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(102, 4, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(103, 4, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(104, 4, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24'),
(105, 4, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-08-02 12:31:24', '2025-08-02 12:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `phone_code` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) NOT NULL,
  `theme_hex` varchar(191) NOT NULL,
  `theme_rgb` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `hide_new_orders` tinyint(1) NOT NULL DEFAULT 0,
  `hide_new_reservations` tinyint(1) NOT NULL DEFAULT 0,
  `hide_new_waiter_request` tinyint(1) NOT NULL DEFAULT 0,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `license_type` enum('free','paid') NOT NULL DEFAULT 'free',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_login_required` tinyint(1) NOT NULL DEFAULT 0,
  `about_us` longtext DEFAULT NULL,
  `allow_customer_delivery_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_customer_pickup_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_customer_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_dine_in_orders` tinyint(1) NOT NULL DEFAULT 1,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive','license_expired') NOT NULL DEFAULT 'active',
  `license_expire_on` datetime DEFAULT NULL,
  `trial_ends_at` datetime DEFAULT NULL,
  `license_updated_at` datetime DEFAULT NULL,
  `subscription_updated_at` datetime DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `is_waiter_request_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `default_table_reservation_status` varchar(191) NOT NULL DEFAULT 'Confirmed',
  `approval_status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Approved',
  `rejection_reason` text DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `yelp_link` varchar(255) DEFAULT NULL,
  `table_required` tinyint(1) NOT NULL DEFAULT 0,
  `show_logo_text` tinyint(1) NOT NULL DEFAULT 1,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `upload_fav_icon_android_chrome_192` varchar(191) DEFAULT NULL,
  `upload_fav_icon_android_chrome_512` varchar(191) DEFAULT NULL,
  `upload_fav_icon_apple_touch_icon` varchar(191) DEFAULT NULL,
  `upload_favicon_16` varchar(191) DEFAULT NULL,
  `upload_favicon_32` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `is_waiter_request_enabled_on_desktop` tinyint(1) NOT NULL DEFAULT 1,
  `is_waiter_request_enabled_on_mobile` tinyint(1) NOT NULL DEFAULT 1,
  `is_waiter_request_enabled_open_by_qr` tinyint(1) NOT NULL DEFAULT 0,
  `webmanifest` varchar(191) DEFAULT NULL,
  `enable_tip_shop` tinyint(1) NOT NULL DEFAULT 1,
  `enable_tip_pos` tinyint(1) NOT NULL DEFAULT 1,
  `is_pwa_install_alert_show` tinyint(1) NOT NULL DEFAULT 0,
  `auto_confirm_orders` tinyint(1) NOT NULL DEFAULT 0,
  `tax_mode` enum('order','item') NOT NULL DEFAULT 'order',
  `tax_inclusive` tinyint(1) NOT NULL DEFAULT 0,
  `customer_site_language` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `hash`, `address`, `phone_number`, `phone_code`, `email`, `timezone`, `theme_hex`, `theme_rgb`, `logo`, `country_id`, `hide_new_orders`, `hide_new_reservations`, `hide_new_waiter_request`, `currency_id`, `license_type`, `is_active`, `created_at`, `updated_at`, `customer_login_required`, `about_us`, `allow_customer_delivery_orders`, `allow_customer_pickup_orders`, `allow_customer_orders`, `allow_dine_in_orders`, `package_id`, `package_type`, `status`, `license_expire_on`, `trial_ends_at`, `license_updated_at`, `subscription_updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `is_waiter_request_enabled`, `default_table_reservation_status`, `approval_status`, `rejection_reason`, `facebook_link`, `instagram_link`, `twitter_link`, `yelp_link`, `table_required`, `show_logo_text`, `meta_keyword`, `meta_description`, `upload_fav_icon_android_chrome_192`, `upload_fav_icon_android_chrome_512`, `upload_fav_icon_apple_touch_icon`, `upload_favicon_16`, `upload_favicon_32`, `favicon`, `is_waiter_request_enabled_on_desktop`, `is_waiter_request_enabled_on_mobile`, `is_waiter_request_enabled_open_by_qr`, `webmanifest`, `enable_tip_shop`, `enable_tip_pos`, `is_pwa_install_alert_show`, `auto_confirm_orders`, `tax_mode`, `tax_inclusive`, `customer_site_language`) VALUES
(1, 'Demo Restaurant', 'demo-restaurant', '191 Julianne Lodge Apt. 388\nSouth Jayce, KY 75488-4974', '+14796235600', NULL, 'demo.restaurant@example.com', 'America/New_York', '#A78BFA', '167, 139, 250', NULL, 236, 0, 0, 0, 1, 'free', 1, '2025-08-01 09:37:53', '2025-08-01 09:37:54', 0, '<p class=\"text-lg text-gray-600 mb-6\">\n          Welcome to our restaurant, where great food and good vibes come together! We\'re a local, family-owned spot that loves bringing people together over delicious meals and unforgettable moments. Whether you\'re here for a quick bite, a family dinner, or a celebration, we\'re all about making your time with us special.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          Our menu is packed with dishes made from fresh, quality ingredients because we believe food should taste as\n          good as it makes you feel. From our signature dishes to seasonal specials, there\'s always something to excite\n          your taste buds.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          But we\'re not just about the food—we\'re about community. We love seeing familiar faces and welcoming new ones.\n          Our team is a fun, friendly bunch dedicated to serving you with a smile and making sure every visit feels like\n          coming home.\n        </p>\n        <p class=\"text-lg text-gray-600\">\n          So, come on in, grab a seat, and let us take care of the rest. We can\'t wait to share our love of food with\n          you!\n        </p>\n        <p class=\"text-lg text-gray-800 font-semibold mt-6\">See you soon! 🍽️✨</p>', 1, 1, 1, 1, 5, 'trial', 'active', '2025-08-31 15:07:54', '2025-08-31 15:07:54', '2025-08-01 15:07:54', '2025-08-01 15:07:54', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com/', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, 1, 1, 0, 0, 'order', 0, 'en'),
(2, 'Spice Craft', 'spice-craft', 'Station Road. Uluberia. Howrah', '7685944429', '91', 'subratasah@gmail.com', 'Asia/Kolkata', '#A78BFA', '167, 139, 250', NULL, 103, 0, 0, 0, 6, 'free', 1, '2025-08-02 07:33:05', '2025-08-02 07:34:59', 0, '<p class=\"text-lg text-gray-600 mb-6\">\n          Welcome to our restaurant, where great food and good vibes come together! We\'re a local, family-owned spot that loves bringing people together over delicious meals and unforgettable moments. Whether you\'re here for a quick bite, a family dinner, or a celebration, we\'re all about making your time with us special.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          Our menu is packed with dishes made from fresh, quality ingredients because we believe food should taste as\n          good as it makes you feel. From our signature dishes to seasonal specials, there\'s always something to excite\n          your taste buds.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          But we\'re not just about the food—we\'re about community. We love seeing familiar faces and welcoming new ones.\n          Our team is a fun, friendly bunch dedicated to serving you with a smile and making sure every visit feels like\n          coming home.\n        </p>\n        <p class=\"text-lg text-gray-600\">\n          So, come on in, grab a seat, and let us take care of the rest. We can\'t wait to share our love of food with\n          you!\n        </p>\n        <p class=\"text-lg text-gray-800 font-semibold mt-6\">See you soon! 🍽️✨</p>', 1, 1, 1, 1, 5, 'trial', 'active', '2025-09-01 13:03:05', '2025-09-01 13:03:05', '2025-08-02 13:03:05', '2025-08-02 13:03:05', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, 1, 1, 0, 0, 'order', 0, 'en'),
(3, 'The Zest - PSK', 'the-zest-psk', '14, District Centre, Vikas Marg, Laxmi Nagar, New Delhi, Delhi, 110092', '8130660060', '93', 'zest@gmail.com', 'Asia/Kolkata', '#A78BFA', '167, 139, 250', 'a7cd310301f3def89819406cfa9fabaf.jpg', 103, 0, 0, 0, 10, 'free', 1, '2025-08-02 12:31:21', '2025-08-02 12:58:07', 0, '<p class=\"text-lg text-gray-600 mb-6\">\n          Welcome to our restaurant, where great food and good vibes come together! We\'re a local, family-owned spot that loves bringing people together over delicious meals and unforgettable moments. Whether you\'re here for a quick bite, a family dinner, or a celebration, we\'re all about making your time with us special.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          Our menu is packed with dishes made from fresh, quality ingredients because we believe food should taste as\n          good as it makes you feel. From our signature dishes to seasonal specials, there\'s always something to excite\n          your taste buds.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          But we\'re not just about the food—we\'re about community. We love seeing familiar faces and welcoming new ones.\n          Our team is a fun, friendly bunch dedicated to serving you with a smile and making sure every visit feels like\n          coming home.\n        </p>\n        <p class=\"text-lg text-gray-600\">\n          So, come on in, grab a seat, and let us take care of the rest. We can\'t wait to share our love of food with\n          you!\n        </p>\n        <p class=\"text-lg text-gray-800 font-semibold mt-6\">See you soon! 🍽️✨</p>', 0, 0, 0, 1, 5, 'trial', 'active', '2025-09-01 18:01:22', '2025-09-01 18:01:22', '2025-08-02 18:01:22', '2025-08-02 18:01:22', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, 1, 1, 0, 0, 'order', 0, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_charges`
--

CREATE TABLE `restaurant_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `charge_name` varchar(191) NOT NULL,
  `charge_type` enum('percent','fixed') NOT NULL DEFAULT 'fixed',
  `charge_value` decimal(16,2) DEFAULT NULL,
  `order_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Supported order types: DineIn, Delivery, PickUp' CHECK (json_valid(`order_types`)),
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_charges`
--

INSERT INTO `restaurant_charges` (`id`, `restaurant_id`, `charge_name`, `charge_type`, `charge_value`, `order_types`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 2, 'Service Charge', 'percent', 15.00, '[\"dine_in\"]', 1, '2025-08-02 07:36:31', '2025-08-02 07:36:31'),
(2, 2, 'Packaging Charges', 'fixed', 35.00, '[\"pickup\",\"delivery\"]', 1, '2025-08-02 07:36:56', '2025-08-02 07:36:56'),
(3, 3, 'Service Charge', 'percent', 10.00, '[\"dine_in\"]', 1, '2025-08-02 12:38:25', '2025-08-02 12:38:25'),
(4, 3, 'Packaging Charges', 'fixed', 30.00, '[\"pickup\",\"delivery\"]', 1, '2025-08-02 12:39:00', '2025-08-02 12:39:17');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_payments`
--

CREATE TABLE `restaurant_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `payment_source` enum('official_site','app_sumo') NOT NULL DEFAULT 'official_site',
  `razorpay_order_id` varchar(191) DEFAULT NULL,
  `razorpay_payment_id` varchar(191) DEFAULT NULL,
  `razorpay_signature` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `payment_date_time` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_payment_intent` varchar(191) DEFAULT NULL,
  `stripe_session_id` text DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `currency_id` varchar(191) DEFAULT NULL,
  `flutterwave_transaction_id` varchar(191) DEFAULT NULL,
  `flutterwave_payment_ref` varchar(191) DEFAULT NULL,
  `paypal_payment_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_taxes`
--

CREATE TABLE `restaurant_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` varchar(191) DEFAULT NULL,
  `tax_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_taxes`
--

INSERT INTO `restaurant_taxes` (`id`, `restaurant_id`, `tax_id`, `tax_name`, `created_at`, `updated_at`) VALUES
(1, 2, '19ABCDE1234F2Z5', 'GSTIN', '2025-08-02 07:37:16', '2025-08-02 07:37:16'),
(2, 2, '18824003000668', 'FSSAI', '2025-08-02 07:37:16', '2025-08-02 07:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(1, 'Super Admin', 'Super Admin', 'web', '2025-08-01 09:37:52', '2025-08-01 09:37:52', NULL),
(2, 'Admin_1', 'Admin', 'web', '2025-08-01 09:38:00', '2025-08-01 09:38:00', 1),
(3, 'Branch Head_1', 'Branch Head', 'web', '2025-08-01 09:38:00', '2025-08-01 09:38:00', 1),
(4, 'Waiter_1', 'Waiter', 'web', '2025-08-01 09:38:00', '2025-08-01 09:38:00', 1),
(5, 'Chef_1', 'Chef', 'web', '2025-08-01 09:38:00', '2025-08-01 09:38:00', 1),
(6, 'Admin_2', 'Admin', 'web', '2025-08-02 07:33:07', '2025-08-02 07:33:07', 2),
(7, 'Branch Head_2', 'Branch Head', 'web', '2025-08-02 07:33:07', '2025-08-02 07:33:07', 2),
(8, 'Waiter_2', 'Waiter', 'web', '2025-08-02 07:33:07', '2025-08-02 07:33:07', 2),
(9, 'Chef_2', 'Chef', 'web', '2025-08-02 07:33:07', '2025-08-02 07:33:07', 2),
(10, 'Admin_3', 'Admin', 'web', '2025-08-02 12:31:25', '2025-08-02 12:31:25', 3),
(11, 'Branch Head_3', 'Branch Head', 'web', '2025-08-02 12:31:25', '2025-08-02 12:31:25', 3),
(12, 'Waiter_3', 'Waiter', 'web', '2025-08-02 12:31:25', '2025-08-02 12:31:25', 3),
(13, 'Chef_3', 'Chef', 'web', '2025-08-02 12:31:25', '2025-08-02 12:31:25', 3);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 10),
(1, 11),
(2, 2),
(2, 3),
(2, 6),
(2, 7),
(2, 10),
(2, 11),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(3, 10),
(3, 11),
(4, 2),
(4, 3),
(4, 6),
(4, 7),
(4, 10),
(4, 11),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(5, 10),
(5, 11),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(7, 2),
(7, 3),
(7, 6),
(7, 7),
(7, 10),
(7, 11),
(8, 2),
(8, 3),
(8, 6),
(8, 7),
(8, 10),
(8, 11),
(9, 2),
(9, 3),
(9, 6),
(9, 7),
(9, 10),
(9, 11),
(10, 2),
(10, 3),
(10, 6),
(10, 7),
(10, 10),
(10, 11),
(11, 2),
(11, 3),
(11, 6),
(11, 7),
(11, 10),
(11, 11),
(12, 2),
(12, 3),
(12, 6),
(12, 7),
(12, 10),
(12, 11),
(13, 2),
(13, 3),
(13, 6),
(13, 7),
(13, 10),
(13, 11),
(14, 2),
(14, 3),
(14, 6),
(14, 7),
(14, 10),
(14, 11),
(15, 2),
(15, 3),
(15, 6),
(15, 7),
(15, 10),
(15, 11),
(16, 2),
(16, 3),
(16, 6),
(16, 7),
(16, 10),
(16, 11),
(17, 2),
(17, 3),
(17, 6),
(17, 7),
(17, 10),
(17, 11),
(17, 12),
(18, 2),
(18, 3),
(18, 6),
(18, 7),
(18, 10),
(18, 11),
(18, 12),
(19, 2),
(19, 3),
(19, 6),
(19, 7),
(19, 10),
(19, 11),
(19, 12),
(20, 2),
(20, 3),
(20, 6),
(20, 7),
(20, 10),
(20, 11),
(21, 2),
(21, 3),
(21, 6),
(21, 7),
(21, 10),
(21, 11),
(21, 12),
(22, 2),
(22, 3),
(22, 6),
(22, 7),
(22, 10),
(22, 11),
(22, 12),
(23, 2),
(23, 3),
(23, 6),
(23, 7),
(23, 10),
(23, 11),
(23, 12),
(24, 2),
(24, 3),
(24, 6),
(24, 7),
(24, 10),
(24, 11),
(25, 2),
(25, 3),
(25, 6),
(25, 7),
(25, 10),
(25, 11),
(25, 12),
(26, 2),
(26, 3),
(26, 6),
(26, 7),
(26, 10),
(26, 11),
(26, 12),
(27, 2),
(27, 3),
(27, 6),
(27, 7),
(27, 10),
(27, 11),
(27, 12),
(28, 2),
(28, 3),
(28, 6),
(28, 7),
(28, 10),
(28, 11),
(28, 12),
(29, 2),
(29, 3),
(29, 6),
(29, 7),
(29, 10),
(29, 11),
(30, 2),
(30, 3),
(30, 6),
(30, 7),
(30, 10),
(30, 11),
(31, 2),
(31, 3),
(31, 6),
(31, 7),
(31, 10),
(31, 11),
(31, 12),
(32, 2),
(32, 3),
(32, 6),
(32, 7),
(32, 10),
(32, 11),
(33, 2),
(33, 3),
(33, 6),
(33, 7),
(33, 10),
(33, 11),
(34, 2),
(34, 3),
(34, 6),
(34, 7),
(34, 10),
(34, 11),
(35, 2),
(35, 3),
(35, 6),
(35, 7),
(35, 10),
(35, 11),
(36, 2),
(36, 3),
(36, 6),
(36, 7),
(36, 10),
(36, 11),
(37, 2),
(37, 3),
(37, 6),
(37, 7),
(37, 10),
(37, 11),
(38, 2),
(38, 3),
(38, 6),
(38, 7),
(38, 10),
(38, 11),
(39, 2),
(39, 3),
(39, 6),
(39, 7),
(39, 10),
(39, 11),
(40, 2),
(40, 3),
(40, 6),
(40, 7),
(40, 10),
(40, 11),
(41, 2),
(41, 3),
(41, 6),
(41, 7),
(41, 10),
(41, 11),
(42, 2),
(42, 3),
(42, 6),
(42, 7),
(42, 10),
(42, 11),
(42, 13),
(43, 2),
(43, 3),
(43, 6),
(43, 7),
(43, 10),
(43, 11),
(43, 13),
(44, 2),
(44, 3),
(44, 6),
(44, 7),
(44, 10),
(44, 11),
(45, 2),
(45, 3),
(45, 6),
(45, 7),
(45, 10),
(45, 11),
(45, 12),
(46, 2),
(46, 3),
(46, 6),
(46, 7),
(46, 10),
(46, 11),
(47, 2),
(47, 3),
(47, 6),
(47, 7),
(47, 10),
(47, 11),
(48, 2),
(48, 3),
(48, 6),
(48, 7),
(48, 10),
(48, 11),
(49, 2),
(49, 3),
(49, 6),
(49, 7),
(49, 10),
(49, 11),
(50, 2),
(50, 3),
(50, 6),
(50, 7),
(50, 10),
(50, 11),
(51, 2),
(51, 3),
(51, 6),
(51, 7),
(51, 10),
(51, 11),
(52, 2),
(52, 3),
(52, 6),
(52, 7),
(52, 10),
(52, 11),
(53, 2),
(53, 3),
(53, 6),
(53, 7),
(53, 10),
(53, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9VfVpy1FyghvjfHMWdLC7He2qXbliInvPGpGD236', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicHNsd0lYcWd5UjUzS1dkNFBUUkRERkgyeWZUMmRtb3hXVHdJZEtUQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czo0OiJ1c2VyIjtOO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vdGFibGV0cmFjay51cGRhdGVkLmxvY2FsL2xvZ2luIjt9fQ==', 1754162098);

-- --------------------------------------------------------

--
-- Table structure for table `split_orders`
--

CREATE TABLE `split_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `payment_method` enum('cash','upi','card','due','stripe','razorpay') NOT NULL DEFAULT 'cash',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `split_order_items`
--

CREATE TABLE `split_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `split_order_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_payments`
--

CREATE TABLE `stripe_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `payment_status` enum('pending','requested','declined','completed') NOT NULL DEFAULT 'pending',
  `payment_error_response` text DEFAULT NULL,
  `stripe_payment_intent` varchar(191) DEFAULT NULL,
  `stripe_session_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_payment_gateways`
--

CREATE TABLE `superadmin_payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razorpay_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_razorpay_key` text DEFAULT NULL,
  `test_razorpay_secret` text DEFAULT NULL,
  `razorpay_test_webhook_key` text DEFAULT NULL,
  `live_razorpay_key` text DEFAULT NULL,
  `live_razorpay_secret` text DEFAULT NULL,
  `razorpay_live_webhook_key` text DEFAULT NULL,
  `razorpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_stripe_key` text DEFAULT NULL,
  `test_stripe_secret` text DEFAULT NULL,
  `stripe_test_webhook_key` text DEFAULT NULL,
  `live_stripe_key` text DEFAULT NULL,
  `live_stripe_secret` text DEFAULT NULL,
  `stripe_live_webhook_key` text DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flutterwave_status` tinyint(1) NOT NULL DEFAULT 0,
  `flutterwave_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_flutterwave_key` text DEFAULT NULL,
  `test_flutterwave_secret` text DEFAULT NULL,
  `test_flutterwave_hash` text DEFAULT NULL,
  `flutterwave_test_webhook_key` text DEFAULT NULL,
  `live_flutterwave_key` text DEFAULT NULL,
  `live_flutterwave_secret` text DEFAULT NULL,
  `live_flutterwave_hash` text DEFAULT NULL,
  `flutterwave_live_webhook_key` text DEFAULT NULL,
  `live_paypal_client_id` varchar(191) DEFAULT NULL,
  `live_paypal_secret` varchar(191) DEFAULT NULL,
  `test_paypal_client_id` varchar(191) DEFAULT NULL,
  `test_paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 0,
  `paypal_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_merchant_id` varchar(191) DEFAULT NULL,
  `payfast_merchant_key` varchar(191) DEFAULT NULL,
  `payfast_passphrase` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_id` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_status` tinyint(1) NOT NULL DEFAULT 0,
  `live_paystack_key` varchar(191) DEFAULT NULL,
  `live_paystack_secret` varchar(191) DEFAULT NULL,
  `live_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `test_paystack_key` varchar(191) DEFAULT NULL,
  `test_paystack_secret` varchar(191) DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co',
  `paystack_status` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `superadmin_payment_gateways`
--

INSERT INTO `superadmin_payment_gateways` (`id`, `razorpay_type`, `test_razorpay_key`, `test_razorpay_secret`, `razorpay_test_webhook_key`, `live_razorpay_key`, `live_razorpay_secret`, `razorpay_live_webhook_key`, `razorpay_status`, `stripe_type`, `test_stripe_key`, `test_stripe_secret`, `stripe_test_webhook_key`, `live_stripe_key`, `live_stripe_secret`, `stripe_live_webhook_key`, `stripe_status`, `created_at`, `updated_at`, `flutterwave_status`, `flutterwave_type`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `flutterwave_test_webhook_key`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_live_webhook_key`, `live_paypal_client_id`, `live_paypal_secret`, `test_paypal_client_id`, `test_paypal_secret`, `paypal_status`, `paypal_mode`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`, `payfast_mode`, `payfast_status`, `live_paystack_key`, `live_paystack_secret`, `live_paystack_merchant_email`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`, `paystack_status`, `paystack_mode`) VALUES
(1, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-08-01 09:35:17', '2025-08-01 09:35:17', 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.paystack.co', 0, 'sandbox'),
(2, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-08-01 09:38:00', '2025-08-01 09:38:00', 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.paystack.co', 0, 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_code` varchar(191) NOT NULL,
  `hash` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `available_status` enum('available','reserved','running') NOT NULL DEFAULT 'available',
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `seating_capacity` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `branch_id`, `table_code`, `hash`, `status`, `available_status`, `area_id`, `seating_capacity`, `created_at`, `updated_at`) VALUES
(1, 3, 'R01', '7556ddfb1f11b27d03a8d8bdc2623100', 'active', 'available', 1, 6, '2025-08-02 07:33:47', '2025-08-02 07:33:47'),
(2, 4, 'M1', '2c28399fa39e4b7ee582e9e9098b0303', 'active', 'available', 2, 4, '2025-08-02 14:57:57', '2025-08-02 14:57:57'),
(3, 4, 'M2', '47b680094d23462221cdb66472b2bfee', 'active', 'available', 2, 2, '2025-08-02 14:58:13', '2025-08-02 14:58:13'),
(4, 4, 'M3', 'c76d98d7dc051e67db256fcc2feba925', 'active', 'available', 2, 4, '2025-08-02 14:58:31', '2025-08-02 14:58:31'),
(5, 4, 'M4', '6cdf7e46d01ac0f66bdaaf277f302859', 'active', 'available', 2, 4, '2025-08-02 14:59:47', '2025-08-02 14:59:47'),
(6, 4, 'M5', 'a77cccce1319c9a964ba822a08afaf0a', 'active', 'available', 2, 4, '2025-08-02 15:00:15', '2025-08-02 15:00:15'),
(7, 4, 'M6', '28f66c64df829b7fdb56695cdd4baa9d', 'active', 'available', 2, 4, '2025-08-02 15:00:25', '2025-08-02 15:00:25'),
(8, 4, 'M7', 'bf175b1021f255dd3b085a1d07d15721', 'active', 'available', 2, 4, '2025-08-02 15:00:42', '2025-08-02 15:00:42'),
(9, 4, 'M8', 'bafccda8e15c08ed9e71283130e66abc', 'active', 'available', 2, 4, '2025-08-02 15:01:08', '2025-08-02 15:01:08'),
(10, 4, 'M9', '28359d5135c87721079ee2d48b28b2f5', 'active', 'available', 2, 9, '2025-08-02 15:01:27', '2025-08-02 15:01:27'),
(11, 4, 'M10', '984cbc85da83ce5078f8af555e35ef20', 'active', 'available', 2, 4, '2025-08-02 15:01:43', '2025-08-02 15:01:43'),
(12, 4, 'T1', '6d74831717685ec2acf67687962b78e1', 'active', 'available', 3, 4, '2025-08-02 15:02:45', '2025-08-02 15:02:45'),
(13, 4, 'T2', 'fa90319748bd00f096a5232041ddae30', 'active', 'available', 3, 4, '2025-08-02 15:02:58', '2025-08-02 15:02:58'),
(14, 4, 'T3', '26ad67a2eba90598bcc7888a76676b89', 'active', 'available', 3, 4, '2025-08-02 15:03:08', '2025-08-02 15:03:08'),
(15, 4, 'T4', '874160df04c1faba01bf883da6f56be8', 'active', 'available', 3, 4, '2025-08-02 15:03:17', '2025-08-02 15:03:17'),
(16, 4, 'T5', 'b03d5463bf497445dff4ecac20b6578f', 'active', 'available', 3, 4, '2025-08-02 15:03:27', '2025-08-02 15:03:27'),
(17, 4, 'T6', '19812b653feaf8f57c09625a20fd63cd', 'active', 'available', 3, 4, '2025-08-02 15:04:17', '2025-08-02 15:04:17'),
(18, 4, 'T7', '3199ab434335fc4998663b1c9909bba2', 'active', 'available', 3, 4, '2025-08-02 15:04:25', '2025-08-02 15:04:25'),
(19, 4, 'T8', 'f9c5b3051db1660a7300038645435914', 'active', 'available', 3, 4, '2025-08-02 15:04:33', '2025-08-02 15:04:33'),
(20, 4, 'T9', '52fa14c7ecbb0bdc17b7b5343c69808c', 'active', 'available', 3, 4, '2025-08-02 15:04:40', '2025-08-02 15:04:40'),
(21, 4, 'T10', 'e11b2f2375851c4b9b1cf5e17dcabca8', 'active', 'available', 3, 4, '2025-08-02 15:04:49', '2025-08-02 15:04:49'),
(22, 4, 'T11', 'c056307a8455c51eec502203cc9056da', 'active', 'available', 3, 4, '2025-08-02 15:04:56', '2025-08-02 15:04:56'),
(23, 4, 'T12', '8710de6f11123dc4b29793f6f601ca00', 'active', 'available', 3, 4, '2025-08-02 15:05:31', '2025-08-02 15:05:31'),
(24, 4, 'T13', '0e8519986245328795b9b09c70f20788', 'active', 'available', 3, 4, '2025-08-02 15:05:38', '2025-08-02 15:05:38'),
(25, 4, 'T14', 'c79613fdc2e6a74953e46d08b7f37c9b', 'active', 'available', 3, 4, '2025-08-02 15:05:47', '2025-08-02 15:05:47'),
(26, 4, 'T15', '6e971ec2dd101ce6e83fbcd88380cc72', 'active', 'available', 3, 4, '2025-08-02 15:05:55', '2025-08-02 15:05:55'),
(27, 4, 'T16', '6d3c42846acbe3f670ca7f78a71af22c', 'active', 'available', 3, 4, '2025-08-02 15:06:03', '2025-08-02 15:06:03'),
(28, 4, 'T17', 'd3f83cf4075afe206632235aa9425f33', 'active', 'available', 3, 4, '2025-08-02 15:06:37', '2025-08-02 15:06:37'),
(29, 4, 'T18', '3ed89dd5bf851b584ab79691b0d57462', 'active', 'available', 3, 4, '2025-08-02 15:06:45', '2025-08-02 15:06:45'),
(30, 4, 'T19', '7aff60c84b3d6ec017356b259f33656a', 'active', 'available', 3, 4, '2025-08-02 15:06:53', '2025-08-02 15:06:53'),
(31, 4, 'T20', '670e9745473d4a1f831a06ac250ffe66', 'active', 'available', 3, 4, '2025-08-02 15:07:20', '2025-08-02 15:07:20'),
(32, 4, 'VIP AREA', '7816ce6bf9aaf125b2f3709402c9d93e', 'active', 'available', 4, 10, '2025-08-02 15:07:58', '2025-08-02 15:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_name` varchar(191) NOT NULL,
  `tax_percent` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `restaurant_id`, `tax_name`, `tax_percent`, `created_at`, `updated_at`) VALUES
(1, 1, 'SGST', 2.50, '2025-08-01 09:38:00', '2025-08-01 09:38:00'),
(2, 1, 'CGST', 2.50, '2025-08-01 09:38:00', '2025-08-01 09:38:00'),
(3, 2, 'CGST', 2.50, '2025-08-02 07:38:27', '2025-08-02 07:38:27'),
(4, 2, 'SGST', 2.50, '2025-08-02 07:38:44', '2025-08-02 07:38:44'),
(5, 3, 'CGST', 2.50, '2025-08-02 12:37:26', '2025-08-02 12:37:26'),
(6, 3, 'SGST', 2.50, '2025-08-02 12:37:37', '2025-08-02 12:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `phone_code` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `restaurant_id`, `branch_id`, `name`, `email`, `phone_number`, `phone_code`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `locale`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, NULL, NULL, 'Ashutosh Srivastava', 'superadmin@gmail.com', NULL, NULL, NULL, '$2y$12$L8QsQaHiZQfRA7x5/7NfXuV0sOY48cksCgvC.6RXqCQaNWgE02b0K', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-01 09:37:52', '2025-08-01 09:37:52', 'en', NULL, NULL, NULL, NULL),
(2, 1, NULL, 'Subrata Saha', 'admin@gmail.com', NULL, NULL, NULL, '$2y$12$L8QsQaHiZQfRA7x5/7NfXuV0sOY48cksCgvC.6RXqCQaNWgE02b0K', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-01 09:38:01', '2025-08-01 09:38:01', 'en', NULL, NULL, NULL, NULL),
(3, 1, 1, 'Sumanta', 'waiter@gmail.com', NULL, NULL, NULL, '$2y$12$L8QsQaHiZQfRA7x5/7NfXuV0sOY48cksCgvC.6RXqCQaNWgE02b0K', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-01 09:38:01', '2025-08-01 09:38:01', 'en', NULL, NULL, NULL, NULL),
(4, 2, 3, 'Sushovan Mitra', 'sushovan.mitra@gmail.com', '7685944429', '91', NULL, '$2y$12$4qyDCuQAsFsd56g.8ykbs.V1YK6h4ROzeyiHgG8NLFxAEmw3ip/8K', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 07:33:07', '2025-08-02 07:33:07', 'en', NULL, NULL, NULL, NULL),
(5, 3, 4, 'Staff One', 'zest@gmail.com', '8130660060', '91', NULL, '$2y$12$fIkmRK4BVZaWR0rY6M9g8uhhLcfhH1Xzz5J8WcbiC2m.HJxKr33ze', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 12:31:25', '2025-08-02 12:31:25', 'en', NULL, NULL, NULL, NULL),
(6, 3, 4, 'Surya Prakash ( Manager)', 'gsuryaiecihm@gmail.com', '6985478569', '91', NULL, '$2y$12$bim6maMEXbKpKCD401FNIuQdfV7z72mTUBgT.NfAJihvcFm.00Uq6', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:06:49', '2025-08-02 13:06:49', 'en', NULL, NULL, NULL, NULL),
(7, 3, 4, 'JAY CHOUDHARY', 'JAYPHOJDAR277@GMAIL.COM', '6985478569', '91', NULL, '$2y$12$KvwN5bOg/Z6rKnMEv4RiOOR73cBFyFp6iAh/.nyzZfRhfBbbp/5zq', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:09:44', '2025-08-02 13:09:44', 'en', NULL, NULL, NULL, NULL),
(8, 3, 4, 'VIVEK KATHAYAT', 'VISHJEETKATHAYAT@GMAIL.COM', '6985478569', '91', NULL, '$2y$12$IQ51eHQBaMr/jvRU6O.ZS.QeG5WCTu2d2TUv4zaf5AQzQpCkW3wre', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:11:03', '2025-08-02 13:11:03', 'en', NULL, NULL, NULL, NULL),
(9, 3, 4, 'AJAY KUMAR', 'AJAYIECIHM@GMAIL.COM', '6985478569', '91', NULL, '$2y$12$cq8U2koxDw/Lc6D1o3sA2OB6aGFWrlvxw8LsnPySqjajr3iOiGvG2', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:11:36', '2025-08-02 13:11:36', 'en', NULL, NULL, NULL, NULL),
(10, 3, 4, 'NARENDER KUMAR', 'NARENDERKUMAR3003NK@GMAIL.COM', '6985478569', '91', NULL, '$2y$12$kc8XYiXMBvx1iSHGODlkOee9iRoyHpPIQS2ECr33CrlcKdjao8Gim', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:12:11', '2025-08-02 13:12:11', 'en', NULL, NULL, NULL, NULL),
(11, 3, 4, 'POOJA THAKUR', 'PT1597171@GMAIL.COM', '6985478569', '91', NULL, '$2y$12$.fXe.13JviQTDB34truwkeXqAt.BNuio0jnsNuFPth/beqde4brqG', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:12:47', '2025-08-02 13:12:47', 'en', NULL, NULL, NULL, NULL),
(12, 3, 4, 'DSIIDC', 'psk.delhi92@gmail.com', '6985478569', '91', NULL, '$2y$12$hrT2OfShvydhem/sFvv2ae2V82YU8UjtyQ3VwbAFnUTMYdVVgv5My', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:13:21', '2025-08-02 13:13:21', 'en', NULL, NULL, NULL, NULL),
(13, 3, 4, 'Manita Mam (HR)', 'Manitanoida@gmail.com', '6985478569', '91', NULL, '$2y$12$FWavQgqk54afzAEQh6t29uBYgtlvSYl6aY6yNvfCSfJy3UZlAoExa', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-02 13:13:57', '2025-08-02 13:13:57', 'en', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `waiter_requests`
--

CREATE TABLE `waiter_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_unique_hash_unique` (`unique_hash`),
  ADD KEY `branches_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_delivery_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_countries_code_index` (`countries_code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD KEY `customers_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `custom_menus`
--
ALTER TABLE `custom_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_menus_menu_slug_unique` (`menu_slug`);

--
-- Indexes for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_executives_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_fee_tiers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `desktop_applications`
--
ALTER TABLE `desktop_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flutterwave_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `front_details`
--
ALTER TABLE `front_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_faq_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_features`
--
ALTER TABLE `front_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_features_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_review_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `global_currencies`
--
ALTER TABLE `global_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_invoices_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `global_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `global_invoices_package_id_foreign` (`package_id`),
  ADD KEY `global_invoices_global_subscription_id_foreign` (`global_subscription_id`),
  ADD KEY `global_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_default_currency_id_foreign` (`default_currency_id`);

--
-- Indexes for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_subscriptions_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `global_subscriptions_package_id_foreign` (`package_id`),
  ADD KEY `global_subscriptions_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_modifiers_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `item_modifiers_modifier_group_id_foreign` (`modifier_group_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kots`
--
ALTER TABLE `kots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kots_order_id_foreign` (`order_id`),
  ADD KEY `kots_branch_id_foreign` (`branch_id`),
  ADD KEY `kots_cancel_reason_id_foreign` (`cancel_reason_id`);

--
-- Indexes for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_cancel_reasons_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `kot_items`
--
ALTER TABLE `kot_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_items_kot_id_foreign` (`kot_id`),
  ADD KEY `kot_items_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `kot_items_menu_item_variation_id_foreign` (`menu_item_variation_id`);

--
-- Indexes for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_item_modifier_options_kot_item_id_foreign` (`kot_item_id`),
  ADD KEY `kot_item_modifier_options_modifier_option_id_foreign` (`modifier_option_id`);

--
-- Indexes for table `kot_places`
--
ALTER TABLE `kot_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_places_branch_id_foreign` (`branch_id`),
  ADD KEY `kot_places_printer_id_foreign` (`printer_id`);

--
-- Indexes for table `kot_settings`
--
ALTER TABLE `kot_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `language_settings`
--
ALTER TABLE `language_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `idx_branch_available` (`branch_id`,`is_available`);

--
-- Indexes for table `menu_item_tax`
--
ALTER TABLE `menu_item_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_tax_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `menu_item_tax_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`),
  ADD KEY `menu_item_translations_locale_index` (`locale`);

--
-- Indexes for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_variations_menu_item_id_foreign` (`menu_item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modifier_groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modifier_group_translations_modifier_group_id_locale_unique` (`modifier_group_id`,`locale`),
  ADD KEY `modifier_group_translations_locale_index` (`locale`);

--
-- Indexes for table `modifier_options`
--
ALTER TABLE `modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modifier_options_modifier_group_id_foreign` (`modifier_group_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_settings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_payment_methods_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_plan_changes_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `offline_plan_changes_package_id_foreign` (`package_id`),
  ADD KEY `offline_plan_changes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_plan_changes_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onboarding_steps_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_uuid_unique` (`uuid`),
  ADD KEY `orders_table_id_foreign` (`table_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_delivery_executive_id_foreign` (`delivery_executive_id`),
  ADD KEY `orders_waiter_id_foreign` (`waiter_id`),
  ADD KEY `orders_cancel_reason_id_foreign` (`cancel_reason_id`),
  ADD KEY `idx_branch_date` (`branch_id`,`date_time`);

--
-- Indexes for table `order_charges`
--
ALTER TABLE `order_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_charges_order_id_foreign` (`order_id`),
  ADD KEY `order_charges_charge_id_foreign` (`charge_id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_histories_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `order_items_menu_item_variation_id_foreign` (`menu_item_variation_id`),
  ADD KEY `order_items_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_modifier_options_order_item_id_foreign` (`order_item_id`),
  ADD KEY `order_item_modifier_options_modifier_option_id_foreign` (`modifier_option_id`);

--
-- Indexes for table `order_places`
--
ALTER TABLE `order_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_places_branch_id_foreign` (`branch_id`),
  ADD KEY `order_places_printer_id_foreign` (`printer_id`);

--
-- Indexes for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_taxes_order_id_foreign` (`order_id`),
  ADD KEY `order_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_modules`
--
ALTER TABLE `package_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_modules_package_id_foreign` (`package_id`),
  ADD KEY `package_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `predefined_amounts`
--
ALTER TABLE `predefined_amounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `predefined_amounts_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `printers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `print_jobs_printer_id_foreign` (`printer_id`),
  ADD KEY `print_jobs_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `print_jobs_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razorpay_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_settings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_table_id_foreign` (`table_id`),
  ADD KEY `reservations_customer_id_foreign` (`customer_id`),
  ADD KEY `reservations_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_settings_country_id_foreign` (`country_id`),
  ADD KEY `restaurant_settings_currency_id_foreign` (`currency_id`),
  ADD KEY `restaurants_package_id_foreign` (`package_id`);

--
-- Indexes for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_charges_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_charges_charge_name_index` (`charge_name`);

--
-- Indexes for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_payments_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_payments_package_id_foreign` (`package_id`);

--
-- Indexes for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_taxes_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `roles_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `split_orders`
--
ALTER TABLE `split_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `split_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `split_order_items`
--
ALTER TABLE `split_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `split_order_items_split_order_id_foreign` (`split_order_id`),
  ADD KEY `split_order_items_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `superadmin_payment_gateways`
--
ALTER TABLE `superadmin_payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_area_id_foreign` (`area_id`),
  ADD KEY `tables_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `idx_branch_email` (`branch_id`,`email`);

--
-- Indexes for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `waiter_requests_branch_id_foreign` (`branch_id`),
  ADD KEY `waiter_requests_table_id_foreign` (`table_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_menus`
--
ALTER TABLE `custom_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `desktop_applications`
--
ALTER TABLE `desktop_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storage`
--
ALTER TABLE `file_storage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_details`
--
ALTER TABLE `front_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_features`
--
ALTER TABLE `front_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `global_currencies`
--
ALTER TABLE `global_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `global_invoices`
--
ALTER TABLE `global_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kots`
--
ALTER TABLE `kots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kot_items`
--
ALTER TABLE `kot_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kot_places`
--
ALTER TABLE `kot_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kot_settings`
--
ALTER TABLE `kot_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `language_settings`
--
ALTER TABLE `language_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `menu_item_tax`
--
ALTER TABLE `menu_item_tax`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modifier_options`
--
ALTER TABLE `modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_charges`
--
ALTER TABLE `order_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_places`
--
ALTER TABLE `order_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_taxes`
--
ALTER TABLE `order_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `package_modules`
--
ALTER TABLE `package_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predefined_amounts`
--
ALTER TABLE `predefined_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `split_orders`
--
ALTER TABLE `split_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `split_order_items`
--
ALTER TABLE `split_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_payment_gateways`
--
ALTER TABLE `superadmin_payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  ADD CONSTRAINT `branch_delivery_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  ADD CONSTRAINT `delivery_executives_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  ADD CONSTRAINT `delivery_fee_tiers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD CONSTRAINT `file_storage_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  ADD CONSTRAINT `flutterwave_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_details`
--
ALTER TABLE `front_details`
  ADD CONSTRAINT `front_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  ADD CONSTRAINT `front_faq_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_features`
--
ALTER TABLE `front_features`
  ADD CONSTRAINT `front_features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  ADD CONSTRAINT `front_review_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD CONSTRAINT `global_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_global_subscription_id_foreign` FOREIGN KEY (`global_subscription_id`) REFERENCES `global_subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD CONSTRAINT `global_settings_default_currency_id_foreign` FOREIGN KEY (`default_currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD CONSTRAINT `global_subscriptions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD CONSTRAINT `item_modifiers_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_modifiers_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kots`
--
ALTER TABLE `kots`
  ADD CONSTRAINT `kots_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kots_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `kot_cancel_reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kots_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  ADD CONSTRAINT `kot_cancel_reasons_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kot_items`
--
ALTER TABLE `kot_items`
  ADD CONSTRAINT `kot_items_kot_id_foreign` FOREIGN KEY (`kot_id`) REFERENCES `kots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kot_items_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kot_items_menu_item_variation_id_foreign` FOREIGN KEY (`menu_item_variation_id`) REFERENCES `menu_item_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  ADD CONSTRAINT `kot_item_modifier_options_kot_item_id_foreign` FOREIGN KEY (`kot_item_id`) REFERENCES `kot_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kot_item_modifier_options_modifier_option_id_foreign` FOREIGN KEY (`modifier_option_id`) REFERENCES `modifier_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kot_places`
--
ALTER TABLE `kot_places`
  ADD CONSTRAINT `kot_places_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kot_places_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kot_settings`
--
ALTER TABLE `kot_settings`
  ADD CONSTRAINT `kot_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_item_tax`
--
ALTER TABLE `menu_item_tax`
  ADD CONSTRAINT `menu_item_tax_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_tax_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  ADD CONSTRAINT `menu_item_variations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD CONSTRAINT `modifier_groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  ADD CONSTRAINT `modifier_group_translations_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modifier_options`
--
ALTER TABLE `modifier_options`
  ADD CONSTRAINT `modifier_options_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD CONSTRAINT `notification_settings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD CONSTRAINT `offline_payment_methods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD CONSTRAINT `offline_plan_changes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `global_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  ADD CONSTRAINT `onboarding_steps_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `kot_cancel_reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_delivery_executive_id_foreign` FOREIGN KEY (`delivery_executive_id`) REFERENCES `delivery_executives` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_waiter_id_foreign` FOREIGN KEY (`waiter_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_charges`
--
ALTER TABLE `order_charges`
  ADD CONSTRAINT `order_charges_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `restaurant_charges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_charges_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD CONSTRAINT `order_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_menu_item_variation_id_foreign` FOREIGN KEY (`menu_item_variation_id`) REFERENCES `menu_item_variations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  ADD CONSTRAINT `order_item_modifier_options_modifier_option_id_foreign` FOREIGN KEY (`modifier_option_id`) REFERENCES `modifier_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_modifier_options_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_places`
--
ALTER TABLE `order_places`
  ADD CONSTRAINT `order_places_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_places_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_modules`
--
ALTER TABLE `package_modules`
  ADD CONSTRAINT `package_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_modules_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  ADD CONSTRAINT `payfast_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD CONSTRAINT `payment_gateway_credentials_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD CONSTRAINT `paypal_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD CONSTRAINT `paystack_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `predefined_amounts`
--
ALTER TABLE `predefined_amounts`
  ADD CONSTRAINT `predefined_amounts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `printers_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD CONSTRAINT `print_jobs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `print_jobs_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `print_jobs_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  ADD CONSTRAINT `razorpay_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  ADD CONSTRAINT `receipt_settings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  ADD CONSTRAINT `reservation_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurant_settings_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurants_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  ADD CONSTRAINT `restaurant_charges_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  ADD CONSTRAINT `restaurant_payments_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_payments_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  ADD CONSTRAINT `restaurant_taxes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `split_orders`
--
ALTER TABLE `split_orders`
  ADD CONSTRAINT `split_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `split_order_items`
--
ALTER TABLE `split_order_items`
  ADD CONSTRAINT `split_order_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `split_order_items_split_order_id_foreign` FOREIGN KEY (`split_order_id`) REFERENCES `split_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  ADD CONSTRAINT `stripe_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tables_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  ADD CONSTRAINT `waiter_requests_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `waiter_requests_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
