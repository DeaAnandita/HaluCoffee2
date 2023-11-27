-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 04:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'baskoroadi', '827ccb0eea8a706c4c34a16891f84e7b', 'Baskoro Adi'),
(3, 'dea', '1234', 'dea anandita');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id_likes` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id_likes`, `id_pelanggan`, `id_produk`) VALUES
(21, 8, 1);

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
(4, '827ccb0eea8a706c4c34a16891f84e7b', 'Baskoro Adi Wicaksono'),
(7, '123', 'pelanggan'),
(8, '202cb962ac59075b964b07152d234b70', 'dea'),
(9, 'pelanggan', '123'),
(10, 'staff', '123'),
(11, 'dea', '21'),
(12, 'dimas', '1'),
(13, 'dea', '9'),
(14, 'dea', '1'),
(15, 'dimas', '123'),
(16, 'dea', '1'),
(17, 'dea', '21'),
(18, 'pelanggan', '123'),
(19, 'staff', '123'),
(20, 'bintang', '1'),
(23, 'bintang', '1'),
(24, 'bintang', '1'),
(25, 'bintang', '1'),
(26, 'bintang', '1');

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
(1, 'Americano', 15000, 4, 'americano.jpg', '						Espresso + Air			', 'makanan', 1),
(2, 'Caffe Latte', 18000, 2, 'CafeLatte.jpg', '			Bakso yang terbuat dari daging sapi berkualitas dan halal, dijamin sehat		', 'makanan', 2),
(3, 'Cappucino', 18000, 10, 'Cappucino.jpg', '			Menggunakan daging segar yang sehat dan lezzat		', 'makanan', 3),
(4, 'Moccacino', 18000, 0, 'Moccacino.jpg', 'Moccacino	', 'minuman', 3),
(5, 'Kopi Susu Aren', 15000, 14, 'KopiSusuGulaAren.jpg', 'Espresso + Susu + Gula Aren', '', 1),
(6, 'Kopi Susu Halu', 18000, 16, 'KopiSusuHalu.jpg', 'Signature Kopi dari halu cofee', '', 1),
(7, 'Tubruk', 10000, 0, 'Tubruk.jpg', 'Terbuat dari kopi pilihan', '', 2),
(8, 'Red Valvet', 18000, 16, 'RedValvet.jpg', 'Red Valvet', '', 2),
(9, 'Green Tea', 18000, 16, 'GreenTea.jpg', 'Macha', '', 3),
(10, 'Chocolate', 18000, 16, 'Chocolate.jpg', 'Coklat', '', 1),
(11, 'Lemon Tea', 13000, 16, 'LemonTea.jpg', 'Teh + Lemon', '', 2),
(12, 'French Fries', 15000, 1, 'Frenchfries.jpg', 'Kentang Goreng Mantap		', '', 3);

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
  `nama_warung` varchar(50) DEFAULT NULL,
  `alamat_warung` varchar(100) NOT NULL,
  `telepon_warung` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `warung`
--

INSERT INTO `warung` (`id_warung`, `nama_warung`, `alamat_warung`, `telepon_warung`) VALUES
(1, 'Makanan', '', '081234567888'),
(2, 'Mekdun', 'Gang PGA, Sukabirus, Dayeuhkolot, Bandung', '081234567990'),
(3, 'Kantin Tiana', 'Sukapura, Dayeuhkolot, Bandung', '085324543166');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_likes`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`);

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
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id_likes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_warung`) REFERENCES `warung` (`id_warung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
