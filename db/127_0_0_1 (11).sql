-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2018 at 04:32 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_project_pos`
--
CREATE DATABASE IF NOT EXISTS `db_project_pos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_project_pos`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about`
--

CREATE TABLE `tbl_about` (
  `id` int(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_about`
--

INSERT INTO `tbl_about` (`id`, `name`, `description`, `address`, `email`, `telephone`) VALUES
(1, 'M.Alvarez Technical Supply And General Merchandise', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eaque praesentium aspernatur cupiditate porro at provident magni asperiores officia veniam, deleniti consectetur eligendi voluptatibus. Veritatis unde modi maxime, dolore harum recusandae?', 'Brgy. San Jose GMA, Cavite', 'longcoproel@gmail.com', '09078267471');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `description`, `is_deleted`) VALUES
(1, 'cloths', 'for clothing', 0),
(2, 'shoes', 'for feet', 0),
(3, 'kitchen ware', 'sample data', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float(10,2) NOT NULL,
  `max` int(10) NOT NULL,
  `min` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `serial` varchar(15) NOT NULL,
  `barcode` text NOT NULL,
  `category_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`id`, `name`, `price`, `max`, `min`, `quantity`, `serial`, `barcode`, `category_id`, `supplier_id`, `unit_id`, `is_deleted`) VALUES
(2, 'Oil', 200.00, 100, 20, 0, '111', '233', 3, 4, 2, 0),
(3, 'Teady Bear', 312.00, 212, 32, 260, '321', '321', 2, 1, 1, 0),
(4, 'cordova', 312.00, 100, 20, 3, '64384302', '', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 0, '7889', '', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 226, '2332', '', 1, 4, 1, 0),
(7, 'laptop', 200.00, 100, 32, 0, '78892323', '', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 45, '345678', '', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 15, '456789', '', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 3, '45678934', '', 3, 4, 2, 0),
(11, 'basket', 200.00, 200, 100, 12, '8894343', '', 3, 5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id`, `user_id`, `description`, `date`) VALUES
(10001, 1, 'test', '2018-09-29'),
(10002, 1, 'Update Unit : bundles', '2018-10-16 03:09:48 AM'),
(10003, 1, 'Create Unit : box', '2018-10-16 03:12:00 AM'),
(10004, 1, 'Sale Transaction : (1) Teady Bear = 312.00<br>', '2018-10-16 03:21:49 AM'),
(10005, 1, 'Sale Transaction : <br>(1) basket = 200.00<br>(1) bag = 400.00<br>(1) frame = 200.00<br>(1) Jacket = 321.00<br>(1) cordova = 312.00<br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:24:05 AM'),
(10006, 1, 'Sale Transaction : <br>(1) basket = 200.00<br>(1) bag = 400.00<br>(1) frame = 200.00<br>(1) Jacket = 321.00<br>(1) cordova = 312.00<br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:24:07 AM'),
(10007, 1, 'Sale Transaction : <br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:34:46 AM'),
(10008, 1, 'Sale Transaction : <br>(1) mugs = 200.00<br>(1) bag = 400.00<br>(1) basket = 200.00<br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:36:27 AM'),
(10009, 1, 'Sale Transaction : <br>(1) cordova = 312.00<br>(1) frame = 200.00<br>(1) basket = 200.00<br>(1) bag = 400.00<br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:38:15 AM'),
(10010, 1, 'Sale Transaction : <br>(1) Teady Bear = 312.00<br>', '2018-10-16 03:39:43 AM'),
(10011, 1, 'Sale Transaction : <br>(1) basket = ?200.00<br>(1) bag = ?400.00<br>(1) mugs = ?200.00<br>(1) frame = ?200.00<br>(1) Jacket = ?321.00<br>(1) cordova = ?312.00<br>(1) Teady Bear = ?312.00<br>', '2018-10-16 04:12:37 AM'),
(10012, 1, 'Sale Transaction : <br>(1) basket = ?200.00<br>(1) bag = ?400.00<br>(1) mugs = ?200.00<br>(1) frame = ?200.00<br>(1) Jacket = ?321.00<br>(1) cordova = ?312.00<br>(1) Teady Bear = ?312.00<br>', '2018-10-16 04:15:27 AM'),
(10013, 1, 'Sale Transaction : <br>(1) Teady Bear = ?312.00<br>(1) cordova = ?312.00<br>(1) Jacket = ?321.00<br>(1) frame = ?200.00<br>(1) mugs = ?200.00<br>(1) bag = ?400.00<br>(1) basket = ?200.00<br>', '2018-10-16 04:16:24 AM'),
(10014, 1, 'Sale Transaction : <br>(1) Teady Bear = ?312.00<br>', '2018-10-16 04:18:34 AM'),
(10015, 1, 'Sale Transaction : <br>(1) Teady Bear = ? 312.00<br>', '2018-10-16 04:18:58 AM'),
(10016, 1, 'Sale Transaction : <br>(1) Teady Bear = P 312.00<br>', '2018-10-16 04:19:18 AM'),
(10017, 1, 'Sale Transaction : <br>(1) Teady Bear = Php 312.00<br>', '2018-10-16 04:19:39 AM'),
(10018, 1, 'Sale Transaction : <br>(1) Teady Bear = ? 312.00<br>', '2018-10-16 04:20:20 AM'),
(10019, 1, 'Sale Transaction : <br>(2) Teady Bear = PHP 312.00<br>', '2018-10-16 04:21:15 AM'),
(10020, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br>', '2018-10-16 04:26:21 AM'),
(10021, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br>', '2018-10-16 04:26:56 AM'),
(10022, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br>', '2018-10-16 04:28:21 AM'),
(10023, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br><b>TOTAL</b> : PHP 312', '2018-10-16 04:29:45 AM'),
(10024, 1, 'Sale Transaction : <br>(1) basket = PHP 200.00<br>(1) bag = PHP 400.00<br>(1) mugs = PHP 200.00<br>(1) frame = PHP 200.00<br>(1) Jacket = PHP 321.00<br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,945.00', '2018-10-16 04:30:48 AM'),
(10025, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', '2018-10-16 04:31:53 AM');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_moving_product`
--

CREATE TABLE `tbl_moving_product` (
  `id` int(10) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `quantity` int(10) NOT NULL,
  `date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_moving_product`
--

INSERT INTO `tbl_moving_product` (`id`, `item_name`, `quantity`, `date`) VALUES
(1, 'polo', 156, '2018-09-29'),
(2, 'laptop', 140, '10/31/2018'),
(3, 'pillow', 200, '2018-09-29'),
(4, 'fan', 55, '10/31/2018'),
(5, 'shoes', 300, '2018-09-29'),
(6, 'laze', 28, '10/31/2018'),
(7, 'mouse', 49, '2018-09-29'),
(8, 'keyboard', 22, '10/31/2018'),
(9, 'blanket', 10, '2018-09-29'),
(10, 'TV', 4, '10/31/2018'),
(11, 'remote', 500, '2018-09-29'),
(12, 'Iphone', 90, '10/31/2018'),
(13, 'Charger', 22, '2018-09-29'),
(14, 'Cable wire', 19, '10/31/2018'),
(15, 'Battery', 40, '2018-09-29'),
(16, 'Rakk Mouse', 78, '10/31/2018'),
(17, 'Oil', 1, '2018-10-15'),
(18, 'Oil', 1, '2018-10-15'),
(19, 'Teady Bear', 1, '2018-10-15'),
(20, 'Teady Bear', 1, '2018-10-15'),
(21, 'Oil', 6, '2018-10-15'),
(22, 'Oil', 50, '2018-10-15'),
(23, 'frame', 1, '2018-10-15'),
(24, 'frame', 1, '2018-10-15'),
(25, 'Teady Bear', 1, '2018-10-15'),
(26, 'Teady Bear', 16, '2018-10-16'),
(27, 'Teady Bear', 1, '2018-10-16'),
(28, 'basket', 1, '2018-10-16'),
(29, 'bag', 1, '2018-10-16'),
(30, 'frame', 1, '2018-10-16'),
(31, 'Jacket', 1, '2018-10-16'),
(32, 'cordova', 1, '2018-10-16'),
(33, 'Teady Bear', 1, '2018-10-16'),
(34, 'basket', 1, '2018-10-16'),
(35, 'bag', 1, '2018-10-16'),
(36, 'frame', 1, '2018-10-16'),
(37, 'Jacket', 1, '2018-10-16'),
(38, 'cordova', 1, '2018-10-16'),
(39, 'Teady Bear', 1, '2018-10-16'),
(40, 'Teady Bear', 1, '2018-10-16'),
(41, 'mugs', 1, '2018-10-16'),
(42, 'bag', 1, '2018-10-16'),
(43, 'basket', 1, '2018-10-16'),
(44, 'Teady Bear', 1, '2018-10-16'),
(45, 'cordova', 1, '2018-10-16'),
(46, 'frame', 1, '2018-10-16'),
(47, 'basket', 1, '2018-10-16'),
(48, 'bag', 1, '2018-10-16'),
(49, 'Teady Bear', 1, '2018-10-16'),
(50, 'Teady Bear', 1, '2018-10-16'),
(51, 'basket', 1, '2018-10-16'),
(52, 'bag', 1, '2018-10-16'),
(53, 'mugs', 1, '2018-10-16'),
(54, 'frame', 1, '2018-10-16'),
(55, 'Jacket', 1, '2018-10-16'),
(56, 'cordova', 1, '2018-10-16'),
(57, 'Teady Bear', 1, '2018-10-16'),
(58, 'basket', 1, '2018-10-16'),
(59, 'bag', 1, '2018-10-16'),
(60, 'mugs', 1, '2018-10-16'),
(61, 'frame', 1, '2018-10-16'),
(62, 'Jacket', 1, '2018-10-16'),
(63, 'cordova', 1, '2018-10-16'),
(64, 'Teady Bear', 1, '2018-10-16'),
(65, 'Teady Bear', 1, '2018-10-16'),
(66, 'cordova', 1, '2018-10-16'),
(67, 'Jacket', 1, '2018-10-16'),
(68, 'frame', 1, '2018-10-16'),
(69, 'mugs', 1, '2018-10-16'),
(70, 'bag', 1, '2018-10-16'),
(71, 'basket', 1, '2018-10-16'),
(72, 'Teady Bear', 1, '2018-10-16'),
(73, 'Teady Bear', 1, '2018-10-16'),
(74, 'Teady Bear', 1, '2018-10-16'),
(75, 'Teady Bear', 1, '2018-10-16'),
(76, 'Teady Bear', 1, '2018-10-16'),
(77, 'Teady Bear', 2, '2018-10-16'),
(78, 'Teady Bear', 1, '2018-10-16'),
(79, 'Teady Bear', 1, '2018-10-16'),
(80, 'Teady Bear', 1, '2018-10-16'),
(81, 'Teady Bear', 1, '2018-10-16'),
(82, 'basket', 1, '2018-10-16'),
(83, 'bag', 1, '2018-10-16'),
(84, 'mugs', 1, '2018-10-16'),
(85, 'frame', 1, '2018-10-16'),
(86, 'Jacket', 1, '2018-10-16'),
(87, 'cordova', 1, '2018-10-16'),
(88, 'Teady Bear', 1, '2018-10-16'),
(89, 'Teady Bear', 1, '2018-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale`
--

CREATE TABLE `tbl_sale` (
  `id` int(11) NOT NULL,
  `item` text NOT NULL,
  `total` float(10,2) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sale`
--

INSERT INTO `tbl_sale` (`id`, `item`, `total`, `customer_id`, `sale_date`, `user_id`) VALUES
(1, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2018-01-29', 1),
(2, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2018-02-29', 1),
(3, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2018-03-02', 1),
(4, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2018-04-02', 1),
(5, ' (1) Mouse = 200.00<br>', 200.00, '2018-10-04-4', '2018-05-03', 1),
(6, ' (12) Shoes = 6000.00<br>', 6000.00, '2018-10-07-5', '2018-06-06', 1),
(7, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2018-09-29', 1),
(8, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2018-07-29', 1),
(9, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2018-10-02', 1),
(10, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2017-10-02', 1),
(11, ' (1) Mouse = 200.00<br>', 200.00, '2018-10-04-4', '2018-10-03', 1),
(12, ' (12) Shoes = 6000.00<br>', 6000.00, '2018-10-07-5', '2018-09-06', 1),
(13, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2018-09-14', 1),
(14, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2018-09-29', 1),
(15, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2018-02-12', 1),
(16, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2018-08-15', 1),
(17, ' (1) Mouse = 200.00<br>', 200.00, '2018-10-04-4', '2018-10-03', 1),
(18, ' (12) Shoes = 6000.00<br>', 6000.00, '2018-10-07-5', '2018-10-06', 1),
(19, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2018-09-29', 1),
(20, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2018-09-29', 1),
(21, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2018-10-15', 1),
(22, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2018-11-02', 1),
(23, ' (1) Mouse = 200.00<br>', 200.00, '2018-10-04-4', '2018-10-03', 1),
(24, ' (12) Shoes = 6000.00<br>', 6000.00, '2018-10-07-5', '2018-12-06', 1),
(25, '(1) Oil = 200.00<br>', 200.00, '2018-10-15-9', '2018-10-15', 1),
(26, '(1) Teady Bear = 312.00<br>', 312.00, '2018-10-15-9', '2018-10-15', 1),
(27, '(1) Teady Bear = 312.00<br>', 312.00, '2018-10-15-9', '2018-10-15', 1),
(28, '(6) Oil = 200.00<br>', 1200.00, '2018-10-15-9', '2018-10-15', 1),
(29, '(50) Oil = 200.00<br>', 101000.00, '2018-10-15-9', '2018-10-15', 1),
(30, '(1) frame = 200.00<br>', 200.00, '2018-10-15-9', '2018-10-15', 1),
(31, '(1) Teady Bear = 312.00<br>', 312.00, '130966318', '2018-10-15', 1),
(32, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2017-01-29', 1),
(33, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2017-02-29', 1),
(34, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2017-03-02', 1),
(35, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2017-04-02', 1),
(36, ' (1) Mouse = 200.00<br>', 200.00, '2018-10-04-4', '2017-05-03', 1),
(37, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2017-06-29', 1),
(38, ' (3) Mouse = 600.00<br> (2) Computer = 1000.00<br>', 1600.00, '2018-09-29-1', '2017-07-29', 1),
(39, ' (1) Computer = 500.00<br>', 500.00, '2018-10-03-2', '2017-08-02', 1),
(40, ' (1) Cologne = 200.00<br> (1) Medal = 500.00<br> (13) Laptop = 6500.00<br> (4) Computer = 2000.00<br>', 9200.00, '2018-10-03-3', '2017-09-02', 1),
(41, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2016-01-29', 1),
(42, ' (1) Computer = 500.00<br>', 500.00, '2018-09-29-0', '2016-02-29', 1),
(43, '(16) Teady Bear = 312.00<br>', 4992.00, '1549334022', '2018-10-16', 1),
(44, '(1) Teady Bear = 312.00<br>', 312.00, '1195241164', '2018-10-16', 1),
(45, '(1) basket = 200.00<br>(1) bag = 400.00<br>(1) frame = 200.00<br>(1) Jacket = 321.00<br>(1) cordova = 312.00<br>(1) Teady Bear = 312.00<br>', 1745.00, '1658604189', '2018-10-16', 1),
(46, '(1) basket = 200.00<br>(1) bag = 400.00<br>(1) frame = 200.00<br>(1) Jacket = 321.00<br>(1) cordova = 312.00<br>(1) Teady Bear = 312.00<br>', 1745.00, '1658604189', '2018-10-16', 1),
(47, '(1) Teady Bear = 312.00<br>', 312.00, '1742237555', '2018-10-16', 1),
(48, '(1) mugs = 200.00<br>(1) bag = 400.00<br>(1) basket = 200.00<br>(1) Teady Bear = 312.00<br>', 1112.00, '1417758696', '2018-10-16', 1),
(49, '(1) cordova = 312.00<br>(1) frame = 200.00<br>(1) basket = 200.00<br>(1) bag = 400.00<br>(1) Teady Bear = 312.00<br>', 1424.00, '1566182613', '2018-10-16', 1),
(50, '(1) Teady Bear = 312.00<br>', 312.00, '1428225306', '2018-10-16', 1),
(51, '(1) basket = ?200.00<br>(1) bag = ?400.00<br>(1) mugs = ?200.00<br>(1) frame = ?200.00<br>(1) Jacket = ?321.00<br>(1) cordova = ?312.00<br>(1) Teady Bear = ?312.00<br>', 1945.00, '661586401', '2018-10-16', 1),
(52, '(1) basket = ?200.00<br>(1) bag = ?400.00<br>(1) mugs = ?200.00<br>(1) frame = ?200.00<br>(1) Jacket = ?321.00<br>(1) cordova = ?312.00<br>(1) Teady Bear = ?312.00<br>', 1945.00, '1029498132', '2018-10-16', 1),
(53, '(1) Teady Bear = ?312.00<br>(1) cordova = ?312.00<br>(1) Jacket = ?321.00<br>(1) frame = ?200.00<br>(1) mugs = ?200.00<br>(1) bag = ?400.00<br>(1) basket = ?200.00<br>', 1945.00, '660759469', '2018-10-16', 1),
(54, '(1) Teady Bear = ?312.00<br>', 312.00, '1128453270', '2018-10-16', 1),
(55, '(1) Teady Bear = ? 312.00<br>', 312.00, '1914949634', '2018-10-16', 1),
(56, '(1) Teady Bear = P 312.00<br>', 312.00, '781522291', '2018-10-16', 1),
(57, '(1) Teady Bear = Php 312.00<br>', 312.00, '1174647340', '2018-10-16', 1),
(58, '(1) Teady Bear = ? 312.00<br>', 312.00, '1141246060', '2018-10-16', 1),
(59, '(2) Teady Bear = PHP 312.00<br>', 624.00, '1797118121', '2018-10-16', 1),
(60, '(1) Teady Bear = PHP 312.00<br>', 312.00, '809688585', '2018-10-16', 1),
(61, '(1) Teady Bear = PHP 312.00<br>', 312.00, '547202751', '2018-10-16', 1),
(62, '(1) Teady Bear = PHP 312.00<br>', 312.00, '1655310862', '2018-10-16', 1),
(63, '(1) Teady Bear = PHP 312.00<br><b>TOTAL</b> : PHP 312', 312.00, '1478952647', '2018-10-16', 1),
(64, '(1) basket = PHP 200.00<br>(1) bag = PHP 400.00<br>(1) mugs = PHP 200.00<br>(1) frame = PHP 200.00<br>(1) Jacket = PHP 321.00<br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,945.00', 1945.00, '1901829454', '2018-10-16', 1),
(65, '(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '616957419', '2018-10-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `name`, `telephone`, `address`, `is_deleted`) VALUES
(1, 'Dezza\'s Shop', '094374392', 'paliparan, Dasma', 0),
(2, 'Jeffry\'s Barbershop', '78434823', 'Poblacion 3, GMA, Cavite', 0),
(3, 'Roel Programming Company', '098865756', 'San Jose', 0),
(4, 'Annabelle parlor', '324234', 'poulido', 0),
(5, 'Amazon', '59875', 'USA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`id`, `name`, `is_deleted`) VALUES
(1, 'pieces', 0),
(2, 'bundles', 0),
(3, 'box', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `accessToken` varchar(200) NOT NULL,
  `authKey` varchar(200) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `user`, `accessToken`, `authKey`, `is_deleted`) VALUES
(1, 'admin', 'admin', 'Administrator', '', '', 0),
(2, 'cashier2', 'cashier2', 'Cashier', '', '', 0),
(3, 'cashier', 'cashier', 'Cashier', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10026;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD CONSTRAINT `tbl_item_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `tbl_supplier` (`id`),
  ADD CONSTRAINT `tbl_item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `tbl_item_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit` (`id`);

--
-- Constraints for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD CONSTRAINT `tbl_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD CONSTRAINT `tbl_sale_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
