-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 12 月 26 日 11:29
-- 伺服器版本： 10.4.20-MariaDB
-- PHP 版本： 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `databasefinal`
--

-- --------------------------------------------------------

--
-- 資料表結構 `drink`
--

CREATE TABLE `drink` (
  `productName` varchar(255) NOT NULL,
  `storeName` varchar(255) NOT NULL,
  `price` int(255) DEFAULT NULL,
  `sale` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `drink`
--

INSERT INTO `drink` (`productName`, `storeName`, `price`, `sale`) VALUES
('珍珠奶茶', '海洋店', 35, 3000),
('紅茶', '海大店', 25, 1000);

-- --------------------------------------------------------

--
-- 資料表結構 `employee`
--

CREATE TABLE `employee` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `employeePhone` varchar(12) DEFAULT NULL,
  `salary` int(255) DEFAULT NULL,
  `storeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `employee`
--

INSERT INTO `employee` (`ID`, `name`, `address`, `employeePhone`, `salary`, `storeName`) VALUES
('C02', '林三', '基隆市中正區', '02-32165478', 29000, '海洋店'),
('E01', '王明明', '台中市', '04-12345678', 30000, '海大店');

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `storeName` varchar(255) NOT NULL,
  `managerID` varchar(5) DEFAULT NULL,
  `storeAddress` varchar(255) DEFAULT NULL,
  `storePhone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `store`
--

INSERT INTO `store` (`storeName`, `managerID`, `storeAddress`, `storePhone`) VALUES
('海大店', 'E01', '基隆市中正區', '02-22222222'),
('海洋店', 'C02', '基隆市中正區', '02-11111111');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`productName`,`storeName`),
  ADD KEY `storeName` (`storeName`);

--
-- 資料表索引 `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `storeName` (`storeName`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`storeName`),
  ADD KEY `managerID` (`managerID`) USING BTREE;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `drink`
--
ALTER TABLE `drink`
  ADD CONSTRAINT `drink_ibfk_1` FOREIGN KEY (`storeName`) REFERENCES `store` (`storeName`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`storeName`) REFERENCES `store` (`storeName`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`managerID`) REFERENCES `employee` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
