-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2024 at 01:12 PM
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
-- Database: `resto_makanan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `nama_barang` varchar(50) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `kd_barang` varchar(100) DEFAULT NULL,
  `jumlah_barang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`nama_barang`, `harga_beli`, `harga_jual`, `tanggal_masuk`, `kd_barang`, `jumlah_barang`) VALUES
('Burger L', 20, 30, '2024-07-25', 'B0001', '888848'),
('Burger S', 10, 25, '2024-07-25', 'B0002', '98989888'),
('Buger King', 40, 100, '2024-07-25', 'B0003', '889899898'),
('Frence F', 5, 11, '2024-07-25', 'B0004', '89989898'),
('Coke 1L', 10, 15, '2024-07-25', 'B0005', '9999999'),
('Coke 300ml', 3, 5, '2024-07-25', 'B0006', '89889898'),
('Chciken Wings', 4, 8, '2024-07-25', 'B0007', '89898898'),
('frence Chicken', 5, 10, '2024-07-25', 'B0008', '98989898'),
('Salad', 3, 5, '2024-07-25', 'B0009', '98989898'),
('Rice Bowl', 2, 3, '2024-07-25', 'B0010', '98989898'),
('Skins ', 3, 6, '2024-07-25', 'B0011', '8998989');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hitung_jual`
--

CREATE TABLE `tbl_hitung_jual` (
  `id_hitung` int(11) NOT NULL,
  `kd_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(11) DEFAULT NULL,
  `hsatuan` int(11) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hitung_jual`
--

INSERT INTO `tbl_hitung_jual` (`id_hitung`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_jual`, `harga`) VALUES
(1, 'B0001', 'Burger L', 30, 40, 1200),
(2, 'B0002', 'Burger S', 25, 10, 250);

--
-- Triggers `tbl_hitung_jual`
--
DELIMITER $$
CREATE TRIGGER `tr_batal` AFTER DELETE ON `tbl_hitung_jual` FOR EACH ROW BEGIN UPDATE tbl_barang set jumlah_barang=jumlah_barang+old.jumlah_jual where kd_barang=old.kd_barang; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_jual` AFTER INSERT ON `tbl_hitung_jual` FOR EACH ROW BEGIN
UPDATE tbl_barang set jumlah_barang=jumlah_barang -new.jumlah_jual
WHERE kd_barang=new.kd_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` int(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `id_login` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `password`, `jenis_kelamin`, `email`, `no_telp`, `agama`, `alamat`, `id_login`, `role`) VALUES
('pegawai', 'pegawai', 'Laki-laki', 'pegawai@gmai.com', 987777, 'Islam', 'sadashfdgr', 1, 'pegawai'),
('user', 'user', 'Laki-laki', 'user@gmai.com', 87777, 'Islam', 'sadasdawf', 2, 'pelanggan'),
('pegawaii', 'pegawaii', 'Laki-laki', 'pegawaii@gasdasd.com', 9242812, 'Islam', 'pegawaii', 3, 'pegawai'),
('user2', 'user2', 'Perempuan', 'user2@gmail.com', 86666, 'Islam', 'jhgfdeswerftg', 4, 'pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `nofaktur` varchar(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_jual` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_hitung_jual`
--
ALTER TABLE `tbl_hitung_jual`
  ADD PRIMARY KEY (`id_hitung`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_hitung_jual`
--
ALTER TABLE `tbl_hitung_jual`
  MODIFY `id_hitung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
