-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 07, 2025 at 02:10 PM
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
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `id_favorit` int NOT NULL,
  `user_id` int NOT NULL,
  `tipe_favorit` varchar(30) NOT NULL,
  `item_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `favorit`
--

INSERT INTO `favorit` (`id_favorit`, `user_id`, `tipe_favorit`, `item_id`, `created_at`) VALUES
(3, 1, 'resep_masakan', 13, '2025-07-07 10:21:41'),
(10, 1, 'resep_masakan', 7, '2025-07-07 10:40:16'),
(13, 1, 'resep_masakan', 14, '2025-07-07 10:44:28'),
(15, 1, 'rekomendasi_sosmed', 1, '2025-07-07 11:03:24'),
(21, 1, 'usaha_kuliner', 10, '2025-07-07 11:24:16'),
(23, 6, 'resep_masakan', 13, '2025-07-07 11:59:48'),
(24, 6, 'rekomendasi_sosmed', 10, '2025-07-07 11:59:57'),
(25, 6, 'usaha_kuliner', 13, '2025-07-07 12:02:34'),
(26, 37, 'usaha_kuliner', 10, '2025-07-07 12:03:31'),
(27, 1, 'usaha_kuliner', 12, '2025-07-07 12:04:04'),
(28, 37, 'rekomendasi_sosmed', 10, '2025-07-07 12:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi_sosmed`
--

