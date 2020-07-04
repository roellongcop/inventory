-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2018 at 06:36 AM
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
(1, 'M.Alvarez Technical Supply And General Merchandise', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eaque praesentium aspernatur cupiditate porro at provident magni asperiores officia veniam, deleniti consectetur eligendi voluptatibus. Veritatis unde modi maxime, dolore harum recusandae?', 'Brgy. San Jose GMA, Cavite', 'malvarez@gmail.com', '09078267471');

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
(2, 'shoes', 'for feet ware', 0),
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
(2, 'Oil', 200.00, 100, 20, 0, '8386222035031', '233', 3, 4, 2, 0),
(3, 'Teady Bear', 312.00, 212, 32, 255, '2183355372234', '321', 2, 1, 1, 0),
(4, 'cordova', 312.00, 100, 20, 3, '4394976594771', '', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 0, '5363206163444', '', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 226, '6712944740682', '', 1, 4, 1, 0),
(7, 'heat sink', 200.00, 100, 32, 0, '9885652769599', '', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 44, '5884625374203', '', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 15, '3412139275402', '', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 3, '6137287985063', '', 3, 4, 2, 0),
(11, 'basket', 200.00, 200, 100, 12, '1721769451053', '', 3, 5, 2, 0),
(12, 'lamp', 200.00, 100, 20, 0, '6543415246683', '233', 3, 4, 2, 0),
(13, 'flash drive', 312.00, 212, 32, 251, '9553076094907', '321', 2, 1, 1, 0),
(14, 'system unit', 312.00, 100, 20, 3, '6743184602885', '', 1, 1, 1, 0),
(15, 'speaker', 200.00, 100, 32, 0, '12030631274103', '', 1, 3, 1, 0),
(16, 'headphones', 321.00, 234, 23, 226, '2750315191284', '', 1, 4, 3, 0),
(17, 'laptop', 200.00, 100, 32, 0, '6054959280981', '', 1, 3, 1, 0),
(18, 'earplugs', 200.00, 200, 10, 45, '7019996615353', '', 1, 5, 2, 0),
(19, 'jack', 200.00, 100, 10, 15, '5164523036199', '', 1, 5, 2, 0),
(20, 'helmet', 400.00, 200, 20, 3, '6465272553594', '', 3, 4, 2, 0),
(21, 'pillow', 200.00, 200, 100, 12, '5126549050999', '', 3, 5, 2, 0),
(22, 'jar', 500.00, 1002, 200, 12, '3727806192707', '', 1, 3, 3, 0),
(23, 'mousepad', 200.00, 200, 100, 10, '1746062572129', '', 3, 4, 3, 0),
(24, 'RAM', 23.00, 55, 5, 32, '1203063127410', '', 1, 4, 2, 0);

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
(1, 1, 'Update User : roelroel', '2018-10-18 08:02:07 AM'),
(2, 1, 'Update User : roelroel', '2018-10-18 08:03:03 AM'),
(3, 1, 'Update User : roelroel', '2018-10-18 08:04:32 AM'),
(4, 1, 'Update User : adminss', '2018-10-18 08:05:15 AM'),
(5, 1, 'Update User : roel', '2018-10-18 08:07:50 AM'),
(6, 1, 'Update User : qweqwe', '2018-10-18 08:08:12 AM'),
(7, 1, 'Update User : roel', '2018-10-18 08:10:32 AM'),
(8, 1, 'Create User : cashier', '2018-10-18 08:22:29 AM'),
(9, 1, 'Update Company Profile', '2018-10-19 03:53:11 AM'),
(10, 1, 'Sale Transaction : <br>(5) Teady Bear = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,872.00', '2018-10-19 03:56:34 AM'),
(11, 6, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 624.00', '2018-10-19 03:57:47 AM'),
(12, 6, 'Create Item : 23', '2018-10-19 04:01:39 AM'),
(13, 6, 'Update User : cashiers', '2018-10-19 06:17:37 AM'),
(14, 6, 'Update User : cashiers', '2018-10-19 06:18:06 AM'),
(15, 6, 'Update User : cashiers', '2018-10-19 06:18:38 AM'),
(16, 6, 'Update User : qweqwe', '2018-10-19 06:18:54 AM'),
(17, 6, 'Update User : qweqwe', '2018-10-19 06:19:29 AM'),
(18, 6, 'Update User : cashier', '2018-10-19 06:20:04 AM'),
(19, 6, 'Update User : cashier', '2018-10-19 06:20:29 AM'),
(20, 1, 'Create User : admin2', '2018-10-19 06:22:15 AM'),
(21, 7, 'Update Item : monoblock', '2018-10-19 06:24:03 AM'),
(22, 7, 'Update Item : the best item', '2018-10-19 06:24:14 AM'),
(23, 7, 'Update Item : handbag', '2018-10-19 06:24:28 AM'),
(24, 7, 'Update Item : basket', '2018-10-19 06:24:41 AM'),
(25, 7, 'Update Item : bag', '2018-10-19 06:24:53 AM'),
(26, 7, 'Update Item : mugs', '2018-10-19 06:25:22 AM'),
(27, 7, 'Update Item : frame', '2018-10-19 06:25:34 AM'),
(28, 7, 'Update Item : laptop', '2018-10-19 06:25:45 AM'),
(29, 7, 'Update Item : Jacket', '2018-10-19 06:25:56 AM'),
(30, 7, 'Update Item : laptop', '2018-10-19 06:26:06 AM'),
(31, 7, 'Update Item : laptop', '2018-10-19 06:27:55 AM'),
(32, 7, 'Update Item : cordova', '2018-10-19 06:29:00 AM'),
(33, 7, 'Update Item : Teady Bear', '2018-10-19 06:29:20 AM'),
(34, 7, 'Update Item : Oil', '2018-10-19 06:29:32 AM'),
(35, 7, 'Update Item : basket', '2018-10-19 06:29:44 AM'),
(36, 7, 'Update Item : bag', '2018-10-19 06:29:58 AM'),
(37, 7, 'Update Item : mugs', '2018-10-19 06:30:13 AM'),
(38, 7, 'Update Item : frame', '2018-10-19 06:30:29 AM'),
(39, 7, 'Update Item : Jacket', '2018-10-19 06:30:42 AM'),
(40, 7, 'Update Item : laptop', '2018-10-19 06:30:54 AM'),
(41, 7, 'Update Item : laptop', '2018-10-19 06:30:59 AM'),
(42, 7, 'Update Item : cordova', '2018-10-19 06:31:17 AM'),
(43, 7, 'Update Item : Teady Bear', '2018-10-19 06:31:36 AM'),
(44, 7, 'Update Item : Oil', '2018-10-19 06:31:48 AM'),
(45, 7, 'Update Item : headphones', '2018-10-19 06:33:34 AM'),
(46, 7, 'Update Item : heat sink', '2018-10-19 06:34:48 AM');

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
(21, 'Oil', 6, '2018-10-15'),
(22, 'Oil', 50, '2018-10-15'),
(26, 'Teady Bear', 16, '2018-10-16'),
(27, 'Teady Bear', 1, '2018-10-16'),
(28, 'Teady Bear', 1, '2018-10-16'),
(29, 'frame', 1, '2018-10-17'),
(30, 'Teady Bear', 1, '2018-10-17'),
(31, 'Teady Bear', 1, '2018-10-17'),
(32, 'Teady Bear', 5, '2018-10-19'),
(33, 'Teady Bear', 1, '2018-10-19'),
(34, 'Teady Bear', 1, '2018-10-19'),
(35, 'Teady Bear', 1, '2018-10-19');

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
(65, '(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '616957419', '2018-10-16', 1),
(66, '(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '1292402213', '2018-10-16', 1),
(67, '(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '624001499', '2018-10-16', 1),
(68, '(1) frame = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '682096745', '2018-10-17', 1),
(69, '(1) Teady Bear = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 624.00', 624.00, '835041643', '2018-10-17', 1),
(70, '(5) Teady Bear = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,872.00', 1872.00, '101723956', '2018-10-19', 1),
(71, '(1) Teady Bear = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 624.00', 624.00, '1234230208', '2018-10-19', 6);

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
(1, 'piece', 0),
(2, 'bundles', 0),
(3, 'box', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user` varchar(30) NOT NULL,
  `accessToken` varchar(200) NOT NULL,
  `authKey` varchar(200) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `user`, `accessToken`, `authKey`, `is_deleted`) VALUES
(1, 'admin', '$2y$13$h7GhphAs2DXLdLAASWAdIeTnyCBFAMhpgLQDCET6zy9A4jaGoZgk2', 'Administrator', 'hsaydsneisd8232', 'kfds843ndfhxc7', 0),
(6, 'cashier', '$2y$13$siulWP0z5/0YSBXse/Dz2OkgV88HrwkUTs0DYjzHkR7xdCMKjPzVO', 'Cashier', '', '', 0),
(7, 'admin2', '$2y$13$aXeoIQ5YhzJFUgTWpjEMZuvEWRf8rs/LN3yeKMuq0Jg8pGlDgWz1S', 'Administrator', '', '', 0);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
