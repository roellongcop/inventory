-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 07:21 AM
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
(3, 'Teady Bear', 312.00, 212, 32, 299, '321', '321', 2, 1, 1, 0),
(4, 'cordova', 312.00, 100, 20, 10, '64384302', '', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 0, '7889', '', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 232, '2332', '', 1, 4, 1, 0),
(7, 'laptop', 200.00, 100, 32, 0, '78892323', '', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 52, '345678', '', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 20, '456789', '', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 11, '45678934', '', 3, 4, 2, 0);

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
(25, 'Teady Bear', 1, '2018-10-15');

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
(31, '(1) Teady Bear = 312.00<br>', 312.00, '130966318', '2018-10-15', 1);

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
(2, 'bundle', 0);

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
  `authKey` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `user`, `accessToken`, `authKey`) VALUES
(1, 'admin', 'admin', 'Administrator', '', ''),
(2, 'roel', 'roel', 'Assistant', '', '');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD CONSTRAINT `tbl_sale_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
