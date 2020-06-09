-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 08:47 AM
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
(107, 1, 'logged in the system', NULL, '2020-06-04 04:25:29'),
(108, 1, 'logged in the system', NULL, '2020-06-04 04:28:00'),
(109, 1, 'logged in the system', NULL, '2020-06-04 04:28:44'),
(110, 4, 'logged in the system ', NULL, '2020-06-04 04:31:08'),
(111, 4, 'logged out', NULL, '2020-06-04 04:31:15'),
(112, 1, 'logged in the system', NULL, '2020-06-04 04:31:37'),
(113, 1, 'logged out', NULL, '2020-06-04 04:31:42'),
(114, 4, 'logged in the system ', NULL, '2020-06-04 13:15:31'),
(115, 4, 'Edit their info', NULL, '2020-06-04 13:15:45'),
(116, 4, 'logged out', NULL, '2020-06-04 13:15:52'),
(117, 1, 'logged in the system', NULL, '2020-06-04 13:16:11'),
(118, 1, 'Deleted user', 'Edited Test', '2020-06-04 13:16:23'),
(119, 1, 'Unblocked User', 'Yato', '2020-06-04 13:16:26'),
(120, 1, 'Unblocked User', 'SniperKing', '2020-06-04 13:16:29'),
(121, 1, 'Deleted user', 'Pirate King', '2020-06-04 13:16:36'),
(122, 1, 'Deleted user', 'SniperKing', '2020-06-04 13:16:37'),
(123, 1, 'Deleted user', 'Test2', '2020-06-04 13:16:38'),
(124, 1, 'Deleted user', 'Yato', '2020-06-04 13:16:41'),
(125, 1, 'Added User', 'Nimesh Ji', '2020-06-04 13:17:26'),
(126, 1, 'Edited Info Of', 'Nimesh Ji', '2020-06-04 13:17:47'),
(127, 1, 'logged out', NULL, '2020-06-04 13:18:00'),
(128, 15, 'Changed Their Password', NULL, '2020-06-04 13:18:39'),
(129, 1, 'logged in the system', NULL, '2020-06-04 13:18:52'),
(130, 1, 'logged in the system', NULL, '2020-06-04 13:20:43'),
(131, 1, 'logged in the system', NULL, '2020-06-05 05:23:12'),
(132, 1, 'logged in the system', NULL, '2020-06-07 06:54:51'),
(133, 1, 'logged in the system', NULL, '2020-06-07 07:00:18'),
(134, 1, 'logged in the system', NULL, '2020-06-07 07:01:56'),
(135, 1, 'logged in the system', NULL, '2020-06-07 07:05:25'),
(136, 4, 'logged in the system ', NULL, '2020-06-07 12:08:19'),
(137, 1, 'logged in the system', NULL, '2020-06-07 12:10:04'),
(138, 1, 'logged out', NULL, '2020-06-07 12:10:12'),
(139, 4, 'logged in the system ', NULL, '2020-06-07 12:10:21'),
(140, 4, 'logged in the system ', NULL, '2020-06-07 12:18:17'),
(141, 4, 'logged out', NULL, '2020-06-07 12:18:47'),
(142, 4, 'logged in the system ', NULL, '2020-06-07 12:19:00'),
(143, 4, 'logged out', NULL, '2020-06-07 12:20:05'),
(144, 4, 'logged in the system ', NULL, '2020-06-07 12:20:21'),
(145, 4, 'logged in the system ', NULL, '2020-06-07 12:21:00'),
(146, 4, 'logged in the system ', NULL, '2020-06-07 12:25:13'),
(147, 4, 'logged in the system ', NULL, '2020-06-07 12:34:46'),
(148, 4, 'logged out', NULL, '2020-06-07 12:35:12'),
(149, 1, 'logged in the system', NULL, '2020-06-07 12:35:19'),
(150, 1, 'Unblocked User', 'Nimesh Ji', '2020-06-07 12:35:25'),
(151, 1, 'logged out', NULL, '2020-06-07 12:35:26'),
(152, 15, 'logged in the system ', NULL, '2020-06-07 12:35:34'),
(153, 15, 'logged out', NULL, '2020-06-07 12:35:51'),
(154, 1, 'logged in the system', NULL, '2020-06-07 12:35:59'),
(155, 15, 'logged in the system ', NULL, '2020-06-07 12:57:22'),
(156, 15, 'logged out', NULL, '2020-06-07 13:04:54'),
(157, 15, 'logged in the system ', NULL, '2020-06-07 13:05:05'),
(158, 1, 'logged in the system', NULL, '2020-06-07 13:17:28'),
(159, 1, 'logged out', NULL, '2020-06-07 13:17:42'),
(160, 15, 'logged in the system ', NULL, '2020-06-07 13:18:02'),
(161, 39, 'registered in the system', NULL, '2020-06-07 13:25:56'),
(162, 39, 'registered in the system', NULL, '2020-06-07 13:26:20'),
(164, 1, 'logged in the system', NULL, '2020-06-07 13:30:25'),
(165, 1, 'Deleted user', 'Regisha', '2020-06-07 13:30:45'),
(166, 1, 'logged in the system', NULL, '2020-06-07 13:34:16'),
(167, 1, 'Blocked User', 'Regisha', '2020-06-07 13:34:42'),
(168, 1, 'Unblocked User', 'Regisha', '2020-06-07 13:35:19'),
(169, 1, 'logged in the system', NULL, '2020-06-07 13:36:21'),
(170, 1, 'logged in the system', NULL, '2020-06-07 13:39:42'),
(171, 1, 'logged in the system', NULL, '2020-06-07 13:39:54'),
(172, 1, 'logged in the system', NULL, '2020-06-07 13:41:58'),
(173, 1, 'logged in the system', NULL, '2020-06-07 13:43:30'),
(174, 1, 'logged in the system', NULL, '2020-06-07 13:46:50'),
(175, 1, 'logged in the system', NULL, '2020-06-07 13:48:48'),
(176, 1, 'logged in the system', NULL, '2020-06-07 13:49:33'),
(177, 1, 'logged in the system', NULL, '2020-06-07 13:51:13'),
(178, 1, 'logged out', NULL, '2020-06-07 13:51:27'),
(179, 1, 'logged in the system', NULL, '2020-06-07 13:55:04'),
(180, 1, 'logged out', NULL, '2020-06-07 13:55:07'),
(181, 4, 'logged in the system ', NULL, '2020-06-07 13:55:16'),
(182, 4, 'logged in the system ', NULL, '2020-06-07 14:00:48'),
(183, 4, 'logged out', NULL, '2020-06-07 14:01:08'),
(184, 4, 'logged in the system ', NULL, '2020-06-07 14:01:16'),
(185, 4, 'logged in the system ', NULL, '2020-06-07 14:02:45'),
(186, 1, 'logged in the system', NULL, '2020-06-07 16:53:56'),
(187, 1, 'logged in the system', NULL, '2020-06-08 07:10:58'),
(188, 1, 'Deleted user', 'Prms', '2020-06-08 07:11:08'),
(189, 1, 'Added User', 'Rujan Dai', '2020-06-08 07:11:42'),
(190, 1, 'Blocked User', 'Rujan Dai', '2020-06-08 07:11:47'),
(191, 1, 'Unblocked User', 'Rujan Dai', '2020-06-08 07:11:48'),
(192, 1, 'Blocked User', 'Nimesh Ji', '2020-06-08 07:11:49'),
(193, 1, 'Unblocked User', 'Nimesh Ji', '2020-06-08 07:11:50'),
(194, 1, 'Blocked User', 'Regisha', '2020-06-08 07:11:51'),
(195, 1, 'Unblocked User', 'Regisha', '2020-06-08 07:11:52'),
(196, 1, 'logged out', NULL, '2020-06-08 07:12:07'),
(197, 1, 'logged in the system', NULL, '2020-06-08 07:16:42'),
(198, 1, 'Edited Info Of', 'Admin', '2020-06-08 07:17:21'),
(199, 1, 'logged out', NULL, '2020-06-08 07:17:22'),
(200, 1, 'logged in the system', NULL, '2020-06-08 07:17:30'),
(201, 1, 'logged out', NULL, '2020-06-08 07:20:14'),
(202, 42, 'registered in the system', NULL, '2020-06-08 09:48:23'),
(203, 42, 'logged in the system ', NULL, '2020-06-08 09:48:32'),
(204, 42, 'Edit their info', NULL, '2020-06-08 09:48:58'),
(205, 42, 'logged out', NULL, '2020-06-08 09:49:05'),
(206, 1, 'logged in the system', NULL, '2020-06-08 09:49:14'),
(207, 1, 'Added User', 'Test1', '2020-06-08 09:50:10'),
(208, 1, 'Blocked User', 'Test1', '2020-06-08 09:50:13'),
(209, 1, 'Blocked User', 'Rujan Dai', '2020-06-08 09:50:14'),
(211, 4, 'logged in the system ', NULL, '2020-06-08 10:20:47'),
(212, 4, 'Edit their info', NULL, '2020-06-08 10:20:57'),
(213, 4, 'logged out', NULL, '2020-06-08 10:21:02'),
(214, 1, 'logged in the system', NULL, '2020-06-08 10:21:10'),
(215, 1, 'logged in the system', NULL, '2020-06-08 10:21:18'),
(216, 1, 'Deleted user', '', '2020-06-08 10:21:27'),
(217, 1, 'Deleted user', 'RujanMan', '2020-06-08 10:21:29'),
(218, 1, 'Deleted user', 'Prms', '2020-06-08 10:21:33'),
(219, 1, 'Deleted user', 'Pranish', '2020-06-08 10:21:35'),
(220, 1, 'Deleted user', 'Regisha', '2020-06-08 10:21:36'),
(221, 1, 'logged out', NULL, '2020-06-08 10:22:58'),
(222, 1, 'logged in the system', NULL, '2020-06-08 10:28:36'),
(223, 1, 'logged out', NULL, '2020-06-08 10:28:39'),
(224, 4, 'logged in the system ', NULL, '2020-06-08 10:28:49'),
(225, 4, 'logged out', NULL, '2020-06-08 10:28:58'),
(226, 1, 'logged in the system', NULL, '2020-06-08 10:30:44'),
(227, 1, 'logged out', NULL, '2020-06-08 10:30:46'),
(228, 4, 'logged in the system ', NULL, '2020-06-08 10:30:56'),
(229, 4, 'logged out', NULL, '2020-06-08 10:31:05'),
(230, 4, 'logged in the system ', NULL, '2020-06-08 10:32:19'),
(231, 4, 'logged out', NULL, '2020-06-08 10:32:32'),
(232, 1, 'logged in the system', NULL, '2020-06-08 10:38:50'),
(233, 1, 'logged in the system', NULL, '2020-06-08 10:40:23'),
(234, 1, 'logged out', NULL, '2020-06-08 10:40:26'),
(235, 4, 'logged in the system ', NULL, '2020-06-08 10:40:39'),
(236, 4, 'logged out', NULL, '2020-06-08 10:40:55'),
(237, 4, 'logged in the system ', NULL, '2020-06-08 10:41:25'),
(238, 4, 'logged out', NULL, '2020-06-08 10:41:32'),
(239, 1, 'logged in the system', NULL, '2020-06-08 10:45:46'),
(240, 4, 'logged in the system ', NULL, '2020-06-08 10:47:40'),
(241, 4, 'logged out', NULL, '2020-06-08 10:47:45'),
(242, 42, 'logged in the system ', NULL, '2020-06-08 10:48:07'),
(243, 42, 'logged out', NULL, '2020-06-08 10:48:16'),
(244, 39, 'logged in the system ', NULL, '2020-06-08 10:48:24'),
(245, 39, 'logged in the system ', NULL, '2020-06-08 10:48:24'),
(246, 39, 'logged out', NULL, '2020-06-08 10:48:55'),
(247, 1, 'logged in the system', NULL, '2020-06-08 10:49:23'),
(248, 1, 'logged out', NULL, '2020-06-08 10:49:37'),
(249, 39, 'logged in the system ', NULL, '2020-06-08 10:49:55'),
(250, 39, 'logged out', NULL, '2020-06-08 10:50:05'),
(251, 4, 'logged in the system ', NULL, '2020-06-08 10:50:13'),
(252, 4, 'logged out', NULL, '2020-06-08 10:50:23'),
(253, 1, 'logged in the system', NULL, '2020-06-08 10:50:31'),
(254, 1, 'logged in the system', NULL, '2020-06-08 10:58:48'),
(255, 1, 'logged out', NULL, '2020-06-08 10:58:53'),
(256, 1, 'logged in the system', NULL, '2020-06-08 11:07:56'),
(257, 1, 'Edited Info Of', 'Admin', '2020-06-08 11:08:25'),
(258, 1, 'Edited Info Of', 'Test1', '2020-06-08 11:08:38'),
(259, 1, 'logged out', NULL, '2020-06-08 11:09:25'),
(260, 4, 'logged in the system ', NULL, '2020-06-08 11:09:34'),
(261, 4, 'logged out', NULL, '2020-06-08 11:15:18'),
(262, 1, 'logged in the system', NULL, '2020-06-08 11:15:26'),
(263, 1, 'logged in the system', NULL, '2020-06-08 11:16:45'),
(264, 1, 'logged out', NULL, '2020-06-08 11:17:01'),
(265, 4, 'logged in the system ', NULL, '2020-06-08 11:17:11'),
(266, 4, 'logged out', NULL, '2020-06-08 11:17:31'),
(267, 1, 'logged in the system', NULL, '2020-06-08 11:17:50'),
(268, 1, 'logged in the system', NULL, '2020-06-08 13:14:05'),
(269, 1, 'logged out', NULL, '2020-06-08 13:37:25'),
(270, 4, 'logged in the system ', NULL, '2020-06-08 13:38:56'),
(271, 4, 'logged out', NULL, '2020-06-08 13:41:35'),
(272, 1, 'logged in the system', NULL, '2020-06-08 13:43:01'),
(273, 1, 'logged out', NULL, '2020-06-08 13:44:51'),
(274, 1, 'logged in the system', NULL, '2020-06-08 13:45:18'),
(275, 1, 'logged out', NULL, '2020-06-08 13:45:23'),
(276, 1, 'logged in the system', NULL, '2020-06-08 14:26:38'),
(277, 1, 'logged out', NULL, '2020-06-08 14:26:40'),
(278, 1, 'logged in the system', NULL, '2020-06-08 14:28:00'),
(279, 1, 'logged out', NULL, '2020-06-08 14:28:01'),
(280, 1, 'logged in the system', NULL, '2020-06-08 14:38:17'),
(281, 1, 'logged out', NULL, '2020-06-08 14:38:18'),
(282, 1, 'logged in the system', NULL, '2020-06-08 14:39:20'),
(283, 1, 'logged out', NULL, '2020-06-08 14:39:22'),
(284, 4, 'logged in the system ', NULL, '2020-06-08 14:39:39'),
(285, 4, 'logged out', NULL, '2020-06-08 14:39:45'),
(286, 1, 'logged in the system', NULL, '2020-06-08 14:40:30'),
(287, 1, 'logged in the system', NULL, '2020-06-08 14:43:56'),
(288, 1, 'logged out', NULL, '2020-06-08 14:44:00'),
(289, 1, 'logged in the system', NULL, '2020-06-08 14:44:41'),
(290, 1, 'logged out', NULL, '2020-06-08 14:44:43'),
(291, 1, 'logged in the system', NULL, '2020-06-08 14:45:17'),
(292, 1, 'logged out', NULL, '2020-06-08 14:45:19'),
(293, 1, 'logged in the system', NULL, '2020-06-08 14:46:33'),
(294, 1, 'logged out', NULL, '2020-06-08 14:46:35'),
(295, 1, 'logged in the system', NULL, '2020-06-08 14:48:34'),
(296, 1, 'logged out', NULL, '2020-06-08 14:48:35'),
(297, 1, 'logged in the system', NULL, '2020-06-08 14:52:32'),
(298, 1, 'logged out', NULL, '2020-06-08 14:52:39'),
(299, 1, 'logged in the system', NULL, '2020-06-08 14:52:56'),
(300, 1, 'logged out', NULL, '2020-06-08 14:53:03'),
(301, 4, 'logged in the system ', NULL, '2020-06-08 14:53:10'),
(302, 4, 'logged out', NULL, '2020-06-08 14:53:14'),
(303, 1, 'logged in the system', NULL, '2020-06-08 14:56:24'),
(304, 1, 'logged out', NULL, '2020-06-08 14:58:04'),
(305, 4, 'logged in the system ', NULL, '2020-06-08 14:58:13'),
(306, 44, 'registered in the system', NULL, '2020-06-09 06:43:19'),
(307, 44, 'logged in the system ', NULL, '2020-06-09 06:43:26'),
(308, 44, 'Edit their info', NULL, '2020-06-09 06:43:37'),
(309, 44, 'logged out', NULL, '2020-06-09 06:43:41'),
(310, 1, 'logged in the system', NULL, '2020-06-09 06:43:51'),
(311, 1, 'Blocked User', 'SniperKing', '2020-06-09 06:43:57'),
(312, 1, 'Unblocked User', 'Test1', '2020-06-09 06:43:57'),
(313, 1, 'Blocked User', 'Sandesh JI', '2020-06-09 06:43:58'),
(314, 1, 'Unblocked User', 'Rujan Dai', '2020-06-09 06:43:58'),
(315, 1, 'Blocked User', 'Rujan Dai', '2020-06-09 06:43:59'),
(316, 1, 'Unblocked User', 'Sandesh JI', '2020-06-09 06:44:00'),
(317, 1, 'Unblocked User', 'SniperKing', '2020-06-09 06:44:00'),
(318, 1, 'Blocked User', 'Test1', '2020-06-09 06:44:01'),
(319, 1, 'Blocked User', 'SniperKing', '2020-06-09 06:44:04'),
(320, 1, 'Deleted user', 'Test1', '2020-06-09 06:44:07'),
(321, 1, 'Edited Info Of', 'SniperKing', '2020-06-09 06:44:17'),
(322, 1, 'Added User', 'Test1', '2020-06-09 06:44:42'),
(323, 1, 'logged out', NULL, '2020-06-09 06:45:16');

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
(1, 'Admin', 'Super', 'Admin', 'superAdmin@gmail.com  ', 'superadmin@##', 'admin', 'active', '2020-05-17', 'AdminPet', 'AdminSong'),
(4, 'Pomatoman', 'Pranaya Ji', 'Manandhar', 'pranaya@gmail.com    ', 'pomatoman', 'client', 'active', '2020-05-17', 'nyasi', 'Cherry Wine'),
(15, 'Nimesh Ji', 'Nimesh', 'Amatya', 'nimesh@gmail.com ', 'nimeshji', 'client', 'active', '2020-06-04', 'tommy', 'testsong'),
(39, 'Regisha', 'Regisha', 'Maharjan', 'regisha@gmail.com', 'regisha', 'client', 'active', '2020-06-07', 'Dogs', 'Mooskan'),
(41, 'Rujan Dai', 'Rujan', 'Shrestha', 'Rujan45@gmail.com', 'rujandai', 'client', 'blocked', '2020-06-08', 'dogs', 'songs'),
(42, 'Sandesh JI', 'Pranish', 'Acharya', 'pranish@gmail.com ', 'pranishji', 'client', 'active', '2020-06-08', 'tommy', 'Mooskan'),
(44, 'SniperKing', 'Sabbir Ji', 'Shahi', 'sabbir@gmail.com  ', 'sabbir', 'client', 'blocked', '2020-06-09', 'jerry', 'your man'),
(45, 'Test1', 'Test', 'User', 'test1@gmail.com', 'password', 'client', 'active', '2020-06-09', 'testpet', 'testsong');

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
  MODIFY `hid` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
