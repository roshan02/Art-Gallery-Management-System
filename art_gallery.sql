-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2019 at 08:39 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `ArtistId` varchar(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `G_id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Brought_By`
--

CREATE TABLE `Brought_By` (
  `p_id` varchar(5) NOT NULL,
  `c_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `a_id` varchar(5) NOT NULL,
  `e_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `cust_id` varchar(5) NOT NULL,
  `cust_name` varchar(20) DEFAULT NULL,
  `cust_addr` varchar(20) DEFAULT NULL,
  `painting_id` varchar(5) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `cost` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Exhibition`
--

CREATE TABLE `Exhibition` (
  `ID` varchar(5) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exhibition_artists`
--

CREATE TABLE `exhibition_artists` (
  `ID` varchar(5) NOT NULL,
  `ExhibitionId` varchar(5) DEFAULT NULL,
  `ArtistId` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Gallery`
--

CREATE TABLE `Gallery` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Organize`
--

CREATE TABLE `Organize` (
  `e_id` varchar(5) NOT NULL,
  `g_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Painting`
--

CREATE TABLE `Painting` (
  `ID` varchar(5) NOT NULL,
  `title` varchar(20) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `a_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`ArtistId`),
  ADD KEY `G_id` (`G_id`);

--
-- Indexes for table `Brought_By`
--
ALTER TABLE `Brought_By`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD PRIMARY KEY (`a_id`,`e_id`),
  ADD KEY `e_id` (`e_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `Exhibition`
--
ALTER TABLE `Exhibition`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `exhibition_artists`
--
ALTER TABLE `exhibition_artists`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Gallery`
--
ALTER TABLE `Gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Organize`
--
ALTER TABLE `Organize`
  ADD PRIMARY KEY (`e_id`),
  ADD KEY `g_id` (`g_id`);

--
-- Indexes for table `Painting`
--
ALTER TABLE `Painting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `a_id` (`a_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Artist`
--
ALTER TABLE `Artist`
  ADD CONSTRAINT `Artist_ibfk_1` FOREIGN KEY (`G_id`) REFERENCES `Gallery` (`ID`);

--
-- Constraints for table `Brought_By`
--
ALTER TABLE `Brought_By`
  ADD CONSTRAINT `Brought_By_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `Painting` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Brought_By_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `Customer` (`cust_id`) ON DELETE CASCADE;

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `exhibition_artists` (`ID`),
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `Exhibition` (`ID`);

--
-- Constraints for table `Organize`
--
ALTER TABLE `Organize`
  ADD CONSTRAINT `Organize_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `Gallery` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Organize_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `Exhibition` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `Painting`
--
ALTER TABLE `Painting`
  ADD CONSTRAINT `Painting_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `Artist` (`ArtistId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
