-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 05, 2022 at 01:18 AM
-- Server version: 10.3.35-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trxmyid_burgerlah_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `name`, `price`, `created_at`, `updated_at`, `restaurant_id`, `status`) VALUES
(1, 'Cheese', '7000.00', '2022-08-20 10:42:07', '2022-08-20 10:42:07', 1, 1),
(2, 'Egg', '5000.00', '2022-08-20 10:42:24', '2022-08-20 10:42:24', 1, 1),
(3, 'Beef Patty', '28000.00', '2022-08-20 10:42:45', '2022-08-20 10:42:45', 1, 1),
(4, 'Fried Malachicken', '23000.00', '2022-08-20 10:43:07', '2022-08-20 10:43:07', 1, 1),
(5, 'Fried Chicken', '19000.00', '2022-08-20 10:43:30', '2022-08-20 10:43:30', 1, 1),
(6, 'Toping Smoked Beef', '13000.00', '2022-08-20 10:43:51', '2022-08-20 10:43:51', 1, 1),
(7, 'Toping Beef Slice', '25000.00', '2022-08-20 10:44:14', '2022-08-20 10:44:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Burger', 'Lah', '+6217777777', 'admin.burgerlah@mail.net', '2022-08-14-62f95cb2a2801.png', '$2y$10$Rls6YF5sSKIEmZvFSrEhN.Sy1m9xV79clEXq1elAkHw8gzhKzNkt6', 'dBSraBWHIXQtmNlybFzzFpMmN8cS9ZmhtxIEKeoIIfb9FRzLpmcGyiW8S70b', '2022-08-14 06:34:13', '2022-08-14 06:36:02', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, '0.00', '131063.00', '0.00', '2022-08-19 10:06:08', '2022-09-04 15:04:28', '66609.00');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-05-11 03:56:38', '2021-09-09 22:27:34'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2021-09-09 22:28:18'),
(4, 'mail_config', NULL, NULL, '2021-05-11 04:14:06'),
(5, 'fcm_project_id', '1039212675592', NULL, NULL),
(6, 'push_notification_key', 'AAAA8fXnAgg:APA91bHVhpyp-tdG1cYrgJHO4jRla9p2-bo7xIqhvED599SJmyNb9ggqNHZeOHesz_OI5ZjWZDkwZOQS-XXVA35jCWbwi-OjBMR6UYBjZ3w2-HAdgOhyGfjcml6OPBGYTQCZwjemCFyD', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is pending\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order has in confirmation\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order in processing\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your order ready to delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order has delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(15, 'terms_and_conditions', '<p>test</p>', NULL, '2022-08-28 09:21:02'),
(16, 'business_name', 'Burgerlah', NULL, NULL),
(17, 'currency', 'IDR', NULL, NULL),
(18, 'logo', '2022-08-20-6300b639ba8b5.png', NULL, NULL),
(19, 'phone', '0123456789', NULL, NULL),
(20, 'email_address', 'admin@admin.com', NULL, NULL),
(21, 'address', 'Banda Aceh', NULL, NULL),
(22, 'footer_text', 'Footer Text', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', 'AIzaSyBSOPUOTBi_Y_VcX9fo2rc0Bjsm4Hlu5mM', NULL, NULL),
(25, 'privacy_policy', '<p>test</p>', NULL, '2022-08-28 09:21:18'),
(26, 'about_us', '<p>test</p>', NULL, '2022-08-28 09:21:27'),
(27, 'minimum_shipping_charge', '1000', NULL, NULL),
(28, 'per_km_shipping_charge', '1000', NULL, NULL),
(29, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 08:52:20', '2021-09-09 22:28:30'),
(30, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 08:53:04', '2021-09-09 22:28:25'),
(31, 'digital_payment', '{\"status\":\"1\"}', '2021-07-04 08:53:10', '2022-08-30 16:57:17'),
(32, 'paypal', '{\"status\":\"1\",\"paypal_client_id\":\"AfupPBLMpNULojQXBEQybt5JqKi9kMEShWcaspEofN8NLpQsI6lHrAjGhM7DTqtwzKrfKSghiuH4Z_L-\",\"paypal_secret\":\"EHNMhzYq7OzZUDQmqSSjbLcbyMdVEyvk5YFXg-tblW9jd7v1HFJAKes_iMyqG0v4ya-bwrPMfmagUoie\"}', '2021-07-04 08:53:18', '2022-09-04 09:12:49'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 09:14:07', '2021-10-16 03:12:17'),
(34, 'senang_pay', '{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 09:14:13', '2021-09-09 22:28:04'),
(35, 'order_handover_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Your order cancelled\"}', NULL, NULL),
(37, 'timezone', 'Asia/Bangkok', NULL, NULL),
(38, 'order_delivery_verification', '1', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '0', NULL, NULL),
(44, 'country', 'ID', NULL, NULL),
(45, 'app_url', 'up_comming', NULL, NULL),
(46, 'default_location', '{\"lat\":\"0.1690690557606427\",\"lng\":\"0.10311313891015583\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:30', '2021-10-16 03:10:30'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:22', '2021-10-16 03:10:22'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:36', '2021-10-16 03:10:36'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2021-10-16 03:09:59', '2021-10-16 03:09:59'),
(51, 'admin_order_notification', '1', NULL, NULL),
(52, 'free_delivery_over', NULL, NULL, NULL),
(53, 'maintenance_mode', '0', '2021-09-09 21:33:55', '2021-09-09 21:33:58'),
(54, 'app_minimum_version_android', NULL, NULL, NULL),
(55, 'app_minimum_version_ios', NULL, NULL, NULL),
(56, 'app_url_android', NULL, NULL, NULL),
(57, 'app_url_ios', NULL, NULL, NULL),
(58, 'dm_maximum_orders', '1', NULL, NULL),
(59, 'flutterwave', '{\"status\":\"0\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', '2021-09-23 06:51:28', '2022-08-29 00:14:48'),
(60, 'order_confirmation_model', 'deliveryman', NULL, NULL),
(61, 'mercadopago', '{\"status\":null,\"public_key\":null,\"access_token\":null}', NULL, '2021-10-16 03:12:09'),
(62, 'popular_food', '1', NULL, NULL),
(63, 'popular_restaurant', '1', NULL, NULL),
(64, 'new_restaurant', '1', NULL, NULL),
(65, 'landing_page_text', '{\"header_title_1\":\"Burgerlah\",\"header_title_2\":\"Meet Your JUNK\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"Burgerlah is the best burger, you\'ll never get this best burger in any other place in the world. TRY IT!!!\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer\",\"mobile_app_section_heading\":null,\"mobile_app_section_text\":null,\"feature_section_description\":null,\"feature_section_title\":null,\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(66, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":null,\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(67, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(68, 'testimonial', '[]', '2021-10-31 15:21:57', '2022-08-20 10:51:47'),
(69, 'most_reviewed_foods', '1', NULL, NULL),
(70, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', NULL, '2021-11-12 21:02:39'),
(71, 'timeformat', '12', NULL, NULL),
(72, 'canceled_by_restaurant', '0', NULL, NULL),
(73, 'canceled_by_deliveryman', '0', NULL, NULL),
(74, 'show_dm_earning', '1', NULL, NULL),
(75, 'toggle_veg_non_veg', '0', NULL, NULL),
(76, 'toggle_dm_registration', '0', NULL, NULL),
(77, 'toggle_restaurant_registration', '0', NULL, NULL),
(78, 'recaptcha', '{\"status\":\"0\",\"site_key\":\"6LfRxZEhAAAAAJh0MomhU_APATsbReGLeOmkp6Dc\",\"secret_key\":\"6LfRxZEhAAAAAOWoqll2Zwa7BGVi5YEto5CWl4oy\"}', '2022-08-20 18:17:34', '2022-08-20 18:17:34'),
(79, 'language', '[\"en\"]', NULL, NULL),
(80, 'schedule_order_slot_duration', '10', NULL, NULL),
(81, 'digit_after_decimal_point', '0', NULL, NULL),
(82, 'icon', '2022-08-20-6300b2cf1f330.png', NULL, NULL),
(83, 'delivery_charge_comission', '0', '2022-07-03 17:07:00', '2022-07-03 17:07:00'),
(84, 'dm_max_cash_in_hand', '1000000', '2022-07-03 17:07:00', '2022-07-03 17:07:00'),
(85, 'theme', '2', '2022-07-03 17:37:00', '2022-07-03 17:37:00'),
(86, 'dm_tips_status', '1', NULL, NULL),
(87, 'map_api_key_server', 'AIzaSyBSOPUOTBi_Y_VcX9fo2rc0Bjsm4Hlu5mM', NULL, NULL),
(88, 'order_refunded_message', '{\"status\":1,\"message\":\"Your order refunded\"}', NULL, NULL),
(89, 'wallet_status', '0', NULL, NULL),
(90, 'loyalty_point_status', '0', NULL, NULL),
(91, 'ref_earning_status', '0', NULL, NULL),
(92, 'wallet_add_refund', '1', NULL, NULL),
(93, 'loyalty_point_exchange_rate', '1', NULL, NULL),
(94, 'ref_earning_exchange_rate', '5000', NULL, NULL),
(95, 'loyalty_point_item_purchase_point', '0.21', NULL, NULL),
(96, 'loyalty_point_minimum_point', '1', NULL, NULL),
(97, 'feature', '[]', NULL, '2022-08-20 10:57:37'),
(98, 'backgroundChange', '{\"header-bg\":\"#ef7822\",\"footer-bg\":\"#333e4f\",\"landing-page-bg\":\"#241f31\"}', NULL, NULL),
(99, 'midtrans', '{\"status\":\"1\",\"midtrans_server_key\":\"SB-Mid-server-Cdm_DmRCzJ94n43T77l3ChZK\",\"midtrans_client_key\":\"SB-Mid-client-zUHvRex1_4KD9wxv\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_restaurant`
--

CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(1, 'Burger', '2022-08-15-62f965e48c2bd.png', 0, 0, 1, '2022-08-14 21:15:16', '2022-08-19 20:36:09', 2),
(2, 'French Fries', '2022-08-20-63001de560f57.png', 0, 0, 1, '2022-08-19 23:33:58', '2022-08-19 23:34:12', 1),
(3, 'Minuman', '2022-08-29-630be1188e69e.png', 0, 0, 1, '2022-08-28 21:41:44', '2022-08-28 21:41:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', '1.00', NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', '1.00', NULL, NULL),
(3, 'Euro', 'EUR', '€', '1.00', NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', '1.00', NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', '1.00', NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', '1.00', NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', '1.00', NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', '1.00', NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', '1.00', NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', '1.00', NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', '1.00', NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', '1.00', NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', '1.00', NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', '1.00', NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', '1.00', NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', '1.00', NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', '1.00', NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', '1.00', NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', '1.00', NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', '1.00', NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', '1.00', NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', '1.00', NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', '1.00', NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', '1.00', NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', '1.00', NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', '1.00', NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', '1.00', NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', '1.00', NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', '1.00', NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', '1.00', NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', '1.00', NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', '1.00', NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', '1.00', NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', '1.00', NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', '1.00', NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', '1.00', NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', '1.00', NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', '1.00', NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', '1.00', NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', '1.00', NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', '1.00', NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', '1.00', NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', '1.00', NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', '1.00', NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', '1.00', NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', '1.00', NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', '1.00', NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', '1.00', NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', '1.00', NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', '1.00', NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', '1.00', NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', '1.00', NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', '1.00', NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', '1.00', NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', '1.00', NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', '1.00', NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', '1.00', NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', '1.00', NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', '1.00', NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', '1.00', NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', '1.00', NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', '1.00', NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', '1.00', NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', '1.00', NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', '1.00', NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', '1.00', NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', '1.00', NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', '1.00', NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', '1.00', NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', '1.00', NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', '1.00', NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', '1.00', NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', '1.00', NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', '1.00', NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', '1.00', NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', '1.00', NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', '1.00', NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', '1.00', NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', '1.00', NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', '1.00', NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', '1.00', NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', '1.00', NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', '1.00', NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', '1.00', NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', '1.00', NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', '1.00', NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', '1.00', NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', '1.00', NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', '1.00', NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', '1.00', NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', '1.00', NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', '1.00', NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', '1.00', NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', '1.00', NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', '1.00', NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', '1.00', NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', '1.00', NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', '1.00', NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', '1.00', NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', '1.00', NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', '1.00', NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', '1.00', NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', '1.00', NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', '1.00', NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', '1.00', NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', '1.00', NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', '1.00', NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', '1.00', NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', '1.00', NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', '1.00', NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', '1.00', NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', '1.00', NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', '1.00', NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', '1.00', NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', '1.00', NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', '1.00', NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', '1.00', NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', '1.00', NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', '1.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`, `floor`, `road`, `house`) VALUES
(1, 'home', '+6281210819099', 'Jl.tgk abd rahman', '5.531403173682852', '95.2926055714488', 2, 'Teuku Rizky', '2022-08-26 20:36:19', '2022-08-26 20:36:19', 1, '1', '1', '1'),
(2, 'home', '+62895612054965', 'Unknown Location Found', '5.53672623640566', '95.33032178878784', 3, 'Yufi Aulia', '2022-08-28 18:40:57', '2022-08-28 18:40:57', 1, '1', 'no. 9', '1');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `restaurant_id`, `application_status`, `order_count`, `assigned_order_count`) VALUES
(1, 'Teuku', 'Rizky', '+6281210819088', 'teuku@mail.net', '123456782121', 'driving_license', '[\"2022-08-20-6300aa213e55d.png\"]', '2022-08-20-6300aa21054b3.png', '$2y$10$oIWnh9fJARctLnwF2tC6s.tch3dpsVYmW2.p5v0xEqALFwdCn8Bd.', 'tWLvRwW3y2q17FPj9QNiLM5G1HrNuc0jJbuob8DMqp1NmyPJAvTF2pi9fvGkCvaVrAluDZ5JCnEyBDDtbms5sQuLVym4CF08qFceMJHGA5meJrkmJh3s505z', 'cERKEGnNQYqBrQtXvgEcOb:APA91bF_Ml6dZQkl4FxLHolUIUHXJ86VqsRHCtTwEb_RRcZLg05MaW__1Zh1jgPKE8mML1V-QXEjOekugNlRtE5J9abZl34j4cweZ0VY8sWRrSkRlrbf-Q01GSsjR25jVlk_htcC3GaM', 1, '2022-08-20 09:32:17', '2022-09-04 15:05:39', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `avg_rating` double(16,14) NOT NULL DEFAULT 0.00000000000000,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`) VALUES
(1, 'Spicy Beef Burgerlah', 'Buns, Cheese, Patty, Fried onion, Mala chilli oil, Burgelah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-20-630009b97acf6.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '35000.00', '0.00', 'percent', '10.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-17 16:43:41', '2022-09-04 15:04:28', 3, 4.00000000000000, 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":1,\"5\":0}'),
(2, 'Reguler Burgerlah', 'Buns, Cheese, Patty, Fried onion, Egg, Burgerlah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-19-62ff678ee99c3.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '38000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 10:35:59', '2022-08-24 16:46:07', 0, 0.00000000000000, 0, NULL),
(3, 'Specialty Burgerlah', 'Buns, 2 Cheese slice, 2 Patties, Fired onion, Egg, Burgerlah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-19-62ff67fce68fa.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '52000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 10:37:48', '2022-08-24 16:44:42', 0, 0.00000000000000, 0, NULL),
(4, 'Mala Chicken Burgerlah', 'Buns, Cheese, Fried Chicken, Russian dressing sauce, Mala chilli oil, mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-19-62ff694008797.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '28000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 10:43:12', '2022-08-24 16:43:08', 0, 0.00000000000000, 0, NULL),
(5, 'Basic Burgerlah', 'Buns, Cheese, Patty, Fried onion, Burgerlah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-19-62ff69e62cc0f.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '32000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 10:45:58', '2022-08-24 16:40:34', 0, 0.00000000000000, 0, NULL),
(6, 'Chicken Burgelah', 'Buns, Cheese, Fried chicken, Russian dressing sauce, Mix (Chilli + Tomato + Mayonnaise)', '2022-08-19-62ff6aef48777.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '27000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 10:50:23', '2022-08-24 16:39:21', 0, 0.00000000000000, 0, NULL),
(8, 'Smoke Beef Burgerlah', 'Buns, Cheese, Patty, Smoked beef, Fried onion, burgerlah specialty sauce, Mix sauce (Chilli + Tomato + Mayonnaise)', '2022-08-20-62ffeeba11123.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '40000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:12:43', '2022-08-24 16:37:18', 0, 0.00000000000000, 0, NULL),
(9, 'Meat Lover Burgerlah', 'Buns, cheese, Patty, Beef slice, Fried onion, Burgerlah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)', '2022-08-20-62ffef2147e46.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '44000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:14:27', '2022-08-24 16:21:11', 0, 0.00000000000000, 0, NULL),
(10, 'OG Bugerlah', 'Buns,Patty, Bugerlah specialty sauce', '2022-08-20-62ffef9e44091.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '30000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:16:12', '2022-08-24 16:13:42', 0, 0.00000000000000, 0, NULL),
(11, 'Dodgerdog', 'Buns, Cheese, Bratwust, Fried onion, Burgerlah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonaise)', '2022-08-20-62ffefe3434f7.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '28000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:17:39', '2022-08-24 16:02:41', 0, 0.00000000000000, 0, NULL),
(12, 'Lunatic Beef', 'Buns, cheese, Beef slice, Fried Onion, Burgerlah specialty sauce, Mix sauce (Chilli + Tomato + Matonaise)', '2022-08-20-62fff01b2f2cb.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '32000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:18:35', '2022-08-24 16:03:34', 0, 0.00000000000000, 0, NULL),
(13, 'Lunatic Chicken', 'Buns, Cheese, Fired chicken, Russian dressing sauce, mix sauce (Chili + Tomato + Mayonaise)', '2022-08-20-62fff04d188c5.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '27000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 20:19:25', '2022-08-24 15:59:06', 0, 0.00000000000000, 0, NULL),
(14, 'Beef French Fries', 'Beef, Crinkle french fries, Burgerlah specialty sauce, BBQ sauce, Dried parsley\r\nMix sauce (Chili + Tomato + Mayonaise)', '2022-08-20-63001e3bb3f0a.png', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', '30000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 23:35:24', '2022-08-24 15:50:16', 0, 0.00000000000000, 0, NULL),
(15, 'Chicken French Fries', 'Fried chicken, Crinkle french fries, Russian dressing sauce, Dried parsley\r\nMix sauce (Chili + Tomato + Mayonaise)', '2022-08-20-63001ea73ccee.png', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', '25000.00', '0.00', 'percent', '0.00', 'percent', '16:00:00', '23:30:00', 0, 1, 1, '2022-08-19 23:37:11', '2022-08-24 15:54:42', 0, 0.00000000000000, 0, NULL),
(16, 'kentang', 'tang', '2022-08-29-630be319493c3.png', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', '1010.00', '0.00', 'percent', '0.00', 'percent', '01:00:00', '12:59:00', 0, 1, 2, '2022-08-21 21:17:30', '2022-09-02 04:38:34', 9, 3.33333333333330, 3, '{\"1\":0,\"2\":0,\"3\":2,\"4\":1,\"5\":0}'),
(17, 'Aqua', NULL, '2022-08-29-630be1ae734e1.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', '3000.00', '0.00', 'percent', '0.00', 'percent', '01:00:00', '12:59:00', 0, 1, 2, '2022-08-28 21:44:14', '2022-08-28 21:44:14', 0, 0.00000000000000, 0, NULL),
(18, 'Coca Cola', NULL, '2022-08-29-630be23109f8c.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', '5000.00', '0.00', 'percent', '0.00', 'percent', '01:00:00', '12:59:00', 0, 1, 2, '2022-08-28 21:46:25', '2022-08-28 21:46:25', 0, 0.00000000000000, 0, NULL),
(19, 'Fanta', NULL, '2022-08-29-630be2761a706.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', '5000.00', '0.00', 'percent', '0.00', 'percent', '13:00:00', '12:59:00', 0, 1, 2, '2022-08-28 21:47:34', '2022-08-28 21:47:34', 0, 0.00000000000000, 0, NULL),
(20, 'Sprite', NULL, '2022-08-29-630be2b58669b.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', '5000.00', '0.00', 'percent', '0.00', 'percent', '01:00:00', '12:59:00', 0, 1, 2, '2022-08-28 21:48:37', '2022-08-28 21:48:37', 0, 0.00000000000000, 0, NULL),
(21, 'Add On Food', 'Food With Add On', '2022-09-04-631473dd5ce6a.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', '[]', '[]', '10000.00', '0.00', 'percent', '0.00', 'percent', '15:00:00', '23:30:00', 0, 1, 1, '2022-09-04 09:46:07', '2022-09-04 10:48:38', 1, 0.00000000000000, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(165, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(166, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(167, '2021_08_14_110131_create_user_notifications_table', 64),
(168, '2021_08_14_175657_add_order_count_column_to_foods_table', 65),
(169, '2021_08_14_180044_add_order_count_column_to_users_table', 65),
(170, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 66),
(171, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 66),
(172, '2021_08_19_055839_create_provide_d_m_earnings_table', 67),
(173, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 67),
(174, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 67),
(175, '2021_08_21_162616_change_comission_column_to_restaurants_table', 68),
(176, '2021_06_17_054551_create_soft_credentials_table', 69),
(177, '2021_08_22_232507_add_failed_column_to_orders_table', 69),
(178, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 69),
(179, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 70),
(180, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 70),
(181, '2021_09_23_120332_change_available_column_to_delivery_men_table', 71),
(182, '2021_10_03_214536_add_active_column_to_restaurants_table', 72),
(183, '2021_10_04_123739_add_priority_column_to_categories_table', 72),
(184, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 72),
(185, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 72),
(186, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 72),
(187, '2021_10_11_215352_add_adjustment_column_to_orders_table', 72),
(188, '2021_10_24_184553_change_column_to_account_transactions_table', 73),
(189, '2021_10_24_185143_change_column_to_add_ons_table', 73),
(190, '2021_10_24_185525_change_column_to_admin_roles_table', 73),
(191, '2021_10_24_185831_change_column_to_admin_wallets_table', 73),
(192, '2021_10_24_190550_change_column_to_coupons_table', 73),
(193, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 73),
(194, '2021_10_24_191018_change_column_to_discounts_table', 73),
(195, '2021_10_24_191209_change_column_to_employee_roles_table', 73),
(196, '2021_10_24_191343_change_column_to_food_table', 73),
(197, '2021_10_24_191514_change_column_to_item_campaigns_table', 73),
(198, '2021_10_24_191626_change_column_to_orders_table', 73),
(199, '2021_10_24_191938_change_column_to_order_details_table', 73),
(200, '2021_10_24_192341_change_column_to_order_transactions_table', 73),
(201, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 73),
(202, '2021_10_24_192820_change_column_type_to_restaurants_table', 73),
(203, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 73),
(204, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 74),
(205, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 74),
(206, '2021_12_01_131746_add_status_column_to_reviews_table', 75),
(207, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 75),
(208, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 75),
(209, '2021_12_13_132438_add_zone_id_column_to_admins_table', 75),
(210, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 75),
(211, '2021_12_20_185736_change_status_column_to_vendors_table', 75),
(212, '2021_12_22_114414_create_translations_table', 75),
(213, '2022_01_05_133920_add_sosial_data_column_to_users_table', 75),
(214, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 75),
(215, '2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table', 76),
(216, '2022_01_31_124517_add_veg_column_to_item_campaigns_table', 76),
(217, '2022_02_01_101248_change_coupon_code_column_length_to_coupons_table', 76),
(218, '2022_02_01_104336_change_column_length_to_notifications_table', 76),
(219, '2022_02_06_160701_change_column_length_to_item_campaigns_table', 76),
(220, '2022_02_06_161110_change_column_length_to_campaigns_table', 76),
(221, '2022_02_07_091359_add_zone_id_column_on_orders_table', 76),
(222, '2022_02_07_101547_change_name_column_to_categories_table', 76),
(223, '2022_02_07_152844_add_zone_id_column_to_order_transactions_table', 76),
(224, '2022_02_07_162330_add_zone_id_column_to_users_table', 76),
(225, '2022_02_07_173644_add_column_to_food_table', 76),
(226, '2022_02_07_181314_add_column_to_delivery_men_table', 76),
(227, '2022_02_07_183001_add_total_order_count_column_to_restaurants_table', 76),
(228, '2022_01_19_060356_create_restaurant_schedule_table', 77),
(229, '2022_03_31_103418_create_wallet_transactions_table', 78),
(230, '2022_03_31_103827_create_loyalty_point_transactions_table', 78),
(231, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 78),
(232, '2022_04_12_121040_create_social_media_table', 78),
(233, '2022_04_17_140353_change_column_transaction_referance_to_orders_table', 78),
(234, '2022_04_10_030533_create_newsletters_table', 79),
(235, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 80),
(236, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 80),
(237, '2022_05_14_131338_add_processing_time_column_to_orders_table', 80),
(238, '2022_05_17_153333_add_ref_code_to_users_table', 80),
(239, '2022_05_22_162129_add_new_columns_to_customer_addresses_table', 80),
(240, '2022_06_26_170341_add_delivery_fee_comission_to_ordertransactions', 80),
(241, '2022_06_29_112637_add_delivery_fee_column_to_zones_table', 80),
(242, '2022_06_29_125553_add_rename_delivery_charge_column_to_restaurants_table', 80),
(243, '2022_06_29_151416_create_time_logs_table', 80);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02c187400441f53687a30af580361503d21ab9e30fc263f729536e3e6fb8e013c5f10f170df66154', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:26:44', '2021-08-14 07:26:44', '2022-08-14 13:26:44'),
('03652f98734cb46633be656afd61eb9d6bef93da6cb3f97e5d862e758bc8a7458f4271c9fc525a03', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 04:56:56', '2021-07-04 04:56:56', '2022-07-04 10:56:56'),
('0ce77d214106aa7d2691f22e57a52d61e83c4a74e232b6cf6409728c337a731412d5f011c265abf9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:51:24', '2021-08-08 14:51:24', '2022-08-08 20:51:24'),
('1796645666d7dd6ef53186e095fb9c39d2128e5cca19f2e1ac8e7e7da82d6174fe98b14e94925188', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:29', '2021-08-04 07:35:29', '2022-08-04 13:35:29'),
('2919672ecc1e3dd9f2759d15f8cc54882d1d9f780cfda82fb83c8359de8654492ea6703956a7c50d', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-15 08:22:28', '2021-07-15 08:22:28', '2022-07-15 14:22:28'),
('2f49586a4ac33179f846e60afba15e655ceef494cd64f6812d4ab109336f5fb008cb3005137f700c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-03 13:21:13', '2021-08-03 13:21:13', '2022-08-03 19:21:13'),
('3115e428f22908fa2d94bf2804d1ed2d9929cb27da233aedf24c8bc71dc8066f91b0c63a795c26e9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:33:37', '2021-07-31 08:33:37', '2022-07-31 14:33:37'),
('36217e984b8904eb4dfd30ed62eef9d725c1e8e63a6c1485bb084ef323ad5eea852c84e17560bd54', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-14 00:51:51', '2021-07-14 00:51:51', '2022-07-14 06:51:51'),
('3792f6c16f51a84e3ab72f93eacc13952925a3b9461c2ece8870b8cd1768e3b18f4e5abad016aadb', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 20:33:14', '2022-08-26 20:33:14', '2023-08-27 03:33:14'),
('3abfb4980fdf3c858e1c371352db40dae9e1e40f095b00dcd09c84ff7c8189a305f1be985e4274b3', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:50:53', '2021-06-19 03:50:53', '2022-06-19 09:50:53'),
('3cd3269423e543961a7b64e8169875725eb47f8d0f309c69a4a770258de65e9c02057ed9000942da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:04', '2021-08-04 07:35:04', '2022-08-04 13:35:04'),
('3e923b1f4084faba1a2e5448bd8b72e09b74db6ed25fbe14f6960a5f005107496cc507c1ba15c6e1', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-22 01:32:58', '2021-06-22 01:32:58', '2022-06-22 07:32:58'),
('4140d5b9b3d16e4bbef1b676b01f13f75d9c3fb2cada6548e50b0b2679562aace3b9b44f82f15f30', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-19 17:10:26', '2021-08-19 17:10:26', '2022-08-19 23:10:26'),
('4cfad08796e4a1eecfe8bbdc20e512e0954570168990fa60442ad41b5ecf05e4005cadcae08fbddd', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:29:52', '2021-06-19 03:29:52', '2022-06-19 09:29:52'),
('53afc11b36d08435d8ec82c42305f7aa4397d10b2d296f6e7d819e091d0d7c6d48e14cdc5e66e6c9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:01', '2021-06-23 23:08:01', '2022-06-24 05:08:01'),
('5646d6337aaed0e662c059ed368372e2da241ff97a42df56310667ec321fdbf2252d92771988640a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:37:55', '2021-08-04 07:37:55', '2022-08-04 13:37:55'),
('59551e481bc1fb037bee07e1501d81dad38d4ff34fdca68a49c40d0cf423176ca111940acd359aeb', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:50:59', '2021-08-08 14:50:59', '2022-08-08 20:50:59'),
('67ecdf300471a008fe9cfc5bd84eb9339914fe7e0942b977faedaac5fc4859fd6ef5246ab1e0e04a', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-19 09:40:19', '2022-08-19 09:40:19', '2023-08-19 16:40:19'),
('68b06321c4bbbea81e7dfcbd8d5fae1a94a2fa0500041ee5774be2d9300c1ff7590d03604b77514a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-28 02:33:54', '2021-07-28 02:33:54', '2022-07-28 08:33:54'),
('723ceee668cd1a7fc2e977be48cab3f31aed1ace0883692711b5cc2ddf42c2f23c6d75461172105f', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-01 05:46:27', '2021-07-01 05:46:27', '2022-07-01 11:46:27'),
('74e2dd27429bb92c12e33f891ccff32f48c22463166666705d145cfd8968d96ec992fa2cc3a36e76', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:23', '2021-06-23 23:08:23', '2022-06-24 05:08:23'),
('77c9389b2ab3031e09005a7e7be90d00496ff073dbbefeb57229cee5d0a240376c1f7c3c8a94faff', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:38:22', '2021-06-19 03:38:22', '2022-06-19 09:38:22'),
('7915bda6cb47ff9c6192b5d5854f6145c2f18ffe1bce1e47f9e2afb038f90095765f084fe8ed8ee3', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 03:07:02', '2022-08-26 03:07:02', '2023-08-26 10:07:02'),
('8a20c4f8656e404615f9abc15a95f6754dd87e4e894677647dd17236b95d8a5d7cc243c38457b048', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 02:36:57', '2021-07-04 02:36:57', '2022-07-04 08:36:57'),
('8e00dfc4b21873f78d7211158f732500290a1570eafc39be2038ced2cd6533919189a3413e1750f8', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-28 18:35:43', '2022-08-28 18:35:43', '2023-08-29 01:35:43'),
('8ffc458ddbcbbbec17035dc2153c4baeebb5c54796b3a9008f24c8699197a8a2fc1111c36cc1d7da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:27:12', '2021-08-14 07:27:12', '2022-08-14 13:27:12'),
('a092dc4a49ec27a06d8c9c335446de3d90e03363c6059cdf6fbf2113edaab5fe752053a794ac9236', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 10:12:49', '2021-08-08 10:12:49', '2022-08-08 16:12:49'),
('b4651c7e8bbe8a68b4959504c3a7e3705208cbdb79fcc2498b9b3d0efa9c7cadc77699590cf8f2d4', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-20 03:59:46', '2021-06-20 03:59:46', '2022-06-20 09:59:46'),
('bf24e16194d82c4e2982724df0fef68f7923d6d01ce8c5e1b64e2716d2412db6e62891f0f8dae8a6', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:34:19', '2021-07-31 08:34:19', '2022-07-31 14:34:19'),
('c1b7df78e7373f5eca5f64083ac9bbc6c9bd582adf6c143f520c8a65420d3ee050044e6f65f0a033', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-24 03:40:43', '2021-06-24 03:40:43', '2022-06-24 09:40:43'),
('d8fb1725ff132a6eee1013ec0b261c1bcad717a7290e86bbc6a9e27861f2ab5080e1187b76d81f52', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 16:47:58', '2022-08-17 16:47:58', '2023-08-17 23:47:58'),
('dd6578c99fc90f666b9433871d28f9913fefc860d9a60427388cfcf727be6f5c10eb8b764b39c557', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-28 10:20:50', '2021-06-28 10:20:50', '2022-06-28 16:20:50'),
('ea3ca170bd7935fe3f2a9c80c74d1e8e6eda8cc197ce2066305a286d175ad250475a4657e498779b', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-21 01:24:25', '2021-06-21 01:24:25', '2022-06-21 07:24:25'),
('f1ca535fc5d6f5622a39a591f974595560fef05f203b9e9484e6b939ee8589835d7d6282fc06e387', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-04 12:51:58', '2022-09-04 12:51:58', '2023-09-04 19:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, NULL, 'Laravel Password Grant Client', 'qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_discount_amount` decimal(24,2) NOT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `processing_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `restaurant_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`, `zone_id`, `dm_tips`, `processing_time`) VALUES
(100001, 2, '71569.00', '0.00', '', 'unpaid', 'failed', '2900.00', 'midtrans', '1vB58e-306', NULL, NULL, NULL, '1 Item, with add ons, no discount', 'take_away', 1, 1, '2022-09-04 10:02:33', '2022-09-04 10:24:24', '10669.00', '2022-09-04 10:02:33', NULL, '2368', '2022-09-04 10:02:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Teuku Rizky\",\"contact_person_number\":\"+6281210819099\",\"address_type\":\"others\",\"address\":\"Unknown Location Found\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"95.28456933796406\",\"latitude\":\"5.540715081466755\"}', 0, '0.00', '10669.00', '2022-09-04 10:24:24', '0.00', 0, 1, 0.00, NULL),
(100002, 2, '87319.00', '0.00', '', 'paid', 'delivered', '3650.00', 'cstore', 'uNXPK3-428', NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2022-09-04 10:26:06', '2022-09-04 10:48:38', '10669.00', '2022-09-04 10:26:06', NULL, '8207', '2022-09-04 10:43:32', NULL, '2022-09-04 10:44:48', '2022-09-04 10:47:44', '2022-09-04 10:47:59', NULL, '2022-09-04 10:48:38', NULL, NULL, NULL, '{\"contact_person_name\":\"Teuku Rizky\",\"contact_person_number\":\"+6281210819099\",\"address_type\":\"others\",\"address\":\"Unknown Location Found\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"95.28456933796406\",\"latitude\":\"5.540715081466755\"}', 0, '0.00', '10669.00', '2022-09-04 10:41:16', '0.00', 0, 1, 0.00, '15'),
(100003, 2, '43744.00', '0.00', '', 'paid', 'delivered', '1575.00', 'gopay', 'nRIplU-858', NULL, NULL, NULL, '1 item, discount, no add ons', 'take_away', 1, 1, '2022-09-04 10:49:28', '2022-09-04 11:00:19', '10669.00', '2022-09-04 10:49:28', NULL, '8232', '2022-09-04 10:57:57', NULL, '2022-09-04 10:58:04', '2022-09-04 10:59:54', '2022-09-04 11:00:03', NULL, '2022-09-04 11:00:19', NULL, NULL, NULL, '{\"contact_person_name\":\"Teuku Rizky\",\"contact_person_number\":\"+6281210819099\",\"address_type\":\"others\",\"address\":\"Unknown Location Found\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"95.28456933796406\",\"latitude\":\"5.540715081466755\"}', 0, '3500.00', '10669.00', '2022-09-04 10:57:00', '0.00', 0, 1, 0.00, '15'),
(100004, 2, '43744.00', '0.00', '', 'unpaid', 'canceled', '1575.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2022-09-04 14:59:43', '2022-09-04 15:01:34', '10669.00', '2022-09-04 14:59:43', NULL, '3120', '2022-09-04 14:59:43', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-04 15:00:19', NULL, NULL, '{\"contact_person_name\":\"Teuku Rizky\",\"contact_person_number\":\"+6281210819099\",\"address_type\":\"others\",\"address\":\"Unknown Location Found\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"95.28456933796406\",\"latitude\":\"5.540715081466755\"}', 0, '3500.00', '10669.00', NULL, '0.00', 0, 1, 0.00, NULL),
(100005, 2, '43744.00', '0.00', '', 'paid', 'delivered', '1575.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2022-09-04 15:01:22', '2022-09-04 15:04:28', '10669.00', '2022-09-04 15:01:22', NULL, '7666', '2022-09-04 15:01:22', NULL, '2022-09-04 15:03:27', '2022-09-04 15:03:53', '2022-09-04 15:04:04', NULL, '2022-09-04 15:04:28', NULL, NULL, NULL, '{\"contact_person_name\":\"Teuku Rizky\",\"contact_person_number\":\"+6281210819099\",\"address_type\":\"others\",\"address\":\"Unknown Location Found\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"95.28456933796406\",\"latitude\":\"5.540715081466755\"}', 0, '3500.00', '10669.00', NULL, '0.00', 0, 1, 0.00, '5');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `food_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(76, 21, 100001, '10000.00', '{\"id\":21,\"name\":\"Add On Food\",\"description\":\"Food With Add On\",\"image\":\"2022-09-04-631473dd5ce6a.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":1,\"name\":\"Cheese\",\"price\":7000,\"created_at\":\"2022-08-20T10:42:07.000000Z\",\"updated_at\":\"2022-08-20T10:42:07.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":2,\"name\":\"Egg\",\"price\":5000,\"created_at\":\"2022-08-20T10:42:24.000000Z\",\"updated_at\":\"2022-08-20T10:42:24.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":3,\"name\":\"Beef Patty\",\"price\":28000,\"created_at\":\"2022-08-20T10:42:45.000000Z\",\"updated_at\":\"2022-08-20T10:42:45.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":4,\"name\":\"Fried Malachicken\",\"price\":23000,\"created_at\":\"2022-08-20T10:43:07.000000Z\",\"updated_at\":\"2022-08-20T10:43:07.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":5,\"name\":\"Fried Chicken\",\"price\":19000,\"created_at\":\"2022-08-20T10:43:30.000000Z\",\"updated_at\":\"2022-08-20T10:43:30.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":6,\"name\":\"Toping Smoked Beef\",\"price\":13000,\"created_at\":\"2022-08-20T10:43:51.000000Z\",\"updated_at\":\"2022-08-20T10:43:51.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":7,\"name\":\"Toping Beef Slice\",\"price\":25000,\"created_at\":\"2022-08-20T10:44:14.000000Z\",\"updated_at\":\"2022-08-20T10:44:14.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":10000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"15:00:00\",\"available_time_ends\":\"23:30:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2022-09-04T09:46:07.000000Z\",\"updated_at\":\"2022-09-04T09:46:07.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"Burgerlah\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[{\"id\":1,\"name\":\"Cheese\",\"price\":7000,\"quantity\":1},{\"id\":3,\"name\":\"Beef Patty\",\"price\":28000,\"quantity\":1},{\"id\":6,\"name\":\"Toping Smoked Beef\",\"price\":13000,\"quantity\":1}]', '0.00', 'discount_on_product', 1, '500.00', 'null', '2022-09-04 10:02:34', '2022-09-04 10:02:34', NULL, '48000.00'),
(77, 21, 100002, '10000.00', '{\"id\":21,\"name\":\"Add On Food\",\"description\":\"Food With Add On\",\"image\":\"2022-09-04-631473dd5ce6a.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":1,\"name\":\"Cheese\",\"price\":7000,\"created_at\":\"2022-08-20T10:42:07.000000Z\",\"updated_at\":\"2022-08-20T10:42:07.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":2,\"name\":\"Egg\",\"price\":5000,\"created_at\":\"2022-08-20T10:42:24.000000Z\",\"updated_at\":\"2022-08-20T10:42:24.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":3,\"name\":\"Beef Patty\",\"price\":28000,\"created_at\":\"2022-08-20T10:42:45.000000Z\",\"updated_at\":\"2022-08-20T10:42:45.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":4,\"name\":\"Fried Malachicken\",\"price\":23000,\"created_at\":\"2022-08-20T10:43:07.000000Z\",\"updated_at\":\"2022-08-20T10:43:07.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":5,\"name\":\"Fried Chicken\",\"price\":19000,\"created_at\":\"2022-08-20T10:43:30.000000Z\",\"updated_at\":\"2022-08-20T10:43:30.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":6,\"name\":\"Toping Smoked Beef\",\"price\":13000,\"created_at\":\"2022-08-20T10:43:51.000000Z\",\"updated_at\":\"2022-08-20T10:43:51.000000Z\",\"restaurant_id\":1,\"status\":1},{\"id\":7,\"name\":\"Toping Beef Slice\",\"price\":25000,\"created_at\":\"2022-08-20T10:44:14.000000Z\",\"updated_at\":\"2022-08-20T10:44:14.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":10000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"15:00:00\",\"available_time_ends\":\"23:30:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2022-09-04T09:46:07.000000Z\",\"updated_at\":\"2022-09-04T09:46:07.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"Burgerlah\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[{\"id\":1,\"name\":\"Cheese\",\"price\":7000,\"quantity\":1},{\"id\":2,\"name\":\"Egg\",\"price\":5000,\"quantity\":1},{\"id\":3,\"name\":\"Beef Patty\",\"price\":28000,\"quantity\":1},{\"id\":4,\"name\":\"Fried Malachicken\",\"price\":23000,\"quantity\":1}]', '0.00', 'discount_on_product', 1, '500.00', 'null', '2022-09-04 10:26:06', '2022-09-04 10:26:06', NULL, '63000.00'),
(78, 1, 100003, '35000.00', '{\"id\":1,\"name\":\"Spicy Beef Burgerlah\",\"description\":\"Buns, Cheese, Patty, Fried onion, Mala chilli oil, Burgelah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)\",\"image\":\"2022-08-20-630009b97acf6.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":35000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"16:00:00\",\"available_time_ends\":\"23:30:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2022-08-17T16:43:41.000000Z\",\"updated_at\":\"2022-08-24T16:47:38.000000Z\",\"order_count\":1,\"avg_rating\":4,\"rating_count\":1,\"restaurant_name\":\"Burgerlah\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', '3500.00', 'discount_on_product', 1, '1750.00', 'null', '2022-09-04 10:49:28', '2022-09-04 10:49:28', NULL, '0.00'),
(79, 1, 100004, '35000.00', '{\"id\":1,\"name\":\"Spicy Beef Burgerlah\",\"description\":\"Buns, Cheese, Patty, Fried onion, Mala chilli oil, Burgelah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)\",\"image\":\"2022-08-20-630009b97acf6.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":35000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"16:00:00\",\"available_time_ends\":\"23:30:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2022-08-17T16:43:41.000000Z\",\"updated_at\":\"2022-09-04T11:00:19.000000Z\",\"order_count\":2,\"avg_rating\":4,\"rating_count\":1,\"restaurant_name\":\"Burgerlah\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', '3500.00', 'discount_on_product', 1, '1750.00', 'null', '2022-09-04 14:59:43', '2022-09-04 14:59:43', NULL, '0.00'),
(80, 1, 100005, '35000.00', '{\"id\":1,\"name\":\"Spicy Beef Burgerlah\",\"description\":\"Buns, Cheese, Patty, Fried onion, Mala chilli oil, Burgelah specialty sauce, Mix sauce ( Chilli + Tomato + Mayonnaise)\",\"image\":\"2022-08-20-630009b97acf6.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":35000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"16:00:00\",\"available_time_ends\":\"23:30:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2022-08-17T16:43:41.000000Z\",\"updated_at\":\"2022-09-04T11:00:19.000000Z\",\"order_count\":2,\"avg_rating\":4,\"rating_count\":1,\"restaurant_name\":\"Burgerlah\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', '3500.00', 'discount_on_product', 1, '1750.00', 'null', '2022-09-04 15:01:22', '2022-09-04 15:01:22', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `vendor_id`, `delivery_man_id`, `order_id`, `order_amount`, `restaurant_amount`, `admin_commission`, `received_by`, `status`, `created_at`, `updated_at`, `delivery_charge`, `original_delivery_charge`, `tax`, `zone_id`, `dm_tips`, `delivery_fee_comission`) VALUES
(1, 1, NULL, 100001, '22370.00', '12833.00', '0.00', 'restaurant', NULL, '2022-08-19 10:06:08', '2022-08-19 10:06:08', '9537.00', '9537.00', '611.00', 1, 0.00, 0.00),
(2, 2, NULL, 100004, '5498.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-21 21:32:00', '2022-08-21 21:32:00', '4478.00', '4478.00', '10.00', 1, 0.00, 0.00),
(3, 2, NULL, 100007, '8185.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-26 20:52:39', '2022-08-26 20:52:39', '7165.00', '7165.00', '10.00', 1, 0.00, 0.00),
(4, 2, NULL, 100008, '1020.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-26 21:02:22', '2022-08-26 21:02:22', '0.00', '7165.00', '10.00', 1, 0.00, 0.00),
(5, 2, NULL, 100009, '1020.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-26 21:06:12', '2022-08-26 21:06:12', '0.00', '7165.00', '10.00', 1, 0.00, 0.00),
(6, 2, NULL, 100013, '1020.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-28 20:12:42', '2022-08-28 20:12:42', '0.00', '4474.00', '10.00', 1, 0.00, 0.00),
(7, 2, NULL, 100014, '1020.00', '1020.00', '0.00', 'restaurant', NULL, '2022-08-28 20:23:18', '2022-08-28 20:23:18', '0.00', '4474.00', '10.00', 1, 0.00, 0.00),
(8, 2, NULL, 100051, '5494.00', '1020.00', '0.00', 'restaurant', NULL, '2022-09-02 04:13:38', '2022-09-02 04:13:38', '4474.00', '4474.00', '10.00', 1, 0.00, 0.00),
(9, 2, NULL, 100052, '5494.00', '1020.00', '0.00', 'restaurant', NULL, '2022-09-02 04:19:16', '2022-09-02 04:19:16', '4474.00', '4474.00', '10.00', 1, 0.00, 0.00),
(10, 2, NULL, 100054, '5494.00', '1020.00', '0.00', 'restaurant', NULL, '2022-09-02 04:38:33', '2022-09-02 04:38:33', '4474.00', '4474.00', '10.00', 1, 0.00, 0.00),
(11, 1, NULL, 100002, '87319.00', '76650.00', '0.00', 'admin', NULL, '2022-09-04 10:48:38', '2022-09-04 10:48:38', '10669.00', '10669.00', '3650.00', 1, 0.00, 0.00),
(12, 1, NULL, 100003, '43744.00', '33075.00', '0.00', 'admin', NULL, '2022-09-04 11:00:19', '2022-09-04 11:00:19', '10669.00', '10669.00', '1575.00', 1, 0.00, 0.00),
(13, 1, NULL, 100005, '43744.00', '33075.00', '0.00', 'restaurant', NULL, '2022-09-04 15:04:27', '2022-09-04 15:04:27', '10669.00', '10669.00', '1575.00', 1, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `food_section` tinyint(1) NOT NULL DEFAULT 1,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `per_km_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `opening_time`, `closeing_time`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `minimum_shipping_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `per_km_shipping_charge`) VALUES
(1, 'Burgerlah', '0810898989', 'dika@gmail.com', '2022-09-04-63147513c9393.png', '5.558737264907881', '95.3291793706894', 'Jl. Teuku Moh. Daud Beureueh No.67, Keuramat, Kec. Kuta Alam, Kota Banda Aceh, Aceh 24415', NULL, '1.00', NULL, 0, NULL, NULL, 1, 1, '2022-08-14 22:04:15', '2022-09-04 15:04:28', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":1,\"5\":0}', '2022-08-15-62f9715f70a81.png', 1, 1, 1, '5.00', 1, 1, 1, '', '{\"status\":null,\"code\":null}', 0, 0, '0.00', '15-40', 1, 1, 4, 10, NULL),
(2, '24 Hours', '08989201921', 'test@mail.net', '2022-08-22-6302a0539c85b.png', '5.55032331588515', '95.31543036727906', 'Aceh', NULL, '1.00', NULL, 0, NULL, NULL, 1, 2, '2022-08-21 21:15:00', '2022-09-03 03:01:34', 0, '{\"1\":0,\"2\":0,\"3\":2,\"4\":1,\"5\":0}', '2022-08-22-6302a054c97a3.png', 1, 1, 1, '1.00', 1, 1, 1, '', '{\"status\":null,\"code\":null}', 0, 0, '0.00', '30-40', 1, 1, 9, 67, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_schedule`
--

CREATE TABLE `restaurant_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_schedule`
--

INSERT INTO `restaurant_schedule` (`id`, `restaurant_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '15:30:00', '23:30:00', NULL, NULL),
(2, 1, 5, '15:30:00', '23:30:00', NULL, NULL),
(3, 1, 6, '15:30:00', '23:30:00', NULL, NULL),
(4, 1, 4, '15:30:00', '23:30:00', NULL, NULL),
(5, 1, 3, '15:30:00', '23:30:00', NULL, NULL),
(6, 1, 2, '15:30:00', '23:30:00', NULL, NULL),
(16, 2, 1, '00:01:00', '23:59:00', NULL, NULL),
(17, 2, 2, '00:01:00', '23:59:00', NULL, NULL),
(18, 2, 3, '00:01:00', '23:59:00', NULL, NULL),
(19, 2, 4, '00:01:00', '23:59:00', NULL, NULL),
(20, 2, 5, '00:01:00', '23:59:00', NULL, NULL),
(21, 2, 6, '00:01:00', '23:59:00', NULL, NULL),
(22, 2, 0, '00:01:00', '23:59:00', NULL, NULL),
(23, 1, 0, '15:30:00', '23:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_wallets`
--

INSERT INTO `restaurant_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, '155633.00', '0.00', '0.00', '66114.00', '2022-08-14 22:06:09', '2022-09-04 15:04:28'),
(2, 2, '9180.00', '0.00', '0.00', '34245.00', '2022-08-21 21:19:09', '2022-09-02 04:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'instagram', 'https://www.instagram.com/burger_lah/?hl=en', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `online` time DEFAULT NULL,
  `offline` time DEFAULT NULL,
  `working_hour` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_logs`
--

INSERT INTO `time_logs` (`id`, `user_id`, `date`, `online`, `offline`, `working_hour`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-08-28', '21:08:00', NULL, 0.00, '2022-08-28 14:08:00', '2022-08-28 14:08:00'),
(2, 1, '2022-08-29', NULL, '03:04:06', 0.00, '2022-08-28 20:04:06', '2022-08-28 20:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `wallet_balance`, `loyalty_point`, `ref_code`) VALUES
(1, 'John', 'Doe', '+6281280809696', 'yuffi@mail.net', NULL, 0, NULL, '$2y$10$FGuEIYB4QiUSXmEc4WpucuOE5AQqKIdjJuwuxn3VGgAVKxjS5UrKa', NULL, '2022-08-17 16:47:58', '2022-08-21 21:32:00', '[1]', '@', 1, 2, NULL, NULL, 1, '100000.000', '0.000', 'yuffi10000'),
(2, 'Teuku', 'Rizky', '+6281210819099', 'teuku@mail.net', '2022-08-27-63092eeeb7af5.png', 0, NULL, '$2y$10$gaRmu9xHaTsmeeTe5VY.xuGxxP02zcRxfPDamJs7LjkkGH13F23q2', NULL, '2022-08-26 20:33:13', '2022-09-04 15:04:28', NULL, 'dvHkyBX6SYumeWcTSZchZf:APA91bH8tzd_FiAmGMsEeDe1uKNuWpc-bdAjUBr3xLPf1G0ZVXr9WhDoU7Yg02eSHPn_ceB_o_hzM0C3wt0ouSyrfkRruqE3FYDI6izqSoBL7sKznimm2-H0AYs0mCtvm-63OjCIXCvu', 1, 6, NULL, NULL, 1, '0.000', '0.000', 'teuku20000'),
(3, 'Yufi', 'Aulia', '+62895612054965', 'yufiaulia66@gmail.com', '2022-08-29-630bb60f6cccf.png', 0, NULL, '$2y$10$ILNDe.rzJ5qrd4BU3aRHOO4gXl97Z4mKAIDFt1CwTwhuAc.qLRcBu', NULL, '2022-08-28 18:35:43', '2022-09-02 04:38:34', NULL, 'eFeTxtVdTmO5yKMsNYaT5k:APA91bHy0qPz2oVEf_NlbA9hxOvX-jlyAPmUFzjZwqByLACLiukgaOWPMKIX2EBPvOm4fBjL2Gdee2sOCdUESmri7iz6kJPVHbQVeroTy2NzzzuWmLN3WEGDOsJnK6_HF6uMHO3-m5pB', 1, 5, NULL, NULL, 1, '0.000', '0.000', 'yufiaulia3');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-21 21:26:50', '2022-08-21 21:26:50'),
(2, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 20:47:00', '2022-08-26 20:47:00'),
(3, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100007,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-26 20:47:00', '2022-08-26 20:47:00'),
(4, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 20:51:09', '2022-08-26 20:51:09'),
(5, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 20:51:36', '2022-08-26 20:51:36'),
(6, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 20:52:39', '2022-08-26 20:52:39'),
(7, '{\"title\":\"Order placed successfully!\",\"description\":\"Your order is pending\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:00:50', '2022-08-26 21:00:50'),
(8, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:01:37', '2022-08-26 21:01:37'),
(9, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:01:45', '2022-08-26 21:01:45'),
(10, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:02:22', '2022-08-26 21:02:22'),
(11, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:04:16', '2022-08-26 21:04:16'),
(12, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-26 21:04:16', '2022-08-26 21:04:16'),
(13, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:05:45', '2022-08-26 21:05:45'),
(14, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:05:50', '2022-08-26 21:05:50'),
(15, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-26 21:06:12', '2022-08-26 21:06:12'),
(16, '{\"title\":\"Order placed successfully!\",\"description\":\"Your order is pending\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 19:54:09', '2022-08-28 19:54:09'),
(17, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 19:54:51', '2022-08-28 19:54:51'),
(18, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:01:00', '2022-08-28 20:01:00'),
(19, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:06:25', '2022-08-28 20:06:25'),
(20, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100013,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-28 20:06:25', '2022-08-28 20:06:25'),
(21, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:11:14', '2022-08-28 20:11:14'),
(22, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:11:29', '2022-08-28 20:11:29'),
(23, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:11:50', '2022-08-28 20:11:50'),
(24, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:12:42', '2022-08-28 20:12:42'),
(25, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:20:08', '2022-08-28 20:20:08'),
(26, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100014,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-28 20:20:08', '2022-08-28 20:20:08'),
(27, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:20:56', '2022-08-28 20:20:56'),
(28, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:21:34', '2022-08-28 20:21:34'),
(29, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 20:23:18', '2022-08-28 20:23:18'),
(30, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 22:16:27', '2022-08-28 22:16:27'),
(31, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100016,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-28 22:16:27', '2022-08-28 22:16:27'),
(32, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-08-28 22:19:46', '2022-08-28 22:19:46'),
(33, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-08-30 20:40:24', '2022-08-30 20:40:24'),
(34, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100025,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-08-30 20:40:24', '2022-08-30 20:40:24'),
(35, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-01 17:16:26', '2022-09-01 17:16:26'),
(36, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-01 17:16:40', '2022-09-01 17:16:40'),
(37, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-01 19:46:59', '2022-09-01 19:46:59'),
(38, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100037,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-01 19:46:59', '2022-09-01 19:46:59'),
(39, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-01 19:48:56', '2022-09-01 19:48:56'),
(40, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100039,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-01 20:25:44', '2022-09-01 20:25:44'),
(41, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100039,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-01 20:25:44', '2022-09-01 20:25:44'),
(42, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100040,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-01 20:30:05', '2022-09-01 20:30:05'),
(43, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100040,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-01 20:30:05', '2022-09-01 20:30:05'),
(44, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100051,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:07:44', '2022-09-02 04:07:44'),
(45, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100051,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-02 04:07:44', '2022-09-02 04:07:44'),
(46, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100051,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:10:34', '2022-09-02 04:10:34'),
(47, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100051,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:10:56', '2022-09-02 04:10:56'),
(48, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100051,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:13:38', '2022-09-02 04:13:38'),
(49, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:17:56', '2022-09-02 04:17:56'),
(50, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100052,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-02 04:17:56', '2022-09-02 04:17:56'),
(51, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:18:26', '2022-09-02 04:18:26'),
(52, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:18:45', '2022-09-02 04:18:45'),
(53, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:19:16', '2022-09-02 04:19:16'),
(54, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100053,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:36:32', '2022-09-02 04:36:32'),
(55, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100053,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:36:48', '2022-09-02 04:36:48'),
(56, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100054,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:37:05', '2022-09-02 04:37:05'),
(57, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100054,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-02 04:37:05', '2022-09-02 04:37:05'),
(58, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100054,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:37:20', '2022-09-02 04:37:20'),
(59, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100054,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:37:38', '2022-09-02 04:37:38'),
(60, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100054,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-02 04:38:34', '2022-09-02 04:38:34'),
(61, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 01:51:46', '2022-09-03 01:51:46'),
(62, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 01:51:46', '2022-09-03 01:51:46'),
(63, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 01:58:23', '2022-09-03 01:58:23'),
(64, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 01:58:23', '2022-09-03 01:58:23'),
(65, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:00:54', '2022-09-03 02:00:54'),
(66, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:00:54', '2022-09-03 02:00:54'),
(67, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:02:01', '2022-09-03 02:02:01'),
(68, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:02:02', '2022-09-03 02:02:02'),
(69, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:02:08', '2022-09-03 02:02:08'),
(70, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:02:08', '2022-09-03 02:02:08'),
(71, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:15:53', '2022-09-03 02:15:53'),
(72, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:15:53', '2022-09-03 02:15:53'),
(73, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:16:40', '2022-09-03 02:16:40'),
(74, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:16:40', '2022-09-03 02:16:40'),
(75, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:17:46', '2022-09-03 02:17:46'),
(76, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:17:46', '2022-09-03 02:17:46'),
(77, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:18:01', '2022-09-03 02:18:01'),
(78, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:18:01', '2022-09-03 02:18:01'),
(79, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:22:47', '2022-09-03 02:22:47'),
(80, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:22:47', '2022-09-03 02:22:47'),
(81, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:22:51', '2022-09-03 02:22:51'),
(82, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:22:51', '2022-09-03 02:22:51'),
(83, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-09-03 02:25:38', '2022-09-03 02:25:38'),
(84, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 02:25:38', '2022-09-03 02:25:38'),
(85, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100069,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-03 02:58:43', '2022-09-03 02:58:43'),
(86, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100069,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-03 02:58:46', '2022-09-03 02:58:46'),
(87, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100070,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-03 03:02:35', '2022-09-03 03:02:35'),
(88, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100070,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-09-03 03:02:35', '2022-09-03 03:02:35'),
(89, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2022-09-03 16:47:23', '2022-09-03 16:47:23'),
(90, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100072,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-03 16:47:23', '2022-09-03 16:47:23'),
(91, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:43:32', '2022-09-04 10:43:32'),
(92, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-04 10:43:32', '2022-09-04 10:43:32'),
(93, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:44:49', '2022-09-04 10:44:49'),
(94, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-04 10:44:49', '2022-09-04 10:44:49'),
(95, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:47:44', '2022-09-04 10:47:44'),
(96, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:48:38', '2022-09-04 10:48:38'),
(97, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:57:57', '2022-09-04 10:57:57'),
(98, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-04 10:57:57', '2022-09-04 10:57:57'),
(99, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:58:04', '2022-09-04 10:58:04'),
(100, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-04 10:58:04', '2022-09-04 10:58:04'),
(101, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 10:59:54', '2022-09-04 10:59:54'),
(102, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 11:00:19', '2022-09-04 11:00:19'),
(103, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 14:59:44', '2022-09-04 14:59:44'),
(104, '{\"title\":\"Order\",\"description\":\"Your order cancelled\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 15:00:20', '2022-09-04 15:00:20'),
(105, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 15:01:22', '2022-09-04 15:01:22'),
(106, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-09-04 15:01:22', '2022-09-04 15:01:22'),
(107, '{\"title\":\"Order\",\"description\":\"Your order has in confirmation\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 15:03:27', '2022-09-04 15:03:27'),
(108, '{\"title\":\"Order\",\"description\":\"Your order in processing\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 15:03:54', '2022-09-04 15:03:54'),
(109, '{\"title\":\"Order\",\"description\":\"Your order has delivered\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-09-04 15:04:29', '2022-09-04 15:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'Teuku Andhika', 'Risma', '0810898989', 'dika@gmail.com', NULL, '$2y$10$UMS32KXQV4BHm0ABO/rWuuBxoOEO2h3E56lbMahx91QEdwLanWyS6', NULL, '2022-08-14 22:04:14', '2022-09-04 09:51:15', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Testing', 'Ter', '08989201921', 'test@mail.net', NULL, '$2y$10$scvOzWtg874m05UAcawarO5MBj9CHM3Ah5QxgJYa4TrjwB1h2oora', 'DcscY3EbSaduFvYL6QMlXKCqmTufQha4uUG3FiZPe8Y4BvqmK2GKGIjaYqAr', '2022-08-21 21:14:59', '2022-08-21 21:14:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `admin_bonus`, `balance`, `transaction_type`, `reference`, `created_at`, `updated_at`) VALUES
(1, 1, '4178fc4e-90f2-4846-b023-0b620c5392ea', '100000.000', '0.000', '0.000', '100000.000', 'add_fund_by_admin', 'Kamu mendapatkan give away karena kamu user pertama Congratssss!!!', '2022-08-20 10:34:32', '2022-08-20 10:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `food_id`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(1, 1, 1, '2022-08-17 18:51:53', '2022-08-17 18:51:53', NULL),
(2, 1, NULL, '2022-08-17 18:51:56', '2022-08-17 18:51:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL,
  `per_km_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`, `minimum_shipping_charge`, `per_km_shipping_charge`) VALUES
(1, 'Banda Aceh', 0x00000000010300000001000000040000003697d9f21fd65740e31549447d6b16401297d90215d1574099ff0feda12b16401c97d972bdd65740e725e724170416403697d9f21fd65740e31549447d6b1640, 1, '2022-08-14 21:59:34', '2022-08-14 21:59:34', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man', 2000.000, 2000.000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100073;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
