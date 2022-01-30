-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 01:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `single_vendor`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `longitude` double(8,2) DEFAULT NULL,
  `latitude` double(8,2) DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country_id`, `state_id`, `city_id`, `longitude`, `latitude`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(3, 1, 'Vatara, Gulshan, Thana', 18, 348, 1, NULL, NULL, '1212', '01768618001', 0, '2022-01-17 05:39:22', '2022-01-23 00:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `deletable`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'hemel@gmail.com', NULL, '$2y$10$0k36C9pJ/wqVVvChg8MFC.yldVSKuKGKNQNNvDMuhhg.PhXmws2Uu', 0, NULL, '2022-01-15 03:19:33', '2022-01-15 03:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2022-01-15 23:53:42', '2022-01-15 23:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `attributevalues`
--

CREATE TABLE `attributevalues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributevalues`
--

INSERT INTO `attributevalues` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'XL', '2022-01-15 23:53:58', '2022-01-15 23:53:58'),
(2, 1, 'XXL', '2022-01-19 00:16:21', '2022-01-19 00:16:21'),
(3, 1, 'L', '2022-01-19 00:16:29', '2022-01-19 00:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'Brand 1', 'brand-1-2022-01-16-61e3b2d684bae.png', NULL, '2022-01-15 23:53:26', '2022-01-15 23:53:26'),
(2, 'Samsung', 'samsung-2022-01-27-61f23853dfebb.jpg', NULL, '2022-01-27 00:14:44', '2022-01-27 00:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `temp_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `shipping_cost` double(20,2) DEFAULT NULL,
  `shipping_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_applied` tinyint(4) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `owner_id`, `user_id`, `temp_user_id`, `address_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `shipping_type`, `pickup_point`, `discount`, `product_referral_code`, `coupon_code`, `coupon_applied`, `quantity`, `created_at`, `updated_at`) VALUES
(125, NULL, NULL, '8da26acf4fd0903f840a', NULL, 11, 'Red', 500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-23 00:05:15', '2022-01-23 00:05:15'),
(127, NULL, NULL, '80b97a005a1482462c59', NULL, 10, 'Red', 100.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-01-23 00:23:48', '2022-01-23 00:23:57'),
(144, NULL, NULL, 'd0a126378eddd1b4d177', NULL, 11, 'Red-XL', 1000.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2022-01-24 00:07:32', '2022-01-24 00:07:32'),
(146, NULL, NULL, 'd95bdbbd32635c0f3638', NULL, 11, 'Red-XL', 1000.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 00:15:57', '2022-01-24 00:15:57'),
(147, NULL, NULL, '916990d656b999e282a1', NULL, 10, 'Red', 100.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 00:18:39', '2022-01-24 00:18:39'),
(150, NULL, NULL, 'c437a7661eed5391a127', NULL, 11, 'Red-XL', 1000.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-24 00:26:01', '2022-01-24 00:26:01'),
(218, NULL, 1, NULL, 3, 10, 'Red', 100.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-26 23:46:29', '2022-01-26 23:46:29'),
(219, NULL, 1, NULL, 3, 7, 'XXL', 1200.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-01-26 23:46:38', '2022-01-27 03:38:51'),
(220, NULL, 1, NULL, 3, 2, 'Red', 600.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-27 00:01:00', '2022-01-27 00:01:00'),
(221, NULL, 1, NULL, 3, 12, 'Red', 600.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-27 04:23:46', '2022-01-27 04:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leftsidebar_id` int(11) NOT NULL,
  `rightsidebar_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `image`, `desc`, `leftsidebar_id`, `rightsidebar_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'new Category', 'new-category', 0, 'new-category-2022-01-27-61f250c90bd8f.jpg', 'ssssssssssssssss', 0, 0, 1, '2022-01-27 01:59:05', '2022-01-27 01:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `cost` double(20,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `cost`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dhaka Zone', 348, 110.00, 1, '2021-12-23 07:25:25', '2021-12-23 07:25:25', NULL),
(2, 'Barishal Zone', 348, 150.00, 1, '2021-12-23 07:31:54', '2021-12-23 07:31:54', NULL),
(3, 'Khulna Zone', 348, 200.00, 1, '2021-12-23 07:32:13', '2021-12-23 07:32:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Red', '#e62a45', '2022-01-17 04:35:00', '2022-01-17 04:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `combined_orders`
--

CREATE TABLE `combined_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `combined_orders`
--

INSERT INTO `combined_orders` (`id`, `user_id`, `shipping_address`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 02:51:39', '2022-01-18 02:51:39'),
(2, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 02:52:05', '2022-01-18 02:52:05'),
(3, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:02:15', '2022-01-18 03:02:15'),
(4, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:04:17', '2022-01-18 03:04:17'),
(5, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:04:23', '2022-01-18 03:04:23'),
(6, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:05:09', '2022-01-18 03:05:09'),
(7, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:06:05', '2022-01-18 03:06:05'),
(8, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:06:12', '2022-01-18 03:06:12'),
(9, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:11:42', '2022-01-18 03:11:42'),
(10, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:16:47', '2022-01-18 03:16:47'),
(11, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:17:29', '2022-01-18 03:17:29'),
(12, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 03:19:45', '2022-01-18 03:19:45'),
(13, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 3000.00, '2022-01-18 03:22:31', '2022-01-18 03:22:31'),
(14, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 3000.00, '2022-01-18 03:23:15', '2022-01-18 03:23:15'),
(15, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1500.00, '2022-01-18 03:26:26', '2022-01-18 03:26:26'),
(16, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 10000.00, '2022-01-18 03:28:48', '2022-01-18 03:28:48'),
(17, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 10000.00, '2022-01-18 03:35:20', '2022-01-18 03:35:20'),
(18, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 10000.00, '2022-01-18 03:36:12', '2022-01-18 03:36:12'),
(19, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 05:59:22', '2022-01-18 05:59:22'),
(20, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-18 06:01:40', '2022-01-18 06:01:40'),
(21, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1500.00, '2022-01-18 06:02:21', '2022-01-18 06:02:21'),
(22, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 9000.00, '2022-01-18 06:03:01', '2022-01-18 06:03:01'),
(23, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1000.00, '2022-01-18 23:17:18', '2022-01-18 23:17:18'),
(24, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', NULL, '2022-01-19 00:27:07', '2022-01-19 00:27:07'),
(25, 1, '[]', 2400.00, '2022-01-19 00:41:45', '2022-01-19 00:41:45'),
(26, 1, '[]', 1800.00, '2022-01-19 00:45:31', '2022-01-19 00:45:31'),
(27, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2500.00, '2022-01-19 00:48:18', '2022-01-19 00:48:18'),
(28, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1800.00, '2022-01-19 00:52:16', '2022-01-19 00:52:16'),
(29, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2700.00, '2022-01-19 01:22:18', '2022-01-19 01:22:18'),
(30, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2700.00, '2022-01-19 01:30:59', '2022-01-19 01:30:59'),
(31, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 6000.00, '2022-01-19 01:32:23', '2022-01-19 01:32:23'),
(32, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1900.00, '2022-01-19 01:33:40', '2022-01-19 01:33:40'),
(33, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 800.00, '2022-01-19 01:34:53', '2022-01-19 01:34:53'),
(34, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1200.00, '2022-01-19 02:15:19', '2022-01-19 02:15:19'),
(35, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 900.00, '2022-01-19 02:59:24', '2022-01-19 02:59:24'),
(36, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 100.00, '2022-01-19 02:59:39', '2022-01-19 02:59:39'),
(37, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2200.00, '2022-01-19 03:36:41', '2022-01-19 03:36:41'),
(38, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 600.00, '2022-01-19 03:45:03', '2022-01-19 03:45:03'),
(39, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 600.00, '2022-01-19 04:00:37', '2022-01-19 04:00:37'),
(40, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 1800.00, '2022-01-19 04:23:29', '2022-01-19 04:23:29'),
(41, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 450.00, '2022-01-20 05:02:25', '2022-01-20 05:02:25'),
(42, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2500.00, '2022-01-20 06:10:34', '2022-01-20 06:10:35'),
(43, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 2300.00, '2022-01-22 04:18:45', '2022-01-22 04:18:45'),
(44, 1, '[]', 1300.00, '2022-01-22 04:22:33', '2022-01-22 04:22:33'),
(45, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 3050.00, '2022-01-22 05:03:07', '2022-01-22 05:03:07'),
(46, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block, Gulshan , Vatara\",\"country\":\"18\",\"state\":\"348\",\"city\":\"1\",\"postal_code\":\"1000\",\"phone\":\"01648477222\"}', 500.00, '2022-01-22 06:32:34', '2022-01-22 06:32:34'),
(47, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Barishal bazar road\",\"country\":\"18\",\"state\":\"348\",\"city\":\"2\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 1500.00, '2022-01-22 22:37:45', '2022-01-22 22:37:45'),
(48, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Barishal bazar road\",\"country\":\"18\",\"state\":\"348\",\"city\":\"1\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 500.00, '2022-01-22 22:39:04', '2022-01-22 22:39:04'),
(49, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 450.00, '2022-01-22 22:45:44', '2022-01-22 22:45:44'),
(50, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 2000.00, '2022-01-22 23:20:22', '2022-01-22 23:20:22'),
(51, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 1500.00, '2022-01-22 23:54:31', '2022-01-22 23:54:31'),
(52, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 500.00, '2022-01-23 00:10:58', '2022-01-23 00:10:58'),
(53, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 550.00, '2022-01-23 00:25:15', '2022-01-23 00:25:15'),
(54, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 5000.00, '2022-01-23 02:35:35', '2022-01-23 02:35:35'),
(55, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 200.00, '2022-01-23 02:38:07', '2022-01-23 02:38:07'),
(56, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 1000.00, '2022-01-23 03:04:44', '2022-01-23 03:04:44'),
(57, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 1000.00, '2022-01-23 04:06:54', '2022-01-23 04:06:54'),
(58, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 100.00, '2022-01-26 00:21:34', '2022-01-26 00:21:34'),
(59, 1, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 3000.00, '2022-01-26 05:40:26', '2022-01-26 05:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcategories`
--

CREATE TABLE `contentcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcategory_contentpost`
--

CREATE TABLE `contentcategory_contentpost` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contentpost_id` bigint(20) UNSIGNED NOT NULL,
  `contentcategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentposts`
--

CREATE TABLE `contentposts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallaryimage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) NOT NULL,
  `leftsidebar_id` int(11) NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AF', 'Afghanistan', 0, '2021-04-06 01:06:30', '2021-10-11 00:34:13', NULL),
