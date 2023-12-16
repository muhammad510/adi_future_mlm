-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 08:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlm_darbhnga`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `session` char(32) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `last_login` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `email`, `session`, `ip`, `last_login`) VALUES
(1, 'Admin', 'admin', '$2y$10$P5VMT35fdDybgJot7DPC..jn67l/uTETMy42Z0lAI8cp/Ae1zXJrG', 'admin@g.com', '29c18ac2326608f7c7f611da02fefaf1', '::1', 1702451652),
(4, 'Manish', 'manish', '$2y$10$P5VMT35fdDybgJot7DPC..jn67l/uTETMy42Z0lAI8cp/Ae1zXJrG', 'manish@gmail.com', 'b5710ff22f86349cc4fd168509ab5123', '::1', 1597223337);

-- --------------------------------------------------------

--
-- Table structure for table `admin_expense`
--

CREATE TABLE `admin_expense` (
  `id` int(11) NOT NULL,
  `expense_name` varchar(200) NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `ad_title` varchar(200) NOT NULL,
  `ad_html` text NOT NULL,
  `level_earning` varchar(500) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `type` enum('html','url') NOT NULL DEFAULT 'url'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ad_user`
--

CREATE TABLE `ad_user` (
  `id` int(11) NOT NULL,
  `ad_id` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `coupon` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `coupon_cat` varchar(20) NOT NULL,
  `coupon_amt` decimal(11,2) NOT NULL DEFAULT 0.00,
  `status` enum('Used','Un-Used','Use Request') NOT NULL DEFAULT 'Un-Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_categories`
--

CREATE TABLE `coupon_categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `cat_description` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(20) NOT NULL,
  `donation_amount` varchar(30) NOT NULL,
  `receiver_id` varchar(20) NOT NULL,
  `time` int(11) NOT NULL,
  `trid` varchar(200) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tdate` date DEFAULT NULL,
  `status` enum('Sent','Accepted','Waiting') NOT NULL DEFAULT 'Sent',
  `donation_pack` int(11) NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation_package`
--

CREATE TABLE `donation_package` (
  `id` int(11) NOT NULL,
  `donation_level` int(11) NOT NULL,
  `plan_name` varchar(200) NOT NULL,
  `sponsor_income` varchar(30) DEFAULT NULL,
  `position_income` varchar(30) DEFAULT NULL,
  `donation_amount` varchar(30) DEFAULT '0',
  `donation_qty` int(11) NOT NULL,
  `expiry_duration` int(11) NOT NULL DEFAULT 2 COMMENT 'in days'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earning`
--

CREATE TABLE `earning` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ref_id` varchar(20) NOT NULL DEFAULT 'N/A',
  `date` date NOT NULL,
  `pair_match` int(11) NOT NULL DEFAULT 0,
  `secret` varchar(15) NOT NULL DEFAULT '0',
  `status` enum('Paid','Pending') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `earning`
--

INSERT INTO `earning` (`id`, `userid`, `amount`, `type`, `ref_id`, `date`, `pair_match`, `secret`, `status`) VALUES
(1, '5451366', '250.00', 'Level Income', '6041613', '2023-12-09', 0, '0', 'Pending'),
(2, '4354720', '200.00', 'Level Income', '6041613', '2023-12-09', 0, '0', 'Pending'),
(3, '8321697', '750.00', 'Level Income', '6041613', '2023-12-09', 0, '0', 'Pending'),
(4, '8321697', '250.00', 'Level Income', '4354720', '2023-12-09', 0, '0', 'Pending'),
(5, '8321697', '250.00', 'Level Income', '3635773', '2023-12-09', 0, '0', 'Pending'),
(6, '8321697', '250.00', 'Level Income', '8883176', '2023-12-12', 0, '0', 'Pending'),
(7, '8321697', '250.00', 'Level Income', '6383813', '2023-12-12', 0, '0', 'Pending'),
(8, '8321697', '250.00', 'Level Income', '2377089', '2023-12-12', 0, '0', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `epin`
--

CREATE TABLE `epin` (
  `id` int(11) NOT NULL,
  `epin` varchar(20) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `issue_to` varchar(20) NOT NULL,
  `generate_time` date NOT NULL,
  `generated_by` varchar(15) NOT NULL DEFAULT 'Admin',
  `transfer_by` varchar(20) DEFAULT NULL,
  `used_by` varchar(20) DEFAULT NULL,
  `transfer_time` date DEFAULT NULL,
  `used_time` date DEFAULT NULL,
  `status` enum('Used','Un-used') NOT NULL DEFAULT 'Un-used',
  `type` enum('Single Use','Multi Use') NOT NULL DEFAULT 'Single Use'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `epin`
--

INSERT INTO `epin` (`id`, `epin`, `amount`, `issue_to`, `generate_time`, `generated_by`, `transfer_by`, `used_by`, `transfer_time`, `used_time`, `status`, `type`) VALUES
(1, '41716258', '500.00', '1001', '2023-12-12', 'Admin', NULL, NULL, NULL, NULL, 'Un-used', ''),
(2, '46822457', '500.00', '1001', '2023-12-12', 'Admin', NULL, NULL, NULL, NULL, 'Un-used', ''),
(3, '59772579', '500.00', '1001', '2023-12-12', 'Admin', NULL, NULL, NULL, NULL, 'Un-used', ''),
(4, '80436847', '500.00', '1001', '2023-12-12', 'Admin', NULL, NULL, NULL, NULL, 'Un-used', '');

-- --------------------------------------------------------

--
-- Table structure for table `epin_request`
--

CREATE TABLE `epin_request` (
  `id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `epin_type` varchar(255) NOT NULL,
  `epin_qty` int(11) NOT NULL,
  `total_amount` varchar(20) NOT NULL,
  `screenshot_document` text NOT NULL,
  `epin` text DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '0 false receipt|1 epin not generated | 2 epin generated',
  `request_date` datetime NOT NULL,
  `epin_generate_date` datetime DEFAULT NULL,
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fix_income`
--

CREATE TABLE `fix_income` (
  `id` int(11) NOT NULL,
  `direct_income` varchar(100) DEFAULT NULL,
  `level_income` varchar(100) DEFAULT NULL,
  `binary_income` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flexible_income`
--

CREATE TABLE `flexible_income` (
  `id` int(11) NOT NULL,
  `income_name` varchar(200) NOT NULL,
  `income_duration` int(11) NOT NULL DEFAULT 0 COMMENT 'within how many days he should achieve this',
  `A` int(11) NOT NULL DEFAULT 0,
  `B` int(11) NOT NULL DEFAULT 0,
  `C` int(11) NOT NULL DEFAULT 0,
  `D` int(11) NOT NULL DEFAULT 0,
  `E` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(11,2) NOT NULL,
  `based_on` enum('Member','PV') NOT NULL DEFAULT 'Member'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `franchisee`
--

CREATE TABLE `franchisee` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `business_name` varchar(200) DEFAULT NULL,
  `country` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `last_login` date NOT NULL,
  `last_login_ip` varchar(50) NOT NULL DEFAULT '0:0:0:0',
  `session` char(32) NOT NULL,
  `status` enum('Active','Inactive','Terminated') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `franchisee_stock`
--

CREATE TABLE `franchisee_stock` (
  `id` int(11) NOT NULL,
  `franchisee_id` varchar(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `available_qty` int(11) NOT NULL DEFAULT 0,
  `sold_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `franchisee_stock_sale_bill`
--

CREATE TABLE `franchisee_stock_sale_bill` (
  `id` int(11) NOT NULL,
  `stock_data` varchar(500) NOT NULL,
  `stock_data_price` varchar(500) DEFAULT NULL,
  `fran_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `userid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gap_commission_setting`
--

CREATE TABLE `gap_commission_setting` (
  `id` int(11) NOT NULL,
  `total_pv` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(11,2) NOT NULL,
  `income_name` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` int(11) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `pack_id` varchar(20) NOT NULL,
  `amount` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Pending','Active','Expired') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_pack`
--

CREATE TABLE `investment_pack` (
  `id` int(11) NOT NULL,
  `pack_name` varchar(200) NOT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `direct_income` varchar(20) NOT NULL DEFAULT '0',
  `level_income` varchar(100) NOT NULL DEFAULT '0',
  `matching_income` varchar(30) NOT NULL DEFAULT '0',
  `capping` varchar(30) NOT NULL DEFAULT '0',
  `roi` decimal(11,2) NOT NULL,
  `roi_frequency` int(11) NOT NULL DEFAULT 0,
  `roi_limit` int(11) NOT NULL DEFAULT 0,
  `based` enum('Percent','Fixed') NOT NULL DEFAULT 'Percent' COMMENT 'Calculation Based On'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_name` varchar(200) NOT NULL,
  `userid` varchar(20) NOT NULL DEFAULT 'N/A',
  `invoice_data` varchar(2000) NOT NULL COMMENT 'php array serialize, name=>amount=>tax',
  `invoice_data_tax` varchar(1000) NOT NULL,
  `invoice_data_qty` varchar(300) DEFAULT NULL,
  `company_address` varchar(300) NOT NULL,
  `bill_to_address` varchar(300) NOT NULL,
  `total_amt` decimal(11,2) NOT NULL DEFAULT 0.00,
  `paid_amt` decimal(11,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `user_type` varchar(40) NOT NULL DEFAULT 'Other'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `level1` int(11) NOT NULL DEFAULT 0,
  `level2` int(11) NOT NULL DEFAULT 0,
  `level3` int(11) NOT NULL DEFAULT 0,
  `level4` int(11) NOT NULL DEFAULT 0,
  `level5` int(11) NOT NULL DEFAULT 0,
  `level6` int(11) NOT NULL DEFAULT 0,
  `level7` int(11) NOT NULL DEFAULT 0,
  `level8` int(11) NOT NULL DEFAULT 0,
  `level9` int(11) NOT NULL DEFAULT 0,
  `level10` int(11) NOT NULL DEFAULT 0,
  `level11` int(11) NOT NULL DEFAULT 0,
  `level12` int(11) NOT NULL DEFAULT 0,
  `level13` int(11) NOT NULL DEFAULT 0,
  `level14` int(11) NOT NULL DEFAULT 0,
  `level15` int(11) NOT NULL DEFAULT 0,
  `level16` int(11) NOT NULL DEFAULT 0,
  `level17` int(11) NOT NULL DEFAULT 0,
  `level18` int(11) NOT NULL DEFAULT 0,
  `level19` int(11) NOT NULL DEFAULT 0,
  `level20` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `userid`, `level1`, `level2`, `level3`, `level4`, `level5`, `level6`, `level7`, `level8`, `level9`, `level10`, `level11`, `level12`, `level13`, `level14`, `level15`, `level16`, `level17`, `level18`, `level19`, `level20`) VALUES
(1, '8321697', 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '4354720', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '5451366', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '6041613', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '2377089', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '6383813', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '8883176', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '3635773', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '6754495', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '1666942', 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '7149530', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, '1674155', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, '4811063', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '3928551', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '2881108', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '5414434', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '3678961', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '3158823', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '7032033', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, '6637863', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, '2924125', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, '3271007', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, '6345402', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, '5650760', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, '7571734', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `level_wise_income`
--

CREATE TABLE `level_wise_income` (
  `id` int(11) NOT NULL,
  `income_name` varchar(200) NOT NULL,
  `income_duration` int(11) NOT NULL DEFAULT 0 COMMENT 'within how many days he should achieve this',
  `level_no` int(11) NOT NULL DEFAULT 1,
  `total_member` int(11) NOT NULL DEFAULT 1,
  `amount` decimal(11,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `log` text NOT NULL,
  `type` enum('Admin','User','Franchisee','Other') NOT NULL DEFAULT 'Admin',
  `ip` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(10) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `show_password` varchar(255) NOT NULL,
  `photo` text DEFAULT NULL,
  `sponsor` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `signup_package` varchar(20) DEFAULT NULL,
  `epin` varchar(20) DEFAULT NULL,
  `address` varchar(400) NOT NULL,
  `join_time` date NOT NULL,
  `placement_leg` enum('A','B','C','D','E') NOT NULL DEFAULT 'A',
  `A` int(11) NOT NULL DEFAULT 0,
  `B` int(11) NOT NULL DEFAULT 0,
  `C` int(11) NOT NULL DEFAULT 0,
  `D` int(11) NOT NULL DEFAULT 0,
  `E` int(11) NOT NULL DEFAULT 0,
  `total_a` int(11) NOT NULL DEFAULT 0,
  `total_b` int(11) NOT NULL DEFAULT 0,
  `total_c` int(11) NOT NULL DEFAULT 0,
  `total_d` int(11) NOT NULL DEFAULT 0,
  `total_e` int(11) NOT NULL DEFAULT 0,
  `paid_a` int(11) NOT NULL DEFAULT 0,
  `paid_b` int(11) NOT NULL DEFAULT 0,
  `paid_c` int(11) NOT NULL DEFAULT 0,
  `paid_d` int(11) NOT NULL DEFAULT 0,
  `paid_e` int(11) NOT NULL DEFAULT 0,
  `rank` varchar(30) NOT NULL DEFAULT 'Member',
  `registration_ip` varchar(20) NOT NULL,
  `session` char(32) NOT NULL,
  `last_login` int(11) NOT NULL DEFAULT 0,
  `last_login_ip` varchar(20) NOT NULL DEFAULT 'NA',
  `topup` decimal(11,2) NOT NULL DEFAULT 0.00,
  `re_topup` int(2) NOT NULL DEFAULT 1 COMMENT '0- Retopup again | 1 already topup ',
  `mypv` int(11) NOT NULL DEFAULT 0,
  `total_a_pv` varchar(5) NOT NULL DEFAULT '0',
  `total_b_pv` varchar(5) NOT NULL DEFAULT '0',
  `total_c_pv` varchar(10) NOT NULL DEFAULT '0',
  `total_d_pv` varchar(10) NOT NULL DEFAULT '0',
  `total_e_pv` varchar(10) NOT NULL DEFAULT '0',
  `my_img` varchar(30) DEFAULT '' COMMENT ' ',
  `status` enum('Block','Active','Suspend','') NOT NULL DEFAULT 'Active',
  `total_a_matching_incm` varchar(11) NOT NULL DEFAULT '0',
  `total_b_matching_incm` varchar(11) NOT NULL DEFAULT '0',
  `total_c_matching_incm` varchar(11) NOT NULL DEFAULT '0',
  `total_d_matching_incm` varchar(15) NOT NULL DEFAULT '0',
  `total_e_matching_incm` varchar(15) NOT NULL DEFAULT '0',
  `my_business` varchar(10) NOT NULL DEFAULT '0',
  `total_a_investment` varchar(20) NOT NULL DEFAULT '0',
  `total_b_investment` varchar(20) NOT NULL DEFAULT '0',
  `paid_a_matching_incm` varchar(10) NOT NULL DEFAULT '0',
  `paid_b_matching_incm` varchar(10) NOT NULL DEFAULT '0',
  `secret` int(11) NOT NULL,
  `gift_level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `prefix`, `email`, `phone`, `username`, `password`, `show_password`, `photo`, `sponsor`, `position`, `signup_package`, `epin`, `address`, `join_time`, `placement_leg`, `A`, `B`, `C`, `D`, `E`, `total_a`, `total_b`, `total_c`, `total_d`, `total_e`, `paid_a`, `paid_b`, `paid_c`, `paid_d`, `paid_e`, `rank`, `registration_ip`, `session`, `last_login`, `last_login_ip`, `topup`, `re_topup`, `mypv`, `total_a_pv`, `total_b_pv`, `total_c_pv`, `total_d_pv`, `total_e_pv`, `my_img`, `status`, `total_a_matching_incm`, `total_b_matching_incm`, `total_c_matching_incm`, `total_d_matching_incm`, `total_e_matching_incm`, `my_business`, `total_a_investment`, `total_b_investment`, `paid_a_matching_incm`, `paid_b_matching_incm`, `secret`, `gift_level`) VALUES
(1001, 'master user', '', 'hot@gmail.com', '90909009', '1001', '$2y$10$TPreRxDqL95EJ8c1iCH2fur8oxUqYJ5fSy3MbTb/VlwCobvgP8Sy2', '123456', NULL, '', '', '0', NULL, '', '2023-12-04', 'A', 6754495, 3678961, 0, 0, 3158823, 10, 3, 2, 1, 2, 0, 0, 0, 0, 0, 'master_agent', '', '5ec191ffdc5765821f8f0e7a62aa6569', 1702383228, '::1', '1.00', 1, 0, '0', '0', '', '', '', '', 'Active', '0', '0', '', '', '', '0', '0', '0', '0', '0', 1, 0),
(1666942, 'radhe', '', 'pink4pinku@gmail.com', '77777', '1702295972', '$2y$10$umfiW3/v9lGrqcXwHE7RlunkV7wm/5RG/l.sf3og7Cik2bMhUUUGG', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>biraul', '2023-12-11', 'A', 1674155, 0, 0, 0, 7149530, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 60, 0),
(1674155, 'MD ISRAEL', '', 'pink4pinku@gmail.com', '9905174054', '1702296687', '$2y$10$xpbJWEDVMo2TMGMQ9fBrpOtiU505gT/9f6XMVuuOLumsCM0xYbwuW', '123456', NULL, '1666942', '1666942', '0', NULL, 'darbhnga<br/>', '2023-12-11', 'A', 4811063, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sub_agent', '::1', '0799a7f8b36f1b93b214ba9805d491e9', 1702296773, '::1', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 65, 0),
(2225764, 'agent', '', '', '6565656566', '1701945098', '$2y$10$ga7/YGZXlU6mAUFpIF6gTOn5CSfJwGzw4Y9J2d47JMX8Ugzg94I9a', '123456', NULL, '1001', '1001', '0', NULL, 'Darbhnga<br/>', '2023-12-07', 'A', 0, 0, 0, 0, 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Suspend', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 46, 0),
(2377089, 'a', '', 'fhfghfd@hfgdhgfh', '9905141441', '1702109599', '$2y$10$SN4QYeoJHTAe0H4nrxUKfuv8qoulR6w5PYSGtBBcqu.tcrhaeNfwO', '123456', NULL, '8321697', '8321697', '1', NULL, 'darbhnga<br/>bihar', '2023-12-09', 'B', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 52, 0),
(2628436, 'subagent', '', '', '6565656566', '1701946539', '$2y$10$wXeO0rrFHfQlcNp3QhGrpuhx/TjqJ2txLsYWmMQMVBGi7fbc8wxDO', '123456', NULL, '2225764', '2225764', '0', NULL, 'darbhnga<br/>', '2023-12-07', 'A', 8321697, 0, 0, 0, 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 'sub_agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Suspend', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 47, 0),
(2881108, 'MD ISRAEL', '', '', '9905174054', '1702298590', '$2y$10$VgypGKK.rA9IbEtE773Ybep68mbAqNmni5SdakyFeON.8tugQO3mW', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>', '2023-12-11', 'A', 5414434, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 70, 0),
(2924125, 'fhfgh', '', 'pink4pinku@gmail.com', '9905174054', 'ADIFA1702367680', '$2y$10$tArPszVALPJ72z8LlyAIeeQJrL.37o73s94bTSRY.KD1muxebxBf6', '123456', NULL, '1001', '1001', '0', NULL, 'darbhnga<br/>', '2023-12-12', 'A', 7571734, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', 'b8aa773d795a04d423eac8bad7355567', 1702367923, '::1', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 76, 0),
(3158823, 'chatur', '', 'salman@gmail.com', '8978645645', '1702361135', '$2y$10$gye5w.cbGeYc5zRozGSQY.CKGGAlFbE7v1YIqifv3tkPTuPEL5kbm', '123456', NULL, '1001', '1001', '0', NULL, 'ertgryr<br/>dfghdfghdf', '2023-12-12', 'E', 0, 7032033, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Agent', '192.168.1.202', '063b16194089eb8ac85470d55ccfccb6', 1702361564, '192.168.1.202', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 73, 0),
(3271007, 'md israel', 'ADIFA', 'pink4pinku@gmail.com', '85858585', '1702368629', '$2y$10$9ymbIKqH9TfaYRSe.pzleesH5E0Sxyw/9YeIZZOfw5ASUJp6PuMRa', '123456', NULL, '1001', '1001', '0', NULL, 'Darbhnga<br/>', '2023-12-12', 'B', 0, 0, 0, 0, 6345402, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Agent', '::1', '3cdf3a7c2405282a5a629be8bdd24990', 1702369070, '::1', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 77, 0),
(3635773, 'dss', '', '', '7358488090', '1702109832', '$2y$10$ijlEoTICA/8Adt9jIX8pye19uURqyY/jcL3KqlWK0Uk3sb8L4p5kS', '123456', NULL, '8321697', '8321697', '1', NULL, 'jharkhand<br/>', '2023-12-09', 'E', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 55, 0),
(3676161, 'md israel', '', 'pink4pinku@gmail.com', '9905174054', '1702294679', '$2y$10$zIzvxGtdanUYr6GZL/ZZHeHWI3Lf6Q3yCvCiAPsKPi370W4MseQPG', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>bihar', '2023-12-11', 'B', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 57, 0),
(3678961, 'fhfgh', '', 'pink4pinku@gmail.com', '6565656566', '1702298727', '$2y$10$WajFhau1SDBhN3w//v9CmOp.0FDGu7j/qq70L5rgdRtnTBATnc6gm', '123456', NULL, '1001', '1001', '0', NULL, 'darbhnga<br/>darbhntga', '2023-12-11', 'B', 0, 3271007, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 72, 0),
(3928551, 'md israel', '', 'fhfghfd@hfgdhgfh', '9905174054', '1702298506', '$2y$10$/3.2/YNfszZ8FTzpPI.fdOzJVERu3bRz5hDX4GDn8m8asVQpQE6zO', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>bihar', '2023-12-11', 'A', 2881108, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 69, 0),
(4326415, 'md israel', '', 'pink4pinku@gmail.com', '9905174054', '1702297755', '$2y$10$pkdFsXlMYixI0f6RCgCYQ.qeI4UusT.w6GrlSGk5X1VVhOFf.P3B6', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>', '2023-12-11', 'D', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '90e1d483e1f15bda101fe90b8a2eca4a', 1702297852, '::1', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 68, 0),
(4354720, 'KNOW', '', '', '7358488090', '1701946717', '$2y$10$uUZGMFvgncmz/c2MW1o63uGC/ODogLlfeEHKyF54KP6AHw.XpaacG', '123456', NULL, '8321697', '8321697', '1', NULL, 'Darbhnga<br/>', '2023-12-07', 'A', 5451366, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 49, 0),
(4811063, 'md israel', '', '', '6565656566', '1702296931', '$2y$10$n4drLBaYTkx0DApSXtdmPuTufN/e905k6lUOA1l7tqJE/2ptCVRfy', '123456', NULL, '1674155', '1674155', '1', NULL, 'bhantha<br/>Bihar', '2023-12-11', 'A', 3928551, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 67, 0),
(5414434, 'MD ISRAEL', '', '', '9905174054', '1702298646', '$2y$10$9F3TBN1J2errMvhnsvNo5ebNvFT7Mfx2a/J6RWIIwIOS.bwtjXj.m', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>', '2023-12-11', 'A', 2924125, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 71, 0),
(5451366, 'vcd', '', '', '9905174054', '1701952183', '$2y$10$Vqgqr24rY25AgcwSnM1xuOyYdUvdcf7FSq7Ylpx/lEbAkK8I0N4Ya', '123456', NULL, '4354720', '4354720', '0', NULL, 'patna<br/>', '2023-12-07', 'A', 6041613, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 50, 0),
(5650760, 'md israel', 'ADIFM', 'fhfghfd@hfgdhgfh', '7358488090', '1702383713', '$2y$10$ac8CpXmuSTpV/Ja6wzxTfuDQRzjMk0fLjeP0rItGPoxhExLE3fw5y', '123456', NULL, '6345402', '6345402', '0', NULL, 'darbhnga<br/>', '2023-12-12', 'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 79, 0),
(6041613, 'fvgel', '', '', '9905174054', '1701952791', '$2y$10$uAGveM0/ccmkIoHharwcJ.k2.cFyX2y0LlYPdSaN2CAzK17I/mgWe', '123456', NULL, '5451366', '5451366', '0', NULL, 'darbhnga<br/>', '2023-12-07', 'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 51, 0),
(6345402, 'MD ISRAEL', 'ADIFS', 'pink4pinku@gmail.com', '85858585', '1702369409', '$2y$10$BF5oh5rVAnHz0iPCDBRn1uIaoveXrChKmD3Oky5Gp/cymPx4HhKQq', '123456', NULL, '3271007', '3271007', '0', NULL, 'darbhnga<br/>', '2023-12-12', 'E', 5650760, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sub_agent', '::1', '185fd638e10f24e92ff207be75c9341d', 1702369531, '::1', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 78, 0),
(6383813, 'md israel', '', 'pink4pinku@gmail.com', '9905174054', '1702109708', '$2y$10$j94S16XQtlBnrhZsiVGOSenY/vkU5lRTZ3EsD4K3Wp.LjRjeO/a8a', '123456', NULL, '8321697', '8321697', '1', NULL, 'Darbhnga<br/>darbhntga', '2023-12-09', 'C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 53, 0),
(6637863, 'billa', '', 'akhil@gmail.com', '7894564564', '1702361385', '$2y$10$grCbvYDbzFyZlu/7LAJk4emh951vaSss8nkBwV2O4mbTgyhoeZN1.', '123456', NULL, '7032033', '7032033', '1', NULL, 'ghjgh<br/>jhfgjhfg', '2023-12-12', 'C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '192.168.1.202', '988bd1356cd2d5083feaf433cb61ebea', 1702445134, '192.168.1.202', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 75, 0),
(6754495, 'md israel', '', 'fhfghfd@hfgdhgfh', '7358488090', '1702294998', '$2y$10$LS6E8JMqSCYlqJO3.ZJZqewWiumP0KEDyS5fA4SmmzQQXZ4UBfxN.', '123456', NULL, '1001', '1001', '0', NULL, 'patna<br/>', '2023-12-11', 'A', 1666942, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 58, 0),
(7032033, 'siyar', '', 'arwaj@gmail.com', '97896564645', '1702361222', '$2y$10$fc6O901PiYgXQok0p8ejDOiehHvQvsC5S4r/7UPXjtctmVmee2u92', '123456', NULL, '3158823', '3158823', '0', NULL, 'fghdgfg<br/>fghfgfgh', '2023-12-12', 'B', 0, 0, 6637863, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'sub_agent', '192.168.1.202', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 74, 0),
(7149530, 'md israel', '', '', '7358488090', '1702296637', '$2y$10$Az6wS/RKlbiTMgcWZzWp3ePAp0dgLPBM36YveWtKwok7sNHReU6UO', '123456', NULL, '1666942', '1666942', '0', NULL, 'darbhnga<br/>', '2023-12-11', 'E', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sub_agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 63, 0),
(7571734, 'shsh', 'ADIFA', 'knowingsoon@gmail.com', '6565656566', '1702383867', '$2y$10$bK/45tmR81.VHDxpljBuXOMIL1xT5DkWwmioKjSZfXToflfgoQffu', '123456', NULL, '1001', '1001', '0', NULL, 'darbhnga<br/>', '2023-12-12', 'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '1.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 80, 0),
(8321697, 'md israel', '', 'fhfghfd@hfgdhgfh', '9905174054', '1701946609', '$2y$10$0UXICn9XxTIwkcDjmx2IK.Ge1LNbWF/lqdNEeJprmJHEQZs6/a6qi', '123456', NULL, '2628436', '2628436', '3', NULL, 'Darbhnga<br/>', '2023-12-07', 'A', 4354720, 2377089, 6383813, 8883176, 3635773, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 'Member', '::1', 'f5de34388d0f686902138da779b04b6a', 1702124528, '::1', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 48, 0),
(8883176, 'ddd', '', '', '7358488090', '1702109780', '$2y$10$yGF4lt6PPPqUthUow.t1COVDaeK0vxJH6/3dK.uUM/bUrtfuM34mq', '123456', NULL, '8321697', '8321697', '1', NULL, 'jharkhand<br/>', '2023-12-09', 'D', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Member', '::1', '', 0, 'NA', '500.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 54, 0),
(9266680, 'md israel', '', 'pink4pinku@gmail.com', '9905174054', '1702296574', '$2y$10$rez0Kd8oT0vBd0emu5dm2OL4UDU.arw1LwbpdnIkq0032nR.uBg1W', '123456', NULL, '1666942', '1666942', '0', NULL, 'darbhnga<br/>', '2023-12-11', 'A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sub_agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Active', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 62, 0),
(9650383, 'md israel', '', 'fhfghfd@hfgdhgfh', '9905174054', '1702289701', '$2y$10$jSQv.hpA.ueo4DJMcRuqee7J/qmevlDjI2xWnrZA/Oblfi95wo4wO', '123456', NULL, '1001', '1001', '0', NULL, 'jharkhand<br/>darbhnga', '2023-12-11', 'C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Agent', '::1', '', 0, 'NA', '0.00', 1, 0, '0', '0', '0', '0', '0', '', 'Suspend', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 56, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_profile`
--

CREATE TABLE `member_profile` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `tax_no` varchar(20) NOT NULL DEFAULT 'N/A',
  `aadhar_no` varchar(20) NOT NULL DEFAULT 'NA',
  `bank_ac_no` varchar(60) DEFAULT '',
  `bank_name` varchar(200) DEFAULT '',
  `bank_ifsc` varchar(30) DEFAULT '',
  `bank_branch` varchar(70) DEFAULT '',
  `btc_address` varchar(70) DEFAULT '',
  `tcc_address` varchar(70) DEFAULT '',
  `nominee_name` varchar(120) NOT NULL DEFAULT 'NA',
  `nominee_add` varchar(300) NOT NULL DEFAULT 'NA',
  `nominee_relation` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gstin` varchar(20) NOT NULL DEFAULT 'NA',
  `id_proof` varchar(200) DEFAULT NULL,
  `add_proof` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `member_profile`
--

INSERT INTO `member_profile` (`id`, `userid`, `tax_no`, `aadhar_no`, `bank_ac_no`, `bank_name`, `bank_ifsc`, `bank_branch`, `btc_address`, `tcc_address`, `nominee_name`, `nominee_add`, `nominee_relation`, `date_of_birth`, `gstin`, `id_proof`, `add_proof`) VALUES
(1, '8321697', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(2, '4354720', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(3, '5451366', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(4, '6041613', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(5, '2377089', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(6, '6383813', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(7, '8883176', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(8, '3635773', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(9, '6754495', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(10, '1666942', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(11, '7149530', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(12, '1674155', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(13, '4811063', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(14, '3928551', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(15, '2881108', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(16, '5414434', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(17, '3678961', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(18, '3158823', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(19, '7032033', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(20, '6637863', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(21, '2924125', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(22, '3271007', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(23, '6345402', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(24, '5650760', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL),
(25, '7571734', 'N/A', 'NA', '', '', '', '', '', '', 'NA', 'NA', '', NULL, 'NA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `description`, `status`, `update_date`) VALUES
(1, '<p>Welcome To ADI FUTURE</p>', 1, '2021-07-20');

-- --------------------------------------------------------

--
-- Table structure for table `other_wallet`
--

CREATE TABLE `other_wallet` (
  `id` int(11) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `other_wallet`
--

INSERT INTO `other_wallet` (`id`, `userid`, `balance`, `type`) VALUES
(1, '8321697', '0.00', 'Default'),
(2, '4354720', '0.00', 'Default'),
(3, '5451366', '0.00', 'Default'),
(4, '6041613', '0.00', 'Default'),
(5, '2377089', '0.00', 'Default'),
(6, '6383813', '0.00', 'Default'),
(7, '8883176', '0.00', 'Default'),
(8, '3635773', '0.00', 'Default'),
(9, '6754495', '0.00', 'Default'),
(10, '1666942', '0.00', 'Default'),
(11, '7149530', '0.00', 'Default'),
(12, '1674155', '0.00', 'Default'),
(13, '4811063', '0.00', 'Default'),
(14, '3928551', '0.00', 'Default'),
(15, '2881108', '0.00', 'Default'),
(16, '5414434', '0.00', 'Default'),
(17, '3678961', '0.00', 'Default'),
(18, '3158823', '0.00', 'Default'),
(19, '7032033', '0.00', 'Default'),
(20, '6637863', '0.00', 'Default'),
(21, '2924125', '0.00', 'Default'),
(22, '3271007', '0.00', 'Default'),
(23, '6345402', '0.00', 'Default'),
(24, '5650760', '0.00', 'Default'),
(25, '7571734', '0.00', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `pending_wallet`
--

CREATE TABLE `pending_wallet` (
  `id` int(11) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `balance` varchar(20) NOT NULL,
  `status` enum('Paid','Pending') NOT NULL DEFAULT 'Pending',
  `txn_id` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `prod_name` varchar(200) NOT NULL,
  `category` varchar(20) NOT NULL,
  `prod_price` varchar(15) NOT NULL,
  `dealer_price` decimal(11,2) NOT NULL,
  `prod_desc` text NOT NULL,
  `pv` varchar(20) NOT NULL DEFAULT '0',
  `qty` int(10) NOT NULL DEFAULT -1,
  `gst` decimal(11,2) NOT NULL,
  `image` varchar(200) NOT NULL,
  `show_on_regform` enum('Yes','No') NOT NULL DEFAULT 'No',
  `direct_income` decimal(11,2) DEFAULT 0.00,
  `level_income` varchar(200) DEFAULT NULL,
  `matching_income` decimal(11,2) DEFAULT 0.00,
  `capping` decimal(11,2) DEFAULT 0.00,
  `roi` decimal(11,2) DEFAULT 0.00,
  `roi_frequency` int(11) DEFAULT NULL,
  `roi_limit` int(11) DEFAULT NULL,
  `sold_qty` int(11) NOT NULL DEFAULT 0,
  `status` enum('Selling','Not-Selling') NOT NULL DEFAULT 'Selling'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `prod_name`, `category`, `prod_price`, `dealer_price`, `prod_desc`, `pv`, `qty`, `gst`, `image`, `show_on_regform`, `direct_income`, `level_income`, `matching_income`, `capping`, `roi`, `roi_frequency`, `roi_limit`, `sold_qty`, `status`) VALUES
(1, 'Package 1', '1', '500', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '250,200,750,2000,3000,4000,5000', NULL, '20000.00', '0.00', 0, 0, 8, 'Selling'),
(2, 'Package 2', '2', '1500', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '', NULL, NULL, '0.00', 0, 0, 0, 'Selling'),
(3, 'Package 3', '3', '4000', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '', NULL, NULL, '0.00', 0, 0, 0, 'Selling'),
(4, 'Package 4', '4', '8000', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '', NULL, NULL, '0.00', 0, 0, 0, 'Selling'),
(5, 'Package 70', '5', '16000', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '', NULL, NULL, '0.00', 0, 0, 0, 'Selling'),
(6, 'Package 8', '6', '32000', '0.00', '', '', -1, '0.00', 'default.jpg', 'Yes', NULL, '', NULL, NULL, '0.00', 0, 0, 0, 'Selling');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `parent_cat` varchar(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `cat_name`, `parent_cat`, `description`) VALUES
(1, 'Package', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_sale`
--

CREATE TABLE `product_sale` (
  `id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `userid` varchar(10) NOT NULL COMMENT 'who purchased the product',
  `status` enum('Completed','Processing') NOT NULL DEFAULT 'Processing',
  `franchisee_id` varchar(15) NOT NULL DEFAULT 'Admin',
  `cost` decimal(11,2) NOT NULL,
  `date` date NOT NULL,
  `deliver_date` date DEFAULT NULL,
  `tid` varchar(250) NOT NULL DEFAULT 'N/A',
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(20) NOT NULL,
  `purchased_data` text NOT NULL,
  `bill_copy` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `bill_amt` decimal(11,2) NOT NULL,
  `paid_amt` decimal(11,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rank_system`
--

CREATE TABLE `rank_system` (
  `id` int(11) NOT NULL,
  `rank_name` varchar(200) NOT NULL,
  `rank_duration` int(11) NOT NULL DEFAULT 0 COMMENT 'within how many days he should achieve this',
  `A` int(11) NOT NULL DEFAULT 0,
  `B` int(11) NOT NULL DEFAULT 0,
  `C` int(11) NOT NULL DEFAULT 0,
  `D` int(11) NOT NULL DEFAULT 0,
  `E` int(11) NOT NULL DEFAULT 0,
  `based_on` enum('Member','PV') NOT NULL DEFAULT 'Member'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rank_system`
--

INSERT INTO `rank_system` (`id`, `rank_name`, `rank_duration`, `A`, `B`, `C`, `D`, `E`, `based_on`) VALUES
(1, 'Silver', 0, 0, 0, 0, 0, 0, 'Member'),
(2, 'Gold', 0, 0, 0, 0, 0, 0, 'Member'),
(3, 'Ruby', 0, 0, 0, 0, 0, 0, 'Member'),
(4, 'Emerald', 0, 0, 0, 0, 0, 0, 'Member'),
(5, 'Pearl Distributor', 0, 0, 0, 0, 0, 0, 'Member'),
(6, 'Saphiere', 0, 0, 0, 0, 0, 0, 'Member'),
(7, ' Diamond', 0, 0, 0, 0, 0, 0, 'Member'),
(8, 'Director Diamond', 0, 0, 0, 0, 0, 0, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `recharge_entry`
--

CREATE TABLE `recharge_entry` (
  `id` int(11) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `service_type` enum('Mobile','DTH','Data Card','Utility Bill') NOT NULL DEFAULT 'Mobile',
  `recharge_no` varchar(40) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `time` int(11) NOT NULL,
  `status` enum('Pending','Completed') NOT NULL DEFAULT 'Pending',
  `area` varchar(100) DEFAULT NULL,
  `operator` varchar(100) NOT NULL,
  `trnid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `reward_id` varchar(150) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Delivered','Pending') NOT NULL DEFAULT 'Pending',
  `paid_date` date NOT NULL,
  `tid` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_setting`
--

CREATE TABLE `reward_setting` (
  `id` int(11) NOT NULL,
  `reward_name` varchar(200) NOT NULL,
  `reward_duration` int(11) NOT NULL DEFAULT 0 COMMENT 'within how many days he should achieve this',
  `achievers` int(11) NOT NULL DEFAULT 0,
  `A` int(11) NOT NULL DEFAULT 0,
  `B` int(11) NOT NULL DEFAULT 0,
  `C` int(11) NOT NULL DEFAULT 0,
  `D` int(11) NOT NULL DEFAULT 0,
  `E` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reward_setting`
--

INSERT INTO `reward_setting` (`id`, `reward_name`, `reward_duration`, `achievers`, `A`, `B`, `C`, `D`, `E`) VALUES
(1, 'Tab / LED / Smart Phone / 10,000', 0, 0, 50, 50, 0, 0, 0),
(2, 'Laptop / Bike / 25,000', 0, 0, 100, 100, 0, 0, 0),
(3, '10gm Gold / 50\" LED LG TV / 50,000', 0, 0, 250, 250, 0, 0, 0),
(4, 'Car / 1,50,000', 0, 0, 500, 500, 0, 0, 0),
(5, 'Big Car /300000', 0, 0, 1000, 1000, 0, 0, 0),
(6, 'Fortuner Car / 600000', 0, 0, 2500, 2500, 0, 0, 0),
(7, 'Mercedes/ Audi / BMW / 12 LAKH', 0, 0, 5000, 5000, 0, 0, 0),
(8, 'Jaguar Car / 25 Lakh / Couple Foreign Trip', 0, 0, 10000, 10000, 0, 0, 0),
(9, 'Luxury Bunglow / Couple Foreign Trip / 50 Lakh', 0, 0, 20000, 20000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `salary` decimal(11,2) NOT NULL,
  `month` varchar(10) NOT NULL,
  `year` varchar(10) NOT NULL,
  `paydate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `designtion` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `bank_detail` varchar(300) DEFAULT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `ip` varchar(100) NOT NULL DEFAULT '0:0:0:0',
  `last_login` date NOT NULL,
  `session` varchar(60) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `des_title` varchar(200) NOT NULL,
  `des_permission` varchar(1000) NOT NULL,
  `payscale` decimal(11,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `survey_name` varchar(200) NOT NULL,
  `question_answers` text NOT NULL,
  `level_earning` varchar(100) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `type` enum('Hosted Survey','Third Party') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey_user`
--

CREATE TABLE `survey_user` (
  `id` int(11) NOT NULL,
  `survey_id` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `data` text DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_report`
--

CREATE TABLE `tax_report` (
  `id` int(11) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `payout_id` varchar(10) NOT NULL,
  `tax_amount` decimal(11,2) NOT NULL,
  `tax_percnt` varchar(10) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `ticket_title` varchar(300) NOT NULL,
  `ticket_detail` text NOT NULL,
  `userid` varchar(20) NOT NULL,
  `status` enum('Open','Waiting User Reply','Closed','Customer Reply') NOT NULL DEFAULT 'Open',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `msg_from` varchar(20) NOT NULL DEFAULT 'Admin',
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topup_record`
--

CREATE TABLE `topup_record` (
  `id` int(11) NOT NULL,
  `user_id` varchar(22) NOT NULL,
  `epin` varchar(100) NOT NULL,
  `topup_amount` varchar(50) NOT NULL,
  `topup_by` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `topup_record`
--

INSERT INTO `topup_record` (`id`, `user_id`, `epin`, `topup_amount`, `topup_by`, `date`) VALUES
(1, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(2, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(3, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(4, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(5, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(6, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(7, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(8, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(9, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(10, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(11, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(12, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(13, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-07'),
(14, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-08'),
(15, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-08'),
(16, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-08'),
(17, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-08'),
(18, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(19, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(20, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(21, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(22, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(23, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(24, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(25, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(26, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(27, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(28, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(29, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(30, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(31, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(32, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(33, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(34, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(35, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(36, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(37, '5451366', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(38, '6041613', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(39, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(40, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(41, '8321697', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(42, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(43, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(44, '4354720', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(45, '3635773', 'Diect By Admin', '500', 'Admin', '2023-12-09'),
(46, '4811063', 'Diect By Admin', '500', 'Admin', '2023-12-12'),
(47, '6637863', 'Diect By Admin', '500', 'Admin', '2023-12-12'),
(48, '8883176', 'Diect By Admin', '500', 'Admin', '2023-12-12'),
(49, '6383813', 'Diect By Admin', '500', 'Admin', '2023-12-12'),
(50, '2377089', 'Diect By Admin', '500', 'Admin', '2023-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `capping_amt` decimal(11,2) NOT NULL,
  `gateway` varchar(20) NOT NULL,
  `time` int(11) NOT NULL,
  `transaction_id` varchar(150) NOT NULL DEFAULT 'NA',
  `status` enum('Completed','Processing','Failed') NOT NULL DEFAULT 'Completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_balance_records`
--

CREATE TABLE `transfer_balance_records` (
  `id` int(11) NOT NULL,
  `transfer_from` varchar(10) NOT NULL,
  `transfer_to` varchar(10) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `balance` varchar(15) NOT NULL DEFAULT '0',
  `without_tax_bal` varchar(15) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `userid`, `balance`, `without_tax_bal`, `type`) VALUES
(1, '1001', '0', '0', 'Default'),
(2, '8321697', '0', '0', 'Default'),
(3, '4354720', '0', '0', 'Default'),
(4, '5451366', '0', '0', 'Default'),
(5, '6041613', '0', '0', 'Default'),
(6, '2377089', '0', '0', 'Default'),
(7, '6383813', '0', '0', 'Default'),
(8, '8883176', '0', '0', 'Default'),
(9, '3635773', '0', '0', 'Default'),
(10, '6754495', '0', '0', 'Default'),
(11, '1666942', '0', '0', 'Default'),
(12, '7149530', '0', '0', 'Default'),
(13, '1674155', '0', '0', 'Default'),
(14, '4811063', '0', '0', 'Default'),
(15, '3928551', '0', '0', 'Default'),
(16, '2881108', '0', '0', 'Default'),
(17, '5414434', '0', '0', 'Default'),
(18, '3678961', '0', '0', 'Default'),
(19, '3158823', '0', '0', 'Default'),
(20, '7032033', '0', '0', 'Default'),
(21, '6637863', '0', '0', 'Default'),
(22, '2924125', '0', '0', 'Default'),
(23, '3271007', '0', '0', 'Default'),
(24, '6345402', '0', '0', 'Default'),
(25, '5650760', '0', '0', 'Default'),
(26, '7571734', '0', '0', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_request`
--

CREATE TABLE `withdraw_request` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `without_tax_amt` decimal(11,2) NOT NULL,
  `tax` decimal(11,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `status` enum('Paid','Un-Paid','Hold') NOT NULL DEFAULT 'Un-Paid',
  `paid_date` date DEFAULT NULL,
  `tid` varchar(200) DEFAULT NULL COMMENT 'Transaction ID or detail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_expense`
--
ALTER TABLE `admin_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_user`
--
ALTER TABLE `ad_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation_package`
--
ALTER TABLE `donation_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earning`
--
ALTER TABLE `earning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `useird` (`userid`);

--
-- Indexes for table `epin`
--
ALTER TABLE `epin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `epin` (`epin`),
  ADD KEY `issue_to` (`issue_to`);

--
-- Indexes for table `epin_request`
--
ALTER TABLE `epin_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix_income`
--
ALTER TABLE `fix_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flexible_income`
--
ALTER TABLE `flexible_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `franchisee`
--
ALTER TABLE `franchisee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `franchisee_stock`
--
ALTER TABLE `franchisee_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `franchisee_id` (`franchisee_id`);

--
-- Indexes for table `franchisee_stock_sale_bill`
--
ALTER TABLE `franchisee_stock_sale_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gap_commission_setting`
--
ALTER TABLE `gap_commission_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investment_pack`
--
ALTER TABLE `investment_pack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `level_wise_income`
--
ALTER TABLE `level_wise_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD UNIQUE KEY `secret` (`secret`),
  ADD KEY `sponsor` (`sponsor`),
  ADD KEY `poisition` (`position`);

--
-- Indexes for table `member_profile`
--
ALTER TABLE `member_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_wallet`
--
ALTER TABLE `other_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `pending_wallet`
--
ALTER TABLE `pending_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prod_name` (`prod_name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank_system`
--
ALTER TABLE `rank_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recharge_entry`
--
ALTER TABLE `recharge_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_setting`
--
ALTER TABLE `reward_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_user`
--
ALTER TABLE `survey_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`survey_id`);

--
-- Indexes for table `tax_report`
--
ALTER TABLE `tax_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payout_id` (`payout_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topup_record`
--
ALTER TABLE `topup_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_balance_records`
--
ALTER TABLE `transfer_balance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`transfer_from`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_expense`
--
ALTER TABLE `admin_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_user`
--
ALTER TABLE `ad_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_package`
--
ALTER TABLE `donation_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earning`
--
ALTER TABLE `earning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `epin`
--
ALTER TABLE `epin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `epin_request`
--
ALTER TABLE `epin_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fix_income`
--
ALTER TABLE `fix_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flexible_income`
--
ALTER TABLE `flexible_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `franchisee`
--
ALTER TABLE `franchisee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `franchisee_stock`
--
ALTER TABLE `franchisee_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `franchisee_stock_sale_bill`
--
ALTER TABLE `franchisee_stock_sale_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gap_commission_setting`
--
ALTER TABLE `gap_commission_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investment_pack`
--
ALTER TABLE `investment_pack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `level_wise_income`
--
ALTER TABLE `level_wise_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `secret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `member_profile`
--
ALTER TABLE `member_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `other_wallet`
--
ALTER TABLE `other_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pending_wallet`
--
ALTER TABLE `pending_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_sale`
--
ALTER TABLE `product_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rank_system`
--
ALTER TABLE `rank_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `recharge_entry`
--
ALTER TABLE `recharge_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_setting`
--
ALTER TABLE `reward_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey_user`
--
ALTER TABLE `survey_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_report`
--
ALTER TABLE `tax_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topup_record`
--
ALTER TABLE `topup_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
