-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2018 at 03:36 PM
-- Server version: 5.7.18-log
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sanket`
--

-- --------------------------------------------------------

--
-- Table structure for table `meter_details`
--

CREATE TABLE `meter_details` (
  `meter_no` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `rd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reading` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `bill_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meter_details`
--

INSERT INTO `meter_details` (`meter_no`, `tenant_id`, `rd_date`, `reading`, `units`, `bill_amount`) VALUES
(10001, 1001, '2017-09-14 06:41:21', 35100, 100, 800),
(10002, 1002, '2017-09-14 06:48:03', 35300, 200, 1600),
(10003, 1003, '2017-09-14 06:48:03', 35300, 200, 1600),
(10004, 1004, '2017-09-14 06:48:03', 35300, 200, 1600),
(10005, 1005, '2017-09-14 06:48:03', 35300, 200, 1600),
(10007, 1014, '2017-09-14 06:48:03', 35300, 200, 1600),
(10008, 1015, '2017-09-14 06:48:03', 35300, 200, 1600),
(10009, 1016, '2017-09-14 06:48:03', 35300, 200, 1600),
(10001, 1001, '2017-10-05 08:56:51', 35200, 100, 800),
(10002, 1002, '2017-10-05 08:56:51', 35500, 200, 1600),
(10004, 1004, '2017-10-05 08:56:51', 35500, 200, 1600),
(10009, 1020, '2017-10-05 08:56:51', 35500, 200, 1600),
(10005, 1021, '2017-10-05 08:57:30', 35400, 100, 800),
(10006, 1022, '2017-10-23 09:42:01', 35300, 100, 800),
(10003, 1024, '2017-10-27 09:59:21', 35400, 100, 800);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `tenant_id`, `amount`, `date`) VALUES
(50000, 1001, 8800, '2017-09-22 14:38:17'),
(50004, 1002, 9600, '2017-09-27 16:51:49'),
(50005, 1004, 11600, '2017-09-27 18:57:10'),
(50006, 1020, 12800, '2017-10-05 08:47:19'),
(50007, 1001, 8800, '2017-10-05 08:51:14'),
(50008, 1002, 9600, '2017-10-05 08:51:25'),
(50009, 1004, 11600, '2017-10-05 08:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `room_no` int(11) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Tenant',
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`room_no`, `role`, `username`, `password`) VALUES
(103, 'Tenant', 'Akshata', 'akshata123'),
(201, 'Tenant', 'Aniket', 'aniket123'),
(102, 'Tenant', 'danny', 'danny123'),
(202, 'Tenant', 'Mohan', 'mohan123'),
(303, 'Tenant', 'prasad', 'prasad123'),
(101, 'Tenant', 'raj', 'raj123'),
(203, 'Tenant', 'Rajeesh', 'Ey8e2M'),
(999, 'Owner', 'sanket', 'sanket123');

-- --------------------------------------------------------

--
-- Table structure for table `rent_details`
--

CREATE TABLE `rent_details` (
  `tenant_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meter_bill` double DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `is_paid` varchar(5) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rent_details`
--

