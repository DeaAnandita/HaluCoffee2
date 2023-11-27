-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 10:11 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `halu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `pass`) VALUES
(1, 'dea', '456'),
(2, 'dimas', '678');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(255) NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `no_meja` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_meja`) VALUES
(8, 'dea', '23'),
(33, 'dea', '3'),
(34, 'dimas', '2'),
(35, 'deaa', '12'),
(36, 'deas', '3'),
(37, 'q', '1'),
(38, 'q', '1'),
(39, 'a', '3');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  `jumlah_pembelian` int(11) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `total_pembelian` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `tanggal_pembelian`, `jumlah_pembelian`, `ongkir`, `total_pembelian`, `id_pelanggan`) VALUES
(28, '2023-11-26', 24000, 1000, 25000, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `jumlah`, `id_pembelian`, `id_produk`) VALUES
(33, 2, 28, 5);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto_produk` varchar(100) DEFAULT NULL,
  `deskripsi_produk` text DEFAULT NULL,
  `kategori` varchar(50) NOT NULL,
  `id_warung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok`, `foto_produk`, `deskripsi_produk`, `kategori`, `id_warung`) VALUES
(1, 'Americano', 15000, 4, 'americano.jpg', '						Espresso + Air			', 'Minuman', 1),
(2, 'Caffe Latte', 18000, 2, 'CafeLatte.jpg', 'Latte art mantap		', 'Minuman', 1),
(3, 'Cappucino', 18000, 10, 'Cappucino.jpg', 'Minuman mantap		', 'Minuman', 1),
(4, 'Moccacino', 18000, 0, 'Moccacino.jpg', 'Moccacino	', 'minuman', 1),
(5, 'Kopi Susu Aren', 15000, 14, 'KopiSusuGulaAren.jpg', 'Espresso + Susu + Gula Aren', '', 1),
(6, 'Kopi Susu Halu', 18000, 16, 'KopiSusuHalu.jpg', 'Signature Kopi dari halu cofee', '', 1),
(7, 'Tubruk', 10000, 0, 'Tubruk.jpg', 'Terbuat dari kopi pilihan', '', 1),
(8, 'Red Valvet', 18000, 16, 'RedValvet.jpg', 'Red Valvet', '', 1),
(9, 'Green Tea', 18000, 16, 'GreenTea.jpg', 'Macha', '', 2),
(10, 'Chocolate', 18000, 16, 'Chocolate.jpg', 'Coklat', '', 1),
(11, 'Lemon Tea', 13000, 16, 'LemonTea.jpg', 'Teh + Lemon', '', 2),
(12, 'French Fries', 15000, 1, 'Frenchfries.jpg', 'Kentang Goreng Mantap		', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `produk1`
--

CREATE TABLE `produk1` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto_produk` varchar(100) DEFAULT NULL,
  `deskripsi_produk` text DEFAULT NULL,
  `kategori` varchar(50) NOT NULL,
  `id_warung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produk1`
--

INSERT INTO `produk1` (`id_produk`, `nama_produk`, `harga_produk`, `stok`, `foto_produk`, `deskripsi_produk`, `kategori`, `id_warung`) VALUES
(1, 'Nasi Goreng', 15000, 4, '7.jpg', '						Nasi Goreng enak dengan campuran telor, sosis, baso, ayam				', 'makanan', 1),
(2, 'Bakso', 10000, 2, '9.jpg', '			Bakso yang terbuat dari daging sapi berkualitas dan halal, dijamin sehat		', 'makanan', 2),
(3, 'Ayam Goreng', 20000, 10, '6.jpg', '			Menggunakan daging segar yang sehat dan lezzat		', 'makanan', 3),
(4, 'Es Teh', 5000, 0, '11.jpg', '			Teh segar pengobat dahaga		', 'minuman', 3),
(5, 'Soto Ayam', 12000, 14, '5.jpg', 'Menu soto yang dicampur dengan ayam dan telor', '', 1),
(6, 'Es Jeruk', 4000, 16, '12.jpg', 'Terbuat dari jeruk alami yang sehat dan manis', '', 1),
(7, 'Kopi Jos', 6000, 0, '16.jpg', 'Terbuat dari kopi pilihan yaitu kopi kapal api', '', 2),
(8, 'Martabak', 15000, 16, '10.jpg', 'Martabak telor dengan campuran daging dan kornet', '', 2),
(9, 'Soup Buah', 15000, 16, '13.jpg', 'Es buah dengan campuran beraneka buah-buahan dan kuah sirup', '', 3),
(10, 'Sate Ayam', 11000, 16, '1.jpg', 'Sate ayam lezat dengan bumbu kacang', '', 1),
(11, 'Gado gado', 14000, 16, '2.jpg', 'Gado gado lengkap sayuran dan telor', '', 2),
(16, 'roti', 16000, 5, 'Screenshot 2023-10-29 212235.png', 'roti sandwich', 'makanan', NULL),
(17, 'kopi 1', 12000, 5, 'logo.png', 'adfsg', 'minuman', NULL),
(18, 'kopi', 14000, 5, 'logo.png', 'asfgn', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'pelanggan', '123', 'pelanggan'),
(2, 'staff', '123', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `warung`
--

CREATE TABLE `warung` (
  `id_warung` int(11) NOT NULL,
  `nama_warung` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `warung`
--

INSERT INTO `warung` (`id_warung`, `nama_warung`) VALUES
(1, 'Coffee'),
(2, 'Tea'),
(3, 'Snack');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_warung` (`id_warung`);

--
-- Indexes for table `produk1`
--
ALTER TABLE `produk1`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_warung` (`id_warung`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `warung`
--
ALTER TABLE `warung`
  ADD PRIMARY KEY (`id_warung`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `produk1`
--
ALTER TABLE `produk1`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warung`
--
ALTER TABLE `warung`
  MODIFY `id_warung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk1` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_warung`) REFERENCES `halu2`.`warung` (`id_warung`);

--
-- Constraints for table `produk1`
--
ALTER TABLE `produk1`
  ADD CONSTRAINT `produk1_ibfk_1` FOREIGN KEY (`id_warung`) REFERENCES `warung` (`id_warung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
