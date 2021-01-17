-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th1 17, 2021 lúc 03:13 PM
-- Phiên bản máy phục vụ: 10.3.27-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demoshopspring`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `name`, `parent_id`, `status`) VALUES
(1, '1', '2020-11-20 15:05:37', '0', '2020-11-20 15:05:37', 'Sản phẩm', 0, 1),
(2, '1', '2020-11-20 15:05:48', 'admin', '2021-01-07 03:36:16', 'Điện thoại ', 1, 1),
(3, '1', '2020-11-20 15:05:58', 'admin', '2021-01-06 06:32:33', 'Điện thoại cũ', 2, 1),
(8, '1', '2020-11-22 19:39:07', 'admin', '2021-01-17 08:14:18', 'Phụ kiện', 0, 0),
(12, '1', '2020-11-22 19:42:08', 'admin', '2021-01-17 07:42:30', 'Điện thoại mới', 2, 1),
(15, '1', '2020-11-25 10:06:02', 'admin', '2021-01-17 11:10:15', 'Danh mục', 0, 1),
(16, '1', '2020-11-25 10:08:49', '0', '2020-11-25 10:08:49', '1-1', 15, 1),
(17, '1', '2020-11-25 10:08:49', '0', '2020-11-25 10:08:49', '1-2', 15, 1),
(18, '1', '2020-11-25 10:08:49', '0', '2020-11-25 10:08:49', '1-3', 15, 1),
(19, '1', '2020-11-25 10:10:25', '0', '2020-11-25 10:10:25', '1-2-2', 17, 1),
(20, '1', '2020-11-25 10:10:25', 'admin', '2021-01-06 06:50:29', '1-2-3', 17, 1),
(21, '1', '2020-11-25 10:10:25', '0', '2020-11-25 10:10:25', '1-2-1', 17, 1),
(22, '1', '2020-11-25 10:12:12', '0', '2020-11-25 10:12:12', '1-3-1', 18, 1),
(23, '1', '2020-11-27 09:43:59', '0', '2020-11-27 09:43:59', '1-2-3-1', 20, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `discount` float NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `discount`, `payment_method`, `status`, `total_money`) VALUES
(18, 'nguyenvana', '2021-01-17 11:18:24', 'nguyenvana', '2021-01-17 11:18:24', 0.5, 'Thanh toán tại nhà', 1, 20000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `quantity`, `order_id`, `product_id`, `price`, `status`) VALUES
(18, 'nguyenvana', '2021-01-17 11:18:24', 'nguyenvana', '2021-01-17 11:18:24', 4, 18, 49, 10000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `battery_capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera_feature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `producer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `sale_price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `battery_capacity`, `camera_feature`, `count`, `name`, `preview`, `price`, `producer`, `ram`, `release_date`, `sale_price`, `status`, `storage`, `category_id`) VALUES
(2, '1', '2020-12-04 20:12:05', 'admin', '2021-01-17 12:25:30', '3000 mAh', 'Chụp sắc nét, ko nhòe', 1, 'Iphone 4', 'Điện thoại rất thông minh', 999999000, 'Apple', '50 GB', '2020-12-16', 10000, 1, '32 GB', 3),
(3, '1', '2020-12-04 20:12:45', 'admin', '2021-01-17 11:44:49', '3000 mAh', 'Chụp sắc nét, ko nhòe', 4, 'Iphone 4S', 'Điện thoại thông minh', 999999000, 'Apple', '50 GB', '2020-12-22', 10000, 1, '64 GB', 3),
(4, '1', '2020-12-04 20:13:19', '1', '2020-12-23 19:22:57', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 5', 'Điện thoại thông minh', 999999000, 'Apple', '50 GB', '2020-12-22', 10000, 1, '64 GB', 3),
(5, '1', '2020-12-04 20:13:40', '1', '2020-12-23 19:22:28', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 6s', 'Điện thoại thông minh', 999999000, 'Apple', '50 GB', '2020-12-17', 10000, 1, '64 GB', 3),
(6, '1', '2020-12-04 20:14:04', '1', '2020-12-23 19:21:57', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 7', 'Điện thoại thông minh', 999999000, 'Apple', '50 GB', '2020-12-17', 10000, 1, '64 GB', 3),
(7, '1', '2020-12-04 20:14:24', '1', '2020-12-23 19:21:37', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 7 Plus', 'Điện thoại thông minh', 999999000, 'Apple', '50 GB', '2020-12-17', 10000, 1, '64 GB', 3),
(8, '1', '2020-12-04 20:16:05', '1', '2020-12-23 19:21:19', '50000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'iphone8', 'Điện thoại rất thông minh', 999999000, 'Apple', '50 GB', '2020-12-01', 10000, 1, '320 GB', 3),
(9, '1', '2020-12-04 20:16:37', '1', '2020-12-23 19:20:58', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 10 Plus', 'Điện thoại rất thông minh', 999999000, 'Apple', '500 GB', '2021-01-06', 10000, 1, '64 GB', 12),
(10, '1', '2020-12-04 20:17:14', '1', '2020-12-23 19:20:38', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Iphone 11 pro max', 'Điện thoại rất thông minh', 999999000, 'Apple', '50 GB', '2020-12-29', 10000, 1, '64 GB', 12),
(11, '1', '2020-12-04 20:17:34', 'anonymousUser', '2021-01-16 20:51:14', '3000 mAh', 'Chụp sắc nét, ko nhòe', 1, 'Samsung A', 'Điện thoại rất thông minh', 999999000, 'Apple', '50 GB', '2020-12-29', 10000, 1, '64 GB', 12),
(12, '1', '2020-12-04 20:18:03', '1', '2020-12-23 19:19:09', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Samsung B', 'Điện thoại rất thông minh', 999999000, 'SamSung', '50 GB', '2020-12-29', 10000, 1, '64 GB', 12),
(13, '1', '2020-12-04 20:18:37', '1', '2020-12-23 19:11:41', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Samsung C', 'Điện thoại rất thông minh', 999999000, 'SamSung', '50 GB', '2020-12-29', 10000, 1, '64 GB', 12),
(14, '1', '2020-12-04 20:19:03', 'anonymousUser', '2021-01-17 11:03:32', '3000 mAh', 'Chụp sắc nét, ko nhòe', 1, 'Samsung S', 'Điện thoại rất thông minh', 999999000, 'SamSung', '50 GB', '2020-12-29', 10000, 1, '64 GB', 12),
(15, '1', '2020-12-23 15:33:39', 'admin', '2021-01-17 11:13:58', '3000 mAh', 'Chụp sắc nét, ko nhòe', 0, 'Samsung V', 'Điện thoại rất thông minh', 999999000, 'SamSung', '501 GB', '2020-12-29', 10000, 1, '641 GB', 12),
(16, '1', '2020-12-23 19:12:50', 'admin', '2021-01-17 11:11:18', 'Pin ko bao giờ hết', 'Camera ko bao giờ hư', 0, 'Oppo A', 'dien thoai vip pro', 99999000, 'oppp', '501 GB', '2020-12-23', 10000, 1, '512 GB', 12),
(49, 'admin', '2021-01-17 11:13:07', 'nguyenvana', '2021-01-17 11:17:17', 'Pin ko bao giờ hết', 'Camera ko bao giờ hư', 2, 'Oppo B', 'Điện thoại vip pro', 999999000, 'Oppo', 'Ram cực khủng', '2021-01-06', 10000, 1, 'Lưu trữ rất rất nhiều', 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `name`, `product_id`, `status`) VALUES
(57, 'admin', '2021-01-17 12:20:12', 'admin', '2021-01-17 12:20:12', '8 - Copy (2)-18073416437407.jpg', 49, 1),
(58, 'admin', '2021-01-17 12:20:13', 'admin', '2021-01-17 12:20:13', '8 - Copy-18073416823877.jpg', 49, 1),
(59, 'admin', '2021-01-17 12:20:13', 'admin', '2021-01-17 12:20:13', '8-18073416954298.jpg', 49, 1),
(60, 'admin', '2021-01-17 12:20:29', 'admin', '2021-01-17 12:20:29', '20-18089609875192.jpg', 16, 1),
(61, 'admin', '2021-01-17 12:20:29', 'admin', '2021-01-17 12:20:29', '23-18089610196738.jpg', 16, 1),
(62, 'admin', '2021-01-17 12:21:05', 'admin', '2021-01-17 12:21:05', '9-18125690522739.jpg', 15, 1),
(63, 'admin', '2021-01-17 12:21:05', 'admin', '2021-01-17 12:21:05', '10-18125690901956.jpg', 15, 1),
(64, 'admin', '2021-01-17 12:21:18', 'admin', '2021-01-17 12:21:18', '14 - Copy-18138599991674.jpg', 14, 1),
(65, 'admin', '2021-01-17 12:21:18', 'admin', '2021-01-17 12:21:18', '14-18138600368306.jpg', 14, 1),
(66, 'admin', '2021-01-17 12:21:32', 'admin', '2021-01-17 12:21:32', '15-18152718227727.jpg', 13, 1),
(67, 'admin', '2021-01-17 12:21:32', 'admin', '2021-01-17 12:21:32', '17-18152718535445.jpg', 13, 1),
(68, 'admin', '2021-01-17 12:21:55', 'admin', '2021-01-17 12:21:55', '12-18175640428623.jpg', 12, 1),
(69, 'admin', '2021-01-17 12:21:55', 'admin', '2021-01-17 12:21:55', '17-18175640736339.jpg', 12, 1),
(70, 'admin', '2021-01-17 12:22:12', 'admin', '2021-01-17 12:22:12', '20-18192511832385.jpg', 11, 1),
(71, 'admin', '2021-01-17 12:22:12', 'admin', '2021-01-17 12:22:12', '21-18192512133118.jpg', 11, 1),
(72, 'admin', '2021-01-17 12:22:36', 'admin', '2021-01-17 12:22:36', '21 - Copy-18217321374716.jpg', 10, 1),
(73, 'admin', '2021-01-17 12:22:36', 'admin', '2021-01-17 12:22:36', '24-18217321740499.jpg', 10, 1),
(74, 'admin', '2021-01-17 12:22:45', 'admin', '2021-01-17 12:22:45', '32-18226418400594.jpg', 9, 1),
(75, 'admin', '2021-01-17 12:22:45', 'admin', '2021-01-17 12:22:45', '35-18226429330715.jpg', 9, 1),
(76, 'admin', '2021-01-17 12:22:56', 'admin', '2021-01-17 12:22:56', '33-18236653036140.jpg', 8, 1),
(77, 'admin', '2021-01-17 12:22:56', 'admin', '2021-01-17 12:22:56', '34-18236653422943.jpg', 8, 1),
(78, 'admin', '2021-01-17 12:23:12', 'admin', '2021-01-17 12:23:12', '20-18252516720784.jpg', 7, 1),
(79, 'admin', '2021-01-17 12:23:12', 'admin', '2021-01-17 12:23:12', '22-18252516971530.jpg', 7, 1),
(80, 'admin', '2021-01-17 12:24:02', 'admin', '2021-01-17 12:24:02', '31-18302990872010.jpg', 6, 1),
(81, 'admin', '2021-01-17 12:24:02', 'admin', '2021-01-17 12:24:02', '32 - Copy-18302991162052.jpg', 6, 1),
(82, 'admin', '2021-01-17 12:24:17', 'admin', '2021-01-17 12:24:17', '13-18318000403547.jpg', 5, 1),
(83, 'admin', '2021-01-17 12:24:17', 'admin', '2021-01-17 12:24:17', '15-18318000636054.jpg', 5, 1),
(84, 'admin', '2021-01-17 12:24:26', 'admin', '2021-01-17 12:24:26', '24-18327306776166.jpg', 4, 1),
(85, 'admin', '2021-01-17 12:24:26', 'admin', '2021-01-17 12:24:26', '28-18327307033498.jpg', 4, 1),
(86, 'admin', '2021-01-17 12:24:37', 'admin', '2021-01-17 12:24:37', '6-18337960501400.jpg', 3, 1),
(87, 'admin', '2021-01-17 12:24:37', 'admin', '2021-01-17 12:24:37', '9-18337960698425.jpg', 3, 1),
(90, 'admin', '2021-01-17 12:25:59', 'admin', '2021-01-17 12:25:59', '21-18419593128759.jpg', 2, 1),
(91, 'admin', '2021-01-17 12:25:59', 'admin', '2021-01-17 12:25:59', '23-18419593408383.jpg', 2, 1),
(92, 'admin', '2021-01-17 12:25:59', 'admin', '2021-01-17 12:25:59', '24-18419593536204.jpg', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `name`, `status`) VALUES
(1, NULL, NULL, NULL, NULL, 'ROLE_ADMIN', 1),
(2, NULL, NULL, NULL, NULL, 'ROLE_USER', 1),
(3, NULL, NULL, NULL, NULL, 'MOD', 1),
(4, 'anonymousUser', '2021-01-16 20:47:18', 'anonymousUser', '2021-01-16 20:47:18', 'ROLE_USER', 0),
(5, 'anonymousUser', '2021-01-16 20:48:51', 'anonymousUser', '2021-01-16 20:48:51', 'ROLE_USER', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `telephone_number` int(11) NOT NULL DEFAULT 0,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `created_by`, `created_date`, `modified_by`, `modified_date`, `address`, `fullname`, `password`, `status`, `telephone_number`, `username`) VALUES
(1, 'admin', '2021-01-04 22:16:19', 'admin', '2021-01-16 09:19:53', 'Trường chinh', 'mạnh cường', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 828274541, 'admin'),
(2, 'admin', '2021-01-04 22:16:24', 'admin', '2021-01-12 22:49:19', 'Truong Chinh ', 'Nguyễn Văn A', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 828274541, 'nguyenvana'),
(3, 'admin', '2021-01-01 22:16:29', 'admin', '2021-01-12 22:49:27', 'Truong Chinh2', 'Nguyễn Văn B', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 828274541, 'nguyenvanb'),
(6, 'anonymousUser', '2021-01-16 19:39:09', 'anonymousUser', '2021-01-16 19:39:09', NULL, NULL, '$2a$10$8miJ/76JkOr7LU5vT3peh.h3dPC3qEhGDpl7MNX3bATxCj7103Blm', 1, 0, 'admindemo'),
(7, 'anonymousUser', '2021-01-16 20:13:54', 'admin', '2021-01-17 09:25:17', 'Trường chinh', 'mạnh cường', '$2a$10$z1QhB1WlHhdwLLjRcOEdNuc516ghMzYurFZGUBUKtaH8MHev.2wXq', 1, 0, 'nguyenvanc'),
(9, 'anonymousUser', '2021-01-16 20:47:18', 'anonymousUser', '2021-01-16 20:47:18', NULL, NULL, '$2a$10$..J60Qc.ygaemqFYltEokub1.vGCRDHSlrjjY4wVhbr9Z2jiaM1iC', 1, 0, 'nguyenvand'),
(10, 'anonymousUser', '2021-01-16 20:48:51', 'nguyenvane', '2021-01-16 20:49:36', 'Truong Chinh', 'nguyenvane', '$2a$10$sgsKVR9R80/5eOeLhN5j8OdTVh88XNg08AxSRRdIvAvuReSQChZiG', 1, 0, 'nguyenvane');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(2, 3),
(9, 4),
(10, 5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_9dgbf2frihdis1se0j19ujgdx` (`product_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_p387c2pa1m3xxcxcktoawo954` (`order_id`),
  ADD KEY `FK_b1a9qvfbav8gt853t4lfu3avx` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_of5oeawsy50x878ic9tyapdnv` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_j6vpvxdkrgqdhqs0s1dlqhp6j` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  ADD KEY `FK_apcc8lxk2xnug8377fatvbn04` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_9dgbf2frihdis1se0j19ujgdx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_b1a9qvfbav8gt853t4lfu3avx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_p387c2pa1m3xxcxcktoawo954` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_of5oeawsy50x878ic9tyapdnv` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FK_j6vpvxdkrgqdhqs0s1dlqhp6j` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