(2, 'AL', 'Albania', 0, '2021-04-06 01:06:30', NULL, NULL),
(3, 'DZ', 'Algeria', 0, '2021-04-06 01:06:30', NULL, NULL),
(4, 'AS', 'American Samoa', 0, '2021-04-06 01:06:30', NULL, NULL),
(5, 'AD', 'Andorra', 0, '2021-04-06 01:06:30', NULL, NULL),
(6, 'AO', 'Angola', 0, '2021-04-06 01:06:30', NULL, NULL),
(7, 'AI', 'Anguilla', 0, '2021-04-06 01:06:30', NULL, NULL),
(8, 'AQ', 'Antarctica', 0, '2021-04-06 01:06:30', NULL, NULL),
(9, 'AG', 'Antigua And Barbuda', 0, '2021-04-06 01:06:30', NULL, NULL),
(10, 'AR', 'Argentina', 0, '2021-04-06 01:06:30', NULL, NULL),
(11, 'AM', 'Armenia', 0, '2021-04-06 01:06:30', NULL, NULL),
(12, 'AW', 'Aruba', 0, '2021-04-06 01:06:30', NULL, NULL),
(13, 'AU', 'Australia', 0, '2021-04-06 01:06:30', NULL, NULL),
(14, 'AT', 'Austria', 0, '2021-04-06 01:06:30', NULL, NULL),
(15, 'AZ', 'Azerbaijan', 0, '2021-04-06 01:06:30', NULL, NULL),
(16, 'BS', 'Bahamas The', 0, '2021-04-06 01:06:30', NULL, NULL),
(17, 'BH', 'Bahrain', 0, '2021-04-06 01:06:30', NULL, NULL),
(18, 'BD', 'Bangladesh', 1, '2021-04-06 01:06:30', '2021-12-12 18:25:46', NULL),
(19, 'BB', 'Barbados', 0, '2021-04-06 01:06:30', NULL, NULL),
(20, 'BY', 'Belarus', 0, '2021-04-06 01:06:30', NULL, NULL),
(21, 'BE', 'Belgium', 0, '2021-04-06 01:06:30', NULL, NULL),
(22, 'BZ', 'Belize', 0, '2021-04-06 01:06:30', NULL, NULL),
(23, 'BJ', 'Benin', 0, '2021-04-06 01:06:30', NULL, NULL),
(24, 'BM', 'Bermuda', 0, '2021-04-06 01:06:30', NULL, NULL),
(25, 'BT', 'Bhutan', 0, '2021-04-06 01:06:30', NULL, NULL),
(26, 'BO', 'Bolivia', 0, '2021-04-06 01:06:30', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 0, '2021-04-06 01:06:30', NULL, NULL),
(28, 'BW', 'Botswana', 0, '2021-04-06 01:06:30', NULL, NULL),
(29, 'BV', 'Bouvet Island', 0, '2021-04-06 01:06:30', NULL, NULL),
(30, 'BR', 'Brazil', 0, '2021-04-06 01:06:30', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 0, '2021-04-06 01:06:30', NULL, NULL),
(32, 'BN', 'Brunei', 0, '2021-04-06 01:06:30', NULL, NULL),
(33, 'BG', 'Bulgaria', 0, '2021-04-06 01:06:30', NULL, NULL),
(34, 'BF', 'Burkina Faso', 0, '2021-04-06 01:06:30', NULL, NULL),
(35, 'BI', 'Burundi', 0, '2021-04-06 01:06:30', NULL, NULL),
(36, 'KH', 'Cambodia', 0, '2021-04-06 01:06:30', NULL, NULL),
(37, 'CM', 'Cameroon', 0, '2021-04-06 01:06:30', NULL, NULL),
(38, 'CA', 'Canada', 0, '2021-04-06 01:06:30', NULL, NULL),
(39, 'CV', 'Cape Verde', 0, '2021-04-06 01:06:30', NULL, NULL),
(40, 'KY', 'Cayman Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(41, 'CF', 'Central African Republic', 0, '2021-04-06 01:06:30', NULL, NULL),
(42, 'TD', 'Chad', 0, '2021-04-06 01:06:30', NULL, NULL),
(43, 'CL', 'Chile', 0, '2021-04-06 01:06:30', NULL, NULL),
(44, 'CN', 'China', 0, '2021-04-06 01:06:30', NULL, NULL),
(45, 'CX', 'Christmas Island', 0, '2021-04-06 01:06:30', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(47, 'CO', 'Colombia', 0, '2021-04-06 01:06:30', NULL, NULL),
(48, 'KM', 'Comoros', 0, '2021-04-06 01:06:30', NULL, NULL),
(49, 'CG', 'Republic Of The Congo', 0, '2021-04-06 01:06:30', NULL, NULL),
(50, 'CD', 'Democratic Republic Of The Congo', 0, '2021-04-06 01:06:30', NULL, NULL),
(51, 'CK', 'Cook Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(52, 'CR', 'Costa Rica', 0, '2021-04-06 01:06:30', NULL, NULL),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 0, '2021-04-06 01:06:30', NULL, NULL),
(54, 'HR', 'Croatia (Hrvatska)', 0, '2021-04-06 01:06:30', NULL, NULL),
(55, 'CU', 'Cuba', 0, '2021-04-06 01:06:30', NULL, NULL),
(56, 'CY', 'Cyprus', 0, '2021-04-06 01:06:30', NULL, NULL),
(57, 'CZ', 'Czech Republic', 0, '2021-04-06 01:06:30', NULL, NULL),
(58, 'DK', 'Denmark', 0, '2021-04-06 01:06:30', NULL, NULL),
(59, 'DJ', 'Djibouti', 0, '2021-04-06 01:06:30', NULL, NULL),
(60, 'DM', 'Dominica', 0, '2021-04-06 01:06:30', NULL, NULL),
(61, 'DO', 'Dominican Republic', 0, '2021-04-06 01:06:30', NULL, NULL),
(62, 'TP', 'East Timor', 0, '2021-04-06 01:06:30', NULL, NULL),
(63, 'EC', 'Ecuador', 0, '2021-04-06 01:06:30', NULL, NULL),
(64, 'EG', 'Egypt', 0, '2021-04-06 01:06:30', NULL, NULL),
(65, 'SV', 'El Salvador', 0, '2021-04-06 01:06:30', NULL, NULL),
(66, 'GQ', 'Equatorial Guinea', 0, '2021-04-06 01:06:30', NULL, NULL),
(67, 'ER', 'Eritrea', 0, '2021-04-06 01:06:30', NULL, NULL),
(68, 'EE', 'Estonia', 0, '2021-04-06 01:06:30', NULL, NULL),
(69, 'ET', 'Ethiopia', 0, '2021-04-06 01:06:30', NULL, NULL),
(70, 'XA', 'External Territories of Australia', 0, '2021-04-06 01:06:30', NULL, NULL),
(71, 'FK', 'Falkland Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(72, 'FO', 'Faroe Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(73, 'FJ', 'Fiji Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(74, 'FI', 'Finland', 0, '2021-04-06 01:06:30', NULL, NULL),
(75, 'FR', 'France', 0, '2021-04-06 01:06:30', NULL, NULL),
(76, 'GF', 'French Guiana', 0, '2021-04-06 01:06:30', NULL, NULL),
(77, 'PF', 'French Polynesia', 0, '2021-04-06 01:06:30', NULL, NULL),
(78, 'TF', 'French Southern Territories', 0, '2021-04-06 01:06:30', NULL, NULL),
(79, 'GA', 'Gabon', 0, '2021-04-06 01:06:30', NULL, NULL),
(80, 'GM', 'Gambia The', 0, '2021-04-06 01:06:30', NULL, NULL),
(81, 'GE', 'Georgia', 0, '2021-04-06 01:06:30', NULL, NULL),
(82, 'DE', 'Germany', 0, '2021-04-06 01:06:30', NULL, NULL),
(83, 'GH', 'Ghana', 0, '2021-04-06 01:06:30', NULL, NULL),
(84, 'GI', 'Gibraltar', 0, '2021-04-06 01:06:30', NULL, NULL),
(85, 'GR', 'Greece', 0, '2021-04-06 01:06:30', NULL, NULL),
(86, 'GL', 'Greenland', 0, '2021-04-06 01:06:30', NULL, NULL),
(87, 'GD', 'Grenada', 0, '2021-04-06 01:06:30', NULL, NULL),
(88, 'GP', 'Guadeloupe', 0, '2021-04-06 01:06:30', NULL, NULL),
(89, 'GU', 'Guam', 0, '2021-04-06 01:06:30', NULL, NULL),
(90, 'GT', 'Guatemala', 0, '2021-04-06 01:06:30', NULL, NULL),
(91, 'XU', 'Guernsey and Alderney', 0, '2021-04-06 01:06:30', NULL, NULL),
(92, 'GN', 'Guinea', 0, '2021-04-06 01:06:30', NULL, NULL),
(93, 'GW', 'Guinea-Bissau', 0, '2021-04-06 01:06:30', NULL, NULL),
(94, 'GY', 'Guyana', 0, '2021-04-06 01:06:30', NULL, NULL),
(95, 'HT', 'Haiti', 0, '2021-04-06 01:06:30', NULL, NULL),
(96, 'HM', 'Heard and McDonald Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(97, 'HN', 'Honduras', 0, '2021-04-06 01:06:30', NULL, NULL),
(98, 'HK', 'Hong Kong S.A.R.', 0, '2021-04-06 01:06:30', NULL, NULL),
(99, 'HU', 'Hungary', 0, '2021-04-06 01:06:30', NULL, NULL),
(100, 'IS', 'Iceland', 0, '2021-04-06 01:06:30', NULL, NULL),
(101, 'IN', 'India', 0, '2021-04-06 01:06:30', NULL, NULL),
(102, 'ID', 'Indonesia', 0, '2021-04-06 01:06:30', NULL, NULL),
(103, 'IR', 'Iran', 0, '2021-04-06 01:06:30', NULL, NULL),
(104, 'IQ', 'Iraq', 0, '2021-04-06 01:06:30', NULL, NULL),
(105, 'IE', 'Ireland', 0, '2021-04-06 01:06:30', NULL, NULL),
(106, 'IL', 'Israel', 0, '2021-04-06 01:06:30', NULL, NULL),
(107, 'IT', 'Italy', 0, '2021-04-06 01:06:30', NULL, NULL),
(108, 'JM', 'Jamaica', 0, '2021-04-06 01:06:30', NULL, NULL),
(109, 'JP', 'Japan', 0, '2021-04-06 01:06:30', NULL, NULL),
(110, 'XJ', 'Jersey', 0, '2021-04-06 01:06:30', NULL, NULL),
(111, 'JO', 'Jordan', 0, '2021-04-06 01:06:30', NULL, NULL),
(112, 'KZ', 'Kazakhstan', 0, '2021-04-06 01:06:30', NULL, NULL),
(113, 'KE', 'Kenya', 0, '2021-04-06 01:06:30', NULL, NULL),
(114, 'KI', 'Kiribati', 0, '2021-04-06 01:06:30', NULL, NULL),
(115, 'KP', 'Korea North', 0, '2021-04-06 01:06:30', NULL, NULL),
(116, 'KR', 'Korea South', 0, '2021-04-06 01:06:30', NULL, NULL),
(117, 'KW', 'Kuwait', 0, '2021-04-06 01:06:30', NULL, NULL),
(118, 'KG', 'Kyrgyzstan', 0, '2021-04-06 01:06:30', NULL, NULL),
(119, 'LA', 'Laos', 0, '2021-04-06 01:06:30', NULL, NULL),
(120, 'LV', 'Latvia', 0, '2021-04-06 01:06:30', NULL, NULL),
(121, 'LB', 'Lebanon', 0, '2021-04-06 01:06:30', NULL, NULL),
(122, 'LS', 'Lesotho', 0, '2021-04-06 01:06:30', NULL, NULL),
(123, 'LR', 'Liberia', 0, '2021-04-06 01:06:30', NULL, NULL),
(124, 'LY', 'Libya', 0, '2021-04-06 01:06:30', NULL, NULL),
(125, 'LI', 'Liechtenstein', 0, '2021-04-06 01:06:30', NULL, NULL),
(126, 'LT', 'Lithuania', 0, '2021-04-06 01:06:30', NULL, NULL),
(127, 'LU', 'Luxembourg', 0, '2021-04-06 01:06:30', NULL, NULL),
(128, 'MO', 'Macau S.A.R.', 0, '2021-04-06 01:06:30', NULL, NULL),
(129, 'MK', 'Macedonia', 0, '2021-04-06 01:06:30', NULL, NULL),
(130, 'MG', 'Madagascar', 0, '2021-04-06 01:06:30', NULL, NULL),
(131, 'MW', 'Malawi', 0, '2021-04-06 01:06:30', NULL, NULL),
(132, 'MY', 'Malaysia', 0, '2021-04-06 01:06:30', NULL, NULL),
(133, 'MV', 'Maldives', 0, '2021-04-06 01:06:30', NULL, NULL),
(134, 'ML', 'Mali', 0, '2021-04-06 01:06:30', NULL, NULL),
(135, 'MT', 'Malta', 0, '2021-04-06 01:06:30', NULL, NULL),
(136, 'XM', 'Man (Isle of)', 0, '2021-04-06 01:06:30', NULL, NULL),
(137, 'MH', 'Marshall Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(138, 'MQ', 'Martinique', 0, '2021-04-06 01:06:30', NULL, NULL),
(139, 'MR', 'Mauritania', 0, '2021-04-06 01:06:30', NULL, NULL),
(140, 'MU', 'Mauritius', 0, '2021-04-06 01:06:30', NULL, NULL),
(141, 'YT', 'Mayotte', 0, '2021-04-06 01:06:30', NULL, NULL),
(142, 'MX', 'Mexico', 0, '2021-04-06 01:06:30', NULL, NULL),
(143, 'FM', 'Micronesia', 0, '2021-04-06 01:06:30', NULL, NULL),
(144, 'MD', 'Moldova', 0, '2021-04-06 01:06:30', NULL, NULL),
(145, 'MC', 'Monaco', 0, '2021-04-06 01:06:30', NULL, NULL),
(146, 'MN', 'Mongolia', 0, '2021-04-06 01:06:30', NULL, NULL),
(147, 'MS', 'Montserrat', 0, '2021-04-06 01:06:30', NULL, NULL),
(148, 'MA', 'Morocco', 0, '2021-04-06 01:06:30', NULL, NULL),
(149, 'MZ', 'Mozambique', 0, '2021-04-06 01:06:30', NULL, NULL),
(150, 'MM', 'Myanmar', 0, '2021-04-06 01:06:30', NULL, NULL),
(151, 'NA', 'Namibia', 0, '2021-04-06 01:06:30', NULL, NULL),
(152, 'NR', 'Nauru', 0, '2021-04-06 01:06:30', NULL, NULL),
(153, 'NP', 'Nepal', 0, '2021-04-06 01:06:30', NULL, NULL),
(154, 'AN', 'Netherlands Antilles', 0, '2021-04-06 01:06:30', NULL, NULL),
(155, 'NL', 'Netherlands The', 0, '2021-04-06 01:06:30', NULL, NULL),
(156, 'NC', 'New Caledonia', 0, '2021-04-06 01:06:30', NULL, NULL),
(157, 'NZ', 'New Zealand', 0, '2021-04-06 01:06:30', NULL, NULL),
(158, 'NI', 'Nicaragua', 0, '2021-04-06 01:06:30', NULL, NULL),
(159, 'NE', 'Niger', 0, '2021-04-06 01:06:30', NULL, NULL),
(160, 'NG', 'Nigeria', 0, '2021-04-06 01:06:30', NULL, NULL),
(161, 'NU', 'Niue', 0, '2021-04-06 01:06:30', NULL, NULL),
(162, 'NF', 'Norfolk Island', 0, '2021-04-06 01:06:30', NULL, NULL),
(163, 'MP', 'Northern Mariana Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(164, 'NO', 'Norway', 0, '2021-04-06 01:06:30', NULL, NULL),
(165, 'OM', 'Oman', 0, '2021-04-06 01:06:30', NULL, NULL),
(166, 'PK', 'Pakistan', 0, '2021-04-06 01:06:30', NULL, NULL),
(167, 'PW', 'Palau', 0, '2021-04-06 01:06:30', NULL, NULL),
(168, 'PS', 'Palestinian Territory Occupied', 0, '2021-04-06 01:06:30', NULL, NULL),
(169, 'PA', 'Panama', 0, '2021-04-06 01:06:30', NULL, NULL),
(170, 'PG', 'Papua new Guinea', 0, '2021-04-06 01:06:30', NULL, NULL),
(171, 'PY', 'Paraguay', 0, '2021-04-06 01:06:30', NULL, NULL),
(172, 'PE', 'Peru', 0, '2021-04-06 01:06:30', NULL, NULL),
(173, 'PH', 'Philippines', 0, '2021-04-06 01:06:30', NULL, NULL),
(174, 'PN', 'Pitcairn Island', 0, '2021-04-06 01:06:30', NULL, NULL),
(175, 'PL', 'Poland', 0, '2021-04-06 01:06:30', NULL, NULL),
(176, 'PT', 'Portugal', 0, '2021-04-06 01:06:30', NULL, NULL),
(177, 'PR', 'Puerto Rico', 0, '2021-04-06 01:06:30', NULL, NULL),
(178, 'QA', 'Qatar', 0, '2021-04-06 01:06:30', NULL, NULL),
(179, 'RE', 'Reunion', 0, '2021-04-06 01:06:30', NULL, NULL),
(180, 'RO', 'Romania', 0, '2021-04-06 01:06:30', NULL, NULL),
(181, 'RU', 'Russia', 0, '2021-04-06 01:06:30', NULL, NULL),
(182, 'RW', 'Rwanda', 0, '2021-04-06 01:06:30', NULL, NULL),
(183, 'SH', 'Saint Helena', 0, '2021-04-06 01:06:30', NULL, NULL),
(184, 'KN', 'Saint Kitts And Nevis', 0, '2021-04-06 01:06:30', NULL, NULL),
(185, 'LC', 'Saint Lucia', 0, '2021-04-06 01:06:30', NULL, NULL),
(186, 'PM', 'Saint Pierre and Miquelon', 0, '2021-04-06 01:06:30', NULL, NULL),
(187, 'VC', 'Saint Vincent And The Grenadines', 0, '2021-04-06 01:06:30', NULL, NULL),
(188, 'WS', 'Samoa', 0, '2021-04-06 01:06:30', NULL, NULL),
(189, 'SM', 'San Marino', 0, '2021-04-06 01:06:30', NULL, NULL),
(190, 'ST', 'Sao Tome and Principe', 0, '2021-04-06 01:06:30', NULL, NULL),
(191, 'SA', 'Saudi Arabia', 0, '2021-04-06 01:06:30', NULL, NULL),
(192, 'SN', 'Senegal', 0, '2021-04-06 01:06:30', NULL, NULL),
(193, 'RS', 'Serbia', 0, '2021-04-06 01:06:30', NULL, NULL),
(194, 'SC', 'Seychelles', 0, '2021-04-06 01:06:30', NULL, NULL),
(195, 'SL', 'Sierra Leone', 0, '2021-04-06 01:06:30', NULL, NULL),
(196, 'SG', 'Singapore', 0, '2021-04-06 01:06:30', NULL, NULL),
(197, 'SK', 'Slovakia', 0, '2021-04-06 01:06:30', NULL, NULL),
(198, 'SI', 'Slovenia', 0, '2021-04-06 01:06:30', NULL, NULL),
(199, 'XG', 'Smaller Territories of the UK', 0, '2021-04-06 01:06:30', NULL, NULL),
(200, 'SB', 'Solomon Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(201, 'SO', 'Somalia', 0, '2021-04-06 01:06:30', NULL, NULL),
(202, 'ZA', 'South Africa', 0, '2021-04-06 01:06:30', NULL, NULL),
(203, 'GS', 'South Georgia', 0, '2021-04-06 01:06:30', NULL, NULL),
(204, 'SS', 'South Sudan', 0, '2021-04-06 01:06:30', NULL, NULL),
(205, 'ES', 'Spain', 0, '2021-04-06 01:06:30', NULL, NULL),
(206, 'LK', 'Sri Lanka', 0, '2021-04-06 01:06:30', NULL, NULL),
(207, 'SD', 'Sudan', 0, '2021-04-06 01:06:30', NULL, NULL),
(208, 'SR', 'Suriname', 0, '2021-04-06 01:06:30', NULL, NULL),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(210, 'SZ', 'Swaziland', 0, '2021-04-06 01:06:30', NULL, NULL),
(211, 'SE', 'Sweden', 0, '2021-04-06 01:06:30', NULL, NULL),
(212, 'CH', 'Switzerland', 0, '2021-04-06 01:06:30', NULL, NULL),
(213, 'SY', 'Syria', 0, '2021-04-06 01:06:30', NULL, NULL),
(214, 'TW', 'Taiwan', 0, '2021-04-06 01:06:30', NULL, NULL),
(215, 'TJ', 'Tajikistan', 0, '2021-04-06 01:06:30', NULL, NULL),
(216, 'TZ', 'Tanzania', 0, '2021-04-06 01:06:30', NULL, NULL),
(217, 'TH', 'Thailand', 0, '2021-04-06 01:06:30', NULL, NULL),
(218, 'TG', 'Togo', 0, '2021-04-06 01:06:30', NULL, NULL),
(219, 'TK', 'Tokelau', 0, '2021-04-06 01:06:30', NULL, NULL),
(220, 'TO', 'Tonga', 0, '2021-04-06 01:06:30', NULL, NULL),
(221, 'TT', 'Trinidad And Tobago', 0, '2021-04-06 01:06:30', NULL, NULL),
(222, 'TN', 'Tunisia', 0, '2021-04-06 01:06:30', NULL, NULL),
(223, 'TR', 'Turkey', 0, '2021-04-06 01:06:30', NULL, NULL),
(224, 'TM', 'Turkmenistan', 0, '2021-04-06 01:06:30', NULL, NULL),
(225, 'TC', 'Turks And Caicos Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(226, 'TV', 'Tuvalu', 0, '2021-04-06 01:06:30', NULL, NULL),
(227, 'UG', 'Uganda', 0, '2021-04-06 01:06:30', NULL, NULL),
(228, 'UA', 'Ukraine', 0, '2021-04-06 01:06:30', NULL, NULL),
(229, 'AE', 'United Arab Emirates', 0, '2021-04-06 01:06:30', NULL, NULL),
(230, 'GB', 'United Kingdom', 0, '2021-04-06 01:06:30', NULL, NULL),
(231, 'US', 'United States', 0, '2021-04-06 01:06:30', NULL, NULL),
(232, 'UM', 'United States Minor Outlying Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(233, 'UY', 'Uruguay', 0, '2021-04-06 01:06:30', NULL, NULL),
(234, 'UZ', 'Uzbekistan', 0, '2021-04-06 01:06:30', NULL, NULL),
(235, 'VU', 'Vanuatu', 0, '2021-04-06 01:06:30', NULL, NULL),
(236, 'VA', 'Vatican City State (Holy See)', 0, '2021-04-06 01:06:30', NULL, NULL),
(237, 'VE', 'Venezuela', 0, '2021-04-06 01:06:30', NULL, NULL),
(238, 'VN', 'Vietnam', 0, '2021-04-06 01:06:30', NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 0, '2021-04-06 01:06:30', NULL, NULL),
(240, 'VI', 'Virgin Islands (US)', 0, '2021-04-06 01:06:30', NULL, NULL),
(241, 'WF', 'Wallis And Futuna Islands', 0, '2021-04-06 01:06:30', NULL, NULL),
(242, 'EH', 'Western Sahara', 0, '2021-04-06 01:06:30', NULL, NULL),
(243, 'YE', 'Yemen', 0, '2021-04-06 01:06:30', NULL, NULL),
(244, 'YU', 'Yugoslavia', 0, '2021-04-06 01:06:30', NULL, NULL),
(245, 'ZM', 'Zambia', 0, '2021-04-06 01:06:30', NULL, NULL),
(246, 'ZW', 'Zimbabwe', 0, '2021-04-06 01:06:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custompages`
--

CREATE TABLE `custompages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `container` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transparent` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pagebuilder_id` bigint(20) UNSIGNED NOT NULL,
  `module_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_margin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `margin_amt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_topmargin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topmargin_amt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filemanager`
--

CREATE TABLE `filemanager` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` double(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `absolute_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flashdeals`
--

CREATE TABLE `flashdeals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashdeals`
--

INSERT INTO `flashdeals` (`id`, `title`, `slug`, `start_date`, `end_date`, `background_color`, `text_color`, `banner`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Offer', '', '2022-01-27', '2022-02-12', '#ffffff', '#000000', 'new-offer-2022-01-27-61f26ebfed46f.jpg', '1', '2022-01-27 04:06:56', '2022-01-27 05:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `flashdeal_product`
--

CREATE TABLE `flashdeal_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flashdeal_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashdeal_product`
--

INSERT INTO `flashdeal_product` (`id`, `flashdeal_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 4, NULL, NULL),
(3, 1, 5, NULL, NULL),
(4, 1, 7, NULL, NULL),
(5, 1, 9, NULL, NULL),
(6, 1, 10, NULL, NULL),
(7, 1, 11, NULL, NULL),
(8, 1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `frontmenuitems`
--

CREATE TABLE `frontmenuitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `frontmenu_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `page_id` int(11) DEFAULT NULL,
  `contentcategory_id` int(11) DEFAULT NULL,
  `blogcategory_id` int(11) DEFAULT NULL,
  `teamcategory_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontmenuitems`
--

INSERT INTO `frontmenuitems` (`id`, `frontmenu_id`, `type`, `parent_id`, `page_id`, `contentcategory_id`, `blogcategory_id`, `teamcategory_id`, `order`, `title`, `divider_title`, `slug`, `target`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Product Page', NULL, 'http://localhost/single_vendor/', NULL, '2022-01-26 00:32:17', '2022-01-26 00:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `frontmenus`
--

CREATE TABLE `frontmenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontmenus`
--

INSERT INTO `frontmenus` (`id`, `title`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'footer-menu', 'footer-menu', 0, '2022-01-26 00:31:11', '2022-01-26 00:31:11');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_05_02_100001_create_filemanager_table', 1),
(6, '2021_11_13_082206_create_modules_table', 1),
(7, '2021_11_13_082255_create_permissions_table', 1),
(8, '2021_11_13_082312_create_roles_table', 1),
(9, '2021_11_13_082357_create_permission_role_table', 1),
(10, '2021_11_13_101402_create_admins_table', 1),
(11, '2021_11_15_051524_create_categories_table', 1),
(12, '2021_11_16_061038_create_sidebars_table', 1),
(13, '2021_11_16_120238_create_widgets_table', 1),
(14, '2021_11_17_103409_create_posts_table', 1),
(15, '2021_11_17_103808_create_category_post_table', 1),
(16, '2021_11_20_093651_create_contentcategories_table', 1),
(17, '2021_11_20_113758_create_contentposts_table', 1),
(18, '2021_11_20_121500_create_contentcategory_contentpost_table', 1),
(19, '2021_11_22_052344_create_pages_table', 1),
(20, '2021_11_25_083817_create_frontmenus_table', 1),
(21, '2021_11_25_084358_create_frontmenuitems_table', 1),
(22, '2021_11_27_102443_create_sliders_table', 1),
(23, '2021_11_27_111153_create_slides_table', 1),
(24, '2021_12_01_070139_create_types_table', 1),
(25, '2021_12_01_070512_create_banners_table', 1),
(26, '2021_12_01_130834_create_videos_table', 1),
(27, '2021_12_02_101232_create_notices_table', 1),
(28, '2021_12_04_091955_create_links_table', 1),
(29, '2021_12_11_114037_create_settings_table', 1),
(30, '2021_12_15_043505_create_teamcategories_table', 1),
(31, '2021_12_15_061554_create_teamposts_table', 1),
(32, '2021_12_15_064801_create_teamcategory_teampost_table', 1),
(33, '2021_12_19_125726_create_servicecategories_table', 1),
(34, '2021_12_20_051328_create_services_table', 1),
(35, '2021_12_20_070308_create_service_servicecategory_table', 1),
(36, '2021_12_20_075654_create_portfoliocategories_table', 1),
(37, '2021_12_20_093442_create_portfolios_table', 1),
(38, '2021_12_21_045526_create_portfolio_portfoliocategory_table', 1),
(39, '2021_12_21_050158_create_pricecategories_table', 1),
(40, '2021_12_21_064427_create_prices_table', 1),
(41, '2021_12_21_100033_create_price_pricecategory_table', 1),
(42, '2021_12_23_071806_create_custompages_table', 1),
(43, '2021_12_23_073236_create_pagebuilders_table', 1),
(44, '2021_12_26_072146_create_elements_table', 1),
(45, '2021_12_29_112129_create_navbarsettings_table', 1),
(46, '2022_01_05_061347_create_contacts_table', 1),
(47, '2022_01_05_111951_create_brands_table', 1),
(48, '2022_01_05_113812_create_productcategories_table', 1),
(49, '2022_01_06_091214_create_attributes_table', 1),
(50, '2022_01_06_091831_create_attributevalues_table', 1),
(51, '2022_01_06_094258_create_colors_table', 1),
(52, '2022_01_10_094143_create_flashdeals_table', 1),
(53, '2022_01_10_095952_create_products_table', 1),
(54, '2022_01_10_100039_create_product_productcategory_table', 1),
(55, '2022_01_10_100156_create_flashdeal_product_table', 1),
(56, '2022_01_11_103915_create_taxes_table', 1),
(57, '2022_01_11_104625_create_product_tax_table', 1),
(58, '2022_01_13_074452_create_productstocks_table', 1),
(59, '2022_01_15_101747_create_addresses_table', 2),
(66, '2022_01_15_105510_create_cities_table', 5),
(67, '2022_01_15_105445_create_states_table', 6),
(68, '2022_01_15_105419_create_countries_table', 7),
(69, '2022_01_16_072530_create_carts_table', 8),
(70, '2022_01_18_064758_create_orders_table', 9),
(71, '2022_01_18_064930_create_order_details_table', 9),
(72, '2022_01_18_073851_create_combined_orders_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin Dashboard', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(2, 'Role Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(3, 'User Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(4, 'Product-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(5, 'Product-Brand Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(6, 'Product-Attribute Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(7, 'Product-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(8, 'Blog-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(9, 'Blog-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(10, 'Content-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(11, 'Content-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(12, 'Team-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(13, 'Team-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(14, 'Page Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(15, 'Sidebar Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(16, 'Widget Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(17, 'Front Menu Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(18, 'Service-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(19, 'Service-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(20, 'Portfolio-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(21, 'Portfolio-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(22, 'Price-Category Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(23, 'Price-Post Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(24, 'Custom-Page Management', '2022-01-15 03:19:32', '2022-01-15 03:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `navbarsettings`
--

CREATE TABLE `navbarsettings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `navbar_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `combined_order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double NOT NULL DEFAULT 0,
  `code` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `viewed` int(11) NOT NULL DEFAULT 0,
  `delivery_viewed` int(11) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(11) NOT NULL DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `combined_order_id`, `user_id`, `guest_id`, `seller_id`, `shipping_address`, `delivery_status`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `tracking_code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(16, 14, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 3000.00, 0, '20220118-09231576', NULL, 1642497795, 0, 0, 0, 0, '2022-01-18 03:23:15', '2022-01-18 03:23:15'),
(17, 15, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1500.00, 0, '20220118-09262682', NULL, 1642497986, 0, 0, 0, 0, '2022-01-18 03:26:26', '2022-01-18 03:26:26'),
(18, 16, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 10000.00, 0, '20220118-09284811', NULL, 1642498128, 0, 0, 0, 0, '2022-01-18 03:28:48', '2022-01-18 03:28:48'),
(19, 17, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 10000.00, 0, '20220118-09352043', NULL, 1642498520, 0, 0, 0, 0, '2022-01-18 03:35:20', '2022-01-18 03:35:20'),
(20, 18, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 10000.00, 0, '20220118-09361289', NULL, 1642498572, 0, 0, 0, 0, '2022-01-18 03:36:12', '2022-01-18 03:36:12'),
(21, 19, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, NULL, 0, '20220118-11592214', NULL, 1642507162, 0, 0, 0, 0, '2022-01-18 05:59:22', '2022-01-18 05:59:22'),
(22, 20, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, NULL, 0, '20220118-12014055', NULL, 1642507300, 0, 0, 0, 0, '2022-01-18 06:01:40', '2022-01-18 06:01:40'),
(23, 21, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1500.00, 0, '20220118-12022122', NULL, 1642507341, 0, 0, 0, 0, '2022-01-18 06:02:21', '2022-01-18 06:02:21'),
(24, 22, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 9000.00, 0, '20220118-12030193', NULL, 1642507381, 0, 0, 0, 0, '2022-01-18 06:03:01', '2022-01-18 06:03:01'),
(25, 23, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1000.00, 0, '20220119-05171814', NULL, 1642569438, 0, 0, 0, 0, '2022-01-18 23:17:18', '2022-01-18 23:17:18'),
(26, 24, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, NULL, 0, '20220119-06270745', NULL, 1642573627, 0, 0, 0, 0, '2022-01-19 00:27:07', '2022-01-19 00:27:07'),
(27, 25, 1, NULL, NULL, '[]', 'pending', 'COD', 'unpaid', NULL, 2400.00, 0, '20220119-06414587', NULL, 1642574505, 0, 0, 0, 0, '2022-01-19 00:41:45', '2022-01-19 00:41:45'),
(28, 26, 1, NULL, NULL, '[]', 'pending', 'COD', 'unpaid', NULL, 1800.00, 0, '20220119-06453131', NULL, 1642574731, 0, 0, 0, 0, '2022-01-19 00:45:31', '2022-01-19 00:45:31'),
(29, 27, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2500.00, 0, '20220119-06481883', NULL, 1642574898, 0, 0, 0, 0, '2022-01-19 00:48:18', '2022-01-19 00:48:18'),
(30, 28, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1800.00, 0, '20220119-06521692', NULL, 1642575136, 0, 0, 0, 0, '2022-01-19 00:52:16', '2022-01-19 00:52:16'),
(31, 29, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2700.00, 0, '20220119-07221897', NULL, 1642576938, 0, 0, 0, 0, '2022-01-19 01:22:18', '2022-01-19 01:22:18'),
(32, 30, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2700.00, 0, '20220119-07305935', NULL, 1642577459, 0, 0, 0, 0, '2022-01-19 01:30:59', '2022-01-19 01:30:59'),
(33, 31, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 6000.00, 0, '20220119-07322342', NULL, 1642577543, 0, 0, 0, 0, '2022-01-19 01:32:23', '2022-01-19 01:32:23'),
(34, 32, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1900.00, 0, '20220119-07334044', NULL, 1642577620, 0, 0, 0, 0, '2022-01-19 01:33:40', '2022-01-19 01:33:40'),
(35, 33, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 800.00, 0, '20220119-07345382', NULL, 1642577693, 0, 0, 0, 0, '2022-01-19 01:34:53', '2022-01-19 01:34:53'),
(36, 34, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1200.00, 0, '20220119-08151952', NULL, 1642580119, 0, 0, 0, 0, '2022-01-19 02:15:19', '2022-01-19 02:15:19'),
(37, 35, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 900.00, 0, '20220119-08592488', NULL, 1642582764, 0, 0, 0, 0, '2022-01-19 02:59:24', '2022-01-19 02:59:24'),
(38, 36, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 100.00, 0, '20220119-08593996', NULL, 1642582779, 0, 0, 0, 0, '2022-01-19 02:59:39', '2022-01-19 02:59:39'),
(39, 37, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2200.00, 0, '20220119-09364148', NULL, 1642585001, 0, 0, 0, 0, '2022-01-19 03:36:41', '2022-01-19 03:36:41'),
(40, 38, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 600.00, 0, '20220119-09450387', NULL, 1642585503, 0, 0, 0, 0, '2022-01-19 03:45:03', '2022-01-19 03:45:03'),
(41, 39, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 600.00, 0, '20220119-10003731', NULL, 1642586437, 0, 0, 0, 0, '2022-01-19 04:00:37', '2022-01-19 04:00:37'),
(42, 40, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 1800.00, 0, '20220119-10232914', NULL, 1642587809, 0, 0, 0, 0, '2022-01-19 04:23:29', '2022-01-19 04:23:29'),
(43, 41, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 450.00, 0, '20220120-11022596', NULL, 1642676545, 0, 0, 0, 0, '2022-01-20 05:02:25', '2022-01-20 05:02:25'),
(44, 42, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2500.00, 0, '20220120-12103422', NULL, 1642680634, 0, 0, 0, 0, '2022-01-20 06:10:34', '2022-01-20 06:10:35'),
(45, 43, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 2300.00, 0, '20220122-10184547', NULL, 1642846725, 0, 0, 0, 0, '2022-01-22 04:18:45', '2022-01-22 04:18:45'),
(46, 44, 1, NULL, NULL, '[]', 'pending', 'COD', 'unpaid', NULL, 1300.00, 0, '20220122-10223366', NULL, 1642846953, 0, 0, 0, 0, '2022-01-22 04:22:33', '2022-01-22 04:22:33'),
(47, 45, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01912431987\"}', 'pending', 'COD', 'unpaid', NULL, 3050.00, 0, '20220122-11030723', NULL, 1642849387, 0, 0, 0, 0, '2022-01-22 05:03:07', '2022-01-22 05:03:07'),
(48, 46, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Baridhara j-block, Gulshan , Vatara\",\"country\":\"18\",\"state\":\"348\",\"city\":\"1\",\"postal_code\":\"1000\",\"phone\":\"01648477222\"}', 'pending', 'COD', 'unpaid', NULL, 500.00, 0, '20220122-12323447', NULL, 1642854754, 0, 0, 0, 0, '2022-01-22 06:32:34', '2022-01-22 06:32:34'),
(49, 47, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Barishal bazar road\",\"country\":\"18\",\"state\":\"348\",\"city\":\"2\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 1500.00, 0, '20220123-04374524', NULL, 1642912665, 0, 0, 0, 0, '2022-01-22 22:37:45', '2022-01-22 22:37:45'),
(50, 48, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Barishal bazar road\",\"country\":\"18\",\"state\":\"348\",\"city\":\"1\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 500.00, 0, '20220123-04390428', NULL, 1642912744, 0, 1, 1, 0, '2022-01-22 22:39:04', '2022-01-24 23:39:36'),
(51, 49, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 450.00, 0, '20220123-04454410', NULL, 1642913144, 0, 1, 1, 0, '2022-01-22 22:45:44', '2022-01-24 23:45:51'),
(52, 50, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 2000.00, 0, '20220123-05202283', NULL, 1642915222, 0, 0, 0, 0, '2022-01-22 23:20:22', '2022-01-22 23:20:22'),
(53, 51, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana road\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 1500.00, 0, '20220123-05543195', NULL, 1642917271, 0, 1, 1, 0, '2022-01-22 23:54:31', '2022-01-24 00:52:02'),
(54, 52, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 500.00, 0, '20220123-06105837', NULL, 1642918258, 0, 1, 1, 0, '2022-01-23 00:10:58', '2022-01-24 00:28:12'),
(55, 53, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'COD', 'unpaid', NULL, 550.00, 0, '20220123-06251599', NULL, 1642919115, 0, 1, 1, 0, '2022-01-23 00:25:15', '2022-01-24 00:29:08'),
(56, 54, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', NULL, 'unpaid', NULL, 5000.00, 0, '20220123-08353567', NULL, 1642926935, 0, 1, 1, 0, '2022-01-23 02:35:35', '2022-01-24 00:01:21'),
(57, 55, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 200.00, 0, '20220123-08380717', NULL, 1642927087, 0, 1, 1, 0, '2022-01-23 02:38:07', '2022-01-24 00:29:13'),
(58, 56, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 1000.00, 0, '20220123-09044450', NULL, 1642928684, 0, 1, 1, 0, '2022-01-23 03:04:44', '2022-01-24 00:27:47'),
(59, 57, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 1000.00, 0, '20220123-10065467', NULL, 1642932414, 0, 1, 1, 0, '2022-01-23 04:06:54', '2022-01-24 00:54:23'),
(60, 58, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 100.00, 0, '20220126-06213463', NULL, 1643178094, 0, 0, 0, 0, '2022-01-26 00:21:34', '2022-01-26 00:21:34'),
(61, 59, 1, NULL, NULL, '{\"name\":\"Mr.Rakibul Islam\",\"email\":\"author@gmail.com\",\"address\":\"Vatara, Gulshan, Thana\",\"country\":\"Bangladesh\",\"state\":\"Dhaka\",\"city\":\"Dhaka Zone\",\"postal_code\":\"1212\",\"phone\":\"01768618001\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 3000.00, 0, '20220126-11402691', NULL, 1643197226, 0, 0, 0, 0, '2022-01-26 05:40:26', '2022-01-26 05:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(3, 16, NULL, 2, NULL, 3000.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:23:15', '2022-01-18 03:23:15'),
(4, 17, NULL, 3, NULL, 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:26:26', '2022-01-18 03:26:26'),
(5, 18, NULL, 3, NULL, 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:28:48', '2022-01-18 03:28:48'),
(6, 18, NULL, 2, NULL, 4000.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:28:48', '2022-01-18 03:28:48'),
(7, 18, NULL, 3, NULL, 4500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:28:48', '2022-01-18 03:28:48'),
(8, 19, NULL, 3, NULL, 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:35:20', '2022-01-18 03:35:20'),
(9, 19, NULL, 2, NULL, 4000.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:35:20', '2022-01-18 03:35:20'),
(10, 19, NULL, 3, NULL, 4500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:35:20', '2022-01-18 03:35:20'),
(11, 20, NULL, 3, NULL, 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:36:12', '2022-01-18 03:36:12'),
(12, 20, NULL, 2, NULL, 4000.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:36:12', '2022-01-18 03:36:12'),
(13, 20, NULL, 3, NULL, 4500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 03:36:12', '2022-01-18 03:36:12'),
(14, 23, NULL, 3, '#e62a45', 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 06:02:21', '2022-01-18 06:02:21'),
(15, 24, NULL, 3, '#e62a45', 1500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 06:03:01', '2022-01-18 06:03:01'),
(16, 24, NULL, 3, '#e62a45', 7500.00, 0.00, 0.00, 5, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 06:03:01', '2022-01-18 06:03:01'),
(17, 25, NULL, 4, 'Red', 1000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-18 23:17:18', '2022-01-18 23:17:18'),
(18, 27, NULL, 6, 'Red-XXL', 2400.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 00:41:45', '2022-01-19 00:41:45'),
(19, 28, NULL, 6, 'Red-XXL', 1800.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 00:45:31', '2022-01-19 00:45:31'),
(20, 29, NULL, 6, 'Red-XL', 2500.00, 0.00, 0.00, 5, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 00:48:18', '2022-01-19 00:48:18'),
(21, 30, NULL, 7, 'Red-L', 1800.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 00:52:16', '2022-01-19 00:52:16'),
(22, 31, NULL, 7, 'Red-L', 2700.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:22:18', '2022-01-19 01:22:18'),
(23, 32, NULL, 7, 'Red-L', 2700.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:30:59', '2022-01-19 01:30:59'),
(24, 33, NULL, 4, 'Red', 1200.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:32:23', '2022-01-19 01:32:23'),
(25, 33, NULL, 7, 'Red-XL', 4800.00, 0.00, 0.00, 6, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:32:23', '2022-01-19 01:32:23'),
(26, 34, NULL, 7, 'Red-XL', 800.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:33:40', '2022-01-19 01:33:40'),
(27, 34, NULL, 6, 'Red-XL', 500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:33:40', '2022-01-19 01:33:40'),
(28, 34, NULL, 5, 'Red-XL', 600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:33:40', '2022-01-19 01:33:40'),
(29, 35, NULL, 7, 'Red-XL', 800.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 01:34:53', '2022-01-19 01:34:53'),
(30, 36, NULL, 2, 'Red', 1200.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 02:15:19', '2022-01-19 02:15:19'),
(31, 37, NULL, 7, 'Red-XL', 800.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 02:59:24', '2022-01-19 02:59:24'),
(32, 37, NULL, 10, 'Red', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 02:59:24', '2022-01-19 02:59:24'),
(33, 38, NULL, 10, 'Red', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 02:59:39', '2022-01-19 02:59:39'),
(34, 39, NULL, 2, 'Red', 600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 03:36:41', '2022-01-19 03:36:41'),
(35, 39, NULL, 5, 'Red-XL', 600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 03:36:41', '2022-01-19 03:36:41'),
(36, 39, NULL, 6, 'Red-XL', 1000.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 03:36:41', '2022-01-19 03:36:41'),
(37, 40, NULL, 2, 'Red', 600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 03:45:03', '2022-01-19 03:45:03'),
(38, 41, NULL, 2, 'Red', 600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 04:00:37', '2022-01-19 04:00:37'),
(39, 42, NULL, 9, 'XXL', 1800.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-19 04:23:29', '2022-01-19 04:23:29'),
(40, 43, NULL, 9, 'XXL', 450.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-20 05:02:25', '2022-01-20 05:02:25'),
(41, 44, NULL, 11, 'Red', 2500.00, 0.00, 0.00, 5, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-20 06:10:34', '2022-01-20 06:10:34'),
(42, 45, NULL, 10, 'Red', 800.00, 0.00, 0.00, 8, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 04:18:45', '2022-01-22 04:18:45'),
(43, 45, NULL, 11, 'Red', 1500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 04:18:45', '2022-01-22 04:18:45'),
(44, 46, NULL, 11, 'Red', 500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 04:22:33', '2022-01-22 04:22:33'),
(45, 46, NULL, 7, 'Red-XL', 800.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 04:22:33', '2022-01-22 04:22:33'),
(46, 47, NULL, 10, 'Red', 600.00, 0.00, 0.00, 6, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 05:03:07', '2022-01-22 05:03:07'),
(47, 47, NULL, 11, 'Red', 2000.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 05:03:07', '2022-01-22 05:03:07'),
(48, 47, NULL, 9, 'XXL', 450.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 05:03:07', '2022-01-22 05:03:07'),
(49, 48, NULL, 11, 'Red', 500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 06:32:34', '2022-01-22 06:32:34'),
(50, 49, NULL, 11, 'Red', 1500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 22:37:45', '2022-01-22 22:37:45'),
(51, 50, NULL, 11, 'Red', 500.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 22:39:04', '2022-01-22 22:39:04'),
(52, 51, NULL, 9, 'XXL', 450.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 22:45:44', '2022-01-22 22:45:44'),
(53, 52, NULL, 11, 'Red', 2000.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 23:20:22', '2022-01-22 23:20:22'),
(54, 53, NULL, 11, 'Red', 1500.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-22 23:54:31', '2022-01-22 23:54:31'),
(55, 54, NULL, 10, 'Red', 500.00, 0.00, 0.00, 5, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-23 00:10:58', '2022-01-23 00:10:58'),
(56, 55, NULL, 10, 'Red', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-23 00:25:15', '2022-01-23 00:25:15'),
(57, 55, NULL, 9, 'XXL', 450.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2022-01-23 00:25:15', '2022-01-23 00:25:15'),
(58, 56, NULL, 11, 'Red-XL', 5000.00, 0.00, 0.00, 5, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-23 02:35:35', '2022-01-23 02:35:35'),
(59, 57, NULL, 10, 'Red', 200.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-23 02:38:07', '2022-01-23 02:38:07'),
(60, 58, NULL, 11, 'Red-XL', 1000.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-23 03:04:44', '2022-01-23 03:04:44'),
(61, 59, NULL, 11, 'Red-XL', 1000.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-23 04:06:54', '2022-01-23 04:06:54'),
(62, 60, NULL, 10, 'Red', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-26 00:21:34', '2022-01-26 00:21:34'),
(63, 61, NULL, 11, 'Red-XL', 3000.00, 0.00, 0.00, 3, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2022-01-26 05:40:26', '2022-01-26 05:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilders`
--

CREATE TABLE `pagebuilders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custompage_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one-col',
  `padding` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `margin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `border` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bordercolor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `border_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `gallaryimage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) NOT NULL,
  `leftsidebar_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Access Dashboard', 'app.dashboard', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(2, 2, 'View (Global)', 'app.roles.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(3, 2, 'View (Self)', 'app.roles.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(4, 2, 'Create Role', 'app.roles.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(5, 2, 'Edit Role', 'app.roles.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(6, 2, 'Delete Role', 'app.roles.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(7, 3, 'View (Global)', 'app.users.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(8, 3, 'View (Self)', 'app.users.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(9, 3, 'Create User', 'app.users.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(10, 3, 'Edit User', 'app.users.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(11, 3, 'Delete User', 'app.users.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(12, 4, 'View (Global)', 'app.product.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(13, 4, 'View (Self)', 'app.product.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(14, 4, 'Create ProductCategory', 'app.product.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(15, 4, 'Edit ProductCategory', 'app.product.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(16, 4, 'Delete ProductCategory', 'app.product.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(17, 4, 'Approve ProductCategory', 'app.product.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(18, 5, 'View (Global)', 'app.product.brands.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(19, 5, 'View (Self)', 'app.product.brands.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(20, 5, 'Create ProductBrand', 'app.product.brands.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(21, 5, 'Edit ProductBrand', 'app.product.brands.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(22, 5, 'Delete ProductBrand', 'app.product.brands.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(23, 5, 'Approve ProductBrand', 'app.product.brands.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(24, 6, 'View (Global)', 'app.product.attributes.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(25, 6, 'View (Self)', 'app.product.attributes.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(26, 6, 'Create ProductAtribute', 'app.product.attributes.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(27, 6, 'Edit ProductAtribute', 'app.product.attributes.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(28, 6, 'Delete ProductAtribute', 'app.product.attributes.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(29, 6, 'Approve ProductAtribute', 'app.product.attributes.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(30, 7, 'View (Global)', 'app.product.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(31, 7, 'View (Self)', 'app.product.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(32, 7, 'Create ProductPost', 'app.product.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(33, 7, 'Edit ProductPost', 'app.product.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(34, 7, 'Details ProductPost', 'app.product.posts.details', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(35, 7, 'Delete ProductPost', 'app.product.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(36, 7, 'Approve ProductPost', 'app.product.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(37, 7, 'Approve ProductPost', 'app.product.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(38, 8, 'View (Global)', 'app.blog.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(39, 8, 'View (Self)', 'app.blog.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(40, 8, 'Create BlogCategory', 'app.blog.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(41, 8, 'Edit BlogCategory', 'app.blog.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(42, 8, 'Delete BlogCategory', 'app.blog.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(43, 8, 'Approve BlogCategory', 'app.blog.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(44, 9, 'View (Global)', 'app.blog.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(45, 9, 'View (Self)', 'app.blog.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(46, 9, 'Create BlogPost', 'app.blog.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(47, 9, 'Edit BlogPost', 'app.blog.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(48, 9, 'Details BlogPost', 'app.blog.posts.details', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(49, 9, 'Delete BlogPost', 'app.blog.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(50, 9, 'Approve BlogPost', 'app.blog.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(51, 9, 'Approve BlogPost', 'app.blog.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(52, 10, 'View (Global)', 'app.content.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(53, 10, 'View (Self)', 'app.content.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(54, 10, 'Create ContentCategory', 'app.content.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(55, 10, 'Edit ContentCategory', 'app.content.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(56, 10, 'Delete ContentCategory', 'app.content.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(57, 10, 'Approve ContentCategory', 'app.content.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(58, 11, 'View (Global)', 'app.content.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(59, 11, 'View (Self)', 'app.content.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(60, 11, 'Create ContentPost', 'app.content.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(61, 11, 'Edit ContentPost', 'app.content.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(62, 11, 'Details ContentPost', 'app.content.posts.details', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(63, 11, 'Delete ContentPost', 'app.content.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(64, 11, 'Approve ContentPost', 'app.content.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(65, 11, 'Approve ContentPost', 'app.content.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(66, 12, 'View (Global)', 'app.team.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(67, 12, 'View (Self)', 'app.team.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(68, 12, 'Create TeamCategory', 'app.team.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(69, 12, 'Edit TeamCategory', 'app.team.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(70, 12, 'Delete TeamCategory', 'app.team.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(71, 12, 'Approve TeamCategory', 'app.team.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(72, 13, 'View (Global)', 'app.team.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(73, 13, 'View (Self)', 'app.team.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(74, 13, 'Create TeamPost', 'app.team.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(75, 13, 'Edit TeamPost', 'app.team.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(76, 13, 'Details TeamPost', 'app.team.posts.details', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(77, 13, 'Delete TeamPost', 'app.team.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(78, 13, 'Approve TeamPost', 'app.team.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(79, 13, 'Approve TeamPost', 'app.team.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(80, 14, 'View (Global)', 'app.pages.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(81, 14, 'View (Self)', 'app.pages.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(82, 14, 'Create Page', 'app.pages.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(83, 14, 'Edit Page', 'app.pages.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(84, 14, 'Details Page', 'app.pages.details', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(85, 14, 'Delete Page', 'app.pages.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(86, 14, 'Approve Page', 'app.pages.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(87, 14, 'Approve Page', 'app.pages.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(88, 15, 'View (Global)', 'app.sidebars.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(89, 15, 'View (Self)', 'app.sidebars.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(90, 15, 'Create Sidebar', 'app.sidebars.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(91, 15, 'Edit Sidebar', 'app.sidebars.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(92, 15, 'Delete Sidebar', 'app.sidebars.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(93, 15, 'Approve Sidebar', 'app.sidebars.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(94, 15, 'Sidebar Builder', 'app.sidebars.widgetbuilder', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(95, 16, 'View (Global)', 'app.widgets.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(96, 16, 'View (Self)', 'app.widgets.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(97, 16, 'Create Widget', 'app.widgets.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(98, 16, 'Edit Widget', 'app.widgets.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(99, 16, 'Delete Widget', 'app.widgets.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(100, 16, 'Widget Builder', 'app.widgets.widgetbuilder', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(101, 17, 'View (Global)', 'app.front.menus.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(102, 17, 'View (Self)', 'app.front.menus.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(103, 17, 'Create Frontmenu', 'app.front.menus.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(104, 17, 'Edit Frontmenu', 'app.front.menus.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(105, 17, 'Delete Frontmenu', 'app.front.menus.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(106, 17, 'Approve Frontmenu', 'app.front.menus.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(107, 17, 'Menu Builder', 'app.front.menus.widgetbuilder', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(108, 16, 'View (Global)', 'app.front.menuitems.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(109, 16, 'View (Self)', 'app.front.menuitems.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(110, 16, 'Create Frontmenuitem', 'app.front.menuitems.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(111, 16, 'Edit Frontmenuitem', 'app.front.menuitems.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(112, 16, 'Delete Frontmenuitem', 'app.front.menuitems.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(113, 16, 'menuitem Builder', 'app.front.menuitems.widgetbuilder', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(114, 18, 'View (Global)', 'app.service.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(115, 18, 'View (Self)', 'app.service.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(116, 18, 'Create ServiceCategory', 'app.service.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(117, 18, 'Edit ServiceCategory', 'app.service.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(118, 18, 'Delete ServiceCategory', 'app.service.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(119, 18, 'Approve ServiceCategory', 'app.service.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(120, 19, 'View (Global)', 'app.service.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(121, 19, 'View (Self)', 'app.service.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(122, 19, 'Create ServicePost', 'app.service.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(123, 19, 'Edit ServicePost', 'app.service.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(124, 19, 'Delete ServicePost', 'app.service.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(125, 19, 'Approve ServicePost', 'app.service.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(126, 19, 'Approve ServicePost', 'app.service.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(127, 20, 'View (Global)', 'app.portfolio.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(128, 20, 'View (Self)', 'app.portfolio.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(129, 20, 'Create PortfolioCategory', 'app.portfolio.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(130, 20, 'Edit PortfolioCategory', 'app.portfolio.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(131, 20, 'Delete PortfolioCategory', 'app.portfolio.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(132, 20, 'Approve PortfolioCategory', 'app.portfolio.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(133, 21, 'View (Global)', 'app.portfolio.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(134, 21, 'View (Self)', 'app.portfolio.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(135, 21, 'Create PortfolioPost', 'app.portfolio.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(136, 21, 'Edit PortfolioPost', 'app.portfolio.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(137, 21, 'Delete PortfolioPost', 'app.portfolio.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(138, 21, 'Approve PortfolioPost', 'app.portfolio.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(139, 21, 'Approve PortfolioPost', 'app.portfolio.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(140, 22, 'View (Global)', 'app.price.categories.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(141, 22, 'View (Self)', 'app.price.categories.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(142, 22, 'Create PriceCategory', 'app.price.categories.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(143, 22, 'Edit PriceCategory', 'app.price.categories.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(144, 22, 'Delete PriceCategory', 'app.price.categories.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(145, 22, 'Approve PriceCategory', 'app.price.categories.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(146, 23, 'View (Global)', 'app.price.posts.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(147, 23, 'View (Self)', 'app.price.posts.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(148, 23, 'Create PricePost', 'app.price.posts.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(149, 23, 'Edit PricePost', 'app.price.posts.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(150, 23, 'Delete PricePost', 'app.price.posts.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(151, 23, 'Approve PricePost', 'app.price.posts.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(152, 23, 'Approve PricePost', 'app.price.posts.approve', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(153, 24, 'View (Global)', 'app.custom.pages.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(154, 24, 'View (Self)', 'app.custom.pages.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(155, 24, 'Create Custompage', 'app.custom.pages.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(156, 24, 'Edit Custompage', 'app.custom.pages.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(157, 24, 'Delete Custompage', 'app.custom.pages.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(158, 24, 'Approve Custompage', 'app.custom.pages.status', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(159, 16, 'View (Global)', 'app.build.pages.global', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(160, 16, 'View (Self)', 'app.build.pages.self', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(161, 16, 'Create Pagebuilder', 'app.build.pages.create', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(162, 16, 'Edit Pagebuilder', 'app.build.pages.edit', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(163, 16, 'Delete Pagebuilder', 'app.build.pages.destroy', '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(164, 16, 'Pagebuilder', 'app.build.pages.pagebuilder', '2022-01-15 03:19:32', '2022-01-15 03:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 1, NULL, NULL),
(26, 26, 1, NULL, NULL),
(27, 27, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 31, 1, NULL, NULL),
(32, 32, 1, NULL, NULL),
(33, 33, 1, NULL, NULL),
(34, 34, 1, NULL, NULL),
(35, 35, 1, NULL, NULL),
(36, 36, 1, NULL, NULL),
(37, 37, 1, NULL, NULL),
(38, 38, 1, NULL, NULL),
(39, 39, 1, NULL, NULL),
(40, 40, 1, NULL, NULL),
(41, 41, 1, NULL, NULL),
(42, 42, 1, NULL, NULL),
(43, 43, 1, NULL, NULL),
(44, 44, 1, NULL, NULL),
(45, 45, 1, NULL, NULL),
(46, 46, 1, NULL, NULL),
(47, 47, 1, NULL, NULL),
(48, 48, 1, NULL, NULL),
(49, 49, 1, NULL, NULL),
(50, 50, 1, NULL, NULL),
(51, 51, 1, NULL, NULL),
(52, 52, 1, NULL, NULL),
(53, 53, 1, NULL, NULL),
(54, 54, 1, NULL, NULL),
(55, 55, 1, NULL, NULL),
(56, 56, 1, NULL, NULL),
(57, 57, 1, NULL, NULL),
(58, 58, 1, NULL, NULL),
(59, 59, 1, NULL, NULL),
(60, 60, 1, NULL, NULL),
(61, 61, 1, NULL, NULL),
(62, 62, 1, NULL, NULL),
(63, 63, 1, NULL, NULL),
(64, 64, 1, NULL, NULL),
(65, 65, 1, NULL, NULL),
(66, 66, 1, NULL, NULL),
(67, 67, 1, NULL, NULL),
(68, 68, 1, NULL, NULL),
(69, 69, 1, NULL, NULL),
(70, 70, 1, NULL, NULL),
(71, 71, 1, NULL, NULL),
(72, 72, 1, NULL, NULL),
(73, 73, 1, NULL, NULL),
(74, 74, 1, NULL, NULL),
(75, 75, 1, NULL, NULL),
(76, 76, 1, NULL, NULL),
(77, 77, 1, NULL, NULL),
(78, 78, 1, NULL, NULL),
(79, 79, 1, NULL, NULL),
(80, 80, 1, NULL, NULL),
(81, 81, 1, NULL, NULL),
(82, 82, 1, NULL, NULL),
(83, 83, 1, NULL, NULL),
(84, 84, 1, NULL, NULL),
(85, 85, 1, NULL, NULL),
(86, 86, 1, NULL, NULL),
(87, 87, 1, NULL, NULL),
(88, 88, 1, NULL, NULL),
(89, 89, 1, NULL, NULL),
(90, 90, 1, NULL, NULL),
(91, 91, 1, NULL, NULL),
(92, 92, 1, NULL, NULL),
(93, 93, 1, NULL, NULL),
(94, 94, 1, NULL, NULL),
(95, 95, 1, NULL, NULL),
(96, 96, 1, NULL, NULL),
(97, 97, 1, NULL, NULL),
(98, 98, 1, NULL, NULL),
(99, 99, 1, NULL, NULL),
(100, 100, 1, NULL, NULL),
(101, 101, 1, NULL, NULL),
(102, 102, 1, NULL, NULL),
(103, 103, 1, NULL, NULL),
(104, 104, 1, NULL, NULL),
(105, 105, 1, NULL, NULL),
(106, 106, 1, NULL, NULL),
(107, 107, 1, NULL, NULL),
(108, 108, 1, NULL, NULL),
(109, 109, 1, NULL, NULL),
(110, 110, 1, NULL, NULL),
(111, 111, 1, NULL, NULL),
(112, 112, 1, NULL, NULL),
(113, 113, 1, NULL, NULL),
(114, 114, 1, NULL, NULL),
(115, 115, 1, NULL, NULL),
(116, 116, 1, NULL, NULL),
(117, 117, 1, NULL, NULL),
(118, 118, 1, NULL, NULL),
(119, 119, 1, NULL, NULL),
(120, 120, 1, NULL, NULL),
(121, 121, 1, NULL, NULL),
(122, 122, 1, NULL, NULL),
(123, 123, 1, NULL, NULL),
(124, 124, 1, NULL, NULL),
(125, 125, 1, NULL, NULL),
(126, 126, 1, NULL, NULL),
(127, 127, 1, NULL, NULL),
(128, 128, 1, NULL, NULL),
(129, 129, 1, NULL, NULL),
(130, 130, 1, NULL, NULL),
(131, 131, 1, NULL, NULL),
(132, 132, 1, NULL, NULL),
(133, 133, 1, NULL, NULL),
(134, 134, 1, NULL, NULL),
(135, 135, 1, NULL, NULL),
(136, 136, 1, NULL, NULL),
(137, 137, 1, NULL, NULL),
(138, 138, 1, NULL, NULL),
(139, 139, 1, NULL, NULL),
(140, 140, 1, NULL, NULL),
(141, 141, 1, NULL, NULL),
(142, 142, 1, NULL, NULL),
(143, 143, 1, NULL, NULL),
(144, 144, 1, NULL, NULL),
(145, 145, 1, NULL, NULL),
(146, 146, 1, NULL, NULL),
(147, 147, 1, NULL, NULL),
(148, 148, 1, NULL, NULL),
(149, 149, 1, NULL, NULL),
(150, 150, 1, NULL, NULL),
(151, 151, 1, NULL, NULL),
(152, 152, 1, NULL, NULL),
(153, 153, 1, NULL, NULL),
(154, 154, 1, NULL, NULL),
(155, 155, 1, NULL, NULL),
(156, 156, 1, NULL, NULL),
(157, 157, 1, NULL, NULL),
(158, 158, 1, NULL, NULL),
(159, 159, 1, NULL, NULL),
(160, 160, 1, NULL, NULL),
(161, 161, 1, NULL, NULL),
(162, 162, 1, NULL, NULL),
(163, 163, 1, NULL, NULL),
(164, 164, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfoliocategories`
--

CREATE TABLE `portfoliocategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `gallaryimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_portfoliocategory`
--

CREATE TABLE `portfolio_portfoliocategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `portfoliocategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallaryimage` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `scrollable` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricecategories`
--

CREATE TABLE `pricecategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_pricecategory`
--

CREATE TABLE `price_pricecategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_id` bigint(20) UNSIGNED NOT NULL,
  `pricecategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productcategories`
--

CREATE TABLE `productcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leftsidebar_id` int(11) NOT NULL,
  `rightsidebar_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productcategories`
--

INSERT INTO `productcategories` (`id`, `name`, `slug`, `parent_id`, `image`, `desc`, `leftsidebar_id`, `rightsidebar_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Event & Media', 'event-media', 0, 'event-media-2022-01-27-61f281679b6c6.jpg', NULL, 0, 0, 1, '2022-01-15 23:52:54', '2022-01-27 05:26:31'),
(2, 'Event & Media', 'event-media', 0, 'event-media-2022-01-27-61f281736fc76.jpg', NULL, 0, 0, 1, '2022-01-19 04:59:13', '2022-01-27 05:26:43'),
(3, 'Event & Media', 'event-media', 0, 'event-media-2022-01-27-61f2817fa5e5c.jpg', NULL, 0, 0, 1, '2022-01-19 04:59:46', '2022-01-27 05:26:55'),
(4, 'Kid\'s Watch', 'kids-watch', 3, 'kids-watch-2022-01-27-61f28195bb432.jpg', NULL, 0, 0, 1, '2022-01-26 00:55:01', '2022-01-27 05:27:17'),
(5, 'Kid\'s Watch', 'kids-watch', 2, 'kids-watch-2022-01-27-61f281a4d8576.jpg', NULL, 0, 0, 1, '2022-01-26 02:45:27', '2022-01-27 05:27:32'),
(6, 'Men\'s Fasion', 'mens-fasion', 2, 'mens-fasion-2022-01-27-61f281bf3baf7.png', NULL, 0, 0, 1, '2022-01-26 02:46:22', '2022-01-27 05:27:59'),
(7, 'Kid\'s Watch', 'kids-watch', 5, 'kids-watch-2022-01-27-61f281c945ef6.jpg', NULL, 0, 0, 1, '2022-01-26 02:46:44', '2022-01-27 05:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_startdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_enddate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallaryimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `scrollable` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `digital` int(11) NOT NULL DEFAULT 0,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `low_stock_qty` int(11) DEFAULT NULL,
  `min_qty` int(11) DEFAULT 1,
  `cash_on_delivery` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 1,
  `todays_deal` tinyint(1) DEFAULT NULL,
  `estimate_shipping_time` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `admin_id`, `brand_id`, `title`, `slug`, `unit`, `purchase_qty`, `tags`, `unit_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `discount_startdate`, `discount_enddate`, `discount_rate`, `discount_type`, `quantity`, `sku`, `image`, `youtube_link`, `gallaryimage`, `desc`, `tax`, `tax_type`, `view_count`, `status`, `scrollable`, `is_approved`, `rightsidebar_id`, `leftsidebar_id`, `digital`, `files`, `shipping`, `low_stock_qty`, `min_qty`, `cash_on_delivery`, `featured`, `todays_deal`, `estimate_shipping_time`, `num_of_sale`, `meta_title`, `meta_desc`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Samsung RT34K5532', 'samsung-rt34k5532', 'pc', NULL, NULL, '1000', '1', '[]', '[]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '5', 'amount', 100, NULL, 'samsung-rt34k5532-2022-01-27-61f279a33a5fd.jpg', NULL, 'samsung-rt34k5532--61f279a349518.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 1, 1, 1, 0, NULL, 23, NULL, NULL, '2022-01-16 00:14:47', '2022-01-27 05:19:57'),
(4, 1, 2, 'Samsung RT34K5532S8', 'samsung-rt34k5532s8', 'pc', '1000', NULL, '1000', '1', '[]', '[]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '5', 'amount', 100, NULL, 'samsung-rt34k5532s8-2022-01-27-61f279877e0a3.png', NULL, 'samsung-rt34k5532s8--61f279878e91e.png', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 1, 1, 1, 1, NULL, 3, NULL, NULL, '2022-01-18 23:00:06', '2022-01-27 05:19:57'),
(5, 1, 1, 'Samsung RT34K5532S8-D3', 'samsung-rt34k5532s8-d3', 'pc', '500', NULL, '1200', '1', '[]', '[{\"attribute_id\":\"1\",\"values\":[\"XL\"]}]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '2', 'amount', 100, NULL, 'samsung-rt34k5532s8-d3-2022-01-27-61f279499693e.jpg', NULL, 'samsung-rt34k5532s8-d3--61f27949ac05b.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 1, 1, 1, 1, NULL, 2, NULL, NULL, '2022-01-19 00:12:27', '2022-01-27 05:19:57'),
(7, 1, 1, 'Samsung RT34K5532S8-D3 Refrigerator', 'samsung-rt34k5532s8-d3-refrigerator', 'pc', '1000', NULL, '1200', '1', '[]', '[{\"attribute_id\":\"1\",\"values\":[\"XXL\"]}]', '[]', '2022-01-27', '2022-02-12', '3', 'amount', 600, NULL, 'samsung-rt34k5532s8-d3-refrigerator-2022-01-27-61f2792aae340.jpg', NULL, 'samsung-rt34k5532s8-d3-refrigerator--61f2792abf2f5.jpg|samsung-rt34k5532s8-d3-refrigerator--61f2792ac886d.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 1, 1, 1, 1, NULL, 18, NULL, NULL, '2022-01-19 00:51:08', '2022-01-27 05:19:57'),
(9, 1, 1, 'Samsung RT34K5532S8-D3 Refrigerator - 321L', 'samsung-rt34k5532s8-d3-refrigerator-321l', 'pc', NULL, NULL, '1000', '1', '[]', '[{\"attribute_id\":\"1\",\"values\":[\"XXL\"]}]', '[]', '2022-01-27', '2022-02-12', '100', 'amount', 100, NULL, 'demo-2-2022-01-27-61f2787d6cbe5.jpg', NULL, 'demo-2--61f2787d7da90.jpg|demo-2--61f2787d870cf.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 8, NULL, NULL, '2022-01-19 02:32:31', '2022-01-27 05:19:57'),
(10, 1, 1, 'Tops', 'tops', 'pc', NULL, NULL, '1000', '1', '[]', '[]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '200', 'amount', 100, NULL, 'tops-2022-01-27-61f2786a2802f.jpg', NULL, 'tops--61f2786a3eb1e.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 25, NULL, NULL, '2022-01-19 02:56:48', '2022-01-27 05:19:57'),
(11, 1, 1, 'Shirt', 'shirt', 'pc', NULL, NULL, '1000', '1', '[]', '[{\"attribute_id\":\"1\",\"values\":[\"XL\",\"XXL\",\"L\"]}]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '5', 'amount', 100, NULL, 'shirt-2022-01-27-61f2782ac39b2.jpg', NULL, 'shirt--61f2782ad4b0e.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 35, NULL, NULL, '2022-01-19 04:28:32', '2022-01-27 05:19:57'),
(12, 1, 2, 'Couple set Code-AZ', 'couple-set-code-az', '1200', '1000', NULL, '1200', '1', '[]', '[]', '[\"#e62a45\"]', '2022-01-27', '2022-02-12', '50', 'amount', 100, NULL, 'couple-set-code-az-2022-01-27-61f26f60c1bd5.jpg', NULL, 'couple-set-code-az--61f26f60d293f.jpg|couple-set-code-az--61f26f60dbf29.jpg', NULL, NULL, 'Flat', 0, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 1, 1, 1, 1, NULL, 0, NULL, NULL, '2022-01-26 05:37:48', '2022-01-27 05:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `productstocks`
--

CREATE TABLE `productstocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productstocks`
--

INSERT INTO `productstocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `image`, `created_at`, `updated_at`) VALUES
(18, 3, 'Red-XL', 'Red-XL', '1000', '10', NULL, '2022-01-19 02:18:37', '2022-01-19 02:18:37'),
(27, 8, 'Red', 'fvgd', '600', '10', NULL, '2022-01-19 02:57:44', '2022-01-19 02:57:44'),
(29, 6, 'Red-XL', 'sdfsd', '500', '2', NULL, '2022-01-19 03:35:04', '2022-01-19 03:36:41'),
(30, 6, 'Red-XXL', 'sdfgsd', '600', '3', NULL, '2022-01-19 03:35:04', '2022-01-19 03:35:04'),
(88, 12, 'Red', 'dsfas', '600', '10', NULL, '2022-01-27 04:10:20', '2022-01-27 04:10:20'),
(90, 11, 'Red-XL', 'Red-XL', '1000', '50', NULL, '2022-01-27 04:47:06', '2022-01-27 04:47:06'),
(91, 11, 'Red-XXL', 'Red-XXL', '1000', '50', NULL, '2022-01-27 04:47:06', '2022-01-27 04:47:06'),
(92, 11, 'Red-L', 'Red-L', '1000', '50', NULL, '2022-01-27 04:47:06', '2022-01-27 04:47:06'),
(93, 10, 'Red', 'Red', '100', '35', NULL, '2022-01-27 04:48:10', '2022-01-27 04:48:10'),
(95, 9, 'XXL', 'XXL', '450', '47', NULL, '2022-01-27 04:48:52', '2022-01-27 04:48:52'),
(96, 7, 'XXL', 'XXL', '1200', '10', NULL, '2022-01-27 04:51:22', '2022-01-27 04:51:22'),
(97, 5, 'Red-XL', 'fgsad', '600', '8', NULL, '2022-01-27 04:51:53', '2022-01-27 04:51:53'),
(98, 4, 'Red', 'asdfasd', '600', '50', NULL, '2022-01-27 04:52:55', '2022-01-27 04:52:55'),
(99, 2, 'Red', 'Red', '600', '5', NULL, '2022-01-27 04:53:23', '2022-01-27 04:53:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_productcategory`
--

CREATE TABLE `product_productcategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `productcategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_productcategory`
--

INSERT INTO `product_productcategory` (`id`, `product_id`, `productcategory_id`, `created_at`, `updated_at`) VALUES
(2, 2, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 7, 2, NULL, NULL),
(13, 12, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tax`
--

CREATE TABLE `product_tax` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 0, '2022-01-15 03:19:32', '2022-01-15 03:19:32'),
(2, 'User', 'user', 0, '2022-01-15 03:19:33', '2022-01-15 03:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `servicecategories`
--

CREATE TABLE `servicecategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `rightsidebar_id` int(11) DEFAULT NULL,
  `leftsidebar_id` int(11) DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_servicecategory`
--

CREATE TABLE `service_servicecategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `servicecategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_MAILER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_HOST` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_PORT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_ENCRYPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_FROM_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAIL_FROM_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sidebars`
--

CREATE TABLE `sidebars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` int(11) DEFAULT NULL,
  `fullwidth` tinyint(1) NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `padding` int(11) DEFAULT NULL,
  `margin` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `height`, `fullwidth`, `width`, `padding`, `margin`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home Slider 1', NULL, 1, NULL, NULL, NULL, 1, '2022-01-26 03:39:28', '2022-01-26 03:39:28'),
(2, 'Home Slider 2', NULL, 1, NULL, NULL, NULL, 1, '2022-01-26 03:39:47', '2022-01-26 03:39:47'),
(3, 'Home Slider 3', NULL, 1, NULL, NULL, NULL, 1, '2022-01-26 03:39:59', '2022-01-26 03:39:59');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slideimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slider_id`, `title`, `type`, `url`, `content`, `slideimage`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Slider1', 'main-Slide', NULL, NULL, 'slider1-61f249cc736c3.jpg', 1, '2022-01-26 03:45:51', '2022-01-27 01:29:16'),
(2, 1, 'Slider2', 'main-Slide', NULL, NULL, 'slider2-61f11866a3293.jpg', 1, '2022-01-26 03:46:14', '2022-01-26 03:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Andaman and Nicobar Islands', 101, 0, '2021-04-06 01:11:20', '2021-10-11 00:43:52', NULL),
(2, 'Andhra Pradesh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3, 'Arunachal Pradesh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4, 'Assam', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(5, 'Bihar', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(6, 'Chandigarh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(7, 'Chhattisgarh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(8, 'Dadra and Nagar Haveli', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(9, 'Daman and Diu', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(10, 'Delhi', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(11, 'Goa', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(12, 'Gujarat', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(13, 'Haryana', 101, 0, '2021-04-06 01:11:20', '2021-10-11 00:53:13', NULL),
(14, 'Himachal Pradesh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(15, 'Jammu and Kashmir', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(16, 'Jharkhand', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(17, 'Karnataka', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(18, 'Kenmore', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(19, 'Kerala', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(20, 'Lakshadweep', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(21, 'Madhya Pradesh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(22, 'Maharashtra', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(23, 'Manipur', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(24, 'Meghalaya', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(25, 'Mizoram', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(26, 'Nagaland', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(27, 'Narora', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(28, 'Natwar', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(29, 'Odisha', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(30, 'Paschim Medinipur', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(31, 'Pondicherry', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(32, 'Punjab', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(33, 'Rajasthan', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(34, 'Sikkim', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(35, 'Tamil Nadu', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(36, 'Telangana', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(37, 'Tripura', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(38, 'Uttar Pradesh', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(39, 'Uttarakhand', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(40, 'Vaishali', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(41, 'West Bengal', 101, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(42, 'Badakhshan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(43, 'Badgis', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(44, 'Baglan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(45, 'Balkh', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(46, 'Bamiyan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(47, 'Farah', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(48, 'Faryab', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(49, 'Gawr', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(50, 'Gazni', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(51, 'Herat', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(52, 'Hilmand', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(53, 'Jawzjan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(54, 'Kabul', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(55, 'Kapisa', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(56, 'Khawst', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(57, 'Kunar', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(58, 'Lagman', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(59, 'Lawghar', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(60, 'Nangarhar', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(61, 'Nimruz', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(62, 'Nuristan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(63, 'Paktika', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(64, 'Paktiya', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(65, 'Parwan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(66, 'Qandahar', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(67, 'Qunduz', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(68, 'Samangan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(69, 'Sar-e Pul', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(70, 'Takhar', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(71, 'Uruzgan', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(72, 'Wardag', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(73, 'Zabul', 1, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(74, 'Berat', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(75, 'Bulqize', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(76, 'Delvine', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(77, 'Devoll', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(78, 'Dibre', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(79, 'Durres', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(80, 'Elbasan', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(81, 'Fier', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(82, 'Gjirokaster', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(83, 'Gramsh', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(84, 'Has', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(85, 'Kavaje', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(86, 'Kolonje', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(87, 'Korce', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(88, 'Kruje', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(89, 'Kucove', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(90, 'Kukes', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(91, 'Kurbin', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(92, 'Lezhe', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(93, 'Librazhd', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(94, 'Lushnje', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(95, 'Mallakaster', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(96, 'Malsi e Madhe', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(97, 'Mat', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(98, 'Mirdite', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(99, 'Peqin', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(100, 'Permet', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(101, 'Pogradec', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(102, 'Puke', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(103, 'Sarande', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(104, 'Shkoder', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(105, 'Skrapar', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(106, 'Tepelene', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(107, 'Tirane', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(108, 'Tropoje', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(109, 'Vlore', 2, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(110, '\'Ayn Daflah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(111, '\'Ayn Tamushanat', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(112, 'Adrar', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(113, 'Algiers', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(114, 'Annabah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(115, 'Bashshar', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(116, 'Batnah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(117, 'Bijayah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(118, 'Biskrah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(119, 'Blidah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(120, 'Buirah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(121, 'Bumardas', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(122, 'Burj Bu Arririj', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(123, 'Ghalizan', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(124, 'Ghardayah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(125, 'Ilizi', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(126, 'Jijili', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(127, 'Jilfah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(128, 'Khanshalah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(129, 'Masilah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(130, 'Midyah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(131, 'Milah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(132, 'Muaskar', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(133, 'Mustaghanam', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(134, 'Naama', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(135, 'Oran', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(136, 'Ouargla', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(137, 'Qalmah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(138, 'Qustantinah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(139, 'Sakikdah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(140, 'Satif', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(141, 'Sayda\'', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(142, 'Sidi ban-al-\'Abbas', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(143, 'Suq Ahras', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(144, 'Tamanghasat', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(145, 'Tibazah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(146, 'Tibissah', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(147, 'Tilimsan', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(148, 'Tinduf', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(149, 'Tisamsilt', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(150, 'Tiyarat', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(151, 'Tizi Wazu', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(152, 'Umm-al-Bawaghi', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(153, 'Wahran', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(154, 'Warqla', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(155, 'Wilaya d Alger', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(156, 'Wilaya de Bejaia', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(157, 'Wilaya de Constantine', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(158, 'al-Aghwat', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(159, 'al-Bayadh', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(160, 'al-Jaza\'ir', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(161, 'al-Wad', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(162, 'ash-Shalif', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(163, 'at-Tarif', 3, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(164, 'Eastern', 4, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(165, 'Manu\'a', 4, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(166, 'Swains Island', 4, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(167, 'Western', 4, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(168, 'Andorra la Vella', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(169, 'Canillo', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(170, 'Encamp', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(171, 'La Massana', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(172, 'Les Escaldes', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(173, 'Ordino', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(174, 'Sant Julia de Loria', 5, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(175, 'Bengo', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(176, 'Benguela', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(177, 'Bie', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(178, 'Cabinda', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(179, 'Cunene', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(180, 'Huambo', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(181, 'Huila', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(182, 'Kuando-Kubango', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(183, 'Kwanza Norte', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(184, 'Kwanza Sul', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(185, 'Luanda', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(186, 'Lunda Norte', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(187, 'Lunda Sul', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(188, 'Malanje', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(189, 'Moxico', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(190, 'Namibe', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(191, 'Uige', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(192, 'Zaire', 6, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(193, 'Other Provinces', 7, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(194, 'Sector claimed by Argentina/Ch', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(195, 'Sector claimed by Argentina/UK', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(196, 'Sector claimed by Australia', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(197, 'Sector claimed by France', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(198, 'Sector claimed by New Zealand', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(199, 'Sector claimed by Norway', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(200, 'Unclaimed Sector', 8, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(201, 'Barbuda', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(202, 'Saint George', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(203, 'Saint John', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(204, 'Saint Mary', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(205, 'Saint Paul', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(206, 'Saint Peter', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(207, 'Saint Philip', 9, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(208, 'Buenos Aires', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(209, 'Catamarca', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(210, 'Chaco', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(211, 'Chubut', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(212, 'Cordoba', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(213, 'Corrientes', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(214, 'Distrito Federal', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(215, 'Entre Rios', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(216, 'Formosa', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(217, 'Jujuy', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(218, 'La Pampa', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(219, 'La Rioja', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(220, 'Mendoza', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(221, 'Misiones', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(222, 'Neuquen', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(223, 'Rio Negro', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(224, 'Salta', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(225, 'San Juan', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(226, 'San Luis', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(227, 'Santa Cruz', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(228, 'Santa Fe', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(229, 'Santiago del Estero', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(230, 'Tierra del Fuego', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(231, 'Tucuman', 10, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(232, 'Aragatsotn', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(233, 'Ararat', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(234, 'Armavir', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(235, 'Gegharkunik', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(236, 'Kotaik', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(237, 'Lori', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(238, 'Shirak', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(239, 'Stepanakert', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(240, 'Syunik', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(241, 'Tavush', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(242, 'Vayots Dzor', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(243, 'Yerevan', 11, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(244, 'Aruba', 12, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(245, 'Auckland', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(246, 'Australian Capital Territory', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(247, 'Balgowlah', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(248, 'Balmain', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(249, 'Bankstown', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(250, 'Baulkham Hills', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(251, 'Bonnet Bay', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(252, 'Camberwell', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(253, 'Carole Park', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(254, 'Castle Hill', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(255, 'Caulfield', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(256, 'Chatswood', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(257, 'Cheltenham', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(258, 'Cherrybrook', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(259, 'Clayton', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(260, 'Collingwood', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(261, 'Frenchs Forest', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(262, 'Hawthorn', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(263, 'Jannnali', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(264, 'Knoxfield', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(265, 'Melbourne', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(266, 'New South Wales', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(267, 'Northern Territory', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(268, 'Perth', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(269, 'Queensland', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(270, 'South Australia', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(271, 'Tasmania', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(272, 'Templestowe', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(273, 'Victoria', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(274, 'Werribee south', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(275, 'Western Australia', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(276, 'Wheeler', 13, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(277, 'Bundesland Salzburg', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(278, 'Bundesland Steiermark', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(279, 'Bundesland Tirol', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(280, 'Burgenland', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(281, 'Carinthia', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(282, 'Karnten', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(283, 'Liezen', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(284, 'Lower Austria', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(285, 'Niederosterreich', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(286, 'Oberosterreich', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(287, 'Salzburg', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(288, 'Schleswig-Holstein', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(289, 'Steiermark', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(290, 'Styria', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(291, 'Tirol', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(292, 'Upper Austria', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(293, 'Vorarlberg', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(294, 'Wien', 14, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(295, 'Abseron', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(296, 'Baki Sahari', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(297, 'Ganca', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(298, 'Ganja', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(299, 'Kalbacar', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(300, 'Lankaran', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(301, 'Mil-Qarabax', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(302, 'Mugan-Salyan', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(303, 'Nagorni-Qarabax', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(304, 'Naxcivan', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(305, 'Priaraks', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(306, 'Qazax', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(307, 'Saki', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(308, 'Sirvan', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(309, 'Xacmaz', 15, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(310, 'Abaco', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(311, 'Acklins Island', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(312, 'Andros', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(313, 'Berry Islands', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(314, 'Biminis', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(315, 'Cat Island', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(316, 'Crooked Island', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(317, 'Eleuthera', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(318, 'Exuma and Cays', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(319, 'Grand Bahama', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(320, 'Inagua Islands', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(321, 'Long Island', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(322, 'Mayaguana', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(323, 'New Providence', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(324, 'Ragged Island', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(325, 'Rum Cay', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(326, 'San Salvador', 16, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(327, '\'Isa', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(328, 'Badiyah', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(329, 'Hidd', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(330, 'Jidd Hafs', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(331, 'Mahama', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(332, 'Manama', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(333, 'Sitrah', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(334, 'al-Manamah', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(335, 'al-Muharraq', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(336, 'ar-Rifa\'a', 17, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(337, 'Bagar Hat', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(338, 'Bandarban', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(339, 'Barguna', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(340, 'Barisal', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(341, 'Bhola', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(342, 'Bogora', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(343, 'Brahman Bariya', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(344, 'Chandpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(345, 'Chattagam', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(346, 'Chittagong Division', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(347, 'Chuadanga', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(348, 'Dhaka', 18, 1, '2021-04-06 01:11:20', '2021-12-12 18:26:21', NULL),
(349, 'Dinajpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(350, 'Faridpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(351, 'Feni', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(352, 'Gaybanda', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(353, 'Gazipur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(354, 'Gopalganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(355, 'Habiganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(356, 'Jaipur Hat', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(357, 'Jamalpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(358, 'Jessor', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(359, 'Jhalakati', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(360, 'Jhanaydah', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(361, 'Khagrachhari', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(362, 'Khulna', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(363, 'Kishorganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(364, 'Koks Bazar', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(365, 'Komilla', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(366, 'Kurigram', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(367, 'Kushtiya', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(368, 'Lakshmipur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(369, 'Lalmanir Hat', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(370, 'Madaripur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(371, 'Magura', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(372, 'Maimansingh', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(373, 'Manikganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(374, 'Maulvi Bazar', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(375, 'Meherpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(376, 'Munshiganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(377, 'Naral', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(378, 'Narayanganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(379, 'Narsingdi', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(380, 'Nator', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(381, 'Naugaon', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(382, 'Nawabganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(383, 'Netrakona', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(384, 'Nilphamari', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(385, 'Noakhali', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(386, 'Pabna', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(387, 'Panchagarh', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(388, 'Patuakhali', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(389, 'Pirojpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(390, 'Rajbari', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(391, 'Rajshahi', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(392, 'Rangamati', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(393, 'Rangpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(394, 'Satkhira', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(395, 'Shariatpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(396, 'Sherpur', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(397, 'Silhat', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(398, 'Sirajganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(399, 'Sunamganj', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(400, 'Tangayal', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(401, 'Thakurgaon', 18, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(402, 'Christ Church', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(403, 'Saint Andrew', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(404, 'Saint George', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(405, 'Saint James', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(406, 'Saint John', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(407, 'Saint Joseph', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(408, 'Saint Lucy', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(409, 'Saint Michael', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(410, 'Saint Peter', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(411, 'Saint Philip', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(412, 'Saint Thomas', 19, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(413, 'Brest', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(414, 'Homjel\'', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(415, 'Hrodna', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(416, 'Mahiljow', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(417, 'Mahilyowskaya Voblasts', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(418, 'Minsk', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(419, 'Minskaja Voblasts\'', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(420, 'Petrik', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(421, 'Vicebsk', 20, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(422, 'Antwerpen', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(423, 'Berchem', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(424, 'Brabant', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(425, 'Brabant Wallon', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(426, 'Brussel', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(427, 'East Flanders', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(428, 'Hainaut', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(429, 'Liege', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(430, 'Limburg', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(431, 'Luxembourg', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(432, 'Namur', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(433, 'Ontario', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(434, 'Oost-Vlaanderen', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(435, 'Provincie Brabant', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(436, 'Vlaams-Brabant', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(437, 'Wallonne', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(438, 'West-Vlaanderen', 21, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(439, 'Belize', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(440, 'Cayo', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(441, 'Corozal', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(442, 'Orange Walk', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(443, 'Stann Creek', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(444, 'Toledo', 22, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(445, 'Alibori', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(446, 'Atacora', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(447, 'Atlantique', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(448, 'Borgou', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(449, 'Collines', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(450, 'Couffo', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(451, 'Donga', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(452, 'Littoral', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(453, 'Mono', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(454, 'Oueme', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(455, 'Plateau', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(456, 'Zou', 23, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(457, 'Hamilton', 24, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(458, 'Saint George', 24, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(459, 'Bumthang', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(460, 'Chhukha', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(461, 'Chirang', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(462, 'Daga', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(463, 'Geylegphug', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(464, 'Ha', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(465, 'Lhuntshi', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(466, 'Mongar', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(467, 'Pemagatsel', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(468, 'Punakha', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(469, 'Rinpung', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(470, 'Samchi', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(471, 'Samdrup Jongkhar', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(472, 'Shemgang', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(473, 'Tashigang', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(474, 'Timphu', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(475, 'Tongsa', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(476, 'Wangdiphodrang', 25, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(477, 'Beni', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(478, 'Chuquisaca', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(479, 'Cochabamba', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(480, 'La Paz', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(481, 'Oruro', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(482, 'Pando', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(483, 'Potosi', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(484, 'Santa Cruz', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(485, 'Tarija', 26, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(486, 'Federacija Bosna i Hercegovina', 27, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(487, 'Republika Srpska', 27, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(488, 'Central Bobonong', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(489, 'Central Boteti', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(490, 'Central Mahalapye', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(491, 'Central Serowe-Palapye', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(492, 'Central Tutume', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(493, 'Chobe', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(494, 'Francistown', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(495, 'Gaborone', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(496, 'Ghanzi', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(497, 'Jwaneng', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(498, 'Kgalagadi North', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(499, 'Kgalagadi South', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(500, 'Kgatleng', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(501, 'Kweneng', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(502, 'Lobatse', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(503, 'Ngamiland', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(504, 'Ngwaketse', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(505, 'North East', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(506, 'Okavango', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(507, 'Orapa', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(508, 'Selibe Phikwe', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(509, 'South East', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(510, 'Sowa', 28, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(511, 'Bouvet Island', 29, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(512, 'Acre', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(513, 'Alagoas', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(514, 'Amapa', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(515, 'Amazonas', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(516, 'Bahia', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(517, 'Ceara', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(518, 'Distrito Federal', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(519, 'Espirito Santo', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(520, 'Estado de Sao Paulo', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(521, 'Goias', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(522, 'Maranhao', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(523, 'Mato Grosso', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(524, 'Mato Grosso do Sul', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(525, 'Minas Gerais', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(526, 'Para', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(527, 'Paraiba', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(528, 'Parana', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(529, 'Pernambuco', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(530, 'Piaui', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(531, 'Rio Grande do Norte', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(532, 'Rio Grande do Sul', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(533, 'Rio de Janeiro', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(534, 'Rondonia', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(535, 'Roraima', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(536, 'Santa Catarina', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(537, 'Sao Paulo', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(538, 'Sergipe', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(539, 'Tocantins', 30, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(540, 'British Indian Ocean Territory', 31, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(541, 'Belait', 32, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(542, 'Brunei-Muara', 32, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(543, 'Temburong', 32, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(544, 'Tutong', 32, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(545, 'Blagoevgrad', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(546, 'Burgas', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(547, 'Dobrich', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(548, 'Gabrovo', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(549, 'Haskovo', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(550, 'Jambol', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(551, 'Kardzhali', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(552, 'Kjustendil', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(553, 'Lovech', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(554, 'Montana', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(555, 'Oblast Sofiya-Grad', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(556, 'Pazardzhik', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(557, 'Pernik', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(558, 'Pleven', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(559, 'Plovdiv', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(560, 'Razgrad', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(561, 'Ruse', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(562, 'Shumen', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(563, 'Silistra', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(564, 'Sliven', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(565, 'Smoljan', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(566, 'Sofija grad', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(567, 'Sofijska oblast', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(568, 'Stara Zagora', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(569, 'Targovishte', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(570, 'Varna', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(571, 'Veliko Tarnovo', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(572, 'Vidin', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(573, 'Vraca', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(574, 'Yablaniza', 33, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(575, 'Bale', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(576, 'Bam', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(577, 'Bazega', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(578, 'Bougouriba', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(579, 'Boulgou', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(580, 'Boulkiemde', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(581, 'Comoe', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(582, 'Ganzourgou', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(583, 'Gnagna', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(584, 'Gourma', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(585, 'Houet', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(586, 'Ioba', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(587, 'Kadiogo', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(588, 'Kenedougou', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(589, 'Komandjari', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(590, 'Kompienga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(591, 'Kossi', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(592, 'Kouritenga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(593, 'Kourweogo', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(594, 'Leraba', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(595, 'Mouhoun', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(596, 'Nahouri', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(597, 'Namentenga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(598, 'Noumbiel', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(599, 'Oubritenga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(600, 'Oudalan', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(601, 'Passore', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(602, 'Poni', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(603, 'Sanguie', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(604, 'Sanmatenga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(605, 'Seno', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(606, 'Sissili', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(607, 'Soum', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(608, 'Sourou', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(609, 'Tapoa', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(610, 'Tuy', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(611, 'Yatenga', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(612, 'Zondoma', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(613, 'Zoundweogo', 34, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(614, 'Bubanza', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(615, 'Bujumbura', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(616, 'Bururi', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(617, 'Cankuzo', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(618, 'Cibitoke', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(619, 'Gitega', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(620, 'Karuzi', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(621, 'Kayanza', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(622, 'Kirundo', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(623, 'Makamba', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(624, 'Muramvya', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(625, 'Muyinga', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(626, 'Ngozi', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(627, 'Rutana', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(628, 'Ruyigi', 35, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(629, 'Banteay Mean Chey', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(630, 'Bat Dambang', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(631, 'Kampong Cham', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(632, 'Kampong Chhnang', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(633, 'Kampong Spoeu', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(634, 'Kampong Thum', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(635, 'Kampot', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(636, 'Kandal', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(637, 'Kaoh Kong', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(638, 'Kracheh', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(639, 'Krong Kaeb', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(640, 'Krong Pailin', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(641, 'Krong Preah Sihanouk', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(642, 'Mondol Kiri', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(643, 'Otdar Mean Chey', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(644, 'Phnum Penh', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(645, 'Pousat', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(646, 'Preah Vihear', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(647, 'Prey Veaeng', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(648, 'Rotanak Kiri', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(649, 'Siem Reab', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(650, 'Stueng Traeng', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(651, 'Svay Rieng', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(652, 'Takaev', 36, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(653, 'Adamaoua', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(654, 'Centre', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(655, 'Est', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(656, 'Littoral', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(657, 'Nord', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(658, 'Nord Extreme', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(659, 'Nordouest', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(660, 'Ouest', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(661, 'Sud', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(662, 'Sudouest', 37, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(663, 'Alberta', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(664, 'British Columbia', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(665, 'Manitoba', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(666, 'New Brunswick', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(667, 'Newfoundland and Labrador', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(668, 'Northwest Territories', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(669, 'Nova Scotia', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(670, 'Nunavut', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(671, 'Ontario', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(672, 'Prince Edward Island', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(673, 'Quebec', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(674, 'Saskatchewan', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(675, 'Yukon', 38, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(676, 'Boavista', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(677, 'Brava', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(678, 'Fogo', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(679, 'Maio', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(680, 'Sal', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(681, 'Santo Antao', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(682, 'Sao Nicolau', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(683, 'Sao Tiago', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(684, 'Sao Vicente', 39, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(685, 'Grand Cayman', 40, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(686, 'Bamingui-Bangoran', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(687, 'Bangui', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(688, 'Basse-Kotto', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(689, 'Haut-Mbomou', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(690, 'Haute-Kotto', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(691, 'Kemo', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(692, 'Lobaye', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(693, 'Mambere-Kadei', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(694, 'Mbomou', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(695, 'Nana-Gribizi', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(696, 'Nana-Mambere', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(697, 'Ombella Mpoko', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(698, 'Ouaka', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(699, 'Ouham', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(700, 'Ouham-Pende', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(701, 'Sangha-Mbaere', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(702, 'Vakaga', 41, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(703, 'Batha', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(704, 'Biltine', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(705, 'Bourkou-Ennedi-Tibesti', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(706, 'Chari-Baguirmi', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(707, 'Guera', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(708, 'Kanem', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(709, 'Lac', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(710, 'Logone Occidental', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(711, 'Logone Oriental', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(712, 'Mayo-Kebbi', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(713, 'Moyen-Chari', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(714, 'Ouaddai', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(715, 'Salamat', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(716, 'Tandjile', 42, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(717, 'Aisen', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(718, 'Antofagasta', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(719, 'Araucania', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(720, 'Atacama', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(721, 'Bio Bio', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(722, 'Coquimbo', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(723, 'Libertador General Bernardo O\'', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(724, 'Los Lagos', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(725, 'Magellanes', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(726, 'Maule', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(727, 'Metropolitana', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(728, 'Metropolitana de Santiago', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(729, 'Tarapaca', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(730, 'Valparaiso', 43, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(731, 'Anhui', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(734, 'Aomen', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(735, 'Beijing', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(736, 'Beijing Shi', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(737, 'Chongqing', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(738, 'Fujian', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(740, 'Gansu', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(741, 'Guangdong', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(743, 'Guangxi', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(744, 'Guizhou', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(745, 'Hainan', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(746, 'Hebei', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(747, 'Heilongjiang', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(748, 'Henan', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(749, 'Hubei', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(750, 'Hunan', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(751, 'Jiangsu', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(753, 'Jiangxi', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(754, 'Jilin', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(755, 'Liaoning', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(757, 'Nei Monggol', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(758, 'Ningxia Hui', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(759, 'Qinghai', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(760, 'Shaanxi', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(761, 'Shandong', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(763, 'Shanghai', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(764, 'Shanxi', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(765, 'Sichuan', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(766, 'Tianjin', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(767, 'Xianggang', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(768, 'Xinjiang', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(769, 'Xizang', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(770, 'Yunnan', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(771, 'Zhejiang', 44, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(773, 'Christmas Island', 45, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(774, 'Cocos (Keeling) Islands', 46, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(775, 'Amazonas', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(776, 'Antioquia', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(777, 'Arauca', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(778, 'Atlantico', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(779, 'Bogota', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(780, 'Bolivar', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(781, 'Boyaca', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(782, 'Caldas', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(783, 'Caqueta', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(784, 'Casanare', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(785, 'Cauca', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(786, 'Cesar', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(787, 'Choco', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(788, 'Cordoba', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(789, 'Cundinamarca', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(790, 'Guainia', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(791, 'Guaviare', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(792, 'Huila', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(793, 'La Guajira', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(794, 'Magdalena', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(795, 'Meta', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(796, 'Narino', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(797, 'Norte de Santander', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(798, 'Putumayo', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(799, 'Quindio', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(800, 'Risaralda', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(801, 'San Andres y Providencia', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(802, 'Santander', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(803, 'Sucre', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(804, 'Tolima', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(805, 'Valle del Cauca', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(806, 'Vaupes', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(807, 'Vichada', 47, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(808, 'Mwali', 48, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(809, 'Njazidja', 48, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(810, 'Nzwani', 48, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(811, 'Bouenza', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(812, 'Brazzaville', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(813, 'Cuvette', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(814, 'Kouilou', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(815, 'Lekoumou', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(816, 'Likouala', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(817, 'Niari', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(818, 'Plateaux', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(819, 'Pool', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(820, 'Sangha', 49, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(821, 'Bandundu', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(822, 'Bas-Congo', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(823, 'Equateur', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(824, 'Haut-Congo', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(825, 'Kasai-Occidental', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(826, 'Kasai-Oriental', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(827, 'Katanga', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(828, 'Kinshasa', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(829, 'Maniema', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(830, 'Nord-Kivu', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(831, 'Sud-Kivu', 50, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(832, 'Aitutaki', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(833, 'Atiu', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(834, 'Mangaia', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(835, 'Manihiki', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(836, 'Mauke', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(837, 'Mitiaro', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(838, 'Nassau', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(839, 'Pukapuka', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(840, 'Rakahanga', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(841, 'Rarotonga', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(842, 'Tongareva', 51, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(843, 'Alajuela', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(844, 'Cartago', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(845, 'Guanacaste', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(846, 'Heredia', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(847, 'Limon', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(848, 'Puntarenas', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(849, 'San Jose', 52, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(850, 'Abidjan', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(851, 'Agneby', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(852, 'Bafing', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(853, 'Denguele', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(854, 'Dix-huit Montagnes', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(855, 'Fromager', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(856, 'Haut-Sassandra', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(857, 'Lacs', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(858, 'Lagunes', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(859, 'Marahoue', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(860, 'Moyen-Cavally', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(861, 'Moyen-Comoe', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(862, 'N\'zi-Comoe', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(863, 'Sassandra', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(864, 'Savanes', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(865, 'Sud-Bandama', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(866, 'Sud-Comoe', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(867, 'Vallee du Bandama', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(868, 'Worodougou', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(869, 'Zanzan', 53, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(870, 'Bjelovar-Bilogora', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(871, 'Dubrovnik-Neretva', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(872, 'Grad Zagreb', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(873, 'Istra', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(874, 'Karlovac', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(875, 'Koprivnica-Krizhevci', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(876, 'Krapina-Zagorje', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(877, 'Lika-Senj', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(878, 'Medhimurje', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(879, 'Medimurska Zupanija', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(880, 'Osijek-Baranja', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(881, 'Osjecko-Baranjska Zupanija', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(882, 'Pozhega-Slavonija', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(883, 'Primorje-Gorski Kotar', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(884, 'Shibenik-Knin', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(885, 'Sisak-Moslavina', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(886, 'Slavonski Brod-Posavina', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(887, 'Split-Dalmacija', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(888, 'Varazhdin', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(889, 'Virovitica-Podravina', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(890, 'Vukovar-Srijem', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(891, 'Zadar', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(892, 'Zagreb', 54, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(893, 'Camaguey', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(894, 'Ciego de Avila', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(895, 'Cienfuegos', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(896, 'Ciudad de la Habana', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(897, 'Granma', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(898, 'Guantanamo', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(899, 'Habana', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(900, 'Holguin', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(901, 'Isla de la Juventud', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(902, 'La Habana', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(903, 'Las Tunas', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(904, 'Matanzas', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(905, 'Pinar del Rio', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(906, 'Sancti Spiritus', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(907, 'Santiago de Cuba', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(908, 'Villa Clara', 55, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(909, 'Government controlled area', 56, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(910, 'Limassol', 56, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(911, 'Nicosia District', 56, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(912, 'Paphos', 56, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(913, 'Turkish controlled area', 56, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(914, 'Central Bohemian', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(915, 'Frycovice', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(916, 'Jihocesky Kraj', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(917, 'Jihochesky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(918, 'Jihomoravsky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(919, 'Karlovarsky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(920, 'Klecany', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(921, 'Kralovehradecky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(922, 'Liberecky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(923, 'Lipov', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(924, 'Moravskoslezsky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(925, 'Olomoucky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(926, 'Olomoucky Kraj', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(927, 'Pardubicky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(928, 'Plzensky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(929, 'Praha', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(930, 'Rajhrad', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(931, 'Smirice', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(932, 'South Moravian', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(933, 'Straz nad Nisou', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(934, 'Stredochesky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(935, 'Unicov', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(936, 'Ustecky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(937, 'Valletta', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(938, 'Velesin', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(939, 'Vysochina', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(940, 'Zlinsky', 57, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(941, 'Arhus', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(942, 'Bornholm', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(943, 'Frederiksborg', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(944, 'Fyn', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(945, 'Hovedstaden', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(946, 'Kobenhavn', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(947, 'Kobenhavns Amt', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(948, 'Kobenhavns Kommune', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(949, 'Nordjylland', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(950, 'Ribe', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(951, 'Ringkobing', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(952, 'Roervig', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(953, 'Roskilde', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(954, 'Roslev', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(955, 'Sjaelland', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(956, 'Soeborg', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(957, 'Sonderjylland', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(958, 'Storstrom', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(959, 'Syddanmark', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(960, 'Toelloese', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(961, 'Vejle', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(962, 'Vestsjalland', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(963, 'Viborg', 58, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(964, '\'Ali Sabih', 59, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(965, 'Dikhil', 59, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(966, 'Jibuti', 59, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(967, 'Tajurah', 59, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(968, 'Ubuk', 59, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(969, 'Saint Andrew', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(970, 'Saint David', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(971, 'Saint George', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(972, 'Saint John', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(973, 'Saint Joseph', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(974, 'Saint Luke', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(975, 'Saint Mark', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(976, 'Saint Patrick', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(977, 'Saint Paul', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(978, 'Saint Peter', 60, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(979, 'Azua', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(980, 'Bahoruco', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(981, 'Barahona', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(982, 'Dajabon', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(983, 'Distrito Nacional', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(984, 'Duarte', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(985, 'El Seybo', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(986, 'Elias Pina', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(987, 'Espaillat', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(988, 'Hato Mayor', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(989, 'Independencia', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(990, 'La Altagracia', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(991, 'La Romana', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(992, 'La Vega', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(993, 'Maria Trinidad Sanchez', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(994, 'Monsenor Nouel', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(995, 'Monte Cristi', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(996, 'Monte Plata', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(997, 'Pedernales', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(998, 'Peravia', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(999, 'Puerto Plata', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1000, 'Salcedo', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1001, 'Samana', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1002, 'San Cristobal', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1003, 'San Juan', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1004, 'San Pedro de Macoris', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1005, 'Sanchez Ramirez', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1006, 'Santiago', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1007, 'Santiago Rodriguez', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1008, 'Valverde', 61, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1009, 'Aileu', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1010, 'Ainaro', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1011, 'Ambeno', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1012, 'Baucau', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1013, 'Bobonaro', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1014, 'Cova Lima', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1015, 'Dili', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1016, 'Ermera', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1017, 'Lautem', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1018, 'Liquica', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1019, 'Manatuto', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1020, 'Manufahi', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1021, 'Viqueque', 62, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1022, 'Azuay', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1023, 'Bolivar', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1024, 'Canar', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1025, 'Carchi', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1026, 'Chimborazo', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1027, 'Cotopaxi', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1028, 'El Oro', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1029, 'Esmeraldas', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1030, 'Galapagos', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1031, 'Guayas', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1032, 'Imbabura', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1033, 'Loja', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1034, 'Los Rios', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1035, 'Manabi', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1036, 'Morona Santiago', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1037, 'Napo', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1038, 'Orellana', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1039, 'Pastaza', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1040, 'Pichincha', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1041, 'Sucumbios', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1042, 'Tungurahua', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1043, 'Zamora Chinchipe', 63, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1044, 'Aswan', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1045, 'Asyut', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1046, 'Bani Suwayf', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1047, 'Bur Sa\'id', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1048, 'Cairo', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1049, 'Dumyat', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1050, 'Kafr-ash-Shaykh', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1051, 'Matruh', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1052, 'Muhafazat ad Daqahliyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1053, 'Muhafazat al Fayyum', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1054, 'Muhafazat al Gharbiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1055, 'Muhafazat al Iskandariyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1056, 'Muhafazat al Qahirah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1057, 'Qina', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1058, 'Sawhaj', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1059, 'Sina al-Janubiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1060, 'Sina ash-Shamaliyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1061, 'ad-Daqahliyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1062, 'al-Bahr-al-Ahmar', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1063, 'al-Buhayrah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1064, 'al-Fayyum', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1065, 'al-Gharbiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1066, 'al-Iskandariyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1067, 'al-Ismailiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1068, 'al-Jizah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1069, 'al-Minufiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1070, 'al-Minya', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1071, 'al-Qahira', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1072, 'al-Qalyubiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1073, 'al-Uqsur', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1074, 'al-Wadi al-Jadid', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1075, 'as-Suways', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1076, 'ash-Sharqiyah', 64, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1077, 'Ahuachapan', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1078, 'Cabanas', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1079, 'Chalatenango', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1080, 'Cuscatlan', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1081, 'La Libertad', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1082, 'La Paz', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1083, 'La Union', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1084, 'Morazan', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1085, 'San Miguel', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1086, 'San Salvador', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1087, 'San Vicente', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1088, 'Santa Ana', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1089, 'Sonsonate', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1090, 'Usulutan', 65, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1091, 'Annobon', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1092, 'Bioko Norte', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1093, 'Bioko Sur', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1094, 'Centro Sur', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1095, 'Kie-Ntem', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1096, 'Litoral', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1097, 'Wele-Nzas', 66, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1098, 'Anseba', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1099, 'Debub', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1100, 'Debub-Keih-Bahri', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1101, 'Gash-Barka', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1102, 'Maekel', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1103, 'Semien-Keih-Bahri', 67, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1104, 'Harju', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1105, 'Hiiu', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1106, 'Ida-Viru', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1107, 'Jarva', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1108, 'Jogeva', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1109, 'Laane', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1110, 'Laane-Viru', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1111, 'Parnu', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1112, 'Polva', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1113, 'Rapla', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1114, 'Saare', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1115, 'Tartu', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1116, 'Valga', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1117, 'Viljandi', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1118, 'Voru', 68, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1119, 'Addis Abeba', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1120, 'Afar', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1121, 'Amhara', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1122, 'Benishangul', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1123, 'Diredawa', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1124, 'Gambella', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1125, 'Harar', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1126, 'Jigjiga', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1127, 'Mekele', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1128, 'Oromia', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1129, 'Somali', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1130, 'Southern', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1131, 'Tigray', 69, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1132, 'Christmas Island', 70, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1133, 'Cocos Islands', 70, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1134, 'Coral Sea Islands', 70, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1135, 'Falkland Islands', 71, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1136, 'South Georgia', 71, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1137, 'Klaksvik', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1138, 'Nor ara Eysturoy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1139, 'Nor oy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1140, 'Sandoy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1141, 'Streymoy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1142, 'Su uroy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1143, 'Sy ra Eysturoy', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1144, 'Torshavn', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1145, 'Vaga', 72, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1146, 'Central', 73, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1147, 'Eastern', 73, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1148, 'Northern', 73, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1149, 'South Pacific', 73, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1150, 'Western', 73, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1151, 'Ahvenanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1152, 'Etela-Karjala', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1153, 'Etela-Pohjanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1154, 'Etela-Savo', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1155, 'Etela-Suomen Laani', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1156, 'Ita-Suomen Laani', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1157, 'Ita-Uusimaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1158, 'Kainuu', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1159, 'Kanta-Hame', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1160, 'Keski-Pohjanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1161, 'Keski-Suomi', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1162, 'Kymenlaakso', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1163, 'Lansi-Suomen Laani', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1164, 'Lappi', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1165, 'Northern Savonia', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1166, 'Ostrobothnia', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1167, 'Oulun Laani', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1168, 'Paijat-Hame', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1169, 'Pirkanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1170, 'Pohjanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1171, 'Pohjois-Karjala', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1172, 'Pohjois-Pohjanmaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1173, 'Pohjois-Savo', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1174, 'Saarijarvi', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1175, 'Satakunta', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1176, 'Southern Savonia', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1177, 'Tavastia Proper', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1178, 'Uleaborgs Lan', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1179, 'Uusimaa', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1180, 'Varsinais-Suomi', 74, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1181, 'Ain', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1182, 'Aisne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1183, 'Albi Le Sequestre', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1184, 'Allier', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1185, 'Alpes-Cote dAzur', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1186, 'Alpes-Maritimes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1187, 'Alpes-de-Haute-Provence', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1188, 'Alsace', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1189, 'Aquitaine', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1190, 'Ardeche', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1191, 'Ardennes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1192, 'Ariege', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1193, 'Aube', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1194, 'Aude', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1195, 'Auvergne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1196, 'Aveyron', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1197, 'Bas-Rhin', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1198, 'Basse-Normandie', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1199, 'Bouches-du-Rhone', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1200, 'Bourgogne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1201, 'Bretagne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1202, 'Brittany', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1203, 'Burgundy', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1204, 'Calvados', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1205, 'Cantal', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1206, 'Cedex', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1207, 'Centre', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1208, 'Charente', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1209, 'Charente-Maritime', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1210, 'Cher', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1211, 'Correze', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1212, 'Corse-du-Sud', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1213, 'Cote-d\'Or', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1214, 'Cotes-d\'Armor', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1215, 'Creuse', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1216, 'Crolles', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1217, 'Deux-Sevres', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1218, 'Dordogne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1219, 'Doubs', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1220, 'Drome', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1221, 'Essonne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1222, 'Eure', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1223, 'Eure-et-Loir', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1224, 'Feucherolles', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1225, 'Finistere', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1226, 'Franche-Comte', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1227, 'Gard', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1228, 'Gers', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1229, 'Gironde', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1230, 'Haut-Rhin', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1231, 'Haute-Corse', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1232, 'Haute-Garonne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1233, 'Haute-Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1234, 'Haute-Marne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1235, 'Haute-Saone', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1236, 'Haute-Savoie', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1237, 'Haute-Vienne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1238, 'Hautes-Alpes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1239, 'Hautes-Pyrenees', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1240, 'Hauts-de-Seine', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1241, 'Herault', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1242, 'Ile-de-France', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1243, 'Ille-et-Vilaine', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1244, 'Indre', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1245, 'Indre-et-Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1246, 'Isere', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1247, 'Jura', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1248, 'Klagenfurt', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1249, 'Landes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1250, 'Languedoc-Roussillon', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1251, 'Larcay', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1252, 'Le Castellet', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1253, 'Le Creusot', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1254, 'Limousin', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1255, 'Loir-et-Cher', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1256, 'Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1257, 'Loire-Atlantique', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1258, 'Loiret', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1259, 'Lorraine', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1260, 'Lot', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1261, 'Lot-et-Garonne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1262, 'Lower Normandy', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1263, 'Lozere', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1264, 'Maine-et-Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1265, 'Manche', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1266, 'Marne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1267, 'Mayenne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1268, 'Meurthe-et-Moselle', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1269, 'Meuse', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1270, 'Midi-Pyrenees', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1271, 'Morbihan', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1272, 'Moselle', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1273, 'Nievre', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1274, 'Nord', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1275, 'Nord-Pas-de-Calais', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1276, 'Oise', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1277, 'Orne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1278, 'Paris', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1279, 'Pas-de-Calais', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1280, 'Pays de la Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1281, 'Pays-de-la-Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1282, 'Picardy', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1283, 'Puy-de-Dome', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1284, 'Pyrenees-Atlantiques', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1285, 'Pyrenees-Orientales', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1286, 'Quelmes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1287, 'Rhone', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1288, 'Rhone-Alpes', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1289, 'Saint Ouen', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1290, 'Saint Viatre', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1291, 'Saone-et-Loire', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1292, 'Sarthe', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1293, 'Savoie', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1294, 'Seine-Maritime', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1295, 'Seine-Saint-Denis', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1296, 'Seine-et-Marne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1297, 'Somme', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1298, 'Sophia Antipolis', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1299, 'Souvans', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1300, 'Tarn', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1301, 'Tarn-et-Garonne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1302, 'Territoire de Belfort', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1303, 'Treignac', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1304, 'Upper Normandy', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1305, 'Val-d\'Oise', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1306, 'Val-de-Marne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1307, 'Var', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1308, 'Vaucluse', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1309, 'Vellise', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1310, 'Vendee', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1311, 'Vienne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1312, 'Vosges', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1313, 'Yonne', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1314, 'Yvelines', 75, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1315, 'Cayenne', 76, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1316, 'Saint-Laurent-du-Maroni', 76, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1317, 'Iles du Vent', 77, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1318, 'Iles sous le Vent', 77, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1319, 'Marquesas', 77, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1320, 'Tuamotu', 77, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1321, 'Tubuai', 77, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1322, 'Amsterdam', 78, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1323, 'Crozet Islands', 78, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1324, 'Kerguelen', 78, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1325, 'Estuaire', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1326, 'Haut-Ogooue', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1327, 'Moyen-Ogooue', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1328, 'Ngounie', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1329, 'Nyanga', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1330, 'Ogooue-Ivindo', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1331, 'Ogooue-Lolo', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1332, 'Ogooue-Maritime', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1333, 'Woleu-Ntem', 79, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1334, 'Banjul', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1335, 'Basse', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1336, 'Brikama', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1337, 'Janjanbureh', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1338, 'Kanifing', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1339, 'Kerewan', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1340, 'Kuntaur', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1341, 'Mansakonko', 80, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1342, 'Abhasia', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1343, 'Ajaria', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1344, 'Guria', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1345, 'Imereti', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1346, 'Kaheti', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1347, 'Kvemo Kartli', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1348, 'Mcheta-Mtianeti', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1349, 'Racha', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1350, 'Samagrelo-Zemo Svaneti', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1351, 'Samche-Zhavaheti', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1352, 'Shida Kartli', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1353, 'Tbilisi', 81, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1354, 'Auvergne', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1355, 'Baden-Wurttemberg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1356, 'Bavaria', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1357, 'Bayern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1358, 'Beilstein Wurtt', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1359, 'Berlin', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1360, 'Brandenburg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1361, 'Bremen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1362, 'Dreisbach', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1363, 'Freistaat Bayern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1364, 'Hamburg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1365, 'Hannover', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1366, 'Heroldstatt', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1367, 'Hessen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1368, 'Kortenberg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1369, 'Laasdorf', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1370, 'Land Baden-Wurttemberg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1371, 'Land Bayern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1372, 'Land Brandenburg', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1373, 'Land Hessen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1374, 'Land Mecklenburg-Vorpommern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1375, 'Land Nordrhein-Westfalen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1376, 'Land Rheinland-Pfalz', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1377, 'Land Sachsen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1378, 'Land Sachsen-Anhalt', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1379, 'Land Thuringen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1380, 'Lower Saxony', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1381, 'Mecklenburg-Vorpommern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1382, 'Mulfingen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1383, 'Munich', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1384, 'Neubeuern', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1385, 'Niedersachsen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1386, 'Noord-Holland', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1387, 'Nordrhein-Westfalen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1388, 'North Rhine-Westphalia', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1389, 'Osterode', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1390, 'Rheinland-Pfalz', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1391, 'Rhineland-Palatinate', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1392, 'Saarland', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1393, 'Sachsen', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1394, 'Sachsen-Anhalt', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1395, 'Saxony', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1396, 'Schleswig-Holstein', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1397, 'Thuringia', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1398, 'Webling', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1399, 'Weinstrabe', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1400, 'schlobborn', 82, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1401, 'Ashanti', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1402, 'Brong-Ahafo', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1403, 'Central', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1404, 'Eastern', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1405, 'Greater Accra', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1406, 'Northern', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1407, 'Upper East', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1408, 'Upper West', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1409, 'Volta', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1410, 'Western', 83, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1411, 'Gibraltar', 84, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1412, 'Acharnes', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1413, 'Ahaia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1414, 'Aitolia kai Akarnania', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1415, 'Argolis', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1416, 'Arkadia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1417, 'Arta', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1418, 'Attica', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1419, 'Attiki', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1420, 'Ayion Oros', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1421, 'Crete', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1422, 'Dodekanisos', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1423, 'Drama', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1424, 'Evia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1425, 'Evritania', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1426, 'Evros', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1427, 'Evvoia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1428, 'Florina', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1429, 'Fokis', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1430, 'Fthiotis', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1431, 'Grevena', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1432, 'Halandri', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1433, 'Halkidiki', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1434, 'Hania', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1435, 'Heraklion', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1436, 'Hios', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1437, 'Ilia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1438, 'Imathia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1439, 'Ioannina', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1440, 'Iraklion', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1441, 'Karditsa', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1442, 'Kastoria', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1443, 'Kavala', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1444, 'Kefallinia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1445, 'Kerkira', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1446, 'Kiklades', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1447, 'Kilkis', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1448, 'Korinthia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1449, 'Kozani', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1450, 'Lakonia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1451, 'Larisa', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1452, 'Lasithi', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1453, 'Lesvos', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1454, 'Levkas', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1455, 'Magnisia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1456, 'Messinia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1457, 'Nomos Attikis', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1458, 'Nomos Zakynthou', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1459, 'Pella', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1460, 'Pieria', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1461, 'Piraios', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1462, 'Preveza', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1463, 'Rethimni', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1464, 'Rodopi', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1465, 'Samos', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1466, 'Serrai', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1467, 'Thesprotia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1468, 'Thessaloniki', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1469, 'Trikala', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1470, 'Voiotia', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1471, 'West Greece', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1472, 'Xanthi', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1473, 'Zakinthos', 85, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1474, 'Aasiaat', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1475, 'Ammassalik', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1476, 'Illoqqortoormiut', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1477, 'Ilulissat', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1478, 'Ivittuut', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1479, 'Kangaatsiaq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1480, 'Maniitsoq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1481, 'Nanortalik', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1482, 'Narsaq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1483, 'Nuuk', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1484, 'Paamiut', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1485, 'Qaanaaq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1486, 'Qaqortoq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1487, 'Qasigiannguit', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1488, 'Qeqertarsuaq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1489, 'Sisimiut', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1490, 'Udenfor kommunal inddeling', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1491, 'Upernavik', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1492, 'Uummannaq', 86, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1493, 'Carriacou-Petite Martinique', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1494, 'Saint Andrew', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1495, 'Saint Davids', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1496, 'Saint George\'s', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1497, 'Saint John', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1498, 'Saint Mark', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1499, 'Saint Patrick', 87, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1500, 'Basse-Terre', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1501, 'Grande-Terre', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1502, 'Iles des Saintes', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1503, 'La Desirade', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1504, 'Marie-Galante', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1505, 'Saint Barthelemy', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1506, 'Saint Martin', 88, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1507, 'Agana Heights', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1508, 'Agat', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1509, 'Barrigada', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1510, 'Chalan-Pago-Ordot', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1511, 'Dededo', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1512, 'Hagatna', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1513, 'Inarajan', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1514, 'Mangilao', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1515, 'Merizo', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1516, 'Mongmong-Toto-Maite', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1517, 'Santa Rita', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1518, 'Sinajana', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1519, 'Talofofo', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1520, 'Tamuning', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1521, 'Yigo', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1522, 'Yona', 89, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1523, 'Alta Verapaz', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1524, 'Baja Verapaz', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1525, 'Chimaltenango', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1526, 'Chiquimula', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1527, 'El Progreso', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1528, 'Escuintla', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1529, 'Guatemala', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1530, 'Huehuetenango', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1531, 'Izabal', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1532, 'Jalapa', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1533, 'Jutiapa', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1534, 'Peten', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1535, 'Quezaltenango', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1536, 'Quiche', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1537, 'Retalhuleu', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1538, 'Sacatepequez', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1539, 'San Marcos', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1540, 'Santa Rosa', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1541, 'Solola', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1542, 'Suchitepequez', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1543, 'Totonicapan', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1544, 'Zacapa', 90, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1545, 'Alderney', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1546, 'Castel', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1547, 'Forest', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1548, 'Saint Andrew', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1549, 'Saint Martin', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1550, 'Saint Peter Port', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1551, 'Saint Pierre du Bois', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1552, 'Saint Sampson', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1553, 'Saint Saviour', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1554, 'Sark', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1555, 'Torteval', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1556, 'Vale', 91, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1557, 'Beyla', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1558, 'Boffa', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1559, 'Boke', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1560, 'Conakry', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1561, 'Coyah', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1562, 'Dabola', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1563, 'Dalaba', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1564, 'Dinguiraye', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1565, 'Faranah', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1566, 'Forecariah', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1567, 'Fria', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1568, 'Gaoual', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1569, 'Gueckedou', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1570, 'Kankan', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1571, 'Kerouane', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1572, 'Kindia', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1573, 'Kissidougou', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1574, 'Koubia', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1575, 'Koundara', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1576, 'Kouroussa', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1577, 'Labe', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1578, 'Lola', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1579, 'Macenta', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1580, 'Mali', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1581, 'Mamou', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1582, 'Mandiana', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1583, 'Nzerekore', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1584, 'Pita', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1585, 'Siguiri', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1586, 'Telimele', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1587, 'Tougue', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1588, 'Yomou', 92, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1589, 'Bafata', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1590, 'Bissau', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1591, 'Bolama', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1592, 'Cacheu', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1593, 'Gabu', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1594, 'Oio', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1595, 'Quinara', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1596, 'Tombali', 93, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1597, 'Barima-Waini', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1598, 'Cuyuni-Mazaruni', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1599, 'Demerara-Mahaica', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1600, 'East Berbice-Corentyne', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1601, 'Essequibo Islands-West Demerar', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1602, 'Mahaica-Berbice', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1603, 'Pomeroon-Supenaam', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1604, 'Potaro-Siparuni', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1605, 'Upper Demerara-Berbice', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1606, 'Upper Takutu-Upper Essequibo', 94, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1607, 'Artibonite', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1608, 'Centre', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1609, 'Grand\'Anse', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1610, 'Nord', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1611, 'Nord-Est', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1612, 'Nord-Ouest', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1613, 'Ouest', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1614, 'Sud', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1615, 'Sud-Est', 95, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1616, 'Heard and McDonald Islands', 96, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1617, 'Atlantida', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1618, 'Choluteca', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1619, 'Colon', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1620, 'Comayagua', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1621, 'Copan', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1622, 'Cortes', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1623, 'Distrito Central', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1624, 'El Paraiso', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1625, 'Francisco Morazan', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1626, 'Gracias a Dios', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1627, 'Intibuca', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1628, 'Islas de la Bahia', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1629, 'La Paz', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1630, 'Lempira', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1631, 'Ocotepeque', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1632, 'Olancho', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1633, 'Santa Barbara', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1634, 'Valle', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1635, 'Yoro', 97, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1636, 'Hong Kong', 98, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1637, 'Bacs-Kiskun', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1638, 'Baranya', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1639, 'Bekes', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1640, 'Borsod-Abauj-Zemplen', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1641, 'Budapest', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1642, 'Csongrad', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1643, 'Fejer', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1644, 'Gyor-Moson-Sopron', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1645, 'Hajdu-Bihar', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1646, 'Heves', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1647, 'Jasz-Nagykun-Szolnok', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1648, 'Komarom-Esztergom', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1649, 'Nograd', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1650, 'Pest', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1651, 'Somogy', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1652, 'Szabolcs-Szatmar-Bereg', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1653, 'Tolna', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1654, 'Vas', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1655, 'Veszprem', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1656, 'Zala', 99, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1657, 'Austurland', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1658, 'Gullbringusysla', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1659, 'Hofu borgarsva i', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1660, 'Nor urland eystra', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1661, 'Nor urland vestra', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1662, 'Su urland', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1663, 'Su urnes', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1664, 'Vestfir ir', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1665, 'Vesturland', 100, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1666, 'Aceh', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1667, 'Bali', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1668, 'Bangka-Belitung', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1669, 'Banten', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1670, 'Bengkulu', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1671, 'Gandaria', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1672, 'Gorontalo', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1673, 'Jakarta', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1674, 'Jambi', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1675, 'Jawa Barat', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1676, 'Jawa Tengah', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1677, 'Jawa Timur', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1678, 'Kalimantan Barat', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1679, 'Kalimantan Selatan', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1680, 'Kalimantan Tengah', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1681, 'Kalimantan Timur', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1682, 'Kendal', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1683, 'Lampung', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1684, 'Maluku', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1685, 'Maluku Utara', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1686, 'Nusa Tenggara Barat', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1687, 'Nusa Tenggara Timur', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1688, 'Papua', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1689, 'Riau', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1690, 'Riau Kepulauan', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1691, 'Solo', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1692, 'Sulawesi Selatan', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1693, 'Sulawesi Tengah', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1694, 'Sulawesi Tenggara', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1695, 'Sulawesi Utara', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1696, 'Sumatera Barat', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1697, 'Sumatera Selatan', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1698, 'Sumatera Utara', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1699, 'Yogyakarta', 102, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1700, 'Ardabil', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1701, 'Azarbayjan-e Bakhtari', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1702, 'Azarbayjan-e Khavari', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1703, 'Bushehr', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1704, 'Chahar Mahal-e Bakhtiari', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1705, 'Esfahan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1706, 'Fars', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1707, 'Gilan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1708, 'Golestan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1709, 'Hamadan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1710, 'Hormozgan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1711, 'Ilam', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1712, 'Kerman', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1713, 'Kermanshah', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1714, 'Khorasan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1715, 'Khuzestan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1716, 'Kohgiluyeh-e Boyerahmad', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1717, 'Kordestan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1718, 'Lorestan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1719, 'Markazi', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1720, 'Mazandaran', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1721, 'Ostan-e Esfahan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1722, 'Qazvin', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1723, 'Qom', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1724, 'Semnan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1725, 'Sistan-e Baluchestan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1726, 'Tehran', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1727, 'Yazd', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1728, 'Zanjan', 103, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1729, 'Babil', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1730, 'Baghdad', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1731, 'Dahuk', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1732, 'Dhi Qar', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1733, 'Diyala', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1734, 'Erbil', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1735, 'Irbil', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1736, 'Karbala', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1737, 'Kurdistan', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1738, 'Maysan', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1739, 'Ninawa', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1740, 'Salah-ad-Din', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1741, 'Wasit', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1742, 'al-Anbar', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1743, 'al-Basrah', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1744, 'al-Muthanna', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1745, 'al-Qadisiyah', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1746, 'an-Najaf', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1747, 'as-Sulaymaniyah', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1748, 'at-Ta\'mim', 104, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1749, 'Armagh', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1750, 'Carlow', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1751, 'Cavan', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1752, 'Clare', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1753, 'Cork', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1754, 'Donegal', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1755, 'Dublin', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1756, 'Galway', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1757, 'Kerry', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1758, 'Kildare', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1759, 'Kilkenny', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1760, 'Laois', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1761, 'Leinster', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1762, 'Leitrim', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1763, 'Limerick', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1764, 'Loch Garman', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1765, 'Longford', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1766, 'Louth', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1767, 'Mayo', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1768, 'Meath', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1769, 'Monaghan', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1770, 'Offaly', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1771, 'Roscommon', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1772, 'Sligo', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1773, 'Tipperary North Riding', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1774, 'Tipperary South Riding', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1775, 'Ulster', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1776, 'Waterford', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1777, 'Westmeath', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1778, 'Wexford', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1779, 'Wicklow', 105, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1780, 'Beit Hanania', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1781, 'Ben Gurion Airport', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1782, 'Bethlehem', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1783, 'Caesarea', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1784, 'Centre', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1785, 'Gaza', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1786, 'Hadaron', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1787, 'Haifa District', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1788, 'Hamerkaz', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1789, 'Hazafon', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1790, 'Hebron', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1791, 'Jaffa', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1792, 'Jerusalem', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1793, 'Khefa', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1794, 'Kiryat Yam', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1795, 'Lower Galilee', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1796, 'Qalqilya', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1797, 'Talme Elazar', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1798, 'Tel Aviv', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1799, 'Tsafon', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1800, 'Umm El Fahem', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1801, 'Yerushalayim', 106, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1802, 'Abruzzi', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1803, 'Abruzzo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1804, 'Agrigento', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1805, 'Alessandria', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1806, 'Ancona', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1807, 'Arezzo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1808, 'Ascoli Piceno', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1809, 'Asti', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1810, 'Avellino', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1811, 'Bari', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1812, 'Basilicata', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1813, 'Belluno', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1814, 'Benevento', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1815, 'Bergamo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1816, 'Biella', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1817, 'Bologna', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1818, 'Bolzano', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1819, 'Brescia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1820, 'Brindisi', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1821, 'Calabria', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1822, 'Campania', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1823, 'Cartoceto', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1824, 'Caserta', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1825, 'Catania', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1826, 'Chieti', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1827, 'Como', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1828, 'Cosenza', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1829, 'Cremona', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1830, 'Cuneo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1831, 'Emilia-Romagna', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1832, 'Ferrara', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1833, 'Firenze', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1834, 'Florence', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1835, 'Forli-Cesena ', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1836, 'Friuli-Venezia Giulia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1837, 'Frosinone', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1838, 'Genoa', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1839, 'Gorizia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1840, 'L\'Aquila', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1841, 'Lazio', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1842, 'Lecce', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1843, 'Lecco', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1845, 'Liguria', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1846, 'Lodi', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1847, 'Lombardia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1848, 'Lombardy', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1849, 'Macerata', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1850, 'Mantova', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1851, 'Marche', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1852, 'Messina', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1853, 'Milan', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1854, 'Modena', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1855, 'Molise', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1856, 'Molteno', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1857, 'Montenegro', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1858, 'Monza and Brianza', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1859, 'Naples', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1860, 'Novara', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1861, 'Padova', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1862, 'Parma', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1863, 'Pavia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1864, 'Perugia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1865, 'Pesaro-Urbino', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1866, 'Piacenza', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1867, 'Piedmont', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1868, 'Piemonte', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1869, 'Pisa', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1870, 'Pordenone', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1871, 'Potenza', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1872, 'Puglia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1873, 'Reggio Emilia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1874, 'Rimini', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1875, 'Roma', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1876, 'Salerno', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1877, 'Sardegna', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1878, 'Sassari', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1879, 'Savona', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1880, 'Sicilia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1881, 'Siena', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1882, 'Sondrio', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1883, 'South Tyrol', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1884, 'Taranto', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1885, 'Teramo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1886, 'Torino', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1887, 'Toscana', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1888, 'Trapani', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1889, 'Trentino-Alto Adige', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1890, 'Trento', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1891, 'Treviso', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1892, 'Udine', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1893, 'Umbria', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1894, 'Valle d\'Aosta', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1895, 'Varese', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1896, 'Veneto', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1897, 'Venezia', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1898, 'Verbano-Cusio-Ossola', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1899, 'Vercelli', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1900, 'Verona', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1901, 'Vicenza', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1902, 'Viterbo', 107, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1903, 'Buxoro Viloyati', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1904, 'Clarendon', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1905, 'Hanover', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1906, 'Kingston', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1907, 'Manchester', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1908, 'Portland', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1909, 'Saint Andrews', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1910, 'Saint Ann', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1911, 'Saint Catherine', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1912, 'Saint Elizabeth', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1913, 'Saint James', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1914, 'Saint Mary', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1915, 'Saint Thomas', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1916, 'Trelawney', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1917, 'Westmoreland', 108, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1918, 'Aichi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1919, 'Akita', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1920, 'Aomori', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1921, 'Chiba', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1922, 'Ehime', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1923, 'Fukui', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1924, 'Fukuoka', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1925, 'Fukushima', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1926, 'Gifu', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1927, 'Gumma', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1928, 'Hiroshima', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1929, 'Hokkaido', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1930, 'Hyogo', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1931, 'Ibaraki', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1932, 'Ishikawa', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1933, 'Iwate', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1934, 'Kagawa', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1935, 'Kagoshima', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1936, 'Kanagawa', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1937, 'Kanto', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1938, 'Kochi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1939, 'Kumamoto', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1940, 'Kyoto', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1941, 'Mie', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1942, 'Miyagi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1943, 'Miyazaki', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1944, 'Nagano', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1945, 'Nagasaki', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1946, 'Nara', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1947, 'Niigata', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1948, 'Oita', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1949, 'Okayama', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1950, 'Okinawa', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1951, 'Osaka', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1952, 'Saga', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1953, 'Saitama', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1954, 'Shiga', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1955, 'Shimane', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1956, 'Shizuoka', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1957, 'Tochigi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1958, 'Tokushima', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1959, 'Tokyo', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1960, 'Tottori', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1961, 'Toyama', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1962, 'Wakayama', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1963, 'Yamagata', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1964, 'Yamaguchi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1965, 'Yamanashi', 109, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1966, 'Grouville', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1967, 'Saint Brelade', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1968, 'Saint Clement', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1969, 'Saint Helier', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1970, 'Saint John', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1971, 'Saint Lawrence', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1972, 'Saint Martin', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1973, 'Saint Mary', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1974, 'Saint Peter', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1975, 'Saint Saviour', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1976, 'Trinity', 110, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1977, '\'Ajlun', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1978, 'Amman', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1979, 'Irbid', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1980, 'Jarash', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1981, 'Ma\'an', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1982, 'Madaba', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1983, 'al-\'Aqabah', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1984, 'al-Balqa\'', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1985, 'al-Karak', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1986, 'al-Mafraq', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1987, 'at-Tafilah', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1988, 'az-Zarqa\'', 111, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1989, 'Akmecet', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1990, 'Akmola', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1991, 'Aktobe', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1992, 'Almati', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1993, 'Atirau', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1994, 'Batis Kazakstan', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1995, 'Burlinsky Region', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1996, 'Karagandi', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1997, 'Kostanay', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1998, 'Mankistau', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(1999, 'Ontustik Kazakstan', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2000, 'Pavlodar', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2001, 'Sigis Kazakstan', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2002, 'Soltustik Kazakstan', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2003, 'Taraz', 112, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2004, 'Central', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2005, 'Coast', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2006, 'Eastern', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2007, 'Nairobi', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2008, 'North Eastern', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2009, 'Nyanza', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2010, 'Rift Valley', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2011, 'Western', 113, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2012, 'Abaiang', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2013, 'Abemana', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2014, 'Aranuka', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2015, 'Arorae', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2016, 'Banaba', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2017, 'Beru', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2018, 'Butaritari', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2019, 'Kiritimati', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2020, 'Kuria', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2021, 'Maiana', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2022, 'Makin', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2023, 'Marakei', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2024, 'Nikunau', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2025, 'Nonouti', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2026, 'Onotoa', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2027, 'Phoenix Islands', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2028, 'Tabiteuea North', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2029, 'Tabiteuea South', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2030, 'Tabuaeran', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2031, 'Tamana', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2032, 'Tarawa North', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2033, 'Tarawa South', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2034, 'Teraina', 114, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2035, 'Chagangdo', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2036, 'Hamgyeongbukto', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2037, 'Hamgyeongnamdo', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2038, 'Hwanghaebukto', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2039, 'Hwanghaenamdo', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2040, 'Kaeseong', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2041, 'Kangweon', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2042, 'Nampo', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2043, 'Pyeonganbukto', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2044, 'Pyeongannamdo', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2045, 'Pyeongyang', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2046, 'Yanggang', 115, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2047, 'Busan', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2048, 'Cheju', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2049, 'Chollabuk', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2050, 'Chollanam', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2051, 'Chungbuk', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2052, 'Chungcheongbuk', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2053, 'Chungcheongnam', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2054, 'Chungnam', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2055, 'Daegu', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2056, 'Gangwon-do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2057, 'Goyang-si', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2058, 'Gyeonggi-do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2059, 'Gyeongsang ', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2060, 'Gyeongsangnam-do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2061, 'Incheon', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2062, 'Jeju-Si', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2063, 'Jeonbuk', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2064, 'Kangweon', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2065, 'Kwangju', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2066, 'Kyeonggi', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2067, 'Kyeongsangbuk', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2068, 'Kyeongsangnam', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2069, 'Kyonggi-do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2070, 'Kyungbuk-Do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2071, 'Kyunggi-Do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2072, 'Kyunggi-do', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2073, 'Pusan', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2074, 'Seoul', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2075, 'Sudogwon', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2076, 'Taegu', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2077, 'Taejeon', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2078, 'Taejon-gwangyoksi', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2079, 'Ulsan', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2080, 'Wonju', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2081, 'gwangyoksi', 116, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2082, 'Al Asimah', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2083, 'Hawalli', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2084, 'Mishref', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2085, 'Qadesiya', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2086, 'Safat', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2087, 'Salmiya', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2088, 'al-Ahmadi', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2089, 'al-Farwaniyah', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2090, 'al-Jahra', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2091, 'al-Kuwayt', 117, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2092, 'Batken', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2093, 'Bishkek', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2094, 'Chui', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2095, 'Issyk-Kul', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2096, 'Jalal-Abad', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2097, 'Naryn', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2098, 'Osh', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2099, 'Talas', 118, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2100, 'Attopu', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2101, 'Bokeo', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2102, 'Bolikhamsay', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2103, 'Champasak', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2104, 'Houaphanh', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2105, 'Khammouane', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2106, 'Luang Nam Tha', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2107, 'Luang Prabang', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2108, 'Oudomxay', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2109, 'Phongsaly', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2110, 'Saravan', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2111, 'Savannakhet', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2112, 'Sekong', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2113, 'Viangchan Prefecture', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2114, 'Viangchan Province', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2115, 'Xaignabury', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2116, 'Xiang Khuang', 119, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2117, 'Aizkraukles', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2118, 'Aluksnes', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2119, 'Balvu', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2120, 'Bauskas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2121, 'Cesu', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2122, 'Daugavpils', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2123, 'Daugavpils City', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2124, 'Dobeles', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2125, 'Gulbenes', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2126, 'Jekabspils', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2127, 'Jelgava', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2128, 'Jelgavas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2129, 'Jurmala City', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2130, 'Kraslavas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2131, 'Kuldigas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2132, 'Liepaja', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2133, 'Liepajas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2134, 'Limbazhu', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2135, 'Ludzas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2136, 'Madonas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2137, 'Ogres', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2138, 'Preilu', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2139, 'Rezekne', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2140, 'Rezeknes', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2141, 'Riga', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2142, 'Rigas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2143, 'Saldus', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2144, 'Talsu', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2145, 'Tukuma', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2146, 'Valkas', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2147, 'Valmieras', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2148, 'Ventspils', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2149, 'Ventspils City', 120, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2150, 'Beirut', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2151, 'Jabal Lubnan', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2152, 'Mohafazat Liban-Nord', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2153, 'Mohafazat Mont-Liban', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2154, 'Sidon', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2155, 'al-Biqa', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2156, 'al-Janub', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2157, 'an-Nabatiyah', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2158, 'ash-Shamal', 121, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2159, 'Berea', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2160, 'Butha-Buthe', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2161, 'Leribe', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2162, 'Mafeteng', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2163, 'Maseru', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2164, 'Mohale\'s Hoek', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2165, 'Mokhotlong', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2166, 'Qacha\'s Nek', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2167, 'Quthing', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2168, 'Thaba-Tseka', 122, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2169, 'Bomi', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2170, 'Bong', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2171, 'Grand Bassa', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2172, 'Grand Cape Mount', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2173, 'Grand Gedeh', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2174, 'Loffa', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2175, 'Margibi', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2176, 'Maryland and Grand Kru', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2177, 'Montserrado', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2178, 'Nimba', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2179, 'Rivercess', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2180, 'Sinoe', 123, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2181, 'Ajdabiya', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2182, 'Fezzan', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2183, 'Banghazi', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2184, 'Darnah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2185, 'Ghadamis', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2186, 'Gharyan', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2187, 'Misratah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2188, 'Murzuq', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2189, 'Sabha', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2190, 'Sawfajjin', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2191, 'Surt', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2192, 'Tarabulus', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2193, 'Tarhunah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2194, 'Tripolitania', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2195, 'Tubruq', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2196, 'Yafran', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2197, 'Zlitan', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2198, 'al-\'Aziziyah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2199, 'al-Fatih', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2200, 'al-Jabal al Akhdar', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2201, 'al-Jufrah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2202, 'al-Khums', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2203, 'al-Kufrah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2204, 'an-Nuqat al-Khams', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2205, 'ash-Shati\'', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2206, 'az-Zawiyah', 124, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2207, 'Balzers', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2208, 'Eschen', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2209, 'Gamprin', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2210, 'Mauren', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2211, 'Planken', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2212, 'Ruggell', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2213, 'Schaan', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2214, 'Schellenberg', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2215, 'Triesen', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2216, 'Triesenberg', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2217, 'Vaduz', 125, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2218, 'Alytaus', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2219, 'Anyksciai', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2220, 'Kauno', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2221, 'Klaipedos', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2222, 'Marijampoles', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2223, 'Panevezhio', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2224, 'Panevezys', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2225, 'Shiauliu', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2226, 'Taurages', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2227, 'Telshiu', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2228, 'Telsiai', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2229, 'Utenos', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2230, 'Vilniaus', 126, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2231, 'Capellen', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2232, 'Clervaux', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2233, 'Diekirch', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2234, 'Echternach', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2235, 'Esch-sur-Alzette', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2236, 'Grevenmacher', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2237, 'Luxembourg', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2238, 'Mersch', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2239, 'Redange', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2240, 'Remich', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2241, 'Vianden', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2242, 'Wiltz', 127, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2243, 'Macau', 128, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2244, 'Berovo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2245, 'Bitola', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2246, 'Brod', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2247, 'Debar', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2248, 'Delchevo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2249, 'Demir Hisar', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2250, 'Gevgelija', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2251, 'Gostivar', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2252, 'Kavadarci', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2253, 'Kichevo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2254, 'Kochani', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2255, 'Kratovo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2256, 'Kriva Palanka', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2257, 'Krushevo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2258, 'Kumanovo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2259, 'Negotino', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2260, 'Ohrid', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2261, 'Prilep', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2262, 'Probishtip', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2263, 'Radovish', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2264, 'Resen', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2265, 'Shtip', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2266, 'Skopje', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2267, 'Struga', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2268, 'Strumica', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2269, 'Sveti Nikole', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2270, 'Tetovo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2271, 'Valandovo', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2272, 'Veles', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2273, 'Vinica', 129, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2274, 'Antananarivo', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2275, 'Antsiranana', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2276, 'Fianarantsoa', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2277, 'Mahajanga', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2278, 'Toamasina', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2279, 'Toliary', 130, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2280, 'Balaka', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2281, 'Blantyre City', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2282, 'Chikwawa', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2283, 'Chiradzulu', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2284, 'Chitipa', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2285, 'Dedza', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2286, 'Dowa', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2287, 'Karonga', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2288, 'Kasungu', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2289, 'Lilongwe City', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2290, 'Machinga', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2291, 'Mangochi', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2292, 'Mchinji', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2293, 'Mulanje', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2294, 'Mwanza', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2295, 'Mzimba', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2296, 'Mzuzu City', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2297, 'Nkhata Bay', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2298, 'Nkhotakota', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2299, 'Nsanje', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2300, 'Ntcheu', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2301, 'Ntchisi', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2302, 'Phalombe', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2303, 'Rumphi', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2304, 'Salima', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2305, 'Thyolo', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2306, 'Zomba Municipality', 131, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2307, 'Johor', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2308, 'Kedah', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2309, 'Kelantan', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2310, 'Kuala Lumpur', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2311, 'Labuan', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2312, 'Melaka', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2313, 'Negeri Johor', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2314, 'Negeri Sembilan', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2315, 'Pahang', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2316, 'Penang', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2317, 'Perak', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2318, 'Perlis', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2319, 'Pulau Pinang', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2320, 'Sabah', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2321, 'Sarawak', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2322, 'Selangor', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2323, 'Sembilan', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2324, 'Terengganu', 132, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2325, 'Alif Alif', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2326, 'Alif Dhaal', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2327, 'Baa', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2328, 'Dhaal', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2329, 'Faaf', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2330, 'Gaaf Alif', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2331, 'Gaaf Dhaal', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2332, 'Ghaviyani', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2333, 'Haa Alif', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2334, 'Haa Dhaal', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2335, 'Kaaf', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2336, 'Laam', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2337, 'Lhaviyani', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2338, 'Male', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2339, 'Miim', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2340, 'Nuun', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2341, 'Raa', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2342, 'Shaviyani', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2343, 'Siin', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2344, 'Thaa', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2345, 'Vaav', 133, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2346, 'Bamako', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2347, 'Gao', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2348, 'Kayes', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2349, 'Kidal', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2350, 'Koulikoro', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2351, 'Mopti', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2352, 'Segou', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2353, 'Sikasso', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2354, 'Tombouctou', 134, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2355, 'Gozo and Comino', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2356, 'Inner Harbour', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2357, 'Northern', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2358, 'Outer Harbour', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2359, 'South Eastern', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2360, 'Valletta', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2361, 'Western', 135, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2362, 'Castletown', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2363, 'Douglas', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2364, 'Laxey', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2365, 'Onchan', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2366, 'Peel', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2367, 'Port Erin', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2368, 'Port Saint Mary', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2369, 'Ramsey', 136, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2370, 'Ailinlaplap', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2371, 'Ailuk', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2372, 'Arno', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2373, 'Aur', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2374, 'Bikini', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2375, 'Ebon', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2376, 'Enewetak', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2377, 'Jabat', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2378, 'Jaluit', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2379, 'Kili', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2380, 'Kwajalein', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2381, 'Lae', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2382, 'Lib', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2383, 'Likiep', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2384, 'Majuro', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2385, 'Maloelap', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2386, 'Mejit', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2387, 'Mili', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2388, 'Namorik', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2389, 'Namu', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2390, 'Rongelap', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2391, 'Ujae', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2392, 'Utrik', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2393, 'Wotho', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2394, 'Wotje', 137, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2395, 'Fort-de-France', 138, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2396, 'La Trinite', 138, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2397, 'Le Marin', 138, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2398, 'Saint-Pierre', 138, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2399, 'Adrar', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2400, 'Assaba', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2401, 'Brakna', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2402, 'Dhakhlat Nawadibu', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2403, 'Hudh-al-Gharbi', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2404, 'Hudh-ash-Sharqi', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2405, 'Inshiri', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2406, 'Nawakshut', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2407, 'Qidimagha', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2408, 'Qurqul', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2409, 'Taqant', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2410, 'Tiris Zammur', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2411, 'Trarza', 139, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2412, 'Black River', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2413, 'Eau Coulee', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2414, 'Flacq', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2415, 'Floreal', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2416, 'Grand Port', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2417, 'Moka', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2418, 'Pamplempousses', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2419, 'Plaines Wilhelm', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2420, 'Port Louis', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2421, 'Riviere du Rempart', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2422, 'Rodrigues', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2423, 'Rose Hill', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2424, 'Savanne', 140, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2425, 'Mayotte', 141, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2426, 'Pamanzi', 141, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2427, 'Aguascalientes', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2428, 'Baja California', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2429, 'Baja California Sur', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2430, 'Campeche', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2431, 'Chiapas', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2432, 'Chihuahua', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2433, 'Coahuila', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2434, 'Colima', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2435, 'Distrito Federal', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2436, 'Durango', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2437, 'Estado de Mexico', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2438, 'Guanajuato', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2439, 'Guerrero', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2440, 'Hidalgo', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2441, 'Jalisco', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2442, 'Mexico', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2443, 'Michoacan', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2444, 'Morelos', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2445, 'Nayarit', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2446, 'Nuevo Leon', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2447, 'Oaxaca', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2448, 'Puebla', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2449, 'Queretaro', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2450, 'Quintana Roo', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2451, 'San Luis Potosi', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2452, 'Sinaloa', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2453, 'Sonora', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2454, 'Tabasco', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2455, 'Tamaulipas', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2456, 'Tlaxcala', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2457, 'Veracruz', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2458, 'Yucatan', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2459, 'Zacatecas', 142, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2460, 'Chuuk', 143, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2461, 'Kusaie', 143, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2462, 'Pohnpei', 143, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2463, 'Yap', 143, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2464, 'Balti', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2465, 'Cahul', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2466, 'Chisinau', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2467, 'Chisinau Oras', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2468, 'Edinet', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2469, 'Gagauzia', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2470, 'Lapusna', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2471, 'Orhei', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2472, 'Soroca', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2473, 'Taraclia', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2474, 'Tighina', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2475, 'Transnistria', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2476, 'Ungheni', 144, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2477, 'Fontvieille', 145, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2478, 'La Condamine', 145, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2479, 'Monaco-Ville', 145, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2480, 'Monte Carlo', 145, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2481, 'Arhangaj', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2482, 'Bajan-Olgij', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2483, 'Bajanhongor', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2484, 'Bulgan', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2485, 'Darhan-Uul', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2486, 'Dornod', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2487, 'Dornogovi', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2488, 'Dundgovi', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2489, 'Govi-Altaj', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2490, 'Govisumber', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2491, 'Hentij', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2492, 'Hovd', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2493, 'Hovsgol', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2494, 'Omnogovi', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2495, 'Orhon', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2496, 'Ovorhangaj', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2497, 'Selenge', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2498, 'Suhbaatar', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2499, 'Tov', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2500, 'Ulaanbaatar', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2501, 'Uvs', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2502, 'Zavhan', 146, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2503, 'Montserrat', 147, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2504, 'Agadir', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2505, 'Casablanca', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2506, 'Chaouia-Ouardigha', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2507, 'Doukkala-Abda', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2508, 'Fes-Boulemane', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2509, 'Gharb-Chrarda-Beni Hssen', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2510, 'Guelmim', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2511, 'Kenitra', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2512, 'Marrakech-Tensift-Al Haouz', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2513, 'Meknes-Tafilalet', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2514, 'Oriental', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2515, 'Oujda', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2516, 'Province de Tanger', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2517, 'Rabat-Sale-Zammour-Zaer', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2518, 'Sala Al Jadida', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2519, 'Settat', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2520, 'Souss Massa-Draa', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2521, 'Tadla-Azilal', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2522, 'Tangier-Tetouan', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2523, 'Taza-Al Hoceima-Taounate', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2524, 'Wilaya de Casablanca', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2525, 'Wilaya de Rabat-Sale', 148, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2526, 'Cabo Delgado', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2527, 'Gaza', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2528, 'Inhambane', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2529, 'Manica', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2530, 'Maputo', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2531, 'Maputo Provincia', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2532, 'Nampula', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2533, 'Niassa', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2534, 'Sofala', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2535, 'Tete', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2536, 'Zambezia', 149, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2537, 'Ayeyarwady', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2538, 'Bago', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2539, 'Chin', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2540, 'Kachin', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2541, 'Kayah', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2542, 'Kayin', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2543, 'Magway', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2544, 'Mandalay', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2545, 'Mon', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2546, 'Nay Pyi Taw', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2547, 'Rakhine', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2548, 'Sagaing', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2549, 'Shan', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2550, 'Tanintharyi', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2551, 'Yangon', 150, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2552, 'Caprivi', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2553, 'Erongo', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2554, 'Hardap', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2555, 'Karas', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2556, 'Kavango', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2557, 'Khomas', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2558, 'Kunene', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2559, 'Ohangwena', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2560, 'Omaheke', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2561, 'Omusati', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2562, 'Oshana', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2563, 'Oshikoto', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2564, 'Otjozondjupa', 151, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2565, 'Yaren', 152, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2566, 'Bagmati', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2567, 'Bheri', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2568, 'Dhawalagiri', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2569, 'Gandaki', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2570, 'Janakpur', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2571, 'Karnali', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2572, 'Koshi', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2573, 'Lumbini', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2574, 'Mahakali', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2575, 'Mechi', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2576, 'Narayani', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2577, 'Rapti', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2578, 'Sagarmatha', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2579, 'Seti', 153, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2580, 'Bonaire', 154, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2581, 'Curacao', 154, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2582, 'Saba', 154, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2583, 'Sint Eustatius', 154, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2584, 'Sint Maarten', 154, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2585, 'Amsterdam', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2586, 'Benelux', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2587, 'Drenthe', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2588, 'Flevoland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2589, 'Friesland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2590, 'Gelderland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2591, 'Groningen', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2592, 'Limburg', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2593, 'Noord-Brabant', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2594, 'Noord-Holland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2595, 'Overijssel', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2596, 'South Holland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2597, 'Utrecht', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2598, 'Zeeland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2599, 'Zuid-Holland', 155, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2600, 'Iles', 156, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2601, 'Nord', 156, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2602, 'Sud', 156, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2603, 'Area Outside Region', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2604, 'Auckland', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2605, 'Bay of Plenty', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2606, 'Canterbury', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2607, 'Christchurch', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2608, 'Gisborne', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2609, 'Hawke\'s Bay', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2610, 'Manawatu-Wanganui', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2611, 'Marlborough', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2612, 'Nelson', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2613, 'Northland', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2614, 'Otago', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2615, 'Rodney', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2616, 'Southland', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2617, 'Taranaki', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2618, 'Tasman', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2619, 'Waikato', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2620, 'Wellington', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2621, 'West Coast', 157, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2622, 'Atlantico Norte', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2623, 'Atlantico Sur', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2624, 'Boaco', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2625, 'Carazo', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2626, 'Chinandega', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2627, 'Chontales', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2628, 'Esteli', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2629, 'Granada', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2630, 'Jinotega', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2631, 'Leon', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2632, 'Madriz', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2633, 'Managua', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2634, 'Masaya', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2635, 'Matagalpa', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2636, 'Nueva Segovia', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2637, 'Rio San Juan', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2638, 'Rivas', 158, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2639, 'Agadez', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2640, 'Diffa', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2641, 'Dosso', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2642, 'Maradi', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2643, 'Niamey', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2644, 'Tahoua', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2645, 'Tillabery', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2646, 'Zinder', 159, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2647, 'Abia', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2648, 'Abuja Federal Capital Territory', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2649, 'Adamawa', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2650, 'Akwa Ibom', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2651, 'Anambra', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2652, 'Bauchi', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2653, 'Bayelsa', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2654, 'Benue', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2655, 'Borno', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2656, 'Cross River', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2657, 'Delta', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2658, 'Ebonyi', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2659, 'Edo', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2660, 'Ekiti', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2661, 'Enugu', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2662, 'Gombe', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2663, 'Imo', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2664, 'Jigawa', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2665, 'Kaduna', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2666, 'Kano', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2667, 'Katsina', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2668, 'Kebbi', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2669, 'Kogi', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2670, 'Kwara', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2671, 'Lagos', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2672, 'Nassarawa', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2673, 'Niger', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2674, 'Ogun', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2675, 'Ondo', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2676, 'Osun', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2677, 'Oyo', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2678, 'Plateau', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2679, 'Rivers', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2680, 'Sokoto', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2681, 'Taraba', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2682, 'Yobe', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2683, 'Zamfara', 160, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2684, 'Niue', 161, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2685, 'Norfolk Island', 162, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2686, 'Northern Islands', 163, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2687, 'Rota', 163, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2688, 'Saipan', 163, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2689, 'Tinian', 163, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2690, 'Akershus', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2691, 'Aust Agder', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2692, 'Bergen', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2693, 'Buskerud', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2694, 'Finnmark', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2695, 'Hedmark', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2696, 'Hordaland', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2697, 'Moere og Romsdal', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2698, 'Nord Trondelag', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2699, 'Nordland', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2700, 'Oestfold', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2701, 'Oppland', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2702, 'Oslo', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2703, 'Rogaland', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2704, 'Soer Troendelag', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2705, 'Sogn og Fjordane', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2706, 'Stavern', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2707, 'Sykkylven', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2708, 'Telemark', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2709, 'Troms', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2710, 'Vest Agder', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2711, 'Vestfold', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2712, 'ÃƒÂ˜stfold', 164, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2713, 'Al Buraimi', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2714, 'Dhufar', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2715, 'Masqat', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2716, 'Musandam', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2717, 'Rusayl', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2718, 'Wadi Kabir', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2719, 'ad-Dakhiliyah', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2720, 'adh-Dhahirah', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2721, 'al-Batinah', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2722, 'ash-Sharqiyah', 165, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2723, 'Baluchistan', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2724, 'Federal Capital Area', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2725, 'Federally administered Tribal ', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2726, 'North-West Frontier', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2727, 'Northern Areas', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2728, 'Punjab', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2729, 'Sind', 166, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2730, 'Aimeliik', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2731, 'Airai', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2732, 'Angaur', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2733, 'Hatobohei', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2734, 'Kayangel', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2735, 'Koror', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2736, 'Melekeok', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2737, 'Ngaraard', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2738, 'Ngardmau', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2739, 'Ngaremlengui', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2740, 'Ngatpang', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2741, 'Ngchesar', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2742, 'Ngerchelong', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2743, 'Ngiwal', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2744, 'Peleliu', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2745, 'Sonsorol', 167, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2746, 'Ariha', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2747, 'Bayt Lahm', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2748, 'Bethlehem', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2749, 'Dayr-al-Balah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2750, 'Ghazzah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2751, 'Ghazzah ash-Shamaliyah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2752, 'Janin', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2753, 'Khan Yunis', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2754, 'Nabulus', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2755, 'Qalqilyah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2756, 'Rafah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2757, 'Ram Allah wal-Birah', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2758, 'Salfit', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2759, 'Tubas', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2760, 'Tulkarm', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2761, 'al-Khalil', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2762, 'al-Quds', 168, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2763, 'Bocas del Toro', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2764, 'Chiriqui', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2765, 'Cocle', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2766, 'Colon', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2767, 'Darien', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2768, 'Embera', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2769, 'Herrera', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2770, 'Kuna Yala', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2771, 'Los Santos', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2772, 'Ngobe Bugle', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2773, 'Panama', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2774, 'Veraguas', 169, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2775, 'East New Britain', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2776, 'East Sepik', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2777, 'Eastern Highlands', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2778, 'Enga', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2779, 'Fly River', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2780, 'Gulf', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2781, 'Madang', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2782, 'Manus', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2783, 'Milne Bay', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2784, 'Morobe', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2785, 'National Capital District', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2786, 'New Ireland', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2787, 'North Solomons', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2788, 'Oro', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2789, 'Sandaun', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2790, 'Simbu', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2791, 'Southern Highlands', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2792, 'West New Britain', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2793, 'Western Highlands', 170, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2794, 'Alto Paraguay', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2795, 'Alto Parana', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2796, 'Amambay', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2797, 'Asuncion', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2798, 'Boqueron', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2799, 'Caaguazu', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2800, 'Caazapa', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2801, 'Canendiyu', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2802, 'Central', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2803, 'Concepcion', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2804, 'Cordillera', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2805, 'Guaira', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2806, 'Itapua', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2807, 'Misiones', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2808, 'Neembucu', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2809, 'Paraguari', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2810, 'Presidente Hayes', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2811, 'San Pedro', 171, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2812, 'Amazonas', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2813, 'Ancash', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2814, 'Apurimac', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2815, 'Arequipa', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2816, 'Ayacucho', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2817, 'Cajamarca', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2818, 'Cusco', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2819, 'Huancavelica', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2820, 'Huanuco', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2821, 'Ica', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2822, 'Junin', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2823, 'La Libertad', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2824, 'Lambayeque', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2825, 'Lima y Callao', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2826, 'Loreto', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2827, 'Madre de Dios', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2828, 'Moquegua', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2829, 'Pasco', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2830, 'Piura', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2831, 'Puno', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2832, 'San Martin', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2833, 'Tacna', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2834, 'Tumbes', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2835, 'Ucayali', 172, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2836, 'Batangas', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2837, 'Bicol', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2838, 'Bulacan', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2839, 'Cagayan', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2840, 'Caraga', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2841, 'Central Luzon', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2842, 'Central Mindanao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2843, 'Central Visayas', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2844, 'Cordillera', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2845, 'Davao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2846, 'Eastern Visayas', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2847, 'Greater Metropolitan Area', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2848, 'Ilocos', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2849, 'Laguna', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2850, 'Luzon', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2851, 'Mactan', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2852, 'Metropolitan Manila Area', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2853, 'Muslim Mindanao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2854, 'Northern Mindanao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2855, 'Southern Mindanao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2856, 'Southern Tagalog', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2857, 'Western Mindanao', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2858, 'Western Visayas', 173, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2859, 'Pitcairn Island', 174, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2860, 'Biale Blota', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2861, 'Dobroszyce', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2862, 'Dolnoslaskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2863, 'Dziekanow Lesny', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2864, 'Hopowo', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2865, 'Kartuzy', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2866, 'Koscian', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2867, 'Krakow', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2868, 'Kujawsko-Pomorskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2869, 'Lodzkie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2870, 'Lubelskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2871, 'Lubuskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2872, 'Malomice', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2873, 'Malopolskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2874, 'Mazowieckie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2875, 'Mirkow', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2876, 'Opolskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2877, 'Ostrowiec', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2878, 'Podkarpackie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2879, 'Podlaskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2880, 'Polska', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2881, 'Pomorskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2882, 'Poznan', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2883, 'Pruszkow', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2884, 'Rymanowska', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2885, 'Rzeszow', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2886, 'Slaskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2887, 'Stare Pole', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2888, 'Swietokrzyskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2889, 'Warminsko-Mazurskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2890, 'Warsaw', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2891, 'Wejherowo', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2892, 'Wielkopolskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2893, 'Wroclaw', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2894, 'Zachodnio-Pomorskie', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2895, 'Zukowo', 175, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2896, 'Abrantes', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2897, 'Acores', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2898, 'Alentejo', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2899, 'Algarve', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2900, 'Braga', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2901, 'Centro', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2902, 'Distrito de Leiria', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2903, 'Distrito de Viana do Castelo', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2904, 'Distrito de Vila Real', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2905, 'Distrito do Porto', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2906, 'Lisboa e Vale do Tejo', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2907, 'Madeira', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2908, 'Norte', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2909, 'Paivas', 176, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2910, 'Arecibo', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2911, 'Bayamon', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2912, 'Carolina', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2913, 'Florida', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2914, 'Guayama', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2915, 'Humacao', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2916, 'Mayaguez-Aguadilla', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2917, 'Ponce', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2918, 'Salinas', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2919, 'San Juan', 177, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2920, 'Doha', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2921, 'Jarian-al-Batnah', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2922, 'Umm Salal', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2923, 'ad-Dawhah', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2924, 'al-Ghuwayriyah', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2925, 'al-Jumayliyah', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2926, 'al-Khawr', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2927, 'al-Wakrah', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2928, 'ar-Rayyan', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2929, 'ash-Shamal', 178, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2930, 'Saint-Benoit', 179, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2931, 'Saint-Denis', 179, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2932, 'Saint-Paul', 179, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2933, 'Saint-Pierre', 179, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2934, 'Alba', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2935, 'Arad', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2936, 'Arges', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2937, 'Bacau', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2938, 'Bihor', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2939, 'Bistrita-Nasaud', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2940, 'Botosani', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2941, 'Braila', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2942, 'Brasov', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2943, 'Bucuresti', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2944, 'Buzau', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2945, 'Calarasi', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2946, 'Caras-Severin', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2947, 'Cluj', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2948, 'Constanta', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2949, 'Covasna', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2950, 'Dambovita', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2951, 'Dolj', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2952, 'Galati', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2953, 'Giurgiu', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2954, 'Gorj', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2955, 'Harghita', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2956, 'Hunedoara', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2957, 'Ialomita', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2958, 'Iasi', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2959, 'Ilfov', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2960, 'Maramures', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2961, 'Mehedinti', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2962, 'Mures', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2963, 'Neamt', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2964, 'Olt', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2965, 'Prahova', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2966, 'Salaj', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2967, 'Satu Mare', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2968, 'Sibiu', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2969, 'Sondelor', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2970, 'Suceava', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2971, 'Teleorman', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2972, 'Timis', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2973, 'Tulcea', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2974, 'Valcea', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2975, 'Vaslui', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2976, 'Vrancea', 180, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2977, 'Adygeja', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2978, 'Aga', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2979, 'Alanija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2980, 'Altaj', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2981, 'Amur', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2982, 'Arhangelsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2983, 'Astrahan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2984, 'Bashkortostan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2985, 'Belgorod', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2986, 'Brjansk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2987, 'Burjatija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2988, 'Chechenija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2989, 'Cheljabinsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2990, 'Chita', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2991, 'Chukotka', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2992, 'Chuvashija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2993, 'Dagestan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2994, 'Evenkija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2995, 'Gorno-Altaj', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2996, 'Habarovsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2997, 'Hakasija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2998, 'Hanty-Mansija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(2999, 'Ingusetija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3000, 'Irkutsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3001, 'Ivanovo', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3002, 'Jamalo-Nenets', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3003, 'Jaroslavl', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3004, 'Jevrej', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3005, 'Kabardino-Balkarija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3006, 'Kaliningrad', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3007, 'Kalmykija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3008, 'Kaluga', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3009, 'Kamchatka', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3010, 'Karachaj-Cherkessija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3011, 'Karelija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3012, 'Kemerovo', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3013, 'Khabarovskiy Kray', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3014, 'Kirov', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3015, 'Komi', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3016, 'Komi-Permjakija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3017, 'Korjakija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3018, 'Kostroma', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3019, 'Krasnodar', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3020, 'Krasnojarsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3021, 'Krasnoyarskiy Kray', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3022, 'Kurgan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3023, 'Kursk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3024, 'Leningrad', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3025, 'Lipeck', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3026, 'Magadan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3027, 'Marij El', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3028, 'Mordovija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3029, 'Moscow', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3030, 'Moskovskaja Oblast', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3031, 'Moskovskaya Oblast', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3032, 'Moskva', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3033, 'Murmansk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3034, 'Nenets', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3035, 'Nizhnij Novgorod', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3036, 'Novgorod', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3037, 'Novokusnezk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3038, 'Novosibirsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3039, 'Omsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3040, 'Orenburg', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3041, 'Orjol', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3042, 'Penza', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3043, 'Perm', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3044, 'Primorje', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3045, 'Pskov', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3046, 'Pskovskaya Oblast', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3047, 'Rjazan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3048, 'Rostov', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3049, 'Saha', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3050, 'Sahalin', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3051, 'Samara', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3052, 'Samarskaya', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3053, 'Sankt-Peterburg', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3054, 'Saratov', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3055, 'Smolensk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3056, 'Stavropol', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3057, 'Sverdlovsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3058, 'Tajmyrija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3059, 'Tambov', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3060, 'Tatarstan', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3061, 'Tjumen', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3062, 'Tomsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3063, 'Tula', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3064, 'Tver', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3065, 'Tyva', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3066, 'Udmurtija', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3067, 'Uljanovsk', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3068, 'Ulyanovskaya Oblast', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3069, 'Ust-Orda', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3070, 'Vladimir', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3071, 'Volgograd', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3072, 'Vologda', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3073, 'Voronezh', 181, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3074, 'Butare', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3075, 'Byumba', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3076, 'Cyangugu', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3077, 'Gikongoro', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3078, 'Gisenyi', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3079, 'Gitarama', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3080, 'Kibungo', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3081, 'Kibuye', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3082, 'Kigali-ngali', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3083, 'Ruhengeri', 182, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3084, 'Ascension', 183, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3085, 'Gough Island', 183, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3086, 'Saint Helena', 183, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3087, 'Tristan da Cunha', 183, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3088, 'Christ Church Nichola Town', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3089, 'Saint Anne Sandy Point', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3090, 'Saint George Basseterre', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3091, 'Saint George Gingerland', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3092, 'Saint James Windward', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3093, 'Saint John Capesterre', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3094, 'Saint John Figtree', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3095, 'Saint Mary Cayon', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3096, 'Saint Paul Capesterre', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3097, 'Saint Paul Charlestown', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3098, 'Saint Peter Basseterre', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3099, 'Saint Thomas Lowland', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3100, 'Saint Thomas Middle Island', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3101, 'Trinity Palmetto Point', 184, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3102, 'Anse-la-Raye', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3103, 'Canaries', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3104, 'Castries', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3105, 'Choiseul', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3106, 'Dennery', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3107, 'Gros Inlet', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3108, 'Laborie', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3109, 'Micoud', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3110, 'Soufriere', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3111, 'Vieux Fort', 185, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3112, 'Miquelon-Langlade', 186, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3113, 'Saint-Pierre', 186, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3114, 'Charlotte', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3115, 'Grenadines', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3116, 'Saint Andrew', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3117, 'Saint David', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3118, 'Saint George', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3119, 'Saint Patrick', 187, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3120, 'A\'ana', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3121, 'Aiga-i-le-Tai', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3122, 'Atua', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3123, 'Fa\'asaleleaga', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3124, 'Gaga\'emauga', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3125, 'Gagaifomauga', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3126, 'Palauli', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3127, 'Satupa\'itea', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3128, 'Tuamasaga', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3129, 'Va\'a-o-Fonoti', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3130, 'Vaisigano', 188, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3131, 'Acquaviva', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3132, 'Borgo Maggiore', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3133, 'Chiesanuova', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3134, 'Domagnano', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3135, 'Faetano', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3136, 'Fiorentino', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3137, 'Montegiardino', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3138, 'San Marino', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3139, 'Serravalle', 189, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3140, 'Agua Grande', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3141, 'Cantagalo', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3142, 'Lemba', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3143, 'Lobata', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3144, 'Me-Zochi', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3145, 'Pague', 190, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3146, 'Al Khobar', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3147, 'Aseer', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3148, 'Ash Sharqiyah', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3149, 'Asir', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3150, 'Central Province', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3151, 'Eastern Province', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3152, 'Ha\'il', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3153, 'Jawf', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3154, 'Jizan', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3155, 'Makkah', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3156, 'Najran', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3157, 'Qasim', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3158, 'Tabuk', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3159, 'Western Province', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3160, 'al-Bahah', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3161, 'al-Hudud-ash-Shamaliyah', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3162, 'al-Madinah', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3163, 'ar-Riyad', 191, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3164, 'Dakar', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3165, 'Diourbel', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3166, 'Fatick', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3167, 'Kaolack', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3168, 'Kolda', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3169, 'Louga', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3170, 'Saint-Louis', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3171, 'Tambacounda', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3172, 'Thies', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3173, 'Ziguinchor', 192, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3174, 'Central Serbia', 193, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3175, 'Kosovo and Metohija', 193, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3176, 'Vojvodina', 193, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3177, 'Anse Boileau', 194, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3178, 'Anse Royale', 194, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3179, 'Cascade', 194, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3180, 'Takamaka', 194, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3181, 'Victoria', 194, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3182, 'Eastern', 195, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3183, 'Northern', 195, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3184, 'Southern', 195, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3185, 'Western', 195, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3186, 'Singapore', 196, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3187, 'Banskobystricky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3188, 'Bratislavsky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3189, 'Kosicky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3190, 'Nitriansky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3191, 'Presovsky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3192, 'Trenciansky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3193, 'Trnavsky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3194, 'Zilinsky', 197, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3195, 'Benedikt', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3196, 'Gorenjska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3197, 'Gorishka', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3198, 'Jugovzhodna Slovenija', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3199, 'Koroshka', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3200, 'Notranjsko-krashka', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3201, 'Obalno-krashka', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3202, 'Obcina Domzale', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3203, 'Obcina Vitanje', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3204, 'Osrednjeslovenska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3205, 'Podravska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3206, 'Pomurska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3207, 'Savinjska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3208, 'Slovenian Littoral', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3209, 'Spodnjeposavska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3210, 'Zasavska', 198, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3211, 'Pitcairn', 199, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3212, 'Central', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3213, 'Choiseul', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3214, 'Guadalcanal', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3215, 'Isabel', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3216, 'Makira and Ulawa', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3217, 'Malaita', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3218, 'Rennell and Bellona', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3219, 'Temotu', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3220, 'Western', 200, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3221, 'Awdal', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3222, 'Bakol', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3223, 'Banadir', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3224, 'Bari', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3225, 'Bay', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3226, 'Galgudug', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3227, 'Gedo', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3228, 'Hiran', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3229, 'Jubbada Hose', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3230, 'Jubbadha Dexe', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3231, 'Mudug', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3232, 'Nugal', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3233, 'Sanag', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3234, 'Shabellaha Dhexe', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3235, 'Shabellaha Hose', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3236, 'Togdher', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3237, 'Woqoyi Galbed', 201, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3238, 'Eastern Cape', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3239, 'Free State', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3240, 'Gauteng', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3241, 'Kempton Park', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3242, 'Kramerville', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3243, 'KwaZulu Natal', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3244, 'Limpopo', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3245, 'Mpumalanga', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3246, 'North West', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3247, 'Northern Cape', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3248, 'Parow', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3249, 'Table View', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3250, 'Umtentweni', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3251, 'Western Cape', 202, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3252, 'South Georgia', 203, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3253, 'Central Equatoria', 204, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3254, 'A Coruna', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3255, 'Alacant', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3256, 'Alava', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3257, 'Albacete', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3258, 'Almeria', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3260, 'Asturias', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3261, 'Avila', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3262, 'Badajoz', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3263, 'Balears', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3264, 'Barcelona', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3267, 'Burgos', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3268, 'Caceres', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3269, 'Cadiz', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3270, 'Cantabria', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3271, 'Castello', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3273, 'Ceuta', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3274, 'Ciudad Real', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3281, 'Cordoba', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3282, 'Cuenca', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3284, 'Girona', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3285, 'Granada', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3286, 'Guadalajara', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3287, 'Guipuzcoa', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3288, 'Huelva', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3289, 'Huesca', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3290, 'Jaen', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3291, 'La Rioja', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3292, 'Las Palmas', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3293, 'Leon', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3295, 'Lleida', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3296, 'Lugo', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3297, 'Madrid', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3298, 'Malaga', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3299, 'Melilla', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3300, 'Murcia', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3301, 'Navarra', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3302, 'Ourense', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3303, 'Pais Vasco', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3304, 'Palencia', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3305, 'Pontevedra', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3306, 'Salamanca', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3308, 'Segovia', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3309, 'Sevilla', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3310, 'Soria', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3311, 'Tarragona', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3312, 'Santa Cruz de Tenerife', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3313, 'Teruel', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3314, 'Toledo', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3315, 'Valencia', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3316, 'Valladolid', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3317, 'Vizcaya', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3318, 'Zamora', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3319, 'Zaragoza', 205, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3320, 'Amparai', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3321, 'Anuradhapuraya', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3322, 'Badulla', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3323, 'Boralesgamuwa', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3324, 'Colombo', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3325, 'Galla', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3326, 'Gampaha', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3327, 'Hambantota', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3328, 'Kalatura', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3329, 'Kegalla', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3330, 'Kilinochchi', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3331, 'Kurunegala', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3332, 'Madakalpuwa', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3333, 'Maha Nuwara', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3334, 'Malwana', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3335, 'Mannarama', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3336, 'Matale', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3337, 'Matara', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3338, 'Monaragala', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3339, 'Mullaitivu', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3340, 'North Eastern Province', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3341, 'North Western Province', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3342, 'Nuwara Eliya', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3343, 'Polonnaruwa', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3344, 'Puttalama', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3345, 'Ratnapuraya', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3346, 'Southern Province', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3347, 'Tirikunamalaya', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3348, 'Tuscany', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3349, 'Vavuniyawa', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3350, 'Western Province', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3351, 'Yapanaya', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3352, 'kadawatha', 206, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3353, 'A\'ali-an-Nil', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3354, 'Bahr-al-Jabal', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3355, 'Central Equatoria', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3356, 'Gharb Bahr-al-Ghazal', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3357, 'Gharb Darfur', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3358, 'Gharb Kurdufan', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3359, 'Gharb-al-Istiwa\'iyah', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3360, 'Janub Darfur', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3361, 'Janub Kurdufan', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3362, 'Junqali', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3363, 'Kassala', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3364, 'Nahr-an-Nil', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3365, 'Shamal Bahr-al-Ghazal', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3366, 'Shamal Darfur', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3367, 'Shamal Kurdufan', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3368, 'Sharq-al-Istiwa\'iyah', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3369, 'Sinnar', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3370, 'Warab', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3371, 'Wilayat al Khartum', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3372, 'al-Bahr-al-Ahmar', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3373, 'al-Buhayrat', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3374, 'al-Jazirah', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3375, 'al-Khartum', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3376, 'al-Qadarif', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3377, 'al-Wahdah', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3378, 'an-Nil-al-Abyad', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3379, 'an-Nil-al-Azraq', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3380, 'ash-Shamaliyah', 207, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3381, 'Brokopondo', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3382, 'Commewijne', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3383, 'Coronie', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3384, 'Marowijne', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3385, 'Nickerie', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3386, 'Para', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3387, 'Paramaribo', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3388, 'Saramacca', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3389, 'Wanica', 208, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3390, 'Svalbard', 209, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3391, 'Hhohho', 210, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3392, 'Lubombo', 210, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3393, 'Manzini', 210, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3394, 'Shiselweni', 210, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3395, 'Alvsborgs Lan', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3396, 'Angermanland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3397, 'Blekinge', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3398, 'Bohuslan', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3399, 'Dalarna', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3400, 'Gavleborg', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3401, 'Gaza', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3402, 'Gotland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3403, 'Halland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3404, 'Jamtland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3405, 'Jonkoping', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3406, 'Kalmar', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3407, 'Kristianstads', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3408, 'Kronoberg', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3409, 'Norrbotten', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3410, 'Orebro', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3411, 'Ostergotland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3412, 'Saltsjo-Boo', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3413, 'Skane', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3414, 'Smaland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3415, 'Sodermanland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3416, 'Stockholm', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3417, 'Uppsala', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3418, 'Varmland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3419, 'Vasterbotten', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3420, 'Vastergotland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3421, 'Vasternorrland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3422, 'Vastmanland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3423, 'Vastra Gotaland', 211, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3424, 'Aargau', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3425, 'Appenzell Inner-Rhoden', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3426, 'Appenzell-Ausser Rhoden', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3427, 'Basel-Landschaft', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3428, 'Basel-Stadt', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3429, 'Bern', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3430, 'Canton Ticino', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3431, 'Fribourg', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3432, 'Geneve', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3433, 'Glarus', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3434, 'Graubunden', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3435, 'Heerbrugg', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3436, 'Jura', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3437, 'Kanton Aargau', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3438, 'Luzern', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3439, 'Morbio Inferiore', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3440, 'Muhen', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3441, 'Neuchatel', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3442, 'Nidwalden', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3443, 'Obwalden', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3444, 'Sankt Gallen', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3445, 'Schaffhausen', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3446, 'Schwyz', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3447, 'Solothurn', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3448, 'Thurgau', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3449, 'Ticino', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3450, 'Uri', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3451, 'Valais', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3452, 'Vaud', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3453, 'Vauffelin', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3454, 'Zug', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3455, 'Zurich', 212, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3456, 'Aleppo', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3457, 'Dar\'a', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3458, 'Dayr-az-Zawr', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3459, 'Dimashq', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3460, 'Halab', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3461, 'Hamah', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3462, 'Hims', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3463, 'Idlib', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3464, 'Madinat Dimashq', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3465, 'Tartus', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3466, 'al-Hasakah', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3467, 'al-Ladhiqiyah', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3468, 'al-Qunaytirah', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3469, 'ar-Raqqah', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3470, 'as-Suwayda', 213, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3471, 'Changhua County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3472, 'Chiayi County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3473, 'Chiayi City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3474, 'Taipei City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3475, 'Hsinchu County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3476, 'Hsinchu City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3477, 'Hualien County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3480, 'Kaohsiung City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3481, 'Keelung City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3482, 'Kinmen County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3483, 'Miaoli County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3484, 'Nantou County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3486, 'Penghu County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3487, 'Pingtung County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3488, 'Taichung City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3492, 'Tainan City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3493, 'New Taipei City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3495, 'Taitung County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3496, 'Taoyuan City', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3497, 'Yilan County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3498, 'YunLin County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3500, 'Dushanbe', 215, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3501, 'Gorno-Badakhshan', 215, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3502, 'Karotegin', 215, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3503, 'Khatlon', 215, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3504, 'Sughd', 215, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3505, 'Arusha', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3506, 'Dar es Salaam', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3507, 'Dodoma', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3508, 'Iringa', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3509, 'Kagera', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3510, 'Kigoma', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3511, 'Kilimanjaro', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3512, 'Lindi', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3513, 'Mara', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3514, 'Mbeya', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3515, 'Morogoro', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3516, 'Mtwara', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3517, 'Mwanza', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3518, 'Pwani', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3519, 'Rukwa', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3520, 'Ruvuma', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3521, 'Shinyanga', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3522, 'Singida', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3523, 'Tabora', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3524, 'Tanga', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3525, 'Zanzibar and Pemba', 216, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3526, 'Amnat Charoen', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3527, 'Ang Thong', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3528, 'Bangkok', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3529, 'Buri Ram', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3530, 'Chachoengsao', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3531, 'Chai Nat', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3532, 'Chaiyaphum', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3533, 'Changwat Chaiyaphum', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3534, 'Chanthaburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3535, 'Chiang Mai', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3536, 'Chiang Rai', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3537, 'Chon Buri', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3538, 'Chumphon', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3539, 'Kalasin', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3540, 'Kamphaeng Phet', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3541, 'Kanchanaburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3542, 'Khon Kaen', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3543, 'Krabi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3544, 'Krung Thep', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3545, 'Lampang', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3546, 'Lamphun', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3547, 'Loei', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3548, 'Lop Buri', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3549, 'Mae Hong Son', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3550, 'Maha Sarakham', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3551, 'Mukdahan', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3552, 'Nakhon Nayok', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3553, 'Nakhon Pathom', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3554, 'Nakhon Phanom', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3555, 'Nakhon Ratchasima', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3556, 'Nakhon Sawan', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3557, 'Nakhon Si Thammarat', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3558, 'Nan', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3559, 'Narathiwat', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3560, 'Nong Bua Lam Phu', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3561, 'Nong Khai', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3562, 'Nonthaburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3563, 'Pathum Thani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3564, 'Pattani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3565, 'Phangnga', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3566, 'Phatthalung', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3567, 'Phayao', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3568, 'Phetchabun', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3569, 'Phetchaburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3570, 'Phichit', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3571, 'Phitsanulok', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3572, 'Phra Nakhon Si Ayutthaya', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3573, 'Phrae', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3574, 'Phuket', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3575, 'Prachin Buri', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3576, 'Prachuap Khiri Khan', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3577, 'Ranong', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3578, 'Ratchaburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3579, 'Rayong', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3580, 'Roi Et', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3581, 'Sa Kaeo', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3582, 'Sakon Nakhon', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3583, 'Samut Prakan', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3584, 'Samut Sakhon', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3585, 'Samut Songkhran', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3586, 'Saraburi', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3587, 'Satun', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3588, 'Si Sa Ket', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3589, 'Sing Buri', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3590, 'Songkhla', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3591, 'Sukhothai', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3592, 'Suphan Buri', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3593, 'Surat Thani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3594, 'Surin', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3595, 'Tak', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3596, 'Trang', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3597, 'Trat', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3598, 'Ubon Ratchathani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3599, 'Udon Thani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3600, 'Uthai Thani', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3601, 'Uttaradit', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3602, 'Yala', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3603, 'Yasothon', 217, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3604, 'Centre', 218, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3605, 'Kara', 218, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3606, 'Maritime', 218, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3607, 'Plateaux', 218, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3608, 'Savanes', 218, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3609, 'Atafu', 219, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3610, 'Fakaofo', 219, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3611, 'Nukunonu', 219, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3612, 'Eua', 220, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3613, 'Ha\'apai', 220, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3614, 'Niuas', 220, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3615, 'Tongatapu', 220, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3616, 'Vava\'u', 220, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3617, 'Arima-Tunapuna-Piarco', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3618, 'Caroni', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3619, 'Chaguanas', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3620, 'Couva-Tabaquite-Talparo', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3621, 'Diego Martin', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3622, 'Glencoe', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3623, 'Penal Debe', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3624, 'Point Fortin', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3625, 'Port of Spain', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3626, 'Princes Town', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3627, 'Saint George', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3628, 'San Fernando', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3629, 'San Juan', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3630, 'Sangre Grande', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3631, 'Siparia', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3632, 'Tobago', 221, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3633, 'Aryanah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3634, 'Bajah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3635, 'Bin \'Arus', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3636, 'Binzart', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3637, 'Gouvernorat de Ariana', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3638, 'Gouvernorat de Nabeul', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3639, 'Gouvernorat de Sousse', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3640, 'Hammamet Yasmine', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3641, 'Jundubah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3642, 'Madaniyin', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3643, 'Manubah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3644, 'Monastir', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3645, 'Nabul', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3646, 'Qabis', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3647, 'Qafsah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3648, 'Qibili', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3649, 'Safaqis', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3650, 'Sfax', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3651, 'Sidi Bu Zayd', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3652, 'Silyanah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3653, 'Susah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3654, 'Tatawin', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3655, 'Tawzar', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3656, 'Tunis', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3657, 'Zaghwan', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3658, 'al-Kaf', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3659, 'al-Mahdiyah', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3660, 'al-Munastir', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3661, 'al-Qasrayn', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3662, 'al-Qayrawan', 222, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3663, 'Adana', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3664, 'Adiyaman', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3665, 'Afyon', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3666, 'Agri', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3667, 'Aksaray', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3668, 'Amasya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3669, 'Ankara', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3670, 'Antalya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3671, 'Ardahan', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3672, 'Artvin', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3673, 'Aydin', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3674, 'Balikesir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3675, 'Bartin', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3676, 'Batman', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3677, 'Bayburt', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3678, 'Bilecik', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3679, 'Bingol', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3680, 'Bitlis', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3681, 'Bolu', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3682, 'Burdur', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3683, 'Bursa', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3684, 'Canakkale', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3685, 'Cankiri', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3686, 'Corum', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3687, 'Denizli', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3688, 'Diyarbakir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3689, 'Duzce', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3690, 'Edirne', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3691, 'Elazig', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3692, 'Erzincan', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3693, 'Erzurum', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3694, 'Eskisehir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3695, 'Gaziantep', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3696, 'Giresun', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3697, 'Gumushane', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3698, 'Hakkari', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3699, 'Hatay', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3700, 'Icel', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3701, 'Igdir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3702, 'Isparta', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3703, 'Istanbul', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3704, 'Izmir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3705, 'Kahramanmaras', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3706, 'Karabuk', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3707, 'Karaman', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3708, 'Kars', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3709, 'Karsiyaka', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3710, 'Kastamonu', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3711, 'Kayseri', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3712, 'Kilis', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3713, 'Kirikkale', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3714, 'Kirklareli', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3715, 'Kirsehir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3716, 'Kocaeli', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3717, 'Konya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3718, 'Kutahya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3719, 'Lefkosa', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3720, 'Malatya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3721, 'Manisa', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3722, 'Mardin', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3723, 'Mugla', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3724, 'Mus', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3725, 'Nevsehir', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3726, 'Nigde', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3727, 'Ordu', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3728, 'Osmaniye', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3729, 'Rize', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3730, 'Sakarya', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3731, 'Samsun', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3732, 'Sanliurfa', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3733, 'Siirt', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3734, 'Sinop', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3735, 'Sirnak', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3736, 'Sivas', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3737, 'Tekirdag', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3738, 'Tokat', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3739, 'Trabzon', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3740, 'Tunceli', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3741, 'Usak', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3742, 'Van', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3743, 'Yalova', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3744, 'Yozgat', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3745, 'Zonguldak', 223, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3746, 'Ahal', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3747, 'Asgabat', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3748, 'Balkan', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3749, 'Dasoguz', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3750, 'Lebap', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3751, 'Mari', 224, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3752, 'Grand Turk', 225, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3753, 'South Caicos and East Caicos', 225, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3754, 'Funafuti', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3755, 'Nanumanga', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3756, 'Nanumea', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3757, 'Niutao', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3758, 'Nui', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3759, 'Nukufetau', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3760, 'Nukulaelae', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3761, 'Vaitupu', 226, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3762, 'Central', 227, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3763, 'Eastern', 227, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3764, 'Northern', 227, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3765, 'Western', 227, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3766, 'Cherkas\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3767, 'Chernihivs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3768, 'Chernivets\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3769, 'Crimea', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3770, 'Dnipropetrovska', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3771, 'Donets\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3772, 'Ivano-Frankivs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3773, 'Kharkiv', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3774, 'Kharkov', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3775, 'Khersonska', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3776, 'Khmel\'nyts\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3777, 'Kirovohrad', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3778, 'Krym', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3779, 'Kyyiv', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3780, 'Kyyivs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3781, 'L\'vivs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3782, 'Luhans\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3783, 'Mykolayivs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3784, 'Odes\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3785, 'Odessa', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3786, 'Poltavs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3787, 'Rivnens\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3788, 'Sevastopol\'', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3789, 'Sums\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3790, 'Ternopil\'s\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3791, 'Volyns\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3792, 'Vynnyts\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3793, 'Zakarpats\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3794, 'Zaporizhia', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3795, 'Zhytomyrs\'ka', 228, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3796, 'Abu Zabi', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3797, 'Ajman', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3798, 'Dubai', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3799, 'Ras al-Khaymah', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3800, 'Sharjah', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3801, 'Sharjha', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3802, 'Umm al Qaywayn', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3803, 'al-Fujayrah', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3804, 'ash-Shariqah', 229, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3805, 'Aberdeen', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3806, 'Aberdeenshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3807, 'Argyll', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3808, 'Armagh', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3809, 'Bedfordshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3810, 'Belfast', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3811, 'Berkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3812, 'Birmingham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3813, 'Brechin', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3814, 'Bridgnorth', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3815, 'Bristol', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3816, 'Buckinghamshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3817, 'Cambridge', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3818, 'Cambridgeshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3819, 'Channel Islands', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3820, 'Cheshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3821, 'Cleveland', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3822, 'Co Fermanagh', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3823, 'Conwy', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3824, 'Cornwall', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3825, 'Coventry', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3826, 'Craven Arms', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3827, 'Cumbria', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3828, 'Denbighshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3829, 'Derby', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3830, 'Derbyshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3831, 'Devon', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3832, 'Dial Code Dungannon', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3833, 'Didcot', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3834, 'Dorset', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3835, 'Dunbartonshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3836, 'Durham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3837, 'East Dunbartonshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3838, 'East Lothian', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3839, 'East Midlands', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3840, 'East Sussex', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3841, 'East Yorkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3842, 'England', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3843, 'Essex', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3844, 'Fermanagh', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3845, 'Fife', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3846, 'Flintshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3847, 'Fulham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3848, 'Gainsborough', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3849, 'Glocestershire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3850, 'Gwent', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3851, 'Hampshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3852, 'Hants', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3853, 'Herefordshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3854, 'Hertfordshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3855, 'Ireland', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3856, 'Isle Of Man', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3857, 'Isle of Wight', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3858, 'Kenford', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3859, 'Kent', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3860, 'Kilmarnock', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3861, 'Lanarkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3862, 'Lancashire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3863, 'Leicestershire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3864, 'Lincolnshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3865, 'Llanymynech', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3866, 'London', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3867, 'Ludlow', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3868, 'Manchester', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3869, 'Mayfair', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3870, 'Merseyside', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3871, 'Mid Glamorgan', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3872, 'Middlesex', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3873, 'Mildenhall', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3874, 'Monmouthshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3875, 'Newton Stewart', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3876, 'Norfolk', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3877, 'North Humberside', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3878, 'North Yorkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3879, 'Northamptonshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3880, 'Northants', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3881, 'Northern Ireland', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3882, 'Northumberland', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3883, 'Nottinghamshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3884, 'Oxford', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3885, 'Powys', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3886, 'Roos-shire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3887, 'SUSSEX', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3888, 'Sark', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3889, 'Scotland', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3890, 'Scottish Borders', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3891, 'Shropshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3892, 'Somerset', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3893, 'South Glamorgan', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3894, 'South Wales', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3895, 'South Yorkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3896, 'Southwell', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3897, 'Staffordshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3898, 'Strabane', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3899, 'Suffolk', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3900, 'Surrey', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3901, 'Sussex', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3902, 'Twickenham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3903, 'Tyne and Wear', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3904, 'Tyrone', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3905, 'Utah', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3906, 'Wales', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3907, 'Warwickshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3908, 'West Lothian', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3909, 'West Midlands', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3910, 'West Sussex', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3911, 'West Yorkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3912, 'Whissendine', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3913, 'Wiltshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3914, 'Wokingham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3915, 'Worcestershire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3916, 'Wrexham', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3917, 'Wurttemberg', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3918, 'Yorkshire', 230, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3919, 'Alabama', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3920, 'Alaska', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3921, 'Arizona', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3922, 'Arkansas', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3923, 'Byram', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3924, 'California', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3925, 'Cokato', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3926, 'Colorado', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3927, 'Connecticut', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3928, 'Delaware', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3929, 'District of Columbia', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3930, 'Florida', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3931, 'Georgia', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3932, 'Hawaii', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3933, 'Idaho', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3934, 'Illinois', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3935, 'Indiana', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3936, 'Iowa', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3937, 'Kansas', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3938, 'Kentucky', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3939, 'Louisiana', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3940, 'Lowa', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3941, 'Maine', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3942, 'Maryland', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3943, 'Massachusetts', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3944, 'Medfield', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3945, 'Michigan', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3946, 'Minnesota', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3947, 'Mississippi', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3948, 'Missouri', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3949, 'Montana', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3950, 'Nebraska', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3951, 'Nevada', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3952, 'New Hampshire', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3953, 'New Jersey', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3954, 'New Jersy', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3955, 'New Mexico', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3956, 'New York', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3957, 'North Carolina', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3958, 'North Dakota', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3959, 'Ohio', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3960, 'Oklahoma', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3961, 'Ontario', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3962, 'Oregon', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3963, 'Pennsylvania', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3964, 'Ramey', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3965, 'Rhode Island', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3966, 'South Carolina', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3967, 'South Dakota', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3968, 'Sublimity', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3969, 'Tennessee', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3970, 'Texas', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3971, 'Trimble', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3972, 'Utah', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3973, 'Vermont', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3974, 'Virginia', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3975, 'Washington', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3976, 'West Virginia', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3977, 'Wisconsin', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3978, 'Wyoming', 231, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3979, 'United States Minor Outlying I', 232, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3980, 'Artigas', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3981, 'Canelones', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3982, 'Cerro Largo', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3983, 'Colonia', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3984, 'Durazno', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3985, 'FLorida', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3986, 'Flores', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3987, 'Lavalleja', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3988, 'Maldonado', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3989, 'Montevideo', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3990, 'Paysandu', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3991, 'Rio Negro', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3992, 'Rivera', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3993, 'Rocha', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3994, 'Salto', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3995, 'San Jose', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3996, 'Soriano', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3997, 'Tacuarembo', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3998, 'Treinta y Tres', 233, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(3999, 'Andijon', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4000, 'Buhoro', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4001, 'Buxoro Viloyati', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4002, 'Cizah', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4003, 'Fargona', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4004, 'Horazm', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4005, 'Kaskadar', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4006, 'Korakalpogiston', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4007, 'Namangan', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4008, 'Navoi', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4009, 'Samarkand', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4010, 'Sirdare', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4011, 'Surhondar', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4012, 'Toskent', 234, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4013, 'Malampa', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4014, 'Penama', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4015, 'Sanma', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4016, 'Shefa', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4017, 'Tafea', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4018, 'Torba', 235, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4019, 'Vatican City State (Holy See)', 236, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4020, 'Amazonas', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4021, 'Anzoategui', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4022, 'Apure', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4023, 'Aragua', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4024, 'Barinas', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4025, 'Bolivar', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4026, 'Carabobo', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4027, 'Cojedes', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4028, 'Delta Amacuro', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4029, 'Distrito Federal', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4030, 'Falcon', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4031, 'Guarico', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4032, 'Lara', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4033, 'Merida', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4034, 'Miranda', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4035, 'Monagas', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4036, 'Nueva Esparta', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4037, 'Portuguesa', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4038, 'Sucre', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4039, 'Tachira', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4040, 'Trujillo', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4041, 'Vargas', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4042, 'Yaracuy', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4043, 'Zulia', 237, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4044, 'Bac Giang', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4045, 'Binh Dinh', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4046, 'Binh Duong', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4047, 'Da Nang', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4048, 'Dong Bang Song Cuu Long', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4049, 'Dong Bang Song Hong', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4050, 'Dong Nai', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4051, 'Dong Nam Bo', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4052, 'Duyen Hai Mien Trung', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4053, 'Hanoi', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4054, 'Hung Yen', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4055, 'Khu Bon Cu', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4056, 'Long An', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4057, 'Mien Nui Va Trung Du', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4058, 'Thai Nguyen', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4059, 'Thanh Pho Ho Chi Minh', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4060, 'Thu Do Ha Noi', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4061, 'Tinh Can Tho', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4062, 'Tinh Da Nang', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4063, 'Tinh Gia Lai', 238, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4064, 'Anegada', 239, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4065, 'Jost van Dyke', 239, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4066, 'Tortola', 239, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4067, 'Saint Croix', 240, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4068, 'Saint John', 240, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4069, 'Saint Thomas', 240, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4070, 'Alo', 241, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4071, 'Singave', 241, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4072, 'Wallis', 241, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4073, 'Bu Jaydur', 242, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4074, 'Wad-adh-Dhahab', 242, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4075, 'al-\'Ayun', 242, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4076, 'as-Samarah', 242, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4077, '\'Adan', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4078, 'Abyan', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4079, 'Dhamar', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4080, 'Hadramaut', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4081, 'Hajjah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4082, 'Hudaydah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4083, 'Ibb', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4084, 'Lahij', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4085, 'Ma\'rib', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4086, 'Madinat San\'a', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4087, 'Sa\'dah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4088, 'Sana', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4089, 'Shabwah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4090, 'Ta\'izz', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4091, 'al-Bayda', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4092, 'al-Hudaydah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4093, 'al-Jawf', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4094, 'al-Mahrah', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4095, 'al-Mahwit', 243, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4096, 'Central Serbia', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4097, 'Kosovo and Metohija', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4098, 'Montenegro', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4099, 'Republic of Serbia', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4100, 'Serbia', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4101, 'Vojvodina', 244, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4102, 'Central', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4103, 'Copperbelt', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4104, 'Eastern', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4105, 'Luapala', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4106, 'Lusaka', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4107, 'North-Western', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4108, 'Northern', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4109, 'Southern', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4110, 'Western', 245, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4111, 'Bulawayo', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4112, 'Harare', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4113, 'Manicaland', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4114, 'Mashonaland Central', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4115, 'Mashonaland East', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4116, 'Mashonaland West', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4117, 'Masvingo', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4118, 'Matabeleland North', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4119, 'Matabeleland South', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4120, 'Midlands', 246, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL),
(4121, 'Lienchiang County', 214, 0, '2021-04-06 01:11:20', '2021-04-06 01:11:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teamcategories`
--

CREATE TABLE `teamcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teamcategory_teampost`
--

CREATE TABLE `teamcategory_teampost` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teampost_id` bigint(20) UNSIGNED NOT NULL,
  `teamcategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teamposts`
--

CREATE TABLE `teamposts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `referred_by` int(11) DEFAULT NULL,
  `provider_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_email_verification_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `banned` tinyint(4) DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `referred_by`, `provider_by`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `new_email_verification_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `state`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, NULL, 'Mr.Rakibul Islam', 'author@gmail.com', NULL, NULL, NULL, '$2y$10$IlqNWTSVzRmMOO8OxLOlwuizGCiLDJEqXiwRS7QBXrIdrpkDLUSBG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01912431987', NULL, NULL, NULL, NULL, NULL, 0, '2022-01-15 03:19:33', '2022-01-15 04:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sidebar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `no_of_post` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallary_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributevalues`
--
ALTER TABLE `attributevalues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`),
  ADD KEY `category_post_category_id_foreign` (`category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `combined_orders`
--
ALTER TABLE `combined_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contentcategories`
--
ALTER TABLE `contentcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contentcategory_contentpost`
--
ALTER TABLE `contentcategory_contentpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contentcategory_contentpost_contentpost_id_foreign` (`contentpost_id`),
  ADD KEY `contentcategory_contentpost_contentcategory_id_foreign` (`contentcategory_id`);

--
-- Indexes for table `contentposts`
--
ALTER TABLE `contentposts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contentposts_slug_unique` (`slug`),
  ADD KEY `contentposts_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custompages`
--
ALTER TABLE `custompages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filemanager`
--
ALTER TABLE `filemanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flashdeals`
--
ALTER TABLE `flashdeals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flashdeal_product`
--
ALTER TABLE `flashdeal_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flashdeal_product_flashdeal_id_foreign` (`flashdeal_id`),
  ADD KEY `flashdeal_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `frontmenuitems`
--
ALTER TABLE `frontmenuitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontmenus`
--
ALTER TABLE `frontmenus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frontmenus_title_unique` (`title`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`);

--
-- Indexes for table `navbarsettings`
--
ALTER TABLE `navbarsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagebuilders`
--
ALTER TABLE `pagebuilders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfoliocategories`
--
ALTER TABLE `portfoliocategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_slug_unique` (`slug`),
  ADD KEY `portfolios_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `portfolio_portfoliocategory`
--
ALTER TABLE `portfolio_portfoliocategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_portfoliocategory_portfolio_id_foreign` (`portfolio_id`),
  ADD KEY `portfolio_portfoliocategory_portfoliocategory_id_foreign` (`portfoliocategory_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `pricecategories`
--
ALTER TABLE `pricecategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prices_slug_unique` (`slug`),
  ADD KEY `prices_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `price_pricecategory`
--
ALTER TABLE `price_pricecategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_pricecategory_price_id_foreign` (`price_id`),
  ADD KEY `price_pricecategory_pricecategory_id_foreign` (`pricecategory_id`);

--
-- Indexes for table `productcategories`
--
ALTER TABLE `productcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `productstocks`
--
ALTER TABLE `productstocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_productcategory_product_id_foreign` (`product_id`),
  ADD KEY `product_productcategory_productcategory_id_foreign` (`productcategory_id`);

--
-- Indexes for table `product_tax`
--
ALTER TABLE `product_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tax_product_id_foreign` (`product_id`),
  ADD KEY `product_tax_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `servicecategories`
--
ALTER TABLE `servicecategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `service_servicecategory`
--
ALTER TABLE `service_servicecategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_servicecategory_service_id_foreign` (`service_id`),
  ADD KEY `service_servicecategory_servicecategory_id_foreign` (`servicecategory_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sidebars`
--
ALTER TABLE `sidebars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sidebars_title_unique` (`title`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_slider_id_foreign` (`slider_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teamcategories`
--
ALTER TABLE `teamcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teamcategory_teampost`
--
ALTER TABLE `teamcategory_teampost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teamcategory_teampost_teampost_id_foreign` (`teampost_id`),
  ADD KEY `teamcategory_teampost_teamcategory_id_foreign` (`teamcategory_id`);

--
-- Indexes for table `teamposts`
--
ALTER TABLE `teamposts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teamposts_slug_unique` (`slug`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributevalues`
--
ALTER TABLE `attributevalues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `combined_orders`
--
ALTER TABLE `combined_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentcategories`
--
ALTER TABLE `contentcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentcategory_contentpost`
--
ALTER TABLE `contentcategory_contentpost`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentposts`
--
ALTER TABLE `contentposts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `custompages`
--
ALTER TABLE `custompages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filemanager`
--
ALTER TABLE `filemanager`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashdeals`
--
ALTER TABLE `flashdeals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flashdeal_product`
--
ALTER TABLE `flashdeal_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `frontmenuitems`
--
ALTER TABLE `frontmenuitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frontmenus`
--
ALTER TABLE `frontmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `navbarsettings`
--
ALTER TABLE `navbarsettings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `pagebuilders`
--
ALTER TABLE `pagebuilders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfoliocategories`
--
ALTER TABLE `portfoliocategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_portfoliocategory`
--
ALTER TABLE `portfolio_portfoliocategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricecategories`
--
ALTER TABLE `pricecategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_pricecategory`
--
ALTER TABLE `price_pricecategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcategories`
--
ALTER TABLE `productcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productstocks`
--
ALTER TABLE `productstocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_tax`
--
ALTER TABLE `product_tax`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `servicecategories`
--
ALTER TABLE `servicecategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_servicecategory`
--
ALTER TABLE `service_servicecategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sidebars`
--
ALTER TABLE `sidebars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teamcategories`
--
ALTER TABLE `teamcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teamcategory_teampost`
--
ALTER TABLE `teamcategory_teampost`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teamposts`
--
ALTER TABLE `teamposts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contentcategory_contentpost`
--
ALTER TABLE `contentcategory_contentpost`
  ADD CONSTRAINT `contentcategory_contentpost_contentcategory_id_foreign` FOREIGN KEY (`contentcategory_id`) REFERENCES `contentcategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contentcategory_contentpost_contentpost_id_foreign` FOREIGN KEY (`contentpost_id`) REFERENCES `contentposts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contentposts`
--
ALTER TABLE `contentposts`
  ADD CONSTRAINT `contentposts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flashdeal_product`
--
ALTER TABLE `flashdeal_product`
  ADD CONSTRAINT `flashdeal_product_flashdeal_id_foreign` FOREIGN KEY (`flashdeal_id`) REFERENCES `flashdeals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flashdeal_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_portfoliocategory`
--
ALTER TABLE `portfolio_portfoliocategory`
  ADD CONSTRAINT `portfolio_portfoliocategory_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolio_portfoliocategory_portfoliocategory_id_foreign` FOREIGN KEY (`portfoliocategory_id`) REFERENCES `portfoliocategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_pricecategory`
--
ALTER TABLE `price_pricecategory`
  ADD CONSTRAINT `price_pricecategory_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `price_pricecategory_pricecategory_id_foreign` FOREIGN KEY (`pricecategory_id`) REFERENCES `pricecategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  ADD CONSTRAINT `product_productcategory_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_productcategory_productcategory_id_foreign` FOREIGN KEY (`productcategory_id`) REFERENCES `productcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tax`
--
ALTER TABLE `product_tax`
  ADD CONSTRAINT `product_tax_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tax_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_servicecategory`
--
ALTER TABLE `service_servicecategory`
  ADD CONSTRAINT `service_servicecategory_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_servicecategory_servicecategory_id_foreign` FOREIGN KEY (`servicecategory_id`) REFERENCES `servicecategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teamcategory_teampost`
--
ALTER TABLE `teamcategory_teampost`
  ADD CONSTRAINT `teamcategory_teampost_teamcategory_id_foreign` FOREIGN KEY (`teamcategory_id`) REFERENCES `teamcategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teamcategory_teampost_teampost_id_foreign` FOREIGN KEY (`teampost_id`) REFERENCES `teamposts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
