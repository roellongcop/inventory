-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2018 at 07:02 PM
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
(2, 'Oil', 200.00, 100, 20, 63, '8386222035031', '', 3, 4, 2, 0),
(3, 'Teady Bear', 312.00, 212, 32, 244, '2183355372234', '', 2, 1, 1, 0),
(4, 'cordova', 312.00, 100, 20, 67, '4394976594771', '', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 54, '5363206163444', '', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 218, '6712944740682', '', 1, 4, 1, 0),
(7, 'heat sink', 200.00, 100, 32, 119, '9885652769599', '', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 42, '5884625374203', '', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 70, '3412139275402', '', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 112, '6137287985063', '', 3, 4, 2, 0),
(11, 'basket', 200.00, 200, 100, 144, '1721769451053', '', 3, 5, 2, 0),
(12, 'lamp', 200.00, 100, 20, 45, '6543415246683', '', 3, 4, 2, 0),
(13, 'flash drive', 312.00, 212, 32, 249, '9553076094907', '', 2, 1, 1, 0),
(14, 'system unit', 312.00, 100, 20, 82, '6743184602885', '', 1, 1, 1, 0),
(15, 'speaker', 200.00, 100, 32, 46, '12030631274103', '', 1, 3, 1, 0),
(16, 'headphones', 321.00, 234, 23, 226, '2750315191284', '', 1, 4, 3, 0),
(17, 'laptop', 200.00, 100, 32, 99, '6054959280981', '', 1, 3, 1, 0),
(18, 'earplugs', 200.00, 200, 10, 77, '7019996615353', '', 1, 5, 2, 0),
(19, 'jack', 200.00, 100, 10, 200, '5164523036199', '', 1, 5, 2, 0),
(20, 'helmet', 400.00, 200, 20, 180, '6465272553594', '', 3, 4, 2, 0),
(21, 'pillow', 200.00, 200, 100, 154, '5126549050999', '', 3, 5, 2, 0),
(22, 'jar', 500.00, 1002, 200, 198, '3286308808934', '', 1, 3, 3, 0),
(23, 'mousepad', 200.00, 200, 100, 250, '1746062572129', '', 3, 4, 3, 0),
(24, 'RAM', 23.00, 55, 5, 55, '1203063127410', '', 1, 4, 2, 0);

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
(23, 1, 'Sale Transaction : <br>(1) basket = PHP 200.00<br>(4) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,448.00', '2018-10-20 19:00:18 PM');

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
(78, 'Teady Bear', 4, '2018-10-20');

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
(1, '(1) cordova = PHP 312.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 824.00', 824.00, '916298740', '2018-10-20', 1),
(2, '(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '2101216586', '2018-09-20', 1),
(3, '(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 321.00', 321.00, '1978587030', '2018-11-20', 1),
(4, '(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '290887717', '2018-12-20', 1),
(5, '(1) frame = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '337707472', '2018-07-20', 1),
(6, '(2) mugs = PHP 200.00<br><b>Total</b> : PHP 400.00', 400.00, '704918385', '2018-08-20', 1),
(7, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '1662144542', '2018-06-20', 1),
(8, '(1) basket = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '303242496', '2018-05-20', 1),
(9, '(1) lamp = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '659042953', '2018-04-20', 1),
(10, '(1) flash drive = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '1906875874', '2018-03-20', 1),
(11, '(3) system unit = PHP 312.00<br><b>Total</b> : PHP 936.00', 936.00, '798575408', '2018-02-20', 1),
(12, '(1) Jacket = PHP 321.00<br>(1) flash drive = PHP 312.00<br><b>Total</b> : PHP 633.00', 633.00, '382987658', '2018-01-20', 1),
(13, '(1) cordova = PHP 412.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 924.00', 924.00, '916228740', '2017-10-20', 7),
(14, '(1) laptop = PHP 300.00<br><b>Total</b> : PHP 300.00', 300.00, '2101516586', '2017-09-20', 6),
(15, '(1) Jacket = PHP 1500.00<br><b>Total</b> : PHP 1500.00', 1500.00, '1988587030', '2017-11-20', 8),
(16, '(1) heat sink = PHP 500.00<br><b>Total</b> : PHP 500.00', 500.00, '290864717', '2017-12-20', 1),
(17, '(1) frame = PHP 2000.00<br><b>Total</b> : PHP 2000.00', 2000.00, '332707472', '2017-07-20', 1),
(18, '(2) mugs = PHP 1500.00<br><b>Total</b> : PHP 3000.00', 3000.00, '704968385', '2017-08-20', 1),
(19, '(1) bag = PHP 800.00<br><b>Total</b> : PHP 800.00', 800.00, '1622144542', '2017-06-20', 7),
(20, '(1) basket = PHP 250.00<br><b>Total</b> : PHP 250.00', 250.00, '303222496', '2017-05-20', 1),
(21, '(1) lamp = PHP 4200.00<br><b>Total</b> : PHP 4200.00', 4200.00, '659012953', '2017-04-20', 7),
(22, '(1) flash drive = PHP 3500.00<br><b>Total</b> : PHP 3500.00', 312.00, '1906874874', '2017-03-20', 1),
(23, '(3) system unit = PHP 1000.00<br><b>Total</b> : PHP 3000.00', 3000.00, '798571408', '2017-02-20', 1),
(24, '(1) Jacket = PHP 600.00<br>(1) flash drive = PHP 312.00<br><b>Total</b> : PHP 912.00', 912.00, '382287658', '2017-01-20', 6),
(25, '(1) basket = PHP 200.00<br>(1) mugs = PHP 200.00<br>(1) laptop = PHP 200.00<br>(1) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br>(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 1,312.00', 1312.00, '230460521', '2018-10-20', 1),
(26, '(1) lamp = PHP 200.00<br>(3) basket = PHP 200.00<br>(2) bag = PHP 400.00<br>(5) mugs = PHP 200.00<br>(1) frame = PHP 200.00<br>(3) heat sink = PHP 200.00<br>(4) Jacket = PHP 321.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br>(5) Teady Bear = PHP 312.00<br>(1) Oil = PHP 200.00<br><b>Total</b> : PHP 6,956.00', 6956.00, '477067233', '2018-10-20', 1),
(27, '(1) lamp = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '1215569902', '2018-10-20', 1),
(28, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '622337972', '2018-10-20', 1),
(29, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '661435846', '2018-10-20', 1),
(30, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '2126291761', '2018-10-20', 1),
(31, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '341148300', '2018-10-20', 1),
(32, '(1) bag = PHP 400.00<br><b>Total</b> : PHP 400.00', 400.00, '255157619', '2018-10-20', 1),
(33, '(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 321.00', 321.00, '121960082', '2018-10-20', 1),
(34, '(1) laptop = PHP 200.00<br>(1) Jacket = PHP 321.00<br><b>Total</b> : PHP 521.00', 521.00, '2015533856', '2018-10-20', 1),
(35, '(1) basket = PHP 200.00<br>(4) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,448.00', 1448.00, '1261363931', '2018-10-20', 1);

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
(1, 'admin1', '$2y$13$c9R5YK9s2GFpbwLneBfKp.F/ZvLZ7zEK/fvyO3288UMnETxk0wJh2', 'Administrator', 'hsaydsneisd8232', 'kfds843ndfhxc7', 0),
(6, 'cashier1', '$2y$13$WmSYunHm0vJ.mNJPtQOYt.m75cCL1yNJQ30leKj4d2lBIxmXiLfP.', 'Cashier', '', '', 0),
(7, 'admin2', '$2y$13$pbrhk12Cq0J35jSG5Pkh7u1tk7aoxxf.ZMWe9vYZUCn12DbBuH8v6', 'Administrator', '', '', 0),
(8, 'cashier2', '$2y$13$VFXjeeFanfgB96zoDYqueuSfsvLaAQTGWmpunEiiPnDMTuJdcMkPS', 'Cashier', '', '', 0);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
