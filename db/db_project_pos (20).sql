-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2019 at 07:31 AM
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
(2, 'Oil', 20.00, 100, 20, 53, '8386222035031', '', 3, 4, 2, 0),
(3, 'Teady Bear', 312.00, 212, 32, 237, '2183355372234', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/+Pxhnv88BgY2nz9/5mc4f97e+M+fD4c/H2bmZ/5swzAqPyo/Kj9o5QFacfOimwcbzQAAAABJRU5ErkJggg==\">', 2, 1, 1, 0),
(4, 'cordova', 12.00, 100, 20, 5, '4394976594771', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/2Ib/DM9/+zMHDtswM9uf//zZ+M+fwx8+G/znZ/5swzAqPyo/Kj9o5QHjgPu4e6rgnwAAAABJRU5ErkJggg==\">', 1, 1, 1, 0),
(5, 'laptop', 200.00, 100, 32, 0, '5363206163444', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/+Pz5M4cP2Bj8+XDA2OADD7+98Z8/Hw5/tmHmZ/5swzAqPyo/Kj9o5QEVJfeADUtfJwAAAABJRU5ErkJggg==\">', 1, 3, 1, 0),
(6, 'Jacket', 321.00, 234, 23, 184, '6712944740682', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/mOE8z4c/BsZ/Dvz5fOAMDzO/8Z8/H/4Yfz5wnvmzDcOo/Kj8qPyglQcAkUoj2x0aTQMAAAAASUVORK5CYII=\">', 1, 4, 1, 0),
(7, 'heat sink', 200.00, 100, 32, 102, '9885652769599', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/+M+BM/aHDc4z/Plw2MaA/8Bn4z9//hgfPszDz/zZhmFUflR+VH7QygMAB1AIb4mCIQ4AAAAASUVORK5CYII=\">', 1, 3, 1, 0),
(8, 'frame', 200.00, 200, 10, 26, '5884625374203', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/+POBM/Zn7A+c+fz5M8OH8zz2xn/+fDh/+MBhfubPNgyj8qPyo/KDVh4Au+pHA9ErfK0AAAAASUVORK5CYII=\">', 1, 5, 2, 0),
(9, 'mugs', 200.00, 100, 10, 59, '3412139275402', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/mNmG58Mfg88fzvxnPmBwntnA+M+fD3+M+RnOM3+2YRiVH5UflR+08gABmuTeWR8h+QAAAABJRU5ErkJggg==\">', 1, 5, 2, 0),
(10, 'bag', 400.00, 200, 20, 112, '6137287985063', '', 3, 4, 2, 0),
(11, 'basket', 200.00, 200, 100, 143, '1721769451053', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADJJREFUKJFj+Mx/mP/weXseG2OGA+c/nz/DA2T9+fPh/OHzZ/iZP9swjMqPyo/KD1p5AJ/U4xxyOC0JAAAAAElFTkSuQmCC\">', 3, 5, 2, 0),
(12, 'lamp', 200.00, 100, 20, 45, '6543415246683', '', 3, 4, 2, 0),
(13, 'flash drive', 312.00, 212, 32, 249, '9553076094907', '', 2, 1, 1, 0),
(14, 'system unit', 312.00, 100, 20, 78, '6743184602885', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/mOE8zwd7G3ue8wc+Hz58/sNh4z9/Pn84/PnzeebPNgyj8qPyo/KDVh4AI1FL76cxd2MAAAAASUVORK5CYII=\">', 1, 1, 1, 0),
(15, 'speaker', 200.00, 100, 32, 43, '12030631274103', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAAAeAQMAAAAPe4DLAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADBJREFUKJFj+Mx/2Maex+CDwYcDnw98/nyYn5nZ4PCBz8yfD/w5zzAqOSo5Kkm5JABNPNzIFMrv+gAAAABJRU5ErkJggg==\">', 1, 3, 1, 0),
(16, 'headphones', 321.00, 234, 23, 221, '2750315191284', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADJJREFUKJFj+Mx/+PNhfmZ7mw82nz8z//l8/vAZ4z9/PhwGcs4zf7ZhGJUflR+VH7TyAMj8P/uxqv2lAAAAAElFTkSuQmCC\">', 1, 4, 3, 0),
(17, 'laptop ACER', 200.00, 100, 32, 0, '6054959280981', '', 1, 3, 1, 0),
(18, 'earplugs', 200.00, 200, 10, 75, '7019996615353', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/2IaZn+eP8ec/hxk+2/Pz8PAb//nz4fzhz2f4mT/bMIzKj8qPyg9aeQD11sSGI6N/sQAAAABJRU5ErkJggg==\">', 1, 5, 2, 0),
(19, 'jack', 200.00, 100, 10, 200, '5164523036199', '', 1, 5, 2, 0),
(20, 'helmet', 400.00, 200, 20, 180, '6465272553594', '', 3, 4, 2, 0),
(21, 'pillow', 200.00, 200, 100, 153, '5126549050999', '', 3, 5, 2, 0),
(22, 'jar', 500.00, 1002, 200, 198, '3286308808934', '', 1, 3, 3, 0),
(23, 'mousepad', 200.00, 200, 100, 250, '1746062572129', '', 3, 4, 3, 0),
(24, 'RAM', 23.00, 55, 5, 54, '1347998748938', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/mN+eh/+88ec//3kOf/585sB/4z9//hw+fMDgPPNnG4ZR+VH5UflBKw8A9VU5pyf8tssAAAAASUVORK5CYII=\">', 1, 3, 2, 0),
(25, 'remote', 50.00, 1000, 100, 541, '3479534293988', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/mNmGh/+zzZ8/5+2ZDezPf2Y2/vPnz+HDf87wM3+2YRiVH5UflR+08gByzOeuYXQEGAAAAABJRU5ErkJggg==\">', 2, 4, 1, 1),
(26, 'laptop asus', 200.00, 100, 10, 19, '2832345316170', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADRJREFUKJFj+Mx/+MNnfubzBsYHPn/+zH+ex57f+M+fw58PM/85z/zZhmFUflR+VH7QygMArZsJfULo4O8AAAAASUVORK5CYII=\">', 1, 4, 3, 0),
(27, 'cordovaves', 200.00, 1000, 45, 52, '1654594272401', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADNJREFUKJFj+Mx/mP88/5kP9sxnztsz8zOcZzYw/vPn8IfP58+fZ/5swzAqPyo/Kj9o5QEkceG0qzCduQAAAABJRU5ErkJggg==\">', 1, 4, 4, 0),
(28, 'mouse for gaming', 200.00, 100, 22, 22, 'BGS26', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALQAAAAeAQMAAAC/hKb5AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAClJREFUKJFj+MzDzGzDb2Bg8+fAhz/Ghz/zfDCw4T/zgWFUfFR8CIoDAPzIQLB6QxC1AAAAAElFTkSuQmCC\">', 4, 4, 3, 0),
(29, 'adidas shoes', 200.00, 200, 10, 20, 'CLT28', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALQAAAAeAQMAAAC/hKb5AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAClJREFUKJFj+MzDzMx8ht/e5g/Phz/Gn/n5z3+24T/zgWFUfFR8CIoDAKcNNzIj7UvEAAAAAElFTkSuQmCC\">', 1, 4, 2, 0),
(30, 'zipper', 222.00, 11111, 22, 22, 'BGS00029', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAAeAQMAAAAly3FkAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADJJREFUKJFj+MzDzGzDb2Bg8+fA+fOfz/MDgfGfP3+MD3/4cJ75sw3DqPyo/Kj8oJUHAKh2ycyT5BXCAAAAAElFTkSuQmCC\">', 4, 5, 2, 0),
(31, 'zipper', 222.00, 11111, 22, 22, 'BGS0000000030', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQwAAAAeAQMAAADjK7L0AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADdJREFUOI1j+MzDzGzDb2Bg8+fA+fOfz/Pz29jYfPjw+fDh8zY8PDY2/Gc+MIwqGVUyqmSkKQEAz0LT/j+0pyIAAAAASUVORK5CYII=\">', 4, 5, 2, 0),
(32, 'zipper', 222.00, 11111, 22, 22, 'BGS0000000031', '<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQwAAAAeAQMAAADjK7L0AAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAADdJREFUOI1j+MzDzGzDb2Bg8+fA+fOfz/Pz29jYfPjw+fDh88xnbOxt+M98YBhVMqpkVMlIUwIAk1Lpyn5Gfb4AAAAASUVORK5CYII=\">', 4, 5, 2, 0);

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
(39, 1, 'Create Item : zipper', '2019-02-19 07:30:44 AM');

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
(38, 'cordova', 1, '2019-02-19');

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
(14, '(3) cordova = PHP 312.00<br>(5) laptop = PHP 200.00<br>(4) mugs = PHP 200.00<br>(1) basket = PHP 200.00<br>(1) heat sink = PHP 200.00<br>(2) Jacket = PHP 321.00<br><b>Total</b> : PHP 3,778.00', 3778.00, '1247811105', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		312.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		laptop \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		mugs \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		basket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		heat sink \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div><div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		Jacket \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		321.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						3362.42 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						415.58\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 3778.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 5000</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 5000</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 1222.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">6 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1247811105 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:28</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(15, '(1) mugs = PHP 200.00<br><b>Total</b> : PHP 200.00', 200.00, '432425224', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		mugs \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		200.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						178.00 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						22.00\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 200.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 200</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 200</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 0.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">432425224 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:36</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(16, '(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', 12.00, '160043481', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		12.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 12.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 10.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">160043481 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:57</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>'),
(17, '(1) cordova = PHP 12.00<br><b>Total</b> : PHP 12.00', 12.00, '1380481858', '2019-02-19', 1, '<div class=\"row\"><div class=\"col-sm-4 col-xs-4\"></div> <div class=\"col-sm-4 col-xs-4 panel panel-default\" style=\"width: 300px;\"><div class=\"row text-center\"><div class=\"col-md-12 col-xs-12 text-center\"><br>\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		#18 St. Anthony Arcade, Gavino Maderan, GMA Cavite <br> <br>\n		            		SALES TRANSACTION <br></div></div> <div class=\"row text-center\"><div class=\"col-md-4 col-xs-4\">\n		            		cordova \n		            	</div> <div class=\"col-md-4 col-xs-4\"></div> <div class=\"col-md-4 col-xs-4\">\n		            		12.00\n		            	</div></div> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n            				----------------------------------------------------------\n            			</div></div> <div class=\"col-md-12 col-xs-12\"><table><tbody><tr><td>\n		            					(V) Vatable Sale\n		            				</td> <td> .......................... </td> <td class=\"text-right\"> \n	            						 \n		            				</td></tr> <tr><td width=\"300\">Vat Amount </td> <td> .......................... </td> <td class=\"text-right\"> \n		            						\n		            				</td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Due </td> <td> .......................... </td> <td class=\"text-right\"> 12.00</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td>Cash </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td colspan=\"3\">&nbsp; </td></tr> <tr><td colspan=\"3\"> &nbsp;</td></tr> <tr><td>Amount Tender </td> <td> .......................... </td> <td class=\"text-right\"> 22</td></tr> <tr><td>Change </td> <td> .......................... </td> <td class=\"text-right\"> 10.00</td></tr> <tr><td colspan=\"2\">Number of items:  </td> <td class=\"text-right\">1 </td></tr> <tr><td colspan=\"2\">Transaction no:   </td> <td class=\"text-right\">1380481858 </td></tr> <tr><td>Date: 02/19/2019   </td> <td></td> <td>Time: 06:58</td></tr></tbody></table></div> <br><br> <div class=\"row text-center\"><div class=\"col-md-12 col-xs-12\">\n		            		M.Alvarez Electronic Supply And General Merchandise <br>\n		            		09078267471 <br> <br></div></div></div></div>');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_moving_product`
--
ALTER TABLE `tbl_moving_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
