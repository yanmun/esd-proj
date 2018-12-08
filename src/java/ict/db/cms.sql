-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 12 月 08 日 18:29
-- 伺服器版本: 10.1.31-MariaDB
-- PHP 版本： 7.2.3

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
  `rest_pic` varchar(30) NOT NULL,
  `rest_desc` varchar(100) NOT NULL,
  `open_hrs` varchar(20) NOT NULL,
  `num_view` int(8) NOT NULL DEFAULT '0',
  `num_like` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `restaurant`
--

INSERT INTO `restaurant` (`restID`, `restName`, `restTypeID`, `restTel`, `restEmail`, `district`, `address`, `ownerID`, `status`, `rest_pic`, `rest_desc`, `open_hrs`, `num_view`, `num_like`) VALUES
('000001', 'HO LEE SIT', '4003', '12345454', '123@123', 'sdas', 'dsadsadsadsd', 'hll', 'open', 'image\\Restaurant\\samgor.jpg', 'sam gor is very good', '1100-2200', 83, 0),
('000003', 'aaa', '4004', '12345454', 'asa@asa', 'TY', 'asa', 'hll', 'open', 'image\\Restaurant\\samgor.jpg', 'asa', '0000-2300', 75, 2),
('700001', 'Toraji ', '4001', '12345679', 'gg@gmail.com', '', 'TY', 'abc', 'open', '', '', '', 18, 0);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restID`),
  ADD KEY `restTypeID` (`restTypeID`),
  ADD KEY `ownerID` (`ownerID`);

--
-- 已匯出資料表的限制(Constraint)
--

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
