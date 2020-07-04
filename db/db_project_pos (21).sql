-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 09:03 AM
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
(1, 'M.Alvarez Electronic Supply And General Merchandise', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eaque praesentium aspernatur cupiditate porro at provident magni asperiores officia veniam, deleniti consectetur eligendi voluptatibus. Veritatis unde modi maxime, dolore harum recusandae?', '#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite', 'malvarez@gmail.com', '09078267471');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `barcode_prefix` varchar(10) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `description`, `barcode_prefix`, `is_deleted`) VALUES
(1, 'cloths', 'for clothing', 'CLT', 0),
(2, 'shoes', 'for feet ware', 'SHS', 0),
(3, 'kitchen ware', 'sample data', 'KTC', 1),
(4, 'test', 'dest', 'BGS', 0);

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
(37, 'test', 2222.00, 222, 22, 16, 'CLT0000000001', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQwAAAAeAQMAAADjK7L0AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADdJREFUOI1j+MzDzMx8ht/e5g/P+fOfz/Pz29jYfPjw+fDhw+d5mG1s+M98YBhVMqpkVMlIUwIAuhzbBn8JY30AAAAASUVORK5CYII=\">', 1, 4, 3, 0);

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
(1, 1, 'Sale Transaction : <br>(1) headphones = PHP 321.00<br>(1) speaker = PHP 200.00<br>(1) frame = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 1,345.00', '2018-11-20 07:16:34 AM'),
(2, 1, 'Sale Transaction : <br>(1) frame = PHP 200.00<br>(1) speaker = PHP 200.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 912.00', '2018-11-20 07:21:14 AM'),
(3, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', '2018-11-20 07:22:52 AM'),
(4, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-11-20 07:23:39 AM'),
(5, 1, 'Sale Transaction : <br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 312.00', '2018-11-20 07:24:13 AM'),
(6, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', '2018-11-20 07:24:44 AM'),
(7, 1, 'Sale Transaction : <br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 624.00', '2018-11-21 04:25:42 AM'),
(8, 1, 'Sale Transaction : <br>(1) laptop = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 824.00', '2018-11-22 07:39:05 AM'),
(9, 1, 'Update Item : RAM', '2018-11-28 04:45:40 AM'),
(10, 1, 'Update Supplier : Amazon', '2018-11-28 06:26:59 AM'),
(11, 1, 'Create Unit : dozen', '2018-11-28 06:28:57 AM'),
(12, 1, 'Update Item : cordovaves', '2018-11-28 06:29:12 AM'),
(13, 1, 'Create Supplier : veracita', '2018-11-30 17:18:43 PM'),
(14, 1, 'Sale Transaction : <br>(1) mugs = PHP 200.00<br>(3) system unit = PHP 312.00<br>(1) Jacket = PHP 321.00<br>(1) heat sink = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 2,281.00', '2018-11-30 17:20:00 PM'),
(15, 1, 'Sale Transaction : <br>(1) cordova = PHP 312.00<br>(1) remote = PHP 50.00<br>(3) Jacket = PHP 321.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,637.00', '2018-12-30 05:21:15 AM'),
(16, 1, 'Sale Transaction : <br>(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-12-31 22:21:55 PM'),
(17, 1, 'Sale Transaction : <br>(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', '2018-12-31 22:22:11 PM'),
(18, 1, 'Sale Transaction : <br>(3) cordova = PHP 312.00<br>(5) laptop = PHP 200.00<br>(4) mugs = PHP 200.00<br>(1) basket = PHP 200.00<br>(1) heat sink = PHP 200.00<br>(2) Jacket = PHP 321.00<br><b>Total</b> : PHP 3,778.00', '2019-02-19 06:29:45 AM'),
(19, 1, 'Sale Transaction : <br>(1) mugs = PHP 200.00<br><b>Total</b> : PHP 200.00', '2019-02-19 06:47:17 AM'),
(20, 1, 'Sale Transaction : <br>(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', '2019-02-19 06:57:34 AM'),
(21, 1, 'Sale Transaction : <br>(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', '2019-02-19 06:58:15 AM'),
(22, 1, 'Create Category : test', '2019-02-19 07:11:05 AM'),
(23, 1, 'Create Item : mouse for gaming', '2019-02-19 07:18:58 AM'),
(24, 1, 'Create Item : mouse for gaming', '2019-02-19 07:19:09 AM'),
(25, 1, 'Create Item : mouse for gaming', '2019-02-19 07:19:38 AM'),
(26, 1, 'Create Item : mouse for gaming', '2019-02-19 07:20:09 AM'),
(27, 1, 'Create Item : mouse for gaming', '2019-02-19 07:20:19 AM'),
(28, 1, 'Create Item : mouse for gaming', '2019-02-19 07:20:56 AM'),
(29, 1, 'Create Item : adidas shoes', '2019-02-19 07:23:30 AM'),
(30, 1, 'Create Item : adidas shoes', '2019-02-19 07:23:51 AM'),
(31, 1, 'Create Item : laptop mac', '2019-02-19 07:27:42 AM'),
(32, 1, 'Create Item : zipper', '2019-02-19 07:28:54 AM'),
(33, 1, 'Create Item : zipper', '2019-02-19 07:29:11 AM'),
(34, 1, 'Create Item : zipper', '2019-02-19 07:29:24 AM'),
(35, 1, 'Create Item : zipper', '2019-02-19 07:29:44 AM'),
(36, 1, 'Create Item : zipper', '2019-02-19 07:29:58 AM'),
(37, 1, 'Create Item : zipper', '2019-02-19 07:30:09 AM'),
(38, 1, 'Create Item : zipper', '2019-02-19 07:30:20 AM'),
(39, 1, 'Create Item : zipper', '2019-02-19 07:30:44 AM'),
(40, 1, 'Update Item : zipper', '2019-02-19 08:42:02 AM'),
(41, 1, 'Update Item : mousepad', '2019-02-19 08:43:25 AM'),
(42, 1, 'Update Item : zipper', '2019-02-19 08:52:48 AM'),
(43, 1, 'Update Item : zipper', '2019-02-19 08:56:28 AM'),
(44, 1, 'Create Item : laptop', '2019-02-19 09:00:07 AM'),
(45, 1, 'Create Item : mouse for gaming', '2019-02-19 09:01:02 AM'),
(46, 1, 'Create Item : 222', '2019-02-19 09:01:22 AM'),
(47, 1, 'Create Item : 222', '2019-02-19 09:01:48 AM'),
(48, 1, 'Create Item : 222', '2019-02-19 09:03:44 AM'),
(49, 1, 'Update Item : 222', '2019-02-19 09:05:33 AM'),
(50, 1, 'Update Item : 222', '2019-02-19 09:07:10 AM'),
(51, 1, 'Update Item : 222', '2019-02-19 09:08:32 AM'),
(52, 1, 'Update Item : 222', '2019-02-19 09:08:59 AM'),
(53, 1, 'Update Item : 222', '2019-02-19 09:09:18 AM'),
(54, 1, 'Update Item : 222', '2019-02-19 09:09:45 AM'),
(55, 1, 'Update Item : 222', '2019-02-19 09:10:07 AM'),
(56, 1, 'Update Item : 222', '2019-02-19 09:10:22 AM'),
(57, 1, 'Update Item : 222', '2019-02-19 09:11:10 AM'),
(58, 1, 'Update Item : 222', '2019-02-19 09:11:20 AM'),
(59, 1, 'Create Item : item', '2019-02-19 09:12:30 AM'),
(60, 1, 'Update Item : item', '2019-02-19 09:12:41 AM'),
(61, 1, 'Update Item : item', '2019-02-19 09:14:08 AM'),
(62, 1, 'Update Item : item', '2019-02-19 09:14:24 AM'),
(63, 1, 'Create Item : test', '2019-02-19 09:14:52 AM'),
(64, 1, 'Update Item : test', '2019-02-19 09:15:00 AM'),
(65, 1, 'Update Item : test', '2019-02-19 09:15:09 AM'),
(66, 1, 'Update Item : test', '2019-02-19 09:18:49 AM'),
(67, 1, 'Sale Transaction : <br>(1) test = PHP 2,222.00<br><b>Total</b> : PHP 2,222.00', '2019-02-21 08:46:09 AM'),
(68, 1, 'Sale Transaction : <br>(1) test = PHP 2,222.00<br><b>Total</b> : PHP 2,222.00', '2019-02-21 08:47:26 AM'),
(69, 1, 'Sale Transaction : <br>(4) test = PHP 2,222.00<br><b>Total</b> : PHP 8,888.00', '2019-02-21 08:52:33 AM');

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
(1, 'headphones', 1, '2018-11-20'),
(2, 'speaker', 1, '2018-11-20'),
(3, 'frame', 1, '2018-11-20'),
(4, 'cordova', 2, '2018-11-20'),
(5, 'frame', 1, '2018-11-20'),
(6, 'speaker', 1, '2018-11-20'),
(7, 'laptop', 1, '2018-11-20'),
(8, 'cordova', 1, '2018-11-20'),
(9, 'laptop', 1, '2018-11-20'),
(10, 'cordova', 1, '2018-11-20'),
(11, 'laptop', 1, '2018-11-20'),
(12, 'cordova', 1, '2018-11-20'),
(13, 'laptop', 1, '2018-11-20'),
(14, 'cordova', 1, '2018-11-20'),
(15, 'cordova', 2, '2018-11-21'),
(16, 'laptop', 1, '2018-11-22'),
(17, 'cordova', 2, '2018-11-22'),
(18, 'mugs', 1, '2018-11-30'),
(19, 'system unit', 3, '2018-11-30'),
(20, 'Jacket', 1, '2018-11-30'),
(21, 'heat sink', 1, '2018-11-30'),
(22, 'cordova', 2, '2018-11-30'),
(23, 'cordova', 1, '2018-12-30'),
(24, 'remote', 1, '2018-12-30'),
(25, 'Jacket', 3, '2018-12-30'),
(26, 'Teady Bear', 1, '2018-12-30'),
(27, 'laptop', 1, '2018-12-31'),
(28, 'heat sink', 1, '2018-12-31'),
(29, 'heat sink', 1, '2018-12-31'),
(30, 'cordova', 3, '2019-02-19'),
(31, 'laptop', 5, '2019-02-19'),
(32, 'mugs', 4, '2019-02-19'),
(33, 'basket', 1, '2019-02-19'),
(34, 'heat sink', 1, '2019-02-19'),
(35, 'Jacket', 2, '2019-02-19'),
(36, 'mugs', 1, '2019-02-19'),
(37, 'cordova', 1, '2019-02-19'),
(38, 'cordova', 1, '2019-02-19'),
(39, 'test', 1, '2019-02-21'),
(40, 'test', 1, '2019-02-21'),
(41, 'test', 4, '2019-02-21');

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
(1, '(1) headphones = PHP 321.00<br>(1) speaker = PHP 200.00<br>(1) frame = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 1,345.00', 1345.00, '1947984101', '2018-10-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		headphones \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		321.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		speaker \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		frame \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------\n            			</div></div> <table><tbody><tr><td>\n	            					(V) Vatable Sale\n	            				</td> <td> .......................... </td> <td class=\"text-right\"> \n            						1197.05 \n	            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n	            						147.95\n	            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 1345.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 877.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">4 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1947984101 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:12</td></tr></tbody></table> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(2, '(1) frame = PHP 200.00<br>(1) speaker = PHP 200.00<br>(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 912.00', 912.00, '675281640', '2018-11-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		frame \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		speaker \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						811.68 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						100.32\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 912.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 1000</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 1000</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 88.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">4 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">675281640 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:20</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(3, '(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', 512.00, '1968687905', '2018-11-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"padding-right: 10px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						455.68 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						56.32\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 512.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 1710.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">2 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1968687905 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:22</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(4, '(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '803522792', '2018-11-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 400px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 22.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">803522792 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:23</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(5, '(1) cordova = PHP 312.00<br><b>Total</b> : PHP 312.00', 312.00, '1673879469', '2018-11-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 350px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						277.68 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						34.32\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 312.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 21.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1673879469 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:24</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(6, '(1) laptop = PHP 200.00<br>(1) cordova = PHP 312.00<br><b>Total</b> : PHP 512.00', 512.00, '1842930878', '2018-11-20', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						455.68 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						56.32\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 512.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 666</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 666</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 154.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">2 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1842930878 </td></tr> <tr><td>Date: 11/20/2018   </td> <td></td> <td>Time: 07:24</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(7, '(2) cordova = PHP 312.00<br><b>Total</b> : PHP 624.00', 624.00, '1033566708', '2018-11-21', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						555.36 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						68.64\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 624.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 700</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 700</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 76.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1033566708 </td></tr> <tr><td>Date: 11/21/2018   </td> <td></td> <td>Time: 04:24</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(8, '(1) laptop = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 824.00', 824.00, '979189952', '2018-11-22', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						733.36 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						90.64\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 824.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 1398.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">2 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">979189952 </td></tr> <tr><td>Date: 11/22/2018   </td> <td></td> <td>Time: 07:38</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(9, '(1) mugs = PHP 200.00<br>(3) system unit = PHP 312.00<br>(1) Jacket = PHP 321.00<br>(1) heat sink = PHP 200.00<br>(2) cordova = PHP 312.00<br><b>Total</b> : PHP 2,281.00', 2281.00, '57420584', '2018-11-30', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		mugs \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		system unit \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		Jacket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		321.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		heat sink \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						2030.09 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						250.91\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 2281.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 3000</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 3000</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 719.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">5 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">57420584 </td></tr> <tr><td>Date: 11/30/2018   </td> <td></td> <td>Time: 17:19</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(10, '(1) cordova = PHP 312.00<br>(1) remote = PHP 50.00<br>(3) Jacket = PHP 321.00<br>(1) Teady Bear = PHP 312.00<br><b>Total</b> : PHP 1,637.00', 1637.00, '705368655', '2018-12-30', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		remote \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		50.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		Jacket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		321.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		Teady Bear \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						1456.93 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						180.07\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 1637.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 1700</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 1700</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 63.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">4 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">705368655 </td></tr> <tr><td>Date: 12/30/2018   </td> <td></td> <td>Time: 05:20</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(11, '(1) laptop = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '800482742', '2018-12-31', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 22.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">800482742 </td></tr> <tr><td>Date: 12/31/2018   </td> <td></td> <td>Time: 22:20</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(12, '(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '101794786', '2018-12-31', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		heat sink \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 133.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">101794786 </td></tr> <tr><td>Date: 12/31/2018   </td> <td></td> <td>Time: 22:20</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(13, '(1) heat sink = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '924539944', '2018-12-31', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		heat sink \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 333</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 133.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">924539944 </td></tr> <tr><td>Date: 12/31/2018   </td> <td></td> <td>Time: 22:20</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(14, '(3) cordova = PHP 312.00<br>(5) laptop = PHP 200.00<br>(4) mugs = PHP 200.00<br>(1) basket = PHP 200.00<br>(1) heat sink = PHP 200.00<br>(2) Jacket = PHP 321.00<br><b>Total</b> : PHP 3,778.00', 3778.00, '1247811105', '2019-01-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		mugs \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		basket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		heat sink \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		Jacket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		321.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						3362.42 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						415.58\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 3778.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 5000</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 5000</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 1222.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">6 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1247811105 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:28</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(15, '(1) mugs = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '432425224', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		mugs \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 200</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 200</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 0.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">432425224 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:36</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(16, '(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', 12.00, '160043481', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		12.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 12.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 10.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">160043481 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:57</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(17, '(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', 12.00, '1380481858', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		12.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 12.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 10.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1380481858 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:58</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(18, '(1) test = PHP 2,222.00<br><b>Total</b> : PHP 2,222.00', 2222.00, '1380441729', '2019-03-21', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		test \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		2222.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						1977.58 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						244.42\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 2222.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 0.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1380441729 </td></tr> <tr><td>Date: 02/21/2019   </td> <td></td> <td>Time: 08:45</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>');
INSERT INTO `tbl_sale` (`id`, `item`, `total`, `customer_id`, `sale_date`, `user_id`, `invoice`) VALUES
(19, '(1) test = PHP 2,222.00<br><b>Total</b> : PHP 2,222.00', 2222.00, '953461688', '2019-02-21', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		test \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		2222.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						1977.58 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						244.42\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 2222.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 2222</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 0.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">953461688 </td></tr> <tr><td>Date: 02/21/2019   </td> <td></td> <td>Time: 08:47</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(20, '(4) test = PHP 2,222.00<br><b>Total</b> : PHP 8,888.00', 8888.00, '1936374876', '2019-02-21', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		test \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		2222.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						7910.32 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						977.68\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 8888.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 10000</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 10000</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 1112.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1936374876 </td></tr> <tr><td>Date: 02/21/2019   </td> <td></td> <td>Time: 08:52</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>');

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
(5, 'Amazon', '59875', 'USA', 0),
(6, 'veracita', '0983628311', 'laguna binan', 0);

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
(3, 'box', 0),
(4, 'dozen', 0);

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
(1, 'admin1', '$2y$13$jE2LxbMEAwaQyt07U77xbeq5.38Eagify0x8ZP7PuwF8LAOzG3NKy', 'Administrator', 'pHyVmmyDMf', 'GXIKHBK2VZ', 0),
(6, 'cashier1', '$2y$13$zrnE7vZFLYfAZNUEZgqBv.a54nRLX0cnyNoFnT1yoyCv1DWzKSeq2', 'Cashier', 'tddr-OBqvk', 'YTBSJQHCG2', 0),
(7, 'admin2', '$2y$13$jq3oXDzeeA/FBhOP5QG9a.dBrA7tToa8zzfmewbi1r1L21ziYEllm', 'Administrator', 'N7D4ubP7st', '7EV0DF8QO2', 0),
(8, 'cashier2', '$2y$13$nPI13XAIYW.gqYs9uqlh0OAchHDhAYSYZbaZ5ZD69K3LMZRFRFezW', 'Cashier', 'Ddqg28ORNF', 'IUKZJMSC2S', 0);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
