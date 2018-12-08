-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 12 月 08 日 23:43
-- 伺服器版本: 10.1.30-MariaDB
-- PHP 版本： 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `cms`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

CREATE TABLE `account` (
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `tel` char(8) NOT NULL,
  `email` varchar(40) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `accountTypeID` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `account`
--

INSERT INTO `account` (`username`, `password`, `tel`, `email`, `firstName`, `lastName`, `accountTypeID`) VALUES
('4343', '343443', '23989222', 'hlllily@yahoo.com.hk', 'Jajasjk', 'Asasds', '0002'),
('admin', '123', '999', 'admin@gmail.com', 'Siu', 'Jer', '0003'),
('hll', 'hll', '24132374', 'hym7743@gmail.com', 'jajasjk', 'asasds', '0002'),
('hlllily1119', '4345', '24132374', 'hym7743@gmail.com', 'jajasjk', 'asasds', '0001'),
('samgor', 'ewew', '23989222', 'hym7743@gmail.com', 'Jajasjk', 'Asasds', '0002');

-- --------------------------------------------------------

--
-- 資料表結構 `accounttype`
--

CREATE TABLE `accounttype` (
  `accountTypeID` char(4) NOT NULL,
  `accountType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `accounttype`
--

INSERT INTO `accounttype` (`accountTypeID`, `accountType`) VALUES
('0001', 'Normal User'),
('0002', 'Restaurant Owner'),
('0003', 'System Administrator');

-- --------------------------------------------------------

--
-- 資料表結構 `fav_menu`
--

CREATE TABLE `fav_menu` (
  `menuid` char(6) NOT NULL,
  `username` varchar(25) NOT NULL,
  `isFav` varchar(4) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `fav_rest`
--

CREATE TABLE `fav_rest` (
  `restID` char(6) NOT NULL,
  `username` varchar(25) NOT NULL,
  `isFav` varchar(4) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `menu`
--

CREATE TABLE `menu` (
  `menuid` char(6) NOT NULL,
  `menupath` varchar(30) NOT NULL,
  `restID` char(6) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

CREATE TABLE `restaurant` (
  `restID` char(6) NOT NULL,
  `restName` varchar(40) NOT NULL,
  `restTypeID` char(4) NOT NULL,
  `restTel` char(8) NOT NULL,
  `restEmail` varchar(40) NOT NULL,
  `district` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ownerID` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `rest_pic` varchar(70) NOT NULL,
  `rest_desc` varchar(100) NOT NULL,
  `start_hour` char(5) NOT NULL,
  `end_hour` char(5) NOT NULL,
  `start_day` varchar(15) NOT NULL,
  `end_day` varchar(15) NOT NULL,
  `num_view` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `restaurant`
--

INSERT INTO `restaurant` (`restID`, `restName`, `restTypeID`, `restTel`, `restEmail`, `district`, `address`, `ownerID`, `status`, `rest_pic`, `rest_desc`, `start_hour`, `end_hour`, `start_day`, `end_day`, `num_view`) VALUES
('000001', 'HO LEE SIT', '4003', '12345454', '123@123', 'Eastern', 'dsadsadsadsd', 'hll', 'open', 'image\\Restaurant\\samgor.jpg', 'sam gor is very good', '', '', '', '', 83),
('181415', 'samgor', '4001', '34455566', 'g@gmail.com', 'Wan Chai', 'ewewef', 'samgor', 'open', './image/Restaurant/22.jpg', 'rw', '', '', '', '', 0),
('713530', 'mcdonald', '4001', '34455566', 'g@gmail.com', 'Southern', '323232', '4343', 'open', './image/Restaurant/1642694-200.png', '3232', '', '', '', '', 1),
('918541', 'Le Viet', '4002', '34455566', 'g@gmail.com', 'Yau Tsim Mong', 'Shop 101-106, 108-109, 2/F, Bank Centre, 636 Nathan Road', 'hll', 'open', './image/Restaurant/leviet.jpg', 's', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `restauranttype`
--

CREATE TABLE `restauranttype` (
  `restTypeID` char(4) NOT NULL,
  `restType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `restauranttype`
--

INSERT INTO `restauranttype` (`restTypeID`, `restType`) VALUES
('4001', 'Chinese Restaurant'),
('4002', 'Western Restaurant'),
('4003', 'Japanese Restaurant'),
('4004', 'Korean Restaurant');

-- --------------------------------------------------------

--
-- 資料表結構 `rest_tag`
--

CREATE TABLE `rest_tag` (
  `restID` char(6) NOT NULL,
  `tagid` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `search_history`
--

CREATE TABLE `search_history` (
  `time` varchar(40) NOT NULL,
  `keyword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `tags`
--

CREATE TABLE `tags` (
  `tagid` char(4) NOT NULL,
  `tagname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `tags`
--

INSERT INTO `tags` (`tagid`, `tagname`) VALUES
('3001', 'Dessert'),
('3002', 'Hot pot'),
('3003', 'Mixian'),
('3004', 'Cha chaan teng'),
('3005', 'Fast food'),
('3006', 'Hamburgers'),
('3007', 'Pizza'),
('3008', 'Coffee'),
('3009', 'Sushi'),
('3010', 'Pancake'),
('3011', 'Udon'),
('3012', 'Lamian'),
('3013', 'Vegetarian diet'),
('3014', 'Buffet');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD KEY `accountTypeID` (`accountTypeID`);

--
-- 資料表索引 `accounttype`
--
ALTER TABLE `accounttype`
  ADD PRIMARY KEY (`accountTypeID`);

--
-- 資料表索引 `fav_menu`
--
ALTER TABLE `fav_menu`
  ADD PRIMARY KEY (`menuid`,`username`),
  ADD KEY `username` (`username`);

--
-- 資料表索引 `fav_rest`
--
ALTER TABLE `fav_rest`
  ADD PRIMARY KEY (`restID`,`username`),
  ADD KEY `username` (`username`);

--
-- 資料表索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuid`),
  ADD KEY `restID` (`restID`);

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restID`),
  ADD KEY `restTypeID` (`restTypeID`),
  ADD KEY `ownerID` (`ownerID`);

--
-- 資料表索引 `restauranttype`
--
ALTER TABLE `restauranttype`
  ADD PRIMARY KEY (`restTypeID`);

--
-- 資料表索引 `rest_tag`
--
ALTER TABLE `rest_tag`
  ADD PRIMARY KEY (`restID`,`tagid`),
  ADD KEY `tagid` (`tagid`);

--
-- 資料表索引 `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagid`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`accountTypeID`) REFERENCES `accounttype` (`accountTypeID`);

--
-- 資料表的 Constraints `fav_menu`
--
ALTER TABLE `fav_menu`
  ADD CONSTRAINT `fav_menu_ibfk_1` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`),
  ADD CONSTRAINT `fav_menu_ibfk_2` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- 資料表的 Constraints `fav_rest`
--
ALTER TABLE `fav_rest`
  ADD CONSTRAINT `fav_rest_ibfk_1` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  ADD CONSTRAINT `fav_rest_ibfk_2` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- 資料表的 Constraints `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`);

--
-- 資料表的 Constraints `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`restTypeID`) REFERENCES `restauranttype` (`restTypeID`),
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`ownerID`) REFERENCES `account` (`username`);

--
-- 資料表的 Constraints `rest_tag`
--
ALTER TABLE `rest_tag`
  ADD CONSTRAINT `rest_tag_ibfk_1` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  ADD CONSTRAINT `rest_tag_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tags` (`tagid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
