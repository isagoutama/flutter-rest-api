-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2018 at 01:27 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter_mapel`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `id_pelajaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama_guru`, `id_pelajaran`) VALUES
(1, 'Pak Sarwadi', 1),
(2, 'Bu Eriati', 1),
(3, 'Bu Naimah', 1),
(4, 'Pak Sigit', 2),
(5, 'Bu Eni', 2),
(6, 'Mrs. Mia', 3),
(7, 'Mam Chandra', 3),
(8, 'Pak Gifar', 4),
(9, 'Bu Isti', 5),
(10, 'Bu Ning-sensei', 6),
(11, 'Bang Fariz', 7),
(12, 'Ka Lukman', 8),
(13, 'Pak Dadang', 8),
(14, 'Ka Arief', 9),
(15, 'Pak Aroh', 10),
(16, 'Pak Ruslan', 11),
(17, 'Pak Azwarmi', 12),
(18, 'Pak Ichsan', 13);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_mapel`
--

CREATE TABLE `jadwal_mapel` (
  `id` int(11) NOT NULL,
  `hari` varchar(255) NOT NULL,
  `id_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_mapel`
--

INSERT INTO `jadwal_mapel` (`id`, `hari`, `id_guru`) VALUES
(7, 'Kamis', 17),
(9, 'Senin', 18),
(13, 'Senin', 8),
(14, 'Rabu', 1),
(15, 'Jumat', 8),
(16, 'Selasa', 2),
(17, 'Jumat', 10),
(18, 'Selasa', 5),
(19, 'Rabu', 9),
(20, 'Senin', 6),
(23, 'Senin', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE `pelajaran` (
  `id` int(11) NOT NULL,
  `nama_pelajaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`id`, `nama_pelajaran`) VALUES
(1, 'Matematika'),
(2, 'Bahasa Indonesia'),
(3, 'Bahasa Inggris'),
(4, 'Agama Islam'),
(5, 'Sejarah'),
(6, 'Bahasa Jepang'),
(7, 'Pemrograman Java'),
(8, 'pemrograman Perangkat Bergerak'),
(9, 'Pemrograman Web'),
(10, 'Pemrograman Desktop'),
(11, 'Seni Budaya'),
(12, 'Kewirausahaan'),
(13, 'Fisika');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `pelajaran`
--
ALTER TABLE `pelajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
