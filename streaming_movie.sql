-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2026 at 04:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `streaming_movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `nama_customer`, `jenis_kelamin`, `region_id`) VALUES
(1, 'Rizky Pratama', 'L', 1),
(2, 'Siti Rahma', 'P', 1),
(3, 'Budi Santoso', 'L', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_movie`
--

CREATE TABLE `customer_movie` (
  `pembelian_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `tanggal_pembelian` datetime NOT NULL,
  `harga_dibayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_movie`
--

INSERT INTO `customer_movie` (`pembelian_id`, `customer_id`, `movie_id`, `tanggal_pembelian`, `harga_dibayar`) VALUES
(1, 1, 1, '2026-11-08 22:28:31', 45000.00),
(3, 2, 3, '2026-11-08 22:28:31', 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `nama_movie` varchar(150) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `panjang_movie` int(11) NOT NULL,
  `studio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `nama_movie`, `genre`, `panjang_movie`, `studio_id`) VALUES
(1, 'Inception', 'Sci-Fi', 148, 1),
(2, 'The Witcher', 'Fantasy', 60, 2),
(3, 'Everything Everywhere All at Once', 'Action', 139, 3);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `nama_region` varchar(100) NOT NULL,
  `customer_id_ambassador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `nama_region`, `customer_id_ambassador`) VALUES
(1, 'Jakarta', 2),
(2, 'Bandung', NULL),
(3, 'Surabaya', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL,
  `nama_studio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`studio_id`, `nama_studio`) VALUES
(1, 'Hollywood Pictures'),
(2, 'Netflix Original'),
(3, 'A24 Studio');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `customer_movie`
--
ALTER TABLE `customer_movie`
  ADD PRIMARY KEY (`pembelian_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `studio_id` (`studio_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `customer_id_ambassador` (`customer_id_ambassador`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`studio_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_movie`
--
ALTER TABLE `customer_movie`
  MODIFY `pembelian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studio`
--
ALTER TABLE `studio`
  MODIFY `studio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer_movie`
--
ALTER TABLE `customer_movie`
  ADD CONSTRAINT `customer_movie_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `fk_ambassador` FOREIGN KEY (`customer_id_ambassador`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
