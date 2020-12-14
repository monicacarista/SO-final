-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Des 2020 pada 12.51
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_apoteker`
--

CREATE TABLE `tbl_apoteker` (
  `id_apoteker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dtl_item`
--

CREATE TABLE `tbl_dtl_item` (
  `id_dtl_item` int(11) NOT NULL,
  `id_apotek` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `batch` varchar(6) NOT NULL,
  `stok` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_dtl_item`
--

INSERT INTO `tbl_dtl_item` (`id_dtl_item`, `id_apotek`, `id_item`, `batch`, `stok`, `exp_date`, `harga`) VALUES
(16, 13, 15, 'ID2223', 30, '2021-05-08', 2500),
(17, 0, 18, 'IO2222', 50, '2020-10-31', 30000),
(18, 0, 15, 'ID9090', 50, '2020-09-12', 50000),
(19, 0, 17, 'DP5689', 89, '2020-10-31', 35000),
(20, 0, 19, 'OU9099', 65, '2021-04-10', 55000),
(21, 0, 21, 'OIO768', 25, '2021-04-16', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dtl_jadwal`
--

CREATE TABLE `tbl_dtl_jadwal` (
  `id_dtl_jadwal` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `id_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_dtl_jadwal`
--

INSERT INTO `tbl_dtl_jadwal` (`id_dtl_jadwal`, `id`, `id_jadwal`, `id_item`) VALUES
(2, 2, 18, 17),
(3, 6, 18, 18),
(4, 2, 18, 17),
(5, 6, 18, 22),
(6, 2, 18, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_event_so`
--

CREATE TABLE `tbl_event_so` (
  `id_so` int(11) NOT NULL,
  `id_apotek` int(11) NOT NULL,
  `id_apoteker` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_berakhir` date NOT NULL,
  `periodeSO` varchar(150) NOT NULL,
  `total_selisih_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_event_so`
--

INSERT INTO `tbl_event_so` (`id_so`, `id_apotek`, `id_apoteker`, `tgl_mulai`, `tgl_berakhir`, `periodeSO`, `total_selisih_item`) VALUES
(20, 0, 2, '2020-10-27', '2020-10-28', 'Oktober 2020', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_item`
--

CREATE TABLE `tbl_item` (
  `id_item` int(11) NOT NULL,
  `kode_item` varchar(6) NOT NULL,
  `nama_item` varchar(150) NOT NULL,
  `satuan` varchar(128) NOT NULL,
  `lokasi_rak` varchar(150) NOT NULL,
  `item_barcode` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_item`
--

INSERT INTO `tbl_item` (`id_item`, `kode_item`, `nama_item`, `satuan`, `lokasi_rak`, `item_barcode`) VALUES
(15, 'ABC110', 'Vitamin', 'Tablet', '2a', ''),
(17, 'EOI256', 'Paracetamol', 'Tablet', '10a', ''),
(18, 'IOP990', 'Sanitizer', 'Botol', '3a', ''),
(19, 'IPI888', 'Cendoxytrol', 'Botol', '2a', ''),
(20, 'IOP990', 'Sangobion', 'Tablet', '3a', ''),
(21, '366547', 'Nuvo Gel', 'Tablet', '3a', ''),
(22, 'BNI289', 'Cendoxytrol', 'Botol', '10a', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_so` int(11) NOT NULL,
  `id_apoteker` int(11) NOT NULL,
  `jadwal_pengecekan` date NOT NULL,
  `id_item` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `id_so`, `id_apoteker`, `jadwal_pengecekan`, `id_item`) VALUES
(17, 31, 2, '2020-11-25', ''),
(19, 20, 6, '2020-11-11', '20'),
(20, 20, 2, '2020-11-02', '21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level_admin`
--

CREATE TABLE `tbl_level_admin` (
  `id_level` int(11) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_level_admin`
--

INSERT INTO `tbl_level_admin` (`id_level`, `level`) VALUES
(1, 'Admin'),
(2, 'Apoteker');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pencatatan`
--

CREATE TABLE `tbl_pencatatan` (
  `id_pencatatan` int(11) NOT NULL,
  `id_so` int(11) NOT NULL,
  `id_jadwal` date NOT NULL,
  `id_item` int(11) NOT NULL,
  `stok_tempat` int(11) NOT NULL,
  `id_dtl_item` varchar(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pencatatan`
--

INSERT INTO `tbl_pencatatan` (`id_pencatatan`, `id_so`, `id_jadwal`, `id_item`, `stok_tempat`, `id_dtl_item`, `id`) VALUES
(156, 20, '0000-00-00', 18, 2, '20', 0),
(159, 20, '0000-00-00', 20, 10, '21', 0),
(175, 0, '0000-00-00', 20, 10, '21', 0),
(176, 0, '0000-00-00', 18, 1, '20', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `roles` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `roles`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'admin', 'admin', 'admin'),
(2, 'monica', 'monica', 'monica@gmail.com', 'monica', 'monica', 'staff'),
(6, 'eva', 'eva', 'eva@gmail.com', 'eva', 'evaa', 'apoteker');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_admin`
--

CREATE TABLE `tbl_user_admin` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enkrip` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `inisial` varchar(10) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_admin`
--

INSERT INTO `tbl_user_admin` (`id_user`, `username`, `password`, `enkrip`, `email`, `inisial`, `deskripsi`, `id_level`) VALUES
(4, 'tesss', '991fb2561c6ab8af28eeb4137f587eef', '5f3f44c0c5bac0.36219763', 'monica@gmail.com', 'mon', 'adsasdassfafa', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(2, 'monica', 'monica', 'monica@gmail.com'),
(3, 'caris', 'caris', 'monicaa@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_apoteker`
--
ALTER TABLE `tbl_apoteker`
  ADD PRIMARY KEY (`id_apoteker`);

--
-- Indeks untuk tabel `tbl_dtl_item`
--
ALTER TABLE `tbl_dtl_item`
  ADD PRIMARY KEY (`id_dtl_item`);

--
-- Indeks untuk tabel `tbl_dtl_jadwal`
--
ALTER TABLE `tbl_dtl_jadwal`
  ADD PRIMARY KEY (`id_dtl_jadwal`);

--
-- Indeks untuk tabel `tbl_event_so`
--
ALTER TABLE `tbl_event_so`
  ADD PRIMARY KEY (`id_so`);

--
-- Indeks untuk tabel `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indeks untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `tbl_level_admin`
--
ALTER TABLE `tbl_level_admin`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tbl_pencatatan`
--
ALTER TABLE `tbl_pencatatan`
  ADD PRIMARY KEY (`id_pencatatan`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_user_admin`
--
ALTER TABLE `tbl_user_admin`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_apoteker`
--
ALTER TABLE `tbl_apoteker`
  MODIFY `id_apoteker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_dtl_item`
--
ALTER TABLE `tbl_dtl_item`
  MODIFY `id_dtl_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_event_so`
--
ALTER TABLE `tbl_event_so`
  MODIFY `id_so` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
