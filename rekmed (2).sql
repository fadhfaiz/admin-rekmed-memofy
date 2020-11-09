-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2020 pada 10.17
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rekmed`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrasi`
--

CREATE TABLE `administrasi` (
  `ID` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ID_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `asesmen`
--

CREATE TABLE `asesmen` (
  `ID` int(11) NOT NULL,
  `nama_diagnosis` varchar(255) NOT NULL,
  `ID_pasien` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `asesmen`
--

INSERT INTO `asesmen` (`ID`, `nama_diagnosis`, `ID_pasien`, `created_at`) VALUES
(32, 'hepatitis A', 6, '2020-11-08 15:52:48'),
(33, 'fff', 6, '2020-11-08 15:52:50'),
(34, 'fff', 6, '2020-11-08 15:56:24'),
(35, 'hepatitis A', 6, '2020-11-08 15:56:24'),
(36, 'kjhs', 6, '2020-11-08 15:56:25'),
(37, 'sdfgkjd', 6, '2020-11-08 15:56:26'),
(38, 'sfds', 6, '2020-11-08 15:56:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `asesmen_terpilih`
--

CREATE TABLE `asesmen_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(255) NOT NULL COMMENT 'dari tabel asesmen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `asesmen_terpilih`
--

INSERT INTO `asesmen_terpilih` (`ID`, `value`) VALUES
(131, 'cacingan'),
(132, 'kencing batu'),
(133, 'hepatitis A'),
(134, 'hepatitis B'),
(135, 'hilang ingatan'),
(136, 'gak tau kenapa sakit aja'),
(167, 'fff'),
(168, 'kjhs'),
(169, 'sdfgkjd'),
(170, 'sfds');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosis`
--

CREATE TABLE `diagnosis` (
  `ID` int(11) NOT NULL,
  `ID_pasien` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `diagnosis`
--

INSERT INTO `diagnosis` (`ID`, `ID_pasien`, `diagnosis`, `created_at`) VALUES
(1, 6, 'hahaha', '2020-11-08 16:15:32'),
(2, 6, 'hihihi', '2020-11-08 16:15:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosis_terpilih`
--

CREATE TABLE `diagnosis_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `ID` int(11) NOT NULL,
  `no_str` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `kualifikasi` varchar(50) NOT NULL,
  `ID_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `objektif`
--
-- Kesalahan membaca struktur untuk tabel rekmed.objektif: #1932 - Table 'rekmed.objektif' doesn't exist in engine
-- Kesalahan membaca data untuk tabel rekmed.objektif: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `rekmed`.`objektif`' at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `ID` int(11) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`ID`, `NIK`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `no_telp`, `alamat`, `created_at`) VALUES
(6, '1234567899234523', 'intan destiyanti', 'Perempuan', '2020-11-06', '0874637537846', 'indramayu', '2020-11-08 14:50:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `plan`
--

CREATE TABLE `plan` (
  `ID` int(11) NOT NULL,
  `ID_pasien` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `ID` int(11) NOT NULL,
  `tekanan_darah` int(11) NOT NULL,
  `nadi` int(11) NOT NULL,
  `suhu` double NOT NULL,
  `berat_badan` int(11) NOT NULL,
  `tinggi_badan` int(11) NOT NULL,
  `respiration_rate` int(11) NOT NULL,
  `keluhan_utama` text NOT NULL,
  `tanggal_periksa` date NOT NULL,
  `subjective` text NOT NULL,
  `objective` text NOT NULL,
  `assessment` text NOT NULL,
  `plan` text NOT NULL,
  `ID_dokter` int(11) NOT NULL,
  `ID_admin` int(11) NOT NULL,
  `ID_resep` int(11) NOT NULL,
  `ID_pasien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_diagnostik`
--

CREATE TABLE `rencana_diagnostik` (
  `ID` int(11) NOT NULL,
  `nama_diagnosis` varchar(255) NOT NULL,
  `ID_plan` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rencana_diagnostik`
--

INSERT INTO `rencana_diagnostik` (`ID`, `nama_diagnosis`, `ID_plan`, `created_at`) VALUES
(1, 'cek darah', 0, '2020-11-08 14:42:02'),
(2, 'cek darah', 0, '2020-11-08 14:42:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_diagnostik_terpilih`
--

CREATE TABLE `rencana_diagnostik_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rencana_diagnostik_terpilih`
--

INSERT INTO `rencana_diagnostik_terpilih` (`ID`, `value`) VALUES
(40, 'plan diaghhh'),
(41, 'mkmkmkk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_edukasi`
--

CREATE TABLE `rencana_edukasi` (
  `ID` int(11) NOT NULL,
  `nama_edukasi` varchar(255) NOT NULL,
  `ID_plan` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_edukasi_terpilih`
--

CREATE TABLE `rencana_edukasi_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rencana_edukasi_terpilih`
--

INSERT INTO `rencana_edukasi_terpilih` (`ID`, `value`) VALUES
(10, 'asdf'),
(11, 'j'),
(12, 'hghg'),
(13, 'intan'),
(14, 'wahyu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_terapi`
--

CREATE TABLE `rencana_terapi` (
  `ID` int(11) NOT NULL,
  `nama_terapi` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `ID_plan` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_terapi_terpilih`
--

CREATE TABLE `rencana_terapi_terpilih` (
  `ID` int(11) NOT NULL,
  `nama_terapi` varchar(255) NOT NULL,
  `biaya_terapi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rencana_terapi_terpilih`
--

INSERT INTO `rencana_terapi_terpilih` (`ID`, `nama_terapi`, `biaya_terapi`) VALUES
(1, 'jgjgjg', 10000),
(2, 'faiz', 90000),
(3, 'wahyu', 12000),
(4, 'f', 9000),
(5, 'kkk', 999),
(6, 'asdf', 0),
(7, 'wkk', 988),
(8, 'whjwkh', 123),
(9, 'mmmm', 999),
(10, 'kfkf', 3222);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `ID` int(11) NOT NULL,
  `nama_resep` varchar(255) NOT NULL,
  `ID_plan` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_terpilih`
--

CREATE TABLE `resep_terpilih` (
  `ID` int(11) NOT NULL,
  `nama_resep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subjektif`
--

CREATE TABLE `subjektif` (
  `ID` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ID_pasien` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subjektif_terpilih`
--

CREATE TABLE `subjektif_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakan`
--

CREATE TABLE `tindakan` (
  `ID` int(11) NOT NULL,
  `ID_pasien` int(11) NOT NULL,
  `tindakan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tindakan`
--

INSERT INTO `tindakan` (`ID`, `ID_pasien`, `tindakan`, `created_at`) VALUES
(1, 6, 'jjjj', '2020-11-08 16:23:30'),
(2, 6, 'kkkk', '2020-11-08 16:23:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakan_terpilih`
--

CREATE TABLE `tindakan_terpilih` (
  `ID` int(11) NOT NULL,
  `value` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `asesmen`
--
ALTER TABLE `asesmen`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `asesmen_terpilih`
--
ALTER TABLE `asesmen_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `diagnosis_terpilih`
--
ALTER TABLE `diagnosis_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_diagnostik`
--
ALTER TABLE `rencana_diagnostik`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_diagnostik_terpilih`
--
ALTER TABLE `rencana_diagnostik_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_edukasi`
--
ALTER TABLE `rencana_edukasi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_edukasi_terpilih`
--
ALTER TABLE `rencana_edukasi_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_terapi`
--
ALTER TABLE `rencana_terapi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rencana_terapi_terpilih`
--
ALTER TABLE `rencana_terapi_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `resep_terpilih`
--
ALTER TABLE `resep_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `subjektif`
--
ALTER TABLE `subjektif`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `subjektif_terpilih`
--
ALTER TABLE `subjektif_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tindakan_terpilih`
--
ALTER TABLE `tindakan_terpilih`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `asesmen`
--
ALTER TABLE `asesmen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `asesmen_terpilih`
--
ALTER TABLE `asesmen_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `diagnosis_terpilih`
--
ALTER TABLE `diagnosis_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `plan`
--
ALTER TABLE `plan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rencana_diagnostik`
--
ALTER TABLE `rencana_diagnostik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rencana_diagnostik_terpilih`
--
ALTER TABLE `rencana_diagnostik_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `rencana_edukasi`
--
ALTER TABLE `rencana_edukasi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rencana_edukasi_terpilih`
--
ALTER TABLE `rencana_edukasi_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `rencana_terapi`
--
ALTER TABLE `rencana_terapi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rencana_terapi_terpilih`
--
ALTER TABLE `rencana_terapi_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resep_terpilih`
--
ALTER TABLE `resep_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subjektif`
--
ALTER TABLE `subjektif`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subjektif_terpilih`
--
ALTER TABLE `subjektif_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tindakan_terpilih`
--
ALTER TABLE `tindakan_terpilih`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
