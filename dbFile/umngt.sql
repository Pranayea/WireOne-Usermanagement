-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2020 at 04:14 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umngt`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `hid` int(7) NOT NULL,
  `userId` int(3) NOT NULL,
  `activity` varchar(30) NOT NULL,
  `aUsername` varchar(25) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`hid`, `userId`, `activity`, `aUsername`, `time`) VALUES
(16, 1, 'logged in the system', NULL, '2020-05-31 09:31:12'),
(17, 13, 'registered in the system', NULL, '2020-05-31 09:32:02'),
(18, 1, 'logged in the system', NULL, '2020-05-31 13:50:34'),
(19, 14, 'registered in the system', NULL, '2020-05-31 14:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(3) NOT NULL,
  `username` varchar(15) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `urole` varchar(10) NOT NULL DEFAULT 'client',
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `joindate` date NOT NULL,
  `ques1` varchar(20) NOT NULL,
  `ques2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `fname`, `lname`, `email`, `password`, `urole`, `status`, `joindate`, `ques1`, `ques2`) VALUES
(1, 'Admin', 'Super', 'Admin', 'superAdmin@gmail.com', 'superadmin', 'admin', 'active', '2020-05-17', 'tommy', '500 miles'),
(4, 'Pomatoman', 'Pranaya', 'Manandhar', 'prn@gmail.com', '20561102', 'client', 'active', '2020-05-17', 'nyasi', 'Cherry Wine'),
(5, 'SniperKing', 'Ussop', 'Sogeking', 'sogeking@gmail.com', 'totalliar', 'client', 'blocked', '2020-05-17', 'tom', 'your man'),
(6, 'Pirate King', 'Luffy', 'Monkey D.', 'luffy@gmail.com', 'asds12s', 'client', 'active', '2020-05-17', 'jerry', 'help me hold on'),
(7, 'Yato', 'Yabouku', 'Kami', 'Ya@gmail.com', 'yabi32', 'client', 'blocked', '2020-05-20', 'lucky', 'dive'),
(12, 'Prms', 'Pranaya', 'Sayami', 'pranayasayami33@gmail.com', 'pranaya', 'client', 'active', '2020-05-30', 'Tommy', 'Without You'),
(13, 'Test1', 'Test', 'User', 'test1@gmail.com', 'testuser', 'client', 'active', '2020-05-31', 'testpet', 'testsong'),
(14, 'Test2', 'Another', 'Test', 'test2@gmail.com', 'testuser', 'client', 'active', '2020-05-31', 'testpet', 'testsong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`hid`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `hid` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
