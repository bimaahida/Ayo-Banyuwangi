-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2019 at 08:22 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayobanyuwangi`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `spot_id` int(11) NOT NULL,
  `type_gallery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE `level_user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'UMKM'),
(3, 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8_danish_ci,
  `price` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `spot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `description`, `price`, `date`, `spot_id`) VALUES
(1, 'test2', 'assets/upload/product/d4b0ef4e-475e-4d10-9d47-0217215754591.jpeg', 'Assign responsive-friendly margin or padding values to an element or a subset of its sides with shorthand classes. Includes support for individual properties, all properties, and vertical and horizontal properties. Classes are built from a default Sass map ranging from .25rem to 3rem.', '1235', '2019-03-23 01:13:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `review` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  `spot_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spot`
--

CREATE TABLE `spot` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `description` text COLLATE utf8_danish_ci,
  `latitude` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `longitude` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `type_spot_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `spot`
--

INSERT INTO `spot` (`id`, `name`, `image`, `description`, `latitude`, `longitude`, `date`, `type_spot_id`, `user_id`) VALUES
(1, 'Store 1', 'assets/upload/profile/d4b0ef4e-475e-4d10-9d47-0217215754592.jpeg', 'Deskripsi', '-7.587871', '110.4443', '2019-03-23 00:51:24', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type_gallery`
--

CREATE TABLE `type_gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `type_gallery`
--

INSERT INTO `type_gallery` (`id`, `name`) VALUES
(1, 'Image'),
(2, 'Vidio');

-- --------------------------------------------------------

--
-- Table structure for table `type_spot`
--

CREATE TABLE `type_spot` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `type_spot`
--

INSERT INTO `type_spot` (`id`, `name`) VALUES
(1, 'Wisata'),
(2, 'UMKM');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `level_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `email`, `phone`, `image`, `date`, `level_user_id`) VALUES
(1, 'lul ba', 'lul', '328cc988b604d8f67b9e8cd2abbc1d443cff1203', 'lul@lul.com', '0822574646455', 'assets/upload/profile/d4b0ef4e-475e-4d10-9d47-0217215754592.jpeg', '2019-03-22 12:36:11', 1),
(2, 'test', 'root', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'xejefi@ace-mail.net', '82257464699', 'assets/upload/profile/d4b0ef4e-475e-4d10-9d47-0217215754592.jpeg', '2019-03-22 23:21:41', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gallery_spot1_idx` (`spot_id`),
  ADD KEY `fk_gallery_type_gallery1_idx` (`type_gallery_id`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_spot_idx` (`spot_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_review_spot1_idx` (`spot_id`),
  ADD KEY `fk_review_user1_idx` (`user_id`);

--
-- Indexes for table `spot`
--
ALTER TABLE `spot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_spot_type_spot1_idx` (`type_spot_id`),
  ADD KEY `fk_spot_user1_idx` (`user_id`);

--
-- Indexes for table `type_gallery`
--
ALTER TABLE `type_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_spot`
--
ALTER TABLE `type_spot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`level_user_id`),
  ADD KEY `fk_user_level_user1_idx` (`level_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `level_user`
--
ALTER TABLE `level_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `spot`
--
ALTER TABLE `spot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `type_gallery`
--
ALTER TABLE `type_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `type_spot`
--
ALTER TABLE `type_spot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `fk_gallery_spot1` FOREIGN KEY (`spot_id`) REFERENCES `spot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gallery_type_gallery1` FOREIGN KEY (`type_gallery_id`) REFERENCES `type_gallery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_spot` FOREIGN KEY (`spot_id`) REFERENCES `spot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_spot1` FOREIGN KEY (`spot_id`) REFERENCES `spot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `spot`
--
ALTER TABLE `spot`
  ADD CONSTRAINT `fk_spot_type_spot1` FOREIGN KEY (`type_spot_id`) REFERENCES `type_spot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_spot_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_level_user1` FOREIGN KEY (`level_user_id`) REFERENCES `level_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