INSERT INTO `rent_details` (`tenant_id`, `date`, `meter_bill`, `rent`, `total_amount`, `is_paid`) VALUES
(1001, '2017-09-20 16:11:02', 800, 8000, 8800, 'yes'),
(1002, '2017-09-20 16:11:02', 1600, 8000, 9600, 'yes'),
(1004, '2017-09-20 16:11:02', 1600, 10000, 11600, 'yes'),
(1020, '2017-09-20 16:11:03', 800, 12000, 12800, 'yes'),
(1001, '2017-10-05 08:43:16', 800, 8000, 8800, 'yes'),
(1002, '2017-10-05 08:43:37', 1600, 8000, 9600, 'yes'),
(1004, '2017-10-05 08:43:53', 1600, 10000, 11600, 'yes'),
(1020, '2017-10-05 08:44:22', 800, 12000, 12800, 'yes'),
(1021, '2017-10-05 08:44:22', 800, 8000, 8800, 'No'),
(1022, '2017-10-23 09:44:29', 800, 9000, 9800, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `room_details`
--

CREATE TABLE `room_details` (
  `room_no` int(11) NOT NULL,
  `vacancy` varchar(10) NOT NULL,
  `meter_no` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `area` int(11) NOT NULL,
  `amount_perunit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_details`
--

INSERT INTO `room_details` (`room_no`, `vacancy`, `meter_no`, `type`, `area`, `amount_perunit`) VALUES
(101, 'No', 10001, '1BHK', 600, 8),
(102, 'No', 10002, '1BHK', 600, 8),
(103, 'No', 10003, '1BHK', 600, 8),
(201, 'No', 10004, '1BHK', 750, 8),
(202, 'No', 10005, '1BHK', 750, 8),
(203, 'No', 10006, '1BHK', 750, 8),
(301, 'yes', 10007, '1BHK', 900, 8),
(302, 'yes', 10008, '1BHK', 900, 8),
(303, 'No', 10009, '1BHK', 900, 8),
(999, 'No', 99999, '1BHK', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_details`
--

CREATE TABLE `tenant_details` (
  `room_no` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `agreement_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(5) DEFAULT 'yes',
  `rent` int(11) NOT NULL,
  `deposit` int(11) NOT NULL DEFAULT '25000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tenant_details`
--

INSERT INTO `tenant_details` (`room_no`, `tenant_id`, `firstname`, `lastname`, `email_id`, `contact_no`, `agreement_date`, `is_active`, `rent`, `deposit`) VALUES
(101, 1001, 'raj', 'shirolkar', 'raj123@gmail.com', 9865341111, '2017-10-08 17:20:31', 'yes', 8000, 25000),
(102, 1002, 'danny', 'giri', 'danny123@gmail.com', 9865310474, '2017-10-05 09:23:20', 'yes', 8000, 25000),
(103, 1003, 'prasad', 'narode', 'prasad123@gmail.com', 9874563201, '2017-10-05 09:23:20', 'No', 8000, 25000),
(201, 1004, 'tejas', 'gawate', 'tejas123@gmail.com', 9854123607, '2017-10-27 18:56:44', 'No', 9000, 25000),
(202, 1005, 'jajyesh', 'gore', 'gauesh123@gmail.com', 95123578460, '2017-10-05 09:23:20', 'No', 10000, 25000),
(203, 1010, 'vivek', 'ambekar', 'vivek123@gmail.com', 9822762393, '2017-10-05 09:23:20', 'No', 10000, 25000),
(203, 1011, 'anirudha', 'pansare', 'ani123@gmail.com', 9874412036, '2017-10-05 09:23:20', 'No', 10000, 25000),
(301, 1014, 'shahid', 'sayyed', 'shahid123@gmail.com', 982134920, '2017-10-05 09:23:20', 'No', 12000, 25000),
(302, 1015, 'shreekant', 'sanap', 'shree123@gmail.com', 9764815926, '2017-10-05 09:23:20', 'No', 12000, 25000),
(303, 1016, 'vijay', 'sanap', 'vijay123@gmail.com', 9011895079, '2017-10-05 09:23:20', 'No', 12000, 25000),
(303, 1020, 'prasad', 'narode', 'prasad1234@gmail.com', 9988775566, '2017-10-05 09:23:20', 'yes', 12000, 25000),
(202, 1021, 'Mohan', 'Sanap', 'sanketsanap5@gmail.com', 9822765079, '2017-10-08 19:34:30', 'yes', 8000, 25000),
(203, 1022, 'Vikas', 'Shirolkar', 'rajshirolkar@gmail.com', 9876124355, '2017-10-23 09:45:03', 'No', 9000, 25000),
(203, 1023, 'Sajeli', 'Gitte', 'sajeligitte97@gmail.com', 9172927830, '2017-10-27 18:57:01', 'No', 9000, 25000),
(103, 1024, 'Akshata', 'More', 'akshumore24@gmail.com', 9527022544, '2017-10-27 00:24:20', 'yes', 9000, 25000),
(201, 1025, 'Shreekant', 'Sanap', 'shreekanatsanap7@gmail.com', 9385694256, '2017-10-29 12:37:32', 'No', 9000, 25000),
(201, 1026, 'Aniket', 'garje', 'shreekantsanap7@gmail.com', 9822673293, '2017-10-29 12:41:43', 'yes', 8000, 25000),
(203, 1027, 'Rajeesh', 'BAc', 'rajshirolkar.comp@mmcoe.edu.in', 9422036566, '2017-10-30 02:18:08', 'yes', 9000, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `veh_amount`
--

CREATE TABLE `veh_amount` (
  `veh_type` varchar(25) NOT NULL,
  `OneWay_Amount` int(11) NOT NULL,
  `Return_Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `veh_amount`
--

INSERT INTO `veh_amount` (`veh_type`, `OneWay_Amount`, `Return_Amount`) VALUES
('Bus', 60, 110),
('cars', 30, 50),
('HeavyTruck', 90, 170),
('Truck', 65, 120);

-- --------------------------------------------------------

--
-- Table structure for table `veh_entry`
--

CREATE TABLE `veh_entry` (
  `veh_type` varchar(20) NOT NULL,
  `veh_num` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL DEFAULT 'Cash',
  `amount` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ticket_Type` varchar(10) NOT NULL DEFAULT 'One-Way'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `veh_entry`
--

INSERT INTO `veh_entry` (`veh_type`, `veh_num`, `payment_type`, `amount`, `date_time`, `Ticket_Type`) VALUES
('cars', 'mh12', 'Paytm', 30, '2017-07-22 16:08:43', 'One-Way'),
('Bus ', 'mh14', 'Credit / Debit ', 60, '2017-07-22 16:54:57', 'One-Way'),
('Bus ', 'mh14', 'Credit / Debit ', 60, '2017-07-22 16:59:49', 'One-Way'),
('Truck', 'mH16', 'NetBanking', 65, '2017-07-22 17:58:59', 'Return'),
('Bus ', 'Mh-12 Lp23', 'Cash', 60, '2017-07-22 20:13:37', 'One-Way'),
('Bus ', 'mh34', 'Credit / Debit ', 60, '2017-07-22 20:14:49', 'Return'),
('Truck', 'sas', 'Cash', 65, '2017-07-22 20:18:16', 'One-Way'),
('HeavyTruck', 's', 'Credit / Debit ', 90, '2017-07-22 20:20:18', 'One-Way'),
('Bus ', 'sa', 'Cash', 60, '2017-07-22 20:21:08', 'One-Way'),
('cars', 'ss', 'Cash', 30, '2017-07-22 20:23:33', 'One-Way'),
('cars', 'ss', 'Cash', 30, '2017-07-22 20:23:50', 'One-Way'),
('Bus ', 'ss', 'Cash', 60, '2017-07-22 20:24:05', 'One-Way'),
('Truck', 'mh15', 'Credit / Debit ', 65, '2017-07-22 20:26:48', 'Return'),
('Truck', 'sdsd', 'Credit / Debit ', 65, '2017-07-22 20:27:45', 'Return'),
('Bus ', 'sd', 'Credit / Debit ', 60, '2017-07-22 20:29:50', 'One-Way'),
('HeavyTruck', 'as', 'Credit / Debit ', 90, '2017-07-22 20:30:31', 'One-Way'),
('Bus ', 'sas', 'Paytm', 60, '2017-07-22 20:47:24', 'Return'),
('Bus ', 'sas', 'NetBanking', 60, '2017-07-22 20:48:17', 'Return'),
('HeavyTruck', 'MH14BG1308', 'Paytm', 90, '2017-07-25 10:22:48', 'Return'),
('cars', 'MH!@ddf', 'Cash', 30, '2017-07-25 11:36:23', 'One-Way'),
('Bus ', 'asas', 'Cash', 60, '2017-07-25 11:37:08', 'One-Way'),
('cars', 'sas', 'Credit / Debit ', 30, '2017-07-25 11:38:46', 'One-Way'),
('cars', 'sas', 'Credit / Debit ', 30, '2017-07-25 11:38:51', 'One-Way'),
('cars', 'sas', 'Cash', 30, '2017-07-25 11:39:09', 'One-Way'),
('Bus ', 'sas', 'Cash', 60, '2017-07-25 11:39:28', 'One-Way'),
('Bus ', 'jhjsd', 'Credit / Debit ', 60, '2017-07-25 11:41:22', 'Return'),
('Bus ', 'sas', 'Credit / Debit ', 60, '2017-07-25 11:50:51', 'One-Way'),
('Bus ', 'sas', 'Paytm', 60, '2017-07-25 11:51:29', 'Return'),
('Truck', 'sas', 'NetBanking', 65, '2017-07-25 11:53:40', 'One-Way'),
('Bus ', 'sas', 'Cash', 60, '2017-07-25 12:21:17', 'One-Way'),
('Bus ', 'sas', 'Paytm', 60, '2017-07-25 12:22:56', 'Return'),
('Bus ', 'sa', 'Credit / Debit ', 60, '2017-07-25 12:23:57', 'Return'),
('Bus ', 'sas', 'Cash', 60, '2017-07-25 12:25:57', 'Return'),
('Bus ', 'sas', 'Credit / Debit ', 60, '2017-07-25 12:29:25', 'One-Way'),
('Truck', 'sas', 'Paytm', 65, '2017-07-25 12:29:45', 'Return'),
('Bus ', 'sa', 'Cash', 60, '2017-07-25 12:32:17', 'One-Way'),
('cars', 'sas', 'Cash', 30, '2017-07-25 12:34:28', 'One-Way'),
('HeavyTruck', 'sa', 'Cash', 90, '2017-07-25 12:34:55', 'Return'),
('HeavyTruck', 'sas', 'Credit / Debit ', 90, '2017-07-25 12:35:52', 'One-Way'),
('Bus ', 'asa', 'Credit / Debit ', 60, '2017-07-25 12:36:03', 'One-Way'),
('Truck', 'sadsad', 'NetBanking', 65, '2017-07-25 12:36:18', 'Return'),
('HeavyTruck', 'MH12 LP525', 'NetBanking', 90, '2017-07-27 10:55:34', 'Return'),
('Truck', 'MH14BG1308', 'Paytm', 65, '2017-07-28 06:23:01', 'Return'),
('Truck', 'abcd', 'Paytm', 0, '2017-07-28 07:26:48', 'Return'),
('Truck', 'ato z', 'Credit / Debit ', 120, '2017-07-28 07:30:11', 'Return'),
('cars', '12ka 4', 'Credit / Debit ', 50, '2017-07-28 09:36:09', 'Return'),
('Bus ', 'abscg', 'Paytm', 110, '2017-07-28 10:00:06', 'Return'),
('cars', 'sas', 'Credit / Debit ', 50, '2017-07-28 10:07:45', 'Return'),
('Truck', 'sass', 'Cash', 65, '2017-07-28 10:08:54', 'One-Way'),
('Truck', 'klklk', 'Cash', 120, '2017-07-28 10:16:29', 'Return'),
('Bus ', 'jkk', 'Credit / Debit ', 60, '2017-07-28 10:20:29', 'One-Way'),
('Bus', 'now', 'Credit / Debit', 60, '2017-07-28 10:20:29', 'One-Way'),
('Bus', 'now', 'Credit / Debit', 60, '2017-06-28 10:20:29', 'One-Way'),
('HeavyTruck', 'MH12 LP525', 'Paytm', 170, '2017-07-29 17:12:14', 'Return'),
('Truck', 'ssd', 'Cash', 65, '2017-07-29 17:19:42', 'One-Way'),
('Bus ', 'zzxcxzc', 'Credit / Debit ', 60, '2017-07-29 17:20:27', 'One-Way'),
('Bus ', 'ghbj', 'Credit / Debit ', 60, '2017-07-29 17:35:30', 'One-Way'),
('cars', '22121', 'Cash', 30, '2017-07-29 17:39:46', 'One-Way'),
('cars', 'dsd', 'Cash', 30, '2017-07-29 17:40:59', 'One-Way'),
('cars', 'ffgf', 'Cash', 30, '2017-07-29 17:43:05', 'One-Way'),
('cars', 'rerere', 'Cash', 50, '2017-07-29 17:43:33', 'Return'),
('Bus ', 'asasa', 'Cash', 60, '2017-07-29 17:48:42', 'One-Way'),
('HeavyTruck', 'dd', 'Credit / Debit ', 170, '2017-07-29 17:49:25', 'Return'),
('cars', 'fdf', 'Cash', 30, '2017-07-29 17:49:39', 'One-Way');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meter_details`
--
ALTER TABLE `meter_details`
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`username`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `rent_details`
--
ALTER TABLE `rent_details`
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `room_details`
--
ALTER TABLE `room_details`
  ADD PRIMARY KEY (`room_no`),
  ADD UNIQUE KEY `meter_no` (`meter_no`);

--
-- Indexes for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD PRIMARY KEY (`tenant_id`),
  ADD UNIQUE KEY `contact_no` (`contact_no`),
  ADD UNIQUE KEY `contact_no_2` (`contact_no`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `veh_amount`
--
ALTER TABLE `veh_amount`
  ADD PRIMARY KEY (`veh_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50010;

--
-- AUTO_INCREMENT for table `tenant_details`
--
ALTER TABLE `tenant_details`
  MODIFY `tenant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1028;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meter_details`
--
ALTER TABLE `meter_details`
  ADD CONSTRAINT `meter_details_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room_details` (`room_no`);

--
-- Constraints for table `rent_details`
--
ALTER TABLE `rent_details`
  ADD CONSTRAINT `rent_details_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);

--
-- Constraints for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD CONSTRAINT `tenant_details_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room_details` (`room_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
