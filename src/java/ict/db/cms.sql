-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 12 月 01 日 20:15
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
('hll', '9334', '24132374', 'hym7743@gmail.com', 'jajasjk', 'asasds', '0001'),
('hlllily1119', '4345', '24132374', 'hym7743@gmail.com', 'jajasjk', 'asasds', '0001');

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
('0001', 'Normal User '),
('0002', 'Restaurant Owner'),
('0003', 'System Administrator');

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
  `address` varchar(100) NOT NULL,
  `ownerID` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`accountTypeID`) REFERENCES `accounttype` (`accountTypeID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
