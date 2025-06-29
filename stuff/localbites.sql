-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2025 at 04:25 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `localbites`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `username`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'yuantia', '$2b$12$bpLO3OLec41L8COg0CRU6uX/HhaOYlBWAE19e1AvI4w9rimthfT5.', '2025-06-28 02:31:28', '2025-06-28 02:31:28', NULL),
(2, 'yuannn', '$2b$12$EuLh1sipg5Th8o5zDSGCDuRjBvRYfGBDxLtB/j2Ul7U1iUNqsdID6', '2025-06-28 03:03:39', '2025-06-28 03:03:39', NULL),
(3, 'yuantiaa', '$2b$12$5BdlLCNSI6VTxjwolklVdOR8G8pXd7Eituop.oCRYWbAhbf5QGcym', '2025-06-28 03:10:33', '2025-06-28 03:10:33', NULL),
(4, 'yuanaja', '$2b$12$clsuAnyO4udi6bgrCgVLneY8TzD6h/e/4/uHSvpJZCl1XjK4HqL5K', '2025-06-28 03:14:03', '2025-06-28 03:14:03', NULL),
(5, 'yuanandini', '$2b$12$qYfv69OXyFjSKQGyEfQWu.aPGpkcTgvnGq3BV1XpWqduoMIxXvT8G', '2025-06-28 05:40:08', '2025-06-28 05:40:08', NULL),
(6, 'andini', '$2b$12$IOT2nYdPTeIddA/7ueXe1eVSS3AiHLilX2iRu8XIe0nULZyG9zb06', '2025-06-28 05:51:09', '2025-06-28 05:51:09', NULL),
(7, '12126', '$2b$12$qgkkAHSLH46MM0JWfdtlR.lY.DIJtoNYY.npNEqwvmZkcbve3HHb.', '2025-06-29 03:41:45', '2025-06-29 03:41:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
