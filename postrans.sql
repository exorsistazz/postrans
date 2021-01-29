-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2021 at 05:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postrans`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `barang_id` int(11) NOT NULL,
  `kode_barang` varchar(200) NOT NULL,
  `jenis` enum('Pecah Belah','Bukan Pecah Belah') NOT NULL,
  `isi` varchar(100) NOT NULL,
  `berat` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `id_barang_masuk` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agen`
--

CREATE TABLE `tbl_agen` (
  `agen_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `kode_pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_agen`
--

INSERT INTO `tbl_agen` (`agen_id`, `name`, `address`, `description`, `created`, `updated`, `kode_pos`) VALUES
(1, 'POS Soreang', 'Jl. Soreang-Banjaran, Soreang, Kec. Soreang, Bandung, Jawa Barat', ' Active', '2021-01-05 19:55:45', '2021-01-05 19:22:50', 40911),
(3, 'AGEN POS SOREANG CINGCIN', 'Jl. Raya Soreang Kopo No.78, Cingcin, Kec. Soreang, Bandung, Jawa Barat ', 'Active', '2021-01-05 20:47:00', '2021-01-23 11:04:13', 40914);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `barang_id` int(11) NOT NULL,
  `id_agen` varchar(30) DEFAULT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `jenis` enum('Pecah Belah','Bukan Pecah Belah') NOT NULL,
  `isi` varchar(100) NOT NULL,
  `berat` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `id_barang_masuk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`barang_id`, `id_agen`, `kode_barang`, `jenis`, `isi`, `berat`, `alamat`, `created`, `updated`, `id_barang_masuk`) VALUES
