-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2021 at 11:29 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama`) VALUES
(1, 'Beladiri'),
(2, 'Handphone');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(15) NOT NULL,
  `nama_produk` varchar(40) NOT NULL,
  `category_id` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `berat` double NOT NULL DEFAULT 0,
  `harga` double NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nama_produk`, `category_id`, `deskripsi`, `berat`, `harga`, `stock`) VALUES
('1001', 'Samsak', 1, 'Samsak Beladiri Tinju MMA Muaythai PencakSilat', 3, 500000, 30),
('1002', 'Sarung Tangan Tinju', 1, 'Sarung Tangan Boxing Muaythai', 1, 100000, 20),
('1003', 'Body Protector', 1, 'Body Protector IPSI', 1, 850000, 50),
('1004', 'Matras', 1, 'Matras Tebal 3cm ukuran 1x1 meter', 1, 170000, 15),
('1005', 'Kick Pad', 1, 'Kick Pad Muaythai sepasang', 2, 500000, 6),
('1006', 'Toya', 1, 'Toya silat IPSI Toya Kungfu', 1, 150000, 8),
('1007', 'Kerambit', 1, 'Kerambit tumpul, Kerambit tajam', 5, 150000, 15),
('1008', 'Double Stick', 1, 'Double Stick Besi', 2, 100000, 15),
('1009', 'Pacing Tangan', 1, 'Ukuran Besar', 1, 70000, 15),
('1010', 'Pedang', 1, 'Pedang Tumpul dan Pedang Tajam', 1, 3500000, 4),
('1101', 'Redmi Note ', 2, 'Ram 4 Rom 64 ', 1, 1899000, 5),
('1102', 'Redmi Note 9 Pro', 2, '8GB 128GB Snapdragon720G 64MP QuadKamera 5020mAh 6 FHD Garansi Resmi', 1, 3500000, 6),
('1103', 'Redmi  9A', 2, '2GB 32GB 3GB 32GB Garansi Resmi Xiaomi', 1, 1300000, 2),
('1104', 'Xiaomi Mi 10T Pro', 2, 'Ram 8GB 256GB Resmi Mi 10T 8GB  128GB', 1, 6000000, 1),
('1105', 'Vivo Y12s', 2, 'RAM 3GB 32GB', 1, 1200000, 17),
('1106', 'INFINIX HOT 9 PLAY', 2, 'RAM 4 dan ROM 64GBGB', 1, 400000, 4),
('1107', 'Xiaomi Redmi Note 4x', 2, 'RAM 4 64 4G', 1, 4750000, 3),
('1108', 'Redmi Note 2', 2, 'RAM 2GB INTERNAL 16GB ORIGINAL', 1, 5750000, 3),
('1109', 'Xiaomi Redmi 8', 2, '4GB 64 RAM 4GB ROM 64GB', 1, 1250000, 7),
('1110', 'Vivo Y12s', 2, 'RAM 3GB ROM 32GB', 1, 2150000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `product_id` char(15) NOT NULL,
  `nama_varian` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `product_id`, `nama_varian`, `harga`, `stock`) VALUES
(1, '1001', 'Warna Merah', 500000, 15),
(2, '1002', 'Warna  Merah', 100000, 30),
(3, '1003', 'Warna Hitam', 150000, 20),
(4, '1004', 'Warna Putih', 850000, 50),
(5, '1005', 'Warna Hitam', 170000, 6),
(6, '1006', 'Panjang 140 cm Kulit', 70000, 8),
(7, '1007', 'Bahan Kayu', 150000, 15),
(8, '1008', 'Bahan Almunium', 100000, 15),
(9, '1009', 'Warna Merah', 70000, 15),
(10, '1010', 'Warna Silver', 3500000, 4),
(11, '1101', 'Warna Hijau', 1899000, 5),
(12, '1102', 'Warna Putih', 3500000, 6),
(13, '1103', 'Warna Hitam', 1300000, 2),
(14, '1104', 'Warna Merah', 6000000, 1),
(15, '1105', 'Warna Putih', 1200000, 17),
(16, '1106', 'Warna Biru', 400000, 4),
(17, '1107', 'Warna Biru', 4750000, 3),
(18, '1108', 'Warna Kuning', 5750000, 3),
(19, '1109', 'Warna Biru', 1250000, 7),
(20, '1110', 'Warna  Merah', 2150000, 4),
(1002, '1001', 'Warna Merah', 100000, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
