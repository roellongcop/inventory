-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2018 at 03:14 PM
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
(2, 'Oil', 200.00, 100, 20, 53, '8386222035031', '', 3, 4, 2, 0),
(3, 'Teady Bear', 312.00, 212, 32, 239, '2183355372234', '', 2, 1, 1, 0),
(4, 'cordova', 312.00, 100, 20, 60, '4394976594771', '', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 49, '5363206163444', '', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 215, '6712944740682', '', 1, 4, 1, 0),
(7, 'heat sink', 200.00, 100, 32, 116, '9885652769599', '', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 41, '5884625374203', '', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 70, '3412139275402', '', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 112, '6137287985063', '', 3, 4, 2, 0),
(11, 'basket', 200.00, 200, 100, 144, '1721769451053', '', 3, 5, 2, 0),
(12, 'lamp', 200.00, 100, 20, 45, '6543415246683', '', 3, 4, 2, 0),
(13, 'flash drive', 312.00, 212, 32, 249, '9553076094907', '', 2, 1, 1, 0),
(14, 'system unit', 312.00, 100, 20, 82, '6743184602885', '', 1, 1, 1, 0),
(15, 'speaker', 200.00, 100, 32, 46, '12030631274103', '', 1, 3, 1, 0),
(16, 'headphones', 321.00, 234, 23, 226, '2750315191284', '', 1, 4, 3, 0),
(17, 'laptop', 200.00, 100, 32, 98, '6054959280981', '', 1, 3, 1, 0),
(18, 'earplugs', 200.00, 200, 10, 77, '7019996615353', '', 1, 5, 2, 0),
(19, 'jack', 200.00, 100, 10, 200, '5164523036199', '', 1, 5, 2, 0),
(20, 'helmet', 400.00, 200, 20, 180, '6465272553594', '', 3, 4, 2, 0),
(21, 'pillow', 200.00, 200, 100, 153, '5126549050999', '', 3, 5, 2, 0),
(22, 'jar', 500.00, 1002, 200, 198, '3286308808934', '', 1, 3, 3, 0),
(23, 'mousepad', 200.00, 200, 100, 250, '1746062572129', '', 3, 4, 3, 0),
(24, 'RAM', 23.00, 55, 5, 54, '1203063127410', '', 1, 4, 2, 0);

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
(1, 1, 'Sale Transaction : <br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 824.00', '2018-10-20 18:07:17 PM'),
(2, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:08:24 PM'),
(3, 1, 'Sale Transaction : <br>(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 321.00', '2018-10-20 18:10:02 PM'),
(4, 1, 'Sale Transaction : <br>(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:10:24 PM'),
(5, 1, 'Sale Transaction : <br>(1) frame = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:11:11 PM'),
(6, 1, 'Sale Transaction : <br>(2) mugs = PHP 200.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:11:32 PM'),
(7, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:12:10 PM'),
(8, 1, 'Sale Transaction : <br>(1) basket = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:12:24 PM'),
(9, 1, 'Sale Transaction : <br>(1) lamp = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:12:37 PM'),
(10, 1, 'Sale Transaction : <br>(1) flash drive = PHP 312.00<br><b>Total</b> : PHP 312.00', '2018-10-20 18:12:52 PM'),
(11, 1, 'Sale Transaction : <br>(3) system unit = PHP 312.00<br><b>Total</b> : PHP 936.00', '2018-10-20 18:13:11 PM'),
(12, 1, 'Sale Transaction : <br>(1) Jacket = PHP 321.00<br>(1) flash drive = PHP 312.00<br><b>Total</b> : PHP 633.00', '2018-10-20 18:14:51 PM'),
(13, 1, 'Sale Transaction : <br>(1) basket = PHP 200.00<br>(1) mugs = PHP 200.00<br>(1) laptop = PHP 200.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br>(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 1,312.00', '2018-10-20 18:32:16 PM'),
(14, 1, 'Sale Transaction : <br>(1) lamp = PHP 200.00<br>(3) basket = PHP 200.00<br>(2) bag = PHP 400.00<br>(5) mugs = PHP 200.00<br>(1) frame = PHP 200.00<br>(3) heat sink = PHP 200.00<br>(4) Jacket = PHP 321.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br>(5) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 6,956.00', '2018-10-20 18:35:37 PM'),
(15, 1, 'Sale Transaction : <br>(1) lamp = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-20 18:36:39 PM'),
(16, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:51:42 PM'),
(17, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:52:31 PM'),
(18, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:53:40 PM'),
(19, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:55:14 PM'),
(20, 1, 'Sale Transaction : <br>(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', '2018-10-20 18:56:22 PM'),
(21, 1, 'Sale Transaction : <br>(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 321.00', '2018-10-20 18:59:03 PM'),
(22, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br>(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 521.00', '2018-10-20 18:59:50 PM'),
(23, 1, 'Sale Transaction : <br>(1) basket = PHP 200.00<br>(4) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,448.00', '2018-10-20 19:00:18 PM'),
(24, 1, 'Update User : cashier2', '2018-10-20 19:34:38 PM'),
(25, 1, 'Update User : cashier2', '2018-10-20 19:35:52 PM'),
(26, 1, 'Update User : admin2', '2018-10-20 19:37:06 PM'),
(27, 1, 'Update User : cashier1', '2018-10-20 19:37:51 PM'),
(28, 1, 'Update User : admin2', '2018-10-20 19:41:17 PM'),
(29, 1, 'Update User : cashier2', '2018-10-20 19:45:43 PM'),
(30, 1, 'Update User : admin1', '2018-10-20 19:46:36 PM'),
(31, 1, 'Update User : cashier2', '2018-10-20 19:51:29 PM'),
(32, 1, 'Update User : admin1', '2018-10-20 20:34:34 PM'),
(33, 1, 'Update User : cashier2', '2018-10-20 20:35:02 PM'),
(34, 1, 'Update User : admin2', '2018-10-20 20:36:21 PM'),
(35, 1, 'Update User : cashier1', '2018-10-20 20:36:38 PM'),
(36, 1, 'Update User : cashier2', '2018-10-20 20:38:34 PM'),
(37, 1, 'Update Item : RAM', '2018-10-20 22:01:44 PM'),
(38, 1, 'Update Item : RAM', '2018-10-20 22:02:30 PM'),
(39, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-24 11:57:20 AM'),
(40, 1, 'Sale Transaction : <br>(1) frame = PHP 200.00<br>(1) heat sink = PHP 200.00<br>(1) Jacket = PHP 321.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 1,745.00', '2018-10-24 12:39:36 PM'),
(41, 1, 'Sale Transaction : <br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 824.00', '2018-10-24 14:07:53 PM'),
(42, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-24 14:16:30 PM'),
(43, 1, 'Sale Transaction : <br>(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 321.00', '2018-10-24 14:44:08 PM'),
(44, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-01-24 15:02:55 PM'),
(45, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', '2018-02-01 15:03:59 PM'),
(46, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', '2018-03-01 15:04:29 PM'),
(47, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-04-01 15:06:41 PM'),
(48, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-05-01 15:07:03 PM'),
(49, 1, 'Sale Transaction : <br>(1) pillow = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 712.00', '2018-06-01 15:07:41 PM'),
(50, 1, 'Sale Transaction : <br>(1) Teady Bear = PHP 312.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 624.00', '2018-07-01 15:09:28 PM'),
(51, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-08-01 15:11:00 PM'),
(52, 1, 'Sale Transaction : <br>(1) heat sink = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) Oil = PHP 200.00<br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 912.00', '2018-09-01 15:11:31 PM'),
(53, 1, 'Sale Transaction : <br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-10-01 15:11:50 PM'),
(54, 1, 'Sale Transaction : <br>(1) RAM = PHP 23.00<br><b>Total</b> : PHP 23.00', '2018-11-01 14:12:14 PM'),
(55, 1, 'Sale Transaction : <br>(1) heat sink = PHP 200.00<br>(1) Jacket = PHP 321.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 1,545.00', '2018-12-01 15:12:51 PM');

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
(35, 'Teady Bear', 1, '2018-10-19'),
(36, 'cordova', 1, '2018-10-20'),
(37, 'Teady Bear', 1, '2018-10-20'),
(38, 'Oil', 1, '2018-10-20'),
(39, 'laptop', 1, '2018-10-20'),
(40, 'Jacket', 1, '2018-10-20'),
(41, 'heat sink', 1, '2018-10-20'),
(42, 'frame', 1, '2018-10-20'),
(43, 'mugs', 2, '2018-10-20'),
(44, 'bag', 1, '2018-10-20'),
(45, 'basket', 1, '2018-10-20'),
(46, 'lamp', 1, '2018-10-20'),
(47, 'flash drive', 1, '2018-10-20'),
(48, 'system unit', 3, '2018-10-20'),
(49, 'Jacket', 1, '2018-10-20'),
(50, 'flash drive', 1, '2018-10-20'),
(51, 'basket', 1, '2018-10-20'),
(52, 'mugs', 1, '2018-10-20'),
(53, 'laptop', 1, '2018-10-20'),
(54, 'Teady Bear', 1, '2018-10-20'),
(55, 'Oil', 1, '2018-10-20'),
(56, 'heat sink', 1, '2018-10-20'),
(57, 'lamp', 1, '2018-10-20'),
(58, 'basket', 3, '2018-10-20'),
(59, 'bag', 2, '2018-10-20'),
(60, 'mugs', 5, '2018-10-20'),
(61, 'frame', 1, '2018-10-20'),
(62, 'heat sink', 3, '2018-10-20'),
(63, 'Jacket', 4, '2018-10-20'),
(64, 'laptop', 1, '2018-10-20'),
(65, 'cordova', 1, '2018-10-20'),
(66, 'Teady Bear', 5, '2018-10-20'),
(67, 'Oil', 1, '2018-10-20'),
(68, 'lamp', 1, '2018-10-20'),
(69, 'bag', 1, '2018-10-20'),
(70, 'bag', 1, '2018-10-20'),
(71, 'bag', 1, '2018-10-20'),
(72, 'bag', 1, '2018-10-20'),
(73, 'bag', 1, '2018-10-20'),
(74, 'Jacket', 1, '2018-10-20'),
(75, 'laptop', 1, '2018-10-20'),
(76, 'Jacket', 1, '2018-10-20'),
(77, 'basket', 1, '2018-10-20'),
(78, 'Teady Bear', 4, '2018-10-20'),
(79, 'Oil', 1, '2018-10-24'),
(80, 'frame', 1, '2018-10-24'),
(81, 'heat sink', 1, '2018-10-24'),
(82, 'Jacket', 1, '2018-10-24'),
(83, 'laptop', 1, '2018-10-24'),
(84, 'cordova', 1, '2018-10-24'),
(85, 'Teady Bear', 1, '2018-10-24'),
(86, 'Oil', 1, '2018-10-24'),
(87, 'cordova', 1, '2018-10-24'),
(88, 'Teady Bear', 1, '2018-10-24'),
(89, 'Oil', 1, '2018-10-24'),
(90, 'Oil', 1, '2018-10-24'),
(91, 'Jacket', 1, '2018-10-24'),
(92, 'Oil', 1, '2018-01-24'),
(93, 'Teady Bear', 1, '2018-02-01'),
(94, 'laptop', 1, '2018-03-01'),
(95, 'cordova', 1, '2018-03-01'),
(96, 'laptop', 1, '2018-04-01'),
(97, 'Oil', 1, '2018-05-01'),
(98, 'pillow', 1, '2018-06-01'),
(99, 'cordova', 1, '2018-06-01'),
(100, 'laptop', 1, '2018-06-01'),
(101, 'Teady Bear', 1, '2018-07-01'),
(102, 'cordova', 1, '2018-07-01'),
(103, 'Oil', 1, '2018-08-01'),
(104, 'heat sink', 1, '2018-09-01'),
(105, 'cordova', 1, '2018-09-01'),
(106, 'Oil', 1, '2018-09-01'),
(107, 'laptop', 1, '2018-09-01'),
(108, 'Oil', 1, '2018-10-01'),
(109, 'RAM', 1, '2018-11-01'),
(110, 'heat sink', 1, '2018-12-01'),
(111, 'Jacket', 1, '2018-12-01'),
(112, 'laptop', 1, '2018-12-01'),
(113, 'cordova', 1, '2018-12-01'),
(114, 'Teady Bear', 1, '2018-12-01'),
(115, 'Oil', 1, '2018-12-01');

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
  `user_id` int(10) NOT NULL,
  `invoice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sale`
--

INSERT INTO `tbl_sale` (`id`, `item`, `total`, `customer_id`, `sale_date`, `user_id`, `invoice`) VALUES
(1, '(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '1017178066', '2018-01-24', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1017178066</h4> <p><span><strong>Invoice Date:</strong> <div>January 24, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 200.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 200 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 0.00 </td></tr></tbody></table>'),
(2, '(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '844315950', '2018-02-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-844315950</h4> <p><span><strong>Invoice Date:</strong> <div>January 24, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Teady Bear </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 312.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 350 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 38.00 </td></tr></tbody></table>'),
(3, '(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', 512.00, '1371593823', '2018-03-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1371593823</h4> <p><span><strong>Invoice Date:</strong> <div>January 24, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> laptop </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> cordova </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 512.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 550 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 38.00 </td></tr></tbody></table>'),
(4, '(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '1467056656', '2018-04-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1467056656</h4> <p><span><strong>Invoice Date:</strong> <div>April 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> laptop </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 200.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 600 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 400.00 </td></tr></tbody></table>'),
(5, '(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '217084952', '2018-05-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-217084952</h4> <p><span><strong>Invoice Date:</strong> <div>April 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 200.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 200 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 0.00 </td></tr></tbody></table>'),
(6, '(1) pillow = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 712.00', 712.00, '353857468', '2018-06-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-353857468</h4> <p><span><strong>Invoice Date:</strong> <div>April 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> pillow </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> cordova </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr><tr><td><strong> laptop </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 712.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 720 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 8.00 </td></tr></tbody></table>'),
(7, '(1) Teady Bear = PHP 312.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 624.00', 624.00, '1381402988', '2018-07-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1381402988</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Teady Bear </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr><tr><td><strong> cordova </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 624.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 650 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 26.00 </td></tr></tbody></table>'),
(8, '(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '1637384736', '2018-08-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1637384736</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 200.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 500 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 300.00 </td></tr></tbody></table>'),
(9, '(1) heat sink = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) Oil = PHP 200.00<br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 912.00', 912.00, '294932764', '2018-09-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-294932764</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> heat sink </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> cordova </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> laptop </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 912.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 1000 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 88.00 </td></tr></tbody></table>'),
(10, '(1) Oil = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '1121695373', '2018-10-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1121695373</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 200.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 200 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 0.00 </td></tr></tbody></table>'),
(11, '(1) RAM = PHP 23.00<br><b>Total</b> : PHP 23.00', 23.00, '802641006', '2018-11-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-802641006</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> RAM </strong></td> <td> 1 </td> <td>? 23.00 </td> <td>? 23.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 23.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 50 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 27.00 </td></tr></tbody></table>'),
(12, '(1) heat sink = PHP 200.00<br>(1) Jacket = PHP 321.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 1,545.00', 1545.00, '1082471236', '2018-12-01', 1, '<div class=\"row\"><div class=\"col-sm-6 col-xs-6\"><h5>From:</h5> <address><strong>M.Alvarez Technical Supply And General Merchandise</strong><br>\n	                    Brgy. San Jose GMA, Cavite<br>\n	                    malvarez@gmail.com<br> <abbr title=\"Phone\"></abbr> 09078267471	                </address></div> <div class=\"col-sm-6 col-xs-6 text-right\"><h4>Invoice No.</h4> <h4 class=\"text-navy\">INV-1082471236</h4> <p><span><strong>Invoice Date:</strong> <div>June 01, 2018</div></span><br></p></div></div> <div class=\"table-responsive m-t\"><table class=\"table invoice-table\"><thead><tr><th>Item List</th> <th>Quantity</th> <th>Unit Price</th> <th>Total Price</th></tr></thead> <tbody><tr><td><strong> heat sink </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> Jacket </strong></td> <td> 1 </td> <td>? 321.00 </td> <td>? 321.00 </td></tr><tr><td><strong> laptop </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr><tr><td><strong> cordova </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr><tr><td><strong> Teady Bear </strong></td> <td> 1 </td> <td>? 312.00 </td> <td>? 312.00 </td></tr><tr><td><strong> Oil </strong></td> <td> 1 </td> <td>? 200.00 </td> <td>? 200.00 </td></tr></tbody></table></div> <table class=\"table invoice-total\"><tbody><tr><td><strong>Total :</strong></td> <td>? 1545.00</td></tr> <tr><td><strong>Amount Received : </strong></td> <td>? 1600 .00</td></tr> <tr><td><strong>Change :</strong></td> <td>? 55.00 </td></tr></tbody></table>');

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
(1, 'admin1', '$2y$13$4fLRNUpWEsZ5MVigNVdkG./DGg584zbTumQOiirELKfZbVdd1Aiiu', 'Administrator', '09MvP3WbQ1', 'PEBEFVLC3R', 0),
(6, 'cashier1', '$2y$13$bnfUskqEYsPYl3Idm4g4iu23Di19Gx3wDeXxEf5iuGNzaLdrU79HG', 'Cashier', 'h-JPCbqegt', 'VL9HNYBDQQ', 0),
(7, 'admin2', '$2y$13$jq3oXDzeeA/FBhOP5QG9a.dBrA7tToa8zzfmewbi1r1L21ziYEllm', 'Administrator', 'N7D4ubP7st', '7EV0DF8QO2', 0),
(8, 'cashier2', '$2y$13$BPFU3IhL8.iiX9R5sBCTmOG/OfufY6XuVDAJvgUhNUT7TExhUW2Ya', 'Cashier', '543455453', '402450333', 0);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