(1, '3', '1234567', 'Pecah Belah', 'aksesoris', '3 gr', 'Tasik Malaya', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, '1', 'gt5364y163', 'Pecah Belah', 'emas', '123gr', 'cikarang', '0000-00-00 00:00:00', '2021-01-24 16:59:15', 1),
(3, '3', '1111111111', 'Pecah Belah', '1111111111111', '111222222222', 'jl.sariasih 2 cijerokaso no 11 Rt 07 Rw 10 Kec sukasari Kota Bandung Jawa Barat', '0000-00-00 00:00:00', '2021-01-22 10:08:32', NULL),
(6, '1', '1111111111', 'Bukan Pecah Belah', 'hb', '123', 'jl.sariasih 2 cijerokaso no 11 Rt 07 Rw 10 Kec sukasari Kota Bandung Jawa Barat', '2021-01-22 11:20:23', '2021-01-24 16:59:15', 1),
(12, '1', 'w', 'Pecah Belah', 'www', '12', 'cijerokaso', '2021-01-23 10:34:16', '2021-01-24 16:59:15', 1),
(13, '3', 'ww', 'Pecah Belah', 'www', 'ww', 'wda', '2021-01-23 16:46:35', '0000-00-00 00:00:00', NULL),
(15, '1', 'wwwwww', 'Pecah Belah', 'wwwwwwwwww', 'www', 'www', '2021-01-24 10:03:44', '2021-01-24 16:59:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang_keluar`
--

CREATE TABLE `tbl_barang_keluar` (
  `id_barang_keluar` int(20) NOT NULL,
  `id_pusat` int(200) NOT NULL,
  `id_user` int(200) NOT NULL,
  `tgl_barang_keluar` datetime NOT NULL,
  `keterangan_status` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang_masuk`
--

CREATE TABLE `tbl_barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `id_agen` varchar(30) NOT NULL,
  `tgl_barang_masuk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_barang_masuk`
--

INSERT INTO `tbl_barang_masuk` (`id_barang_masuk`, `id_agen`, `tgl_barang_masuk`) VALUES
(1, '1', '2021-01-24'),
(2, '1', '2021-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoice_id` int(11) NOT NULL,
  `pos_name` varchar(200) NOT NULL,
  `kode_pos` int(100) NOT NULL,
  `alamat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`invoice_id`, `pos_name`, `kode_pos`, `alamat`) VALUES
(1, 'POS Soreang', 40911, 'Jl. Raya Soreang - Banjaran, Soreang, Kec. Soreang, Bandung, Jawa Barat'),
(2, 'AGEN POS SOREANG CINGCIN', 40914, 'Jl. Raya Soreang Kopo No.78, Cingcin, Kec. Soreang, Bandung, Jawa Barat ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kode_pos`
--

CREATE TABLE `tbl_kode_pos` (
  `pos_id` int(11) NOT NULL,
  `kabupaten` varchar(200) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kode_pos`
--

INSERT INTO `tbl_kode_pos` (`pos_id`, `kabupaten`, `kode_pos`, `provinsi`) VALUES
(1, 'Bandung', '40191 - 40974', 'Jawa Barat'),
(2, 'Bandung Barat', '40391 - 40567', 'Jawa Barat'),
(3, 'Bekasi', '17211 - 17730', 'Jawa Barat'),
(4, 'Bogor', '16110 - 16969', 'Jawa Barat'),
(5, 'Ciamis', '46211 - 46388', 'Jawa Barat'),
(6, 'Cianjur', '43215 - 43292', 'Jawa Barat'),
(7, 'Cirebon', '45150 - 45652', 'Jawa Barat'),
(8, 'Garut', '44111 - 44193', 'Jawa Barat'),
(9, 'Indramayu', '45211 - 45285', 'Jawa Barat'),
(10, 'Karawang', '41311 - 41386', 'Jawa Barat'),
(11, 'Kuningan', '45511 - 45595', 'Jawa Barat'),
(12, 'Majalengka', '45411 - 45476', 'Jawa Barat'),
(13, 'Pangandaran', '46267 - 46397', 'Jawa Barat'),
(14, 'Purwakarta', '41111 - 41182', 'Jawa Barat'),
(15, 'Subang', '41211 - 41288', 'Jawa Barat'),
(16, 'Sukabumi', '43132 - 43368', 'Jawa Barat'),
(17, 'Sumedang', '45311 - 45393', 'Jawa Barat'),
(18, 'Tasik Malaya', '46153 - 46476', 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setor_barang`
--

CREATE TABLE `tbl_setor_barang` (
  `barang_id` int(11) NOT NULL,
  `kode_barang` varchar(200) NOT NULL,
  `jenis` enum('Pecah Belah','Bukan Pecah Belah') NOT NULL,
  `isi` varchar(100) NOT NULL,
  `berat` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_setor_barang`
--

INSERT INTO `tbl_setor_barang` (`barang_id`, `kode_barang`, `jenis`, `isi`, `berat`, `alamat`, `created`, `updated`) VALUES
(1, 'wwwwww', 'Pecah Belah', 'wwwwwwwwww', 'www', 'www', '2021-01-24 10:03:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id` int(11) NOT NULL,
  `barang_id` varchar(200) NOT NULL,
  `waktu` datetime NOT NULL,
  `informasi` text NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` int(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `level` int(1) NOT NULL COMMENT '1:Admin, 2:Agen, 3:Manajer',
  `id_agen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `name`, `level`, `id_agen`) VALUES
(1, 992471643, '30e2238080dfce4e3571945b5b46a51072cdf0a7', 'Otang', 1, NULL),
(2, 974369871, '21edae99169878f1f0608bf31d4e8ebfd63d9378', 'Sutarwan S', 2, '3'),
(3, 988440155, 'cc717d0e963c470c373ddb06247afd067e586465', 'Ferry Ferdian', 2, '1'),
(4, 972363919, '286a7b3b83e5dd978ca34064996d204948398a58', 'Teddy Irawan', 3, NULL),
(5, 971362520, '2cd9b1cae0aeebc0b41e8d9134564adee3ffbc8a', 'Daniansyah', 1, NULL),
(11, 970347418, '5fc07895d39bbdffd1f99ceff3bd98fe350fb9c2', 'Iwan Rustiawan', 1, NULL),
(15, 1174038, '76ec911260a543a63269be5a59364049a54902ca', 'teddygideon', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `tbl_agen`
--
ALTER TABLE `tbl_agen`
  ADD PRIMARY KEY (`agen_id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `tbl_barang_keluar`
--
ALTER TABLE `tbl_barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`);

--
-- Indexes for table `tbl_barang_masuk`
--
ALTER TABLE `tbl_barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `tbl_kode_pos`
--
ALTER TABLE `tbl_kode_pos`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `tbl_setor_barang`
--
ALTER TABLE `tbl_setor_barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_agen`
--
ALTER TABLE `tbl_agen`
  MODIFY `agen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_barang_keluar`
--
ALTER TABLE `tbl_barang_keluar`
  MODIFY `id_barang_keluar` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_barang_masuk`
--
ALTER TABLE `tbl_barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_kode_pos`
--
ALTER TABLE `tbl_kode_pos`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_setor_barang`
--
ALTER TABLE `tbl_setor_barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_setor_barang`
--
ALTER TABLE `tbl_setor_barang`
  ADD CONSTRAINT `tbl_setor_barang_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `tbl_barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
