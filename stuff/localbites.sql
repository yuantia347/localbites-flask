-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 04, 2025 at 02:49 AM
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
-- Table structure for table `rekomendasi_sosmed`
--

CREATE TABLE `rekomendasi_sosmed` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `deskripsi` text,
  `thumbnail_url` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekomendasi_sosmed`
--

INSERT INTO `rekomendasi_sosmed` (`id`, `judul`, `link`, `deskripsi`, `thumbnail_url`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Warung Segara Mas Singaraja', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 'Video dari akun @wrsegaramas; menu makanan viral.', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 1, '2025-07-03 14:16:43', '2025-07-03 14:16:43', NULL),
(2, 'nasi kucing', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 'des', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 1, '2025-07-03 15:59:54', '2025-07-03 15:59:54', NULL),
(3, 'ayam', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 'ayam\n', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 1, '2025-07-03 16:03:06', '2025-07-03 16:03:06', NULL),
(4, 'Warung Segara Mas Singaraja', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 'nnm,', 'https://www.tiktok.com/@wrsegaramas/video/7502754526269590839', 1, '2025-07-03 21:34:29', '2025-07-03 21:34:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resep_masakan`
--

CREATE TABLE `resep_masakan` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `judul` text NOT NULL,
  `bahan` text NOT NULL,
  `langkah` text NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resep_masakan`
--

INSERT INTO `resep_masakan` (`id`, `user_id`, `judul`, `bahan`, `langkah`, `kategori`, `foto`, `created_at`, `updated_at`) VALUES
(4, 1, 'telur gorenggg', 'telur\ngaram', 'tumis\naduk\nsaji', 'Makanan utama', 'https://i.pinimg.com/736x/9a/78/74/9a78748c5dc9a6bd20269ebe31a2e0a4.jpg', '2025-07-03 10:02:36', '2025-07-03 21:52:40'),
(5, 1, 'nasi', 'KUCING', 'KUCING', 'Pembuka', 'https://i.pinimg.com/736x/de/1c/9b/de1c9b56cc80767cbe4d0c163864a958.jpg', '2025-07-03 10:14:05', NULL),
(6, 1, 'Nasi kucing', 'kucing \nnasi', 'masak', 'Pembuka', 'https://i.pinimg.com/736x/de/1c/9b/de1c9b56cc80767cbe4d0c163864a958.jpg', '2025-07-03 10:16:13', NULL),
(7, 1, 'Coklat Dubai', '2 batang coklat silverqueen\nSecukupnya DCC pake tulip\n1 bungkus glaze tergantung selera\nKunafa\nSecukupnya almond\nSecukupnya kacang pistachio\n1 SDM margarin', 'Siapkan kunafa kw, lalu goreng dgn margarin sampai kriuk2\nSiapkan silverqueen, tambahkan DCC tulip, dan margarin lalu cairkan / tim\nSetelah itu siapkan cetakan dan masuklan almond slice ke dalam coklat lalu ratakan di cetakan tipis2 dan masukkan ke kulkas biar mengeras\nSetelah mengeras klr kan coklatnya lalu beri glaze, kunafa, almond dan pistachio aduk rata, tata di coklat yg sdh cetak\nSetelah itu tutup kembali dgn coklat dan masukkan di kulkas tunggu mengeras dan bisa di. Lepas\nDan coklat Dubai rumahan bisa di nikmati', 'Pencuci Mulut', 'https://i.pinimg.com/736x/ff/92/bc/ff92bc34ea33e5fd24bf9da43985958d.jpg', '2025-07-03 11:06:40', '2025-07-03 21:42:43'),
(13, 8, 'Americano', 'Kopi\nEs batu\nAir zam-zam\ndoa', 'Masukkan air zam-zam ke dalam gelas\nmasukkan bubuk kopi\ntambahkan es batu', 'Minuman', 'https://i.pinimg.com/736x/cb/48/db/cb48db04009801523739569e0f33cfc3.jpg', '2025-07-04 10:41:10', '2025-07-04 10:41:28');

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
(7, '12126', '$2b$12$qgkkAHSLH46MM0JWfdtlR.lY.DIJtoNYY.npNEqwvmZkcbve3HHb.', '2025-06-29 03:41:45', '2025-06-29 03:41:45', NULL),
(8, 'nazwakayla', '$2b$12$VedE00RyuAFt6hHR0nJIVek97ztqvr5WeiAXAP27Pwmw.SA19sru2', '2025-07-04 02:39:15', '2025-07-04 02:39:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rekomendasi_sosmed`
--
ALTER TABLE `rekomendasi_sosmed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resep_masakan_ibfk_1` (`user_id`);

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
-- AUTO_INCREMENT for table `rekomendasi_sosmed`
--
ALTER TABLE `rekomendasi_sosmed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekomendasi_sosmed`
--
ALTER TABLE `rekomendasi_sosmed`
  ADD CONSTRAINT `rekomendasi_sosmed_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_users`);

--
-- Constraints for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  ADD CONSTRAINT `resep_masakan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