CREATE TABLE `rekomendasi_sosmed` (
  `id_sosmed` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `deskripsi` text NOT NULL,
  `thumbnail_url` text,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekomendasi_sosmed`
--

INSERT INTO `rekomendasi_sosmed` (`id_sosmed`, `judul`, `link`, `deskripsi`, `thumbnail_url`, `created_by`, `created_at`, `updated_at`) VALUES
(10, 'Couple Coffe Singaraja', 'https://vt.tiktok.com/ZSByGxFFK/', 'Cafe yang menyediakan banyak makanan dan minuman', 'https://i.pinimg.com/736x/22/59/e0/2259e038973dceafa59fb513cb3e0664.jpg', 1, '2025-07-07 19:37:06', NULL),
(11, 'Smoothies Singaraja', 'https://vt.tiktok.com/ZSByGxrBm/', 'Aneka smoothies di Singaraja', 'https://i.pinimg.com/736x/22/59/e0/2259e038973dceafa59fb513cb3e0664.jpg', 1, '2025-07-07 19:38:17', NULL),
(12, 'Korean Food Enak dan Murah', 'https://vt.tiktok.com/ZSByGXma2/', 'Berbagai korena food ada disini', 'https://i.pinimg.com/736x/22/59/e0/2259e038973dceafa59fb513cb3e0664.jpg', 1, '2025-07-07 19:39:06', NULL),
(13, 'Korean Streetfood ', 'https://www.instagram.com/reel/C_Kcuc-gR9T/?igsh=MXRoMXEwejBqc2Nhcw==', 'Makanan korean streetfood ada di @elders.kitchen', 'https://i.pinimg.com/736x/da/20/46/da2046dd48a3b00d16da8e8528e1595b.jpg', 1, '2025-07-07 19:40:39', NULL),
(14, 'Camilan Kentang', 'https://www.tiktok.com/@alithermawan7/video/7515001021018443026?_r=1&_t=ZS-8xpNQyxPgCQ', 'Rekomendasi cemilan kentang yang enak dan murah', 'https://i.pinimg.com/736x/22/59/e0/2259e038973dceafa59fb513cb3e0664.jpg', 1, '2025-07-07 19:42:19', NULL),
(15, 'Roti Box with Mentai Sauce', 'https://www.instagram.com/reel/DBLoRsIyxdf/?igsh=OTc5d2ZsMzd5bm90', 'Roti bakar asin lumer Singaraja', 'https://i.pinimg.com/736x/da/20/46/da2046dd48a3b00d16da8e8528e1595b.jpg', 1, '2025-07-07 19:43:56', NULL),
(16, 'Nasi Bakar', 'https://www.instagram.com/p/CJzs8hLBr57/?igsh=MWUzbTYxMWtqczE1Yg==', 'Ada Nasi Bakar Ati Sambel Embe dan Nasi Bakar Ampela Sambel Sere', 'https://i.pinimg.com/736x/da/20/46/da2046dd48a3b00d16da8e8528e1595b.jpg', 1, '2025-07-07 19:45:35', NULL);

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
(7, 1, 'Coklat Dubaii', '2 batang coklat silverqueen\nSecukupnya DCC pake tulip\n1 bungkus glaze tergantung selera\nKunafa\nSecukupnya almond\nSecukupnya kacang pistachio\n1 SDM margarin', 'Siapkan kunafa kw, lalu goreng dgn margarin sampai kriuk2\nSiapkan silverqueen, tambahkan DCC tulip, dan margarin lalu cairkan / tim\nSetelah itu siapkan cetakan dan masuklan almond slice ke dalam coklat lalu ratakan di cetakan tipis2 dan masukkan ke kulkas biar mengeras\nSetelah mengeras klr kan coklatnya lalu beri glaze, kunafa, almond dan pistachio aduk rata, tata di coklat yg sdh cetak\nSetelah itu tutup kembali dgn coklat dan masukkan di kulkas tunggu mengeras dan bisa di. Lepas\nDan coklat Dubai rumahan bisa di nikmati', 'Pencuci Mulut', 'https://i.pinimg.com/736x/ff/92/bc/ff92bc34ea33e5fd24bf9da43985958d.jpg', '2025-07-03 11:06:40', '2025-07-07 18:01:50'),
(13, 8, 'Americano', 'Kopi\nEs batu\nAir zam-zam\ndoa', 'Masukkan air zam-zam ke dalam gelas\nmasukkan bubuk kopi\ntambahkan es batu', 'Minuman', 'https://i.pinimg.com/736x/cb/48/db/cb48db04009801523739569e0f33cfc3.jpg', '2025-07-04 10:41:10', '2025-07-04 10:41:28'),
(14, 1, 'Fuyunghai', '4 butir telur\n150 gram dada ayam, cincang\n3 sdm tepung terigu\n1 buah wortel, serut kasar\n50 gram kol, iris kasar\n2 tangkai daun bawang, iris kasar\n½ sdt garam\n½ sdt kaldu bubuk\n½ sdt merica\n200 minyak goreng\n2 siung bawang putih, cincang\n½ buah bawang bombay, potong kasar\n50 gram nanas, potong kecil-kecil\n6 sdm saus tomat\n2 sdm saus tiram\n½ sdt kaldu bubuk\n½ sdm gula pasir\n300 mL air\n1 sdm maizena, larutkan dengan sedikit air', 'Kocok lepas telur, lalu tambahkan tepung terigu dan kocok kembali sampai tepung terigu larut (tidak bergerindil).\nCampurkan ayam cincang, wortel, kol, daun bawang, garam, kaldu bubuk, dan merica bubuk. Aduk semua bahan sampai tercampur rata.\nPanaskan minyak, goreng adonan fuyunghai sampai kering kedua sisinya dan berwarna kuning keemasan, lalu angkat.\nTumis bawang putih dan bawang bombay hingga harum, lalu tambahkan nanas. Aduk sampai nanas layu.\nTambahkan saus tomat, saus tiram, kaldu bubuk, dan gula pasir. Aduk rata lalu tambahkan air dan masak sampai mendidih.\nTambahkan larutan maizena, aduk-aduk sampai mendidih kembali dan mengental.\nSajikan fuyunghai dengan siraman saus asam manis.', 'Menu Utama', 'https://i.pinimg.com/736x/b7/e3/af/b7e3af99505abe6c34d1f18d6f6301c5.jpg', '2025-07-06 17:50:57', '2025-07-07 16:58:03'),
(15, 1, 'Nasi Goreng', '4 centong nasi\n1 buah sosis, iris\n1 butir telur ayam\n3/4 sdt garam\n1/2 sdt kaldu jamur\n3 sdm kecap manis\n3 siung bawang merah\n3 siung bawang putih\n3 buah cabai rawit merah\n3 buah cabai keriting merah', 'Siapkan bumbu halus.\nTumis bumbu halus sampai tanak.\nTumis bumbu halus sampai tanak.\nCeplok telur dan orak arik. Kemudian masukkan sosis.\nCeplok telur dan orak arik. Kemudian masukkan sosis.\nAduk-aduk dan tumis sebentar.\nAduk-aduk dan tumis sebentar.\nMasukkan nasi, garam, kaldu jamur, dan kecap manis. Aduk sampai rata dan koreksi rasa.\nMasukkan nasi, garam, kaldu jamur, dan kecap manis. Aduk sampai rata dan koreksi rasa.', 'Menu Utama', 'https://i.pinimg.com/736x/94/82/ab/9482ab2e248d249e7daa7fd6924c8d3b.jpg', '2025-07-06 18:26:46', '2025-07-06 18:26:57'),
(16, 1, 'Matcha Latte Boba', '50 gr boba mentah\n3 sdm gula palm\n250 ml susu UHT\n2 sdm kental manis putih\n2 sdm matcha bubuk\nAir panas secukupnya\nEs batu secukupnya', 'Rebus boba mentah dengan air dan gula palm selama 5 menit.\nSiapkan gelas, masukkan boba lalu tambahkan kental manis dan es batu.\nSiapkan gelas, masukkan boba lalu tambahkan kental manis dan es batu.\nTuang susu UHT sampai 1/2 gelas.\nTuang susu UHT sampai 1/2 gelas.\nLarutkan matcha dengan sedikit air panas.\nLarutkan matcha dengan sedikit air panas.\nTerakhir tuang ke dalam gelas. Sajikan.\nTerakhir tuang ke dalam gelas. Sajikan.', 'Minuman', 'https://i.pinimg.com/736x/f9/b8/77/f9b877bbb7e3c89c10f2025773707539.jpg', '2025-07-06 18:28:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usaha_kuliner`
--

CREATE TABLE `usaha_kuliner` (
  `id_usaha` int NOT NULL,
  `user_id` int NOT NULL,
  `nama_usaha` varchar(150) NOT NULL,
  `menu` text,
  `lokasi` varchar(255) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `jam_buka` varchar(50) DEFAULT NULL,
  `status_approve` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usaha_kuliner`
--

INSERT INTO `usaha_kuliner` (`id_usaha`, `user_id`, `nama_usaha`, `menu`, `lokasi`, `kontak`, `foto`, `jam_buka`, `status_approve`, `created_at`, `updated_at`) VALUES
(10, 1, 'Umah Ketipat Food Corner', 'Tipat Plecing Kuah (ketupat dengan sambal plecing segar)\r\nTipat Cantok, Tipat Blayag (varian ketupat dengan bumbu khas)\r\nRujak, Sioke (camilan tradisional Bali)\r\nEs Daluman (minuman dingin menyegarkan)\r\nSate Lilit, Kota gorengan, steak ayam crispy (sesuai review Restaurant Guru)', 'https://www.google.com/maps/search/?api=1&query=Umah+Ketipat+Singaraja', '087860430899', 'https://lh3.googleusercontent.com/p/AF1QipMRZGGIn34iBOPAxxP1WV7I_FhE3nLCzFt7_yj5=w408-h501-k-no', '10:00-21:00', 1, '2025-07-07 06:58:51', '2025-07-07 06:58:51'),
(12, 1, 'Joffi Ramen Singaraja', '🍜 Ramen\r\n1. Ramen premium halal — dengan kuah homemade, mie segar, topping lengkap, ada telur ajitama.\r\n2. Harga mulai dari Rp 9.000–13.000 (varian ekonomis) \r\n3. Tersedia pilihan kuah ayam (chicken bouillon) dan topping variatif seperti dimsum dan agemono (gorengan) sebagai tambahan \r\n🥟 Dimsum Premium & Agemono\r\n4. Pilihan dimsum premium halal, cocok sebagai pendamping ramen \r\n5. Agemono (gorengan Jepang atau serupa ala restoran cepat saji), ditampilkan sebagai tambahan saat makan \r\n🥤 Milky Series (Minuman Baru)\r\nVarian terbaru:\r\n6. Red Velvet\r\n7. Matcha\r\n8. Gaya creamy dan manis, diluncurkan sebagai varian pendamping makan ramen ', 'https://www.google.com/maps/place/Joffi+Ramen+Singaraja/@-8.1222161,115.0686622,17z/data=!3m1!4b1!4m6!3m5!1s0x2dd19b000155bfe7:0xb0f41d2255d283c8!8m2!3d-8.1222214!4d115.0712371!16s%2Fg%2F11ltwwpryf?entry=ttu&g_ep=EgoyMDI1MDYzMC4wIKXMDSoASAFQAw%3D%3D', '@joffiramen_singaraja.bali', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npGB6k4nbwyu-Uu6VlXP-kjRcCsbVK2Ttat1pe1rS3ClXcApo32PHA1QAYB2aBymFucFpfLitwdQRKWFKp4tHS3lRYptFGkMPFNheQTvhpWcmQtoG1dUMRI8iJ8UjCi4ukywGwl8Q=w408-h306-k-no', '10:00-22:00', 1, '2025-07-07 11:53:43', '2025-07-07 11:53:43'),
(13, 1, 'KFC', '🍱 Kombos (Rp 29.000 – 142.500)\r\n1. SB2 Coffee Nescafé (2 chicken + nasi + latte): Rp 60.000\r\n2. SB1 Coffee (1 chicken + nasi + latte): Rp 43.500\r\n3. Combo Twisty (1 Twisty + large fries + Cola): Rp 29.500\r\n4. Combo Spaghetti Supreme (1 porsi + fries + Cola): Rp 31.500\r\n5. Kombo Winger Barbeque (1 BBQ Winger + nasi + Cola): Rp 31.000\r\n6. Super Family (5 chicken + 3 nasi + 3 Cola): Rp 142.500\r\n7. Super Besar 1 (1 chicken + nasi + Cola): Rp 38.500\r\n8. Super Besar 2 (2 chicken + nasi + Cola): Rp 55.000\r\n9. Signature Box (1 chicken + nasi + mocha + sup): Rp 42.500\r\n10. Crispy Box (1 chicken + nasi + mocha + strips): Rp 48.000\r\n11. Kombo O.R. Burger (burger + fries + Cola): Rp 36.500\r\n12. Kombo Bento (oriental/BBQ/black pepper bento + Cola): Rp 29.000\r\n\r\n🍗 A‑la‑carte (Rp 4.000 – 161.500)\r\n13. Winger Bucket (7 half wingers): Rp 84.000\r\n14. KFC Soup: Rp 14.500\r\n15. Seasoned Winger/Strips/Fun Fries (barbeque): Rp 21.000–26.000\r\n16. Hot & Crispy Chicken (HCC) dan Original Chicken (OR): Rp 19.500/pc\r\n17. Rice: Rp 9.500 (gratis jika jadi bagian kombo)\r\n18. Perkedel: Rp 9.500\r\n19. Cream Soup: Rp 12.500\r\n20. 9‑pcs Chicken (mix OR/HC): Rp 161.500\r\n\r\n🍔 Praktis (Rp 13.500 – 26.500)\r\n21. Krunchy Burger: Rp 13.500\r\n22. Krispy Burger: Rp 26.500\r\n23. Twisty: Rp 19.000\r\n24. French Fries (reg: Rp 19.000; large: Rp 23.000)\r\n25. Oriental Bento: Rp 20.000\r\n26. Crispy Strips (2 pcs): Rp 19.000\r\n27. Colonel Burger: Rp 21.000\r\n\r\n🥤 Minuman & Lain‑lain (Rp 8.500 – 13.500)\r\n28. Cafe Latte, Cappuccino, Mocha Float: Rp 12.500–13.500\r\n29. Ichi Ocha: Rp 11.500\r\n30. Black Coffee: Rp 8.500\r\n31. Ovaltine 125 ml: Rp 10.500\r\n32. Mango/Yubari/Chococha/Lovlychee Float: Rp 10.500–12.500\r\n33. Mineral Water, Pudding, 34. Coca‑Cola/Sprite/Fanta: Rp 8.500–11.500\r\n\r\n🌟 Kombo Super Star (Rp 95.500 – 121.000)\r\n35. Super Star 1 (2 chicken + 2 nasi + Cola + 36. Fun Fries + Mocha + CD): Rp 95.500\r\n37. Super Star 2 (3 pcs chicken + 2 nasi + 2 Cola + CD): Rp 107.000\r\n38. Super Star 3 (4 chicken + 2 soup + 2 perkedel + CD): Rp 121.000\r\n\r\n👶 Chaki Kids Meal (mulai Rp 42.000)\r\n39. Chaki Kids Meal A (1 chicken + nasi + Ovaltine + mainan): Rp 42.000', 'https://www.google.com/maps/place/KFC/@-8.1126877,115.0887587,17z/data=!3m1!4b1!4m6!3m5!1s0x2dd19a0ac0000001:0x548dc560189e1246!8m2!3d-8.112693!4d115.0913336!16s%2Fg%2F12ml2yqkf?entry=ttu&g_ep=EgoyMDI1MDYzMC4wIKXMDSoASAFQAw%3D%3D', '08117157540', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np5ROP0s0zB3-DvrpH9G_Gv67ZB7FjM_NAszgYp2KG_sIHEaEghBockPgmdx93LeMd6y56yDeUOcYPm8flNEyk7t7OEUbcI9hoNdZsENv7-NF5qa85gcs3Wmty3dDd-3zoLohjnenLOnaGc=w408-h306-k-no', '07:00-22:00', 1, '2025-07-07 11:58:52', '2025-07-07 11:58:52');

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
(8, 'nazwakayla', '$2b$12$VedE00RyuAFt6hHR0nJIVek97ztqvr5WeiAXAP27Pwmw.SA19sru2', '2025-07-04 02:39:15', '2025-07-04 02:39:15', NULL),
(9, 'jean_doe', '$2b$12$UgnU0a6IFYRE/c2DY0O6Nefn5FzDY/mJFZyxePs9qLxHVr26HSq9.', '2025-07-04 12:35:56', '2025-07-04 12:35:56', NULL),
(34, 'putrii', '$2b$12$o2qoddxEDL1CZB1KxVliveo.F7Yt/WF4J.vTmACpQ2.9mvjhWlTvm', '2025-07-06 05:31:49', '2025-07-06 05:31:49', NULL),
(35, 'putri', '$2b$12$xYFNui2zWfGpsXHzGWLknespsPQAQkUGNhTaFHhI0XYqw.z1P5wTO', '2025-07-06 05:32:13', '2025-07-06 05:32:13', NULL),
(36, 'andiniaja', '$2b$12$OZnIm97nhtj9E/MZ6wIBQ.j/tgb388mNLNv9mYQKIUQ0B7pvzAwVq', '2025-07-06 05:35:14', '2025-07-06 05:35:14', NULL),
(37, 'Randika', '$2b$12$YVwamMteADlztGAZVtz68OdJdzrXoXgoK0swiT92B8qHuMdOg53AG', '2025-07-07 12:01:01', '2025-07-07 12:01:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id_favorit`),
  ADD UNIQUE KEY `user_id` (`user_id`,`tipe_favorit`,`item_id`);

--
-- Indexes for table `rekomendasi_sosmed`
--
ALTER TABLE `rekomendasi_sosmed`
  ADD PRIMARY KEY (`id_sosmed`);

--
-- Indexes for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resep_masakan_ibfk_1` (`user_id`);

--
-- Indexes for table `usaha_kuliner`
--
ALTER TABLE `usaha_kuliner`
  ADD PRIMARY KEY (`id_usaha`),
  ADD UNIQUE KEY `id` (`id_usaha`);

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
-- AUTO_INCREMENT for table `favorit`
--
ALTER TABLE `favorit`
  MODIFY `id_favorit` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekomendasi_sosmed`
--
ALTER TABLE `rekomendasi_sosmed`
  MODIFY `id_sosmed` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usaha_kuliner`
--
ALTER TABLE `usaha_kuliner`
  MODIFY `id_usaha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`);

--
-- Constraints for table `resep_masakan`
--
ALTER TABLE `resep_masakan`
  ADD CONSTRAINT `resep_masakan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
