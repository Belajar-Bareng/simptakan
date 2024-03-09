-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2021 at 02:37 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simptaka_ta_simptaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `peran` enum('kepala','petugas','anggota') NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `password`, `peran`, `status`) VALUES
(1, 'admin', '$2y$10$y.W/LCQwfvzkJLctOhlrJ.XeRa3BYH1zkdQFqwfW8ME8UMVSZVnCi', 'kepala', 1),
(12, 'afriliana', '$2y$10$Eosa4MLK19VGlfki3Xskmup26hpSaXTBbVHuNIdrNfIM9S5nwMVpC', 'anggota', 2),
(13, 'Rizki', '$2y$10$45M5cTwpnZ.0l8TTWmb49OPNciy9X0tfWLZVthTxlQzxReHzlrOdS', 'anggota', 1),
(14, 'amelia', '$2y$10$3Fr2INjTPxqcMU45WjhftuVTsosuxheGk0bn1aSE2z6tvTisvhqz6', 'anggota', 1),
(15, 'annisa', '$2y$10$vDpWL/XPAx4Q6XqUa.70i.Nw2sTduhW6yjkSAf4T6BXt0i3QYrFQC', 'anggota', 1),
(16, 'anzalia', '$2y$10$Mc.HzwUFx9WgW.aWANlqv.1BlK2NnsjYoppC7owM9JO0H9SNkxJNi', 'anggota', 1),
(17, 'bella', '$2y$10$6/kW9qjfdqOGQ19pOngMl.MXku8kL6P7SpVJiJWPbfXaNGOSIlvl2', 'anggota', 1),
(18, 'divana', '$2y$10$GI4yoK4TGxLwQYqyM4mplOke6TFO7qrNoIPI9RttY6FhZ9vwk3w9i', 'anggota', 1),
(19, 'elsa', '$2y$10$oE35pmgdFvZxIND4AQOtL.j18XmEk0Qx7aX4TI29OPZs2Ovgzvuoi', 'anggota', 1),
(20, 'haris', '$2y$10$XAOFwyzfCN1qh9Ygwv55vuA9kZwQehcjEm8gHXJdbP5f0.7CyUnce', 'anggota', 1),
(21, 'inesya', '$2y$10$i2P45viYsLWOHihF5DVAt.CIj9JtRExHoD5e20xZ4RYnw5RMw6DjG', 'anggota', 1),
(22, 'khairunnisa', '$2y$10$0gSxnVFiJcnWlWOP3jFUpuy.g5oaM51y8trN0jGu2On11HK.x22I2', 'anggota', 1),
(23, 'laili', '$2y$10$svZH2rSJDvCfXUyKdDrkK..EKDupOjiMf2UHGasPtBbneCidKM9EO', 'anggota', 1),
(24, 'rezasurya', '$2y$10$JOOt2ab6uTf3PTDY17LQv.3Oh2rF2SVSIFVL5/NgzCUaqU.KSZX32', 'anggota', 1),
(25, 'mahfujatul', '$2y$10$vGZWK9e5yDG.IzadqEosG.6C6P5fNWex6pHrdkF7Mo3coZ36ix/nG', 'anggota', 1),
(26, 'marisasinta', '$2y$10$6CU5BVB.PEvEOOLR0t8GXuu12uGF2e1ClGvcT0r0PznrIjUyK9Dxm', 'anggota', 1),
(27, 'faqih', '$2y$10$dfcDq1PXqDOiwaa7RQEUOOwExI09xHQ8eCEpkxIDK7XbOLVYbLXrK', 'anggota', 1),
(28, 'fridiansyah', '$2y$10$rjilQhX5eDGUDri71IOYhuWl7qtGDLIvjfRadc8fgGE9.sI3cHug6', 'anggota', 1),
(29, 'rifaii', '$2y$10$90ms70aSsowNWHdbB8z54u2TuKrtiEDGYlddzAatUyyJVGquov4k6', 'anggota', 1),
(30, 'rifsan', '$2y$10$zsqBZqsKkLjhJ2grYxlw3uFW.127h87NFvqdjFMia8OKWq2xF0Kc2', 'anggota', 1),
(31, 'rizky', '$2y$10$2YXnvhLhnpAkZQf1fzbizOxfc4kxyUlRJQkUE/f1xLMvd5OsBuvka', 'anggota', 1),
(32, 'mutiah', '$2y$10$m0WTEMWMQUsxTnlaNSJk5O0b2v5X8PkwDNAGUxloCf8WYKI7uphp.', 'anggota', 1),
(33, 'naimatul', '$2y$10$JgPlXHVI69Tf/rPBqHC2tupk.uXkj7/9uUjWw6YZ9lTlAgbSZAwj6', 'anggota', 1),
(34, 'naufal', '$2y$10$d4NnzHK2kinuzRfAZsG6SeNJH1hX5372APYjQgEf79oAn.uA151Hq', 'anggota', 1),
(35, 'nazril', '$2y$10$3ihr84Hp3GGRNmlhWtxtp.E.MH5.sLc9jD5A66hG1O4srf6SpMNAi', 'anggota', 1),
(36, 'nova', '$2y$10$veccpbK5Uvjeq56B6I0S1uosLMiLZtTRT7Uo.Xw8WAoKgqD2cpdfO', 'anggota', 1),
(37, 'rafli', '$2y$10$k.K0CiRE/XYIJ2iPYw9CE.dVwS5BtpG6n6sIpfsJ8skqSzVMgwAPK', 'anggota', 1),
(39, 'rosa', '$2y$10$/V2TDE6AVipQ3U0aV.nhr.Dnodsw0tKIJ3eKBlHOd1pu6CZkZ/LUC', 'petugas', 1),
(40, 'dika123', '$2y$10$XpJPj9km3ofwcQcGaGIeTefEjXj63XaEuSFOT5LxM6XGwc.hmgt9W', 'anggota', 1),
(41, 'firli', '$2y$10$L2JAvA3N/SUDe1cOFk2wcu/Msdc4M69ihvrr59N3BQFON/8IP4t5i', 'anggota', 1),
(43, 'dika', '$2y$10$b7L/qXeGqnCutzU06V8gfeOI8NfZePNkNa8sQApCoxI6mYv.ClM0O', 'anggota', 1),
(47, 'audina', '$2y$10$ydENltxHJfYl9wcEcCVQpOkw8i2TBrJ5KrtA2hCvJjxhi7b5J/RNW', 'anggota', 1),
(48, 'haikal', '$2y$10$ceIZRMlscniIt2CwEnEuuOn1zqb.qvfRwuRvhnBhupNIP4tyS0766', 'anggota', 1),
(50, 'khairimhmdd', '$2y$10$TK0NqlkX46a6qubgXO1eYulj/QWHNaaYhT3FMuMF4PPJhItr3iMxm', 'anggota', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isbn` char(13) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `id_rak` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_klasifikasi` int(11) DEFAULT NULL,
  `id_penerbit` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `isbn`, `pengarang`, `tahun`, `id_rak`, `id_kategori`, `kode_klasifikasi`, `id_penerbit`, `jumlah`, `foto`, `tanggal`) VALUES
(31, 'Kompeten Berbahasa Indonesia Kelas XII', '9789790151727', 'Tim Edukatif', 2017, 2, 1, 5, 6, 0, 'buku_611fa632d1f873_92255208.jpg', '2021-08-20 19:44:10'),
(32, 'Matematika Kelompok Peminatan Matematika dan Ilmu Alam Kelas XI', '9786022987581', 'Sukino', 2017, 8, 1, 7, 6, 0, 'buku_612185b8b8a644_78511991.jpeg', '2021-08-21 17:06:48'),
(33, 'Biologi Peminatan Matematika dan Ilmu Alam Kelas XI', '9786022414704', 'Irnaningtyas, dkk', 2017, 18, 1, 7, 6, 31, 'buku_6121873a12c3b4_81388026.jpeg', '2021-08-21 17:09:54'),
(34, 'Kimia Peminatan Matematika dan ilmu Alam Kelas XI', '9786022414', 'Unggul Sudarmo, dkk', 2017, 1, 1, 7, 6, 33, 'buku_61218827051fd1_87831069.jpg', '2021-08-21 17:13:23'),
(35, 'Ekonomi K-13 Kelompok Peminatan Kelas XI', '9786022541769', 'Alam, dkk', 2017, 11, 1, 4, 6, 0, 'buku_6121ad15e8a093_77280716.jpg', '2021-08-21 17:16:04'),
(36, 'Fisika Peminatan Matematika dan Ilmu Alam Kelas XI', '9786022414667', 'Marthen Kanginan', 2017, 3, 1, 7, 6, 0, 'buku_6121ad79a10258_50887517.jpg', '2021-08-21 17:18:51'),
(37, 'Kimia Untuk SMA/MA Kelas XII', '9789790756236', 'Michael Purba dan Sunardi', 2017, 1, 1, 7, 6, 28, 'buku_61246959a25270_69555203.jpg', '2021-08-21 17:28:55'),
(38, 'Geografi Untuk SMA/MA Kelas XI', '9789790403', 'Bambang Niyanto Mulyo, dkk', 2017, 7, 1, 11, 7, 100, 'buku_6121af41838f49_22907753.JPG', '2021-08-21 17:30:49'),
(39, 'Sosiologi SMA Kelas XI', '978602299583', 'Yadi Mulyadi, dkk', 2017, 2, 1, 4, 8, 84, 'buku_6121b0ef5a9600_15648392.jpg', '2021-08-21 17:35:18'),
(40, 'Sejarah Kelas X K-13 (Peminatan)', '9786022988915', 'Ratna Hapsari dan M. Adil', 2021, 12, 1, 11, 6, 29, 'buku_6121b165b6b624_92640193.jpg', '2021-08-21 17:37:21'),
(41, 'Biologi Kelas XI K-13 Edisi Revisi (Peminatan)', '9786024341', 'Irnaningtyas dan Yossa Istiadi', 2017, 18, 1, 7, 6, 40, 'buku_6121b1f1359743_57221135.jpg', '2021-08-21 17:39:02'),
(42, 'Kimia Kelas XI K-13 Edisi Revisi (Peminatan)', '9786022988397', 'Unggul Sudarmo dan Nanik Mitayani', 2017, 1, 1, 7, 6, 39, 'buku_6121b2551f6075_79733894.jpg', '2021-08-21 17:41:23'),
(43, 'Ekonomi Kelas XI K-13 Edisi Revisi (Peminatan)', '9786022989', 'Alam dan Rudianto', 2017, 11, 1, 4, 6, 39, 'buku_6121b2ad04d709_76546570.jpg', '2021-08-21 17:43:50'),
(44, 'Belajar dan Mengajar', '9789795438946', 'Daryanto', 2017, 17, 6, 1, 2, 10, 'buku_6121b43b3bd6e9_10724098.jpg', '2021-08-21 18:01:28'),
(45, 'Inovasi Pembelajaran Efektif', '9789795438', 'Daryanto', 2017, 17, 6, 1, 9, 3, 'buku_6121b4aeb65182_09299836.jpg', '2021-08-21 18:03:01'),
(46, 'Katalisator Profesionalisme Pendidik', '9786023745', 'Moh. Samsul Hidayat', 2017, 17, 6, 7, 9, 3, 'buku_6121b6370781b0_31388220.jpg', '2021-08-21 18:05:47'),
(47, 'Menjadi Guru Hebat', '9786023746', 'Darma Jari dan E. J Kosasih', 2017, 17, 6, 1, 9, 3, 'buku_6121b85c30b964_52203149.jpg', '2021-08-21 18:17:34'),
(48, 'Referensi Yuridis (PER UU) Kurikulum 2013', '9786022775', 'Weinata Sairin', 2017, 17, 6, 2, 9, 3, 'buku_6121b930e1f066_85723870.jpg', '2021-08-21 18:19:38'),
(49, 'Strategi dan Tahapan Mengajar Bekal Bagi Guru', '9789795439', 'Daryanto', 2017, 17, 6, 1, 9, 3, 'buku_6121babdc12759_17137659.jpg', '2021-08-21 18:22:16'),
(50, 'Sukses Uji Kompetensi Guru + CD', '9786232052', 'Zainal Aqib', 2017, 17, 6, 1, 9, 0, 'buku_6121bc009845d5_42580754.jpg', '2021-08-21 18:27:29'),
(51, 'Bahasa Indonesia SMA-MA/SMK Kelas X', '9786023744', 'Yadi Mulyadi', 2017, 9, 1, 5, 9, 5, 'buku_6121bc4e6c2cf7_53178931.jpg', '2021-08-21 18:29:08'),
(52, 'Bahasa Inggris SMA-MA/SMK Kelas X', '9786023747', 'Otong Setiawan DJ dan Supeni', 2017, 10, 1, 5, 9, 5, 'buku_6121bc97e22ec1_58333211.jpg', '2021-08-21 18:30:58'),
(53, 'Matematika SMA-MA Kelas X', '9786023745', 'Suwah Sembiring dan Marsito', 2017, 8, 1, 7, 9, 1, 'buku_6121bce0a51a41_27168131.jpg', '2021-08-21 18:34:03'),
(54, 'Pendidikan Pancasila dan Kewarganegaraan SMA-MA/SMK kelas X', '9786023748', 'Muhammad Taupan dan Ine Ariyani', 2017, 16, 1, 2, 9, 5, 'buku_6121bd3e1e2eb4_12887580.jpg', '2021-08-21 18:39:20'),
(55, 'Pendidikan Agama Islam dan Budi Pekerti Untuk Siswa SMA-MA/SMK Kelas XI', '9786023745', 'Nurlailah dan Endang Zainal', 2017, 13, 1, 3, 9, 5, 'buku_6121bda44c6a17_41382163.jpg', '2021-08-21 18:45:13'),
(56, 'Seni Budaya Untuk SMA-MA/SMK-MAK Kelas X', '9786023744', 'Harry D. Fauzi dan Yadi Mulyadi', 2017, 14, 1, 9, 9, 5, 'buku_6121bde7bf95e8_15712109.jpg', '2021-08-21 19:06:44'),
(57, 'Penjas Orkes Untuk Siswa SMA-MA/SMK-MAK Kelas X', '9786022770800', 'Khairul Hadziq dan Anwar Musadad', 2017, 15, 1, 9, 9, 4, 'buku_6121be3de17a58_64355652.jpg', '2021-08-22 07:11:36'),
(58, 'Penjas Orkes Untuk Siswa SMA-MA/SMK-MAK Kelas XI', '9786022770824', 'Khairul Hadziq dan Anwar Musadad', 2017, 15, 1, 9, 9, 4, 'buku_6121be7a4c2763_03768973.jpg', '2021-08-22 07:14:37'),
(59, 'Langkah Awal Meraih Medali Emas Olimpiade Matematika SMA', '9786023742', 'Muhammad Idris, dkk', 2017, 17, 6, 7, 9, 3, 'buku_6121bee06bbb09_54968918.jpg', '2021-08-22 07:17:56'),
(60, 'Pena Emas OSN Fisika SMA', '9786022774488', 'Marthen Kanginan', 2017, 17, 6, 7, 9, 3, 'buku_6121bf1964c950_68438956.jpg', '2021-08-22 07:21:10'),
(61, 'Latihan Soal dan Solusi Internasional Biology Olympiad', '9786022776819', 'TOBI', 2017, 17, 6, 7, 9, 3, 'buku_6121bf92223934_39694961.jpg', '2021-08-22 07:26:30'),
(62, 'Pena Emas OSN Ekonomi dan Olimpiade Pasar Modal', '9786023742158', 'Wuj Purwanta dan Prathama Rahardja', 2017, 17, 6, 4, 9, 3, 'buku_6121bff1924873_44274879.jpg', '2021-08-22 07:29:51'),
(63, 'Buku Guru Peminatan Fisika Kelas XI K-13', '9786023743', 'Indarti, dkk', 2017, 3, 1, 7, 2, 1, 'buku_6121c0d8d39f71_82307837.jpg', '2021-08-22 07:33:52'),
(64, 'Buku Guru Peminatan Matematika Kelas XI K-13', '9786023743', 'Suparmin, dkk', 2017, 8, 1, 7, 2, 2, 'buku_6121c1465502a6_61653591.jpg', '2021-08-22 07:38:34'),
(65, 'Buku Guru Peminatan Sejarah Kelas XI K-13', '9786023449927', 'Indah Sawitri', 2017, 12, 1, 11, 2, 2, 'buku_6121c19b47b8f1_29537585.jpg', '2021-08-22 07:41:38'),
(66, '26 Kiat Merebut Hati Pria', '9789791234719', 'Adil Fathi', 2018, 17, 3, 10, 10, 1, 'buku_6121c3a517c143_89627491.jpg', '2021-08-22 07:48:24'),
(68, 'Pemrograman', '123456789', 'Adika', 2021, 2, 1, 3, 1, 5, 'buku_612836a63d6270_59233311.jpg', '2021-08-27 07:48:39'),
(69, 'Kimia Peminatan', '9789790151', 'Aji Hidayat', 2021, 1, 1, 4, 3, 70, NULL, '2021-09-04 16:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `buku_keluar`
--

CREATE TABLE `buku_keluar` (
  `id_pengeluaran` int(11) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku_keluar`
--

INSERT INTO `buku_keluar` (`id_pengeluaran`, `tanggal`, `id_buku`, `jumlah`, `keterangan`) VALUES
(1, '2021-08-12 14:09:46', 4, 20, 'Buka rusak'),
(2, '2021-08-12 14:11:39', 4, 12, 'Tebakar'),
(3, '2021-08-15 11:47:20', 16, 5, 'Buku Robek'),
(4, '2021-08-22 11:40:42', 36, 3, 'Buku rusak'),
(5, '2021-08-27 07:50:22', 68, 5, 'Buku Robek'),
(6, '2021-09-04 16:35:45', 69, 10, 'Buku Robek');

--
-- Triggers `buku_keluar`
--
DELIMITER $$
CREATE TRIGGER `buku_keluar` AFTER INSERT ON `buku_keluar` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah-NEW.jumlah
    WHERE buku.id_buku=NEW.id_buku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `id_ebook` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `isbn` char(13) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `berkas` varchar(255) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`id_ebook`, `judul`, `isbn`, `pengarang`, `tahun`, `foto`, `berkas`, `tanggal`) VALUES
(1, 'Istiqomah Merawat Indonesia', '9786027807686', 'Isman Muayyad, Inayah Adi Oktavia, Andi Aulia Rahman,  dkk.', 2017, 'ebook_61221c1d2fd0f0_20103509.jpg', 'ebook_61221bbe4430b1_52343887.pdf', '2021-08-22 16:41:18'),
(2, 'Aisyah', '9789791479899', 'Sibel Eraslan', 2015, 'ebook_612229cf5e8702_06990357.jpg', 'ebook_612229cf6111b2_29047027.pdf', '2021-08-22 17:41:19'),
(3, 'Matematika Edisi Revisi 2014 SMA/MA kelas X Semester 2', '9786022824916', ' Bornok Sinaga, Pardomuan N.J.M. Sinambela, dkk', 2014, 'ebook_612236fc8be031_57038666.jpg', 'ebook_612236fc8dc9a8_58561776.pdf', '2021-08-22 18:37:32'),
(4, 'Kimia untuk SMA/MA kelas XII', '9789790687318', 'Wening Sukmanawati', 2009, 'ebook_612240473e2e44_12984446.jpg', 'ebook_612240474514a6_14156123.pdf', '2021-08-22 19:17:11'),
(5, 'Jurnal Pembuatan Sistem Informasi  Perpustakaan Berbasis Website Pada Sekolah Menengah  Pertama Negeri 1 Donorojo Kabupaten Pacitan', '23546654', 'Dani Eko Handrianto', 2014, 'ebook_6122445ba0dc04_20685871.jpg', 'ebook_6122445ba3d510_46552080.pdf', '2021-08-22 19:34:35'),
(6, 'Fisika XI', '9786023449941', 'Adika', 2021, 'ebook_61283719c1f857_81196938.jpg', 'ebook_61283719c26195_93407595.pdf', '2021-08-27 07:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `keterangan`) VALUES
(1, 'Pelajaran', ''),
(2, 'Novel', ''),
(3, 'Fiksi', ''),
(6, 'Non Fiksi', '');

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi`
--

CREATE TABLE `klasifikasi` (
  `kode_klasifikasi` int(10) NOT NULL,
  `nmr_klasifikasi` varchar(10) NOT NULL,
  `klasifikasi` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klasifikasi`
--

INSERT INTO `klasifikasi` (`kode_klasifikasi`, `nmr_klasifikasi`, `klasifikasi`, `keterangan`) VALUES
(1, '000.1', '000', 'Komputer, Informasi dan Referensi Umum'),
(2, '100', '100', 'Filsafat dan psikologi'),
(3, '200', '200', 'Agama'),
(4, '300', '300', 'Ilmu Sosial'),
(5, '400', '400', 'Bahasa'),
(7, '500', '500', 'Sains dan Matematika'),
(8, '600', '600', 'Teknologi'),
(9, '700', '700', 'Kesenian dan Rekreasi'),
(10, '800', '800', 'Sastra'),
(11, '900', '900', 'Sejarah dan Geografi'),
(12, '300.10', '300', 'Ilmu Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `created_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_akun` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`created_at`, `id`, `id_akun`, `token`) VALUES
('0000-00-00 00:00:00', 2, 42, '8f7b36b1ef2a1145b9b44c8fac9236084c8dd005a9bba9374085cb215a6c333439bd5db733d171521f465ac294938db1110534e2455b397e84bf4677555402ed'),
('0000-00-00 00:00:00', 3, 43, '0328d07db1f413948be47fae0994c9b934c17fc2b1f676dd49afdd718864c4c16caa4042c4471fa2457eccbcc33f4dc68ae7dc20491297da4f65e667a2a13903'),
('0000-00-00 00:00:00', 5, 48, '03fd61499720ad17a0fd280e8c90b63b9d2d8548ec0eb06f986dd9cd201e2ea5410d4f098e2cd04e04a7b2514d2686bee52dfd4b62fc193707ccd9f040bf2366');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_peminjaman` int(11) NOT NULL,
  `nis` varchar(15) DEFAULT NULL,
  `nama` int(11) DEFAULT NULL,
  `tanggal_pinjam` datetime DEFAULT current_timestamp(),
  `tanggal_tenggat` datetime DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`no_peminjaman`, `nis`, `nama`, `tanggal_pinjam`, `tanggal_tenggat`, `keterangan`) VALUES
(1, '08', NULL, '2021-08-22 10:28:17', '2021-08-25 00:00:00', ''),
(2, '02', NULL, '2021-08-22 10:28:38', '2021-08-25 00:00:00', ''),
(3, '15', NULL, '2021-08-22 10:32:33', '2021-08-25 00:00:00', ''),
(4, '08', NULL, '2021-08-22 10:39:57', '2021-08-20 00:00:00', ''),
(5, '01', NULL, '2021-08-22 15:56:34', '2021-08-25 00:00:00', ''),
(6, '08', NULL, '2021-08-27 07:47:09', '2021-08-31 00:00:00', ''),
(7, '08', NULL, '2021-08-27 07:54:37', '2021-08-30 00:00:00', ''),
(8, '01', NULL, '2021-08-27 08:05:02', '2021-08-30 00:00:00', ''),
(9, '011', NULL, '2021-08-27 08:06:07', '2021-08-30 00:00:00', ''),
(10, '02', NULL, '2021-08-27 08:07:51', '2021-08-30 00:00:00', ''),
(11, '01', NULL, '2021-08-27 17:58:39', '2021-08-30 00:00:00', ''),
(12, '08', NULL, '2021-08-29 19:19:52', '2021-09-25 00:00:00', ''),
(13, '08', NULL, '2021-08-29 21:38:39', '2021-09-30 00:00:00', ''),
(14, '08', NULL, '2021-08-29 21:47:30', '2021-10-16 00:00:00', ''),
(15, '01', NULL, '2021-08-30 13:40:33', '2021-09-26 00:00:00', ''),
(16, '01', NULL, '2021-08-31 13:57:51', '2021-09-03 00:00:00', ''),
(17, '010', NULL, '2021-08-31 14:05:11', '2021-09-03 00:00:00', ''),
(18, '107', NULL, '2021-08-31 14:07:37', '2021-09-17 00:00:00', ''),
(19, '107', NULL, '2021-08-31 14:39:49', '2021-09-30 00:00:00', ''),
(20, '107', NULL, '2021-08-31 16:12:12', '2021-09-03 00:00:00', ''),
(21, '107', NULL, '2021-08-31 16:12:37', '2021-09-03 00:00:00', ''),
(22, '08', NULL, '2021-08-31 16:13:13', '2021-09-03 00:00:00', ''),
(23, '08', NULL, '2021-08-31 16:16:20', '2021-09-03 00:00:00', ''),
(24, '011', NULL, '2021-08-31 16:19:09', '2021-09-03 00:00:00', ''),
(25, '98', NULL, '2021-08-31 21:01:16', '2021-09-30 00:00:00', ''),
(26, '03', NULL, '2021-09-01 04:08:19', '2021-09-04 00:00:00', ''),
(27, '56', NULL, '2021-09-01 04:56:53', '2021-09-04 00:00:00', ''),
(28, '60', NULL, '2021-09-01 06:35:06', '2021-09-04 00:00:00', ''),
(29, '98', NULL, '2021-09-01 12:59:37', '2021-09-04 00:00:00', ''),
(30, '011', NULL, '2021-09-04 16:29:18', '2021-09-17 00:00:00', ''),
(31, '010', NULL, '2021-09-04 16:40:34', '2021-09-07 00:00:00', ''),
(32, '198', NULL, '2021-09-04 16:48:02', '2021-09-17 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id_peminjaman` int(11) NOT NULL,
  `no_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `denda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman_detail`
--

INSERT INTO `peminjaman_detail` (`id_peminjaman`, `no_peminjaman`, `id_buku`, `tanggal_kembali`, `denda`) VALUES
(1, 1, 36, '2021-08-22 10:33:13', 0),
(2, 2, 33, '2021-08-22 10:33:21', 0),
(3, 3, 37, '2021-08-22 10:38:10', 0),
(4, 4, 46, '2021-08-22 10:40:10', 1000),
(5, 5, 41, '2021-08-29 07:47:24', 2000),
(6, 6, 31, NULL, NULL),
(7, 7, 53, NULL, NULL),
(8, 8, 32, NULL, NULL),
(9, 8, 32, NULL, NULL),
(10, 8, 32, NULL, NULL),
(11, 9, 32, NULL, NULL),
(12, 9, 32, NULL, NULL),
(13, 9, 32, NULL, NULL),
(14, 10, 36, NULL, NULL),
(15, 10, 36, NULL, NULL),
(16, 10, 36, NULL, NULL),
(17, 11, 50, NULL, NULL),
(18, 11, 50, NULL, NULL),
(19, 11, 50, NULL, NULL),
(20, 12, 37, '2021-08-29 21:37:15', 0),
(21, 13, 53, NULL, NULL),
(22, 14, 43, NULL, NULL),
(23, 15, 36, NULL, NULL),
(24, 16, 32, NULL, NULL),
(25, 17, 35, '2021-09-04 03:23:51', 500),
(26, 18, 34, '2021-08-31 14:39:22', 0),
(27, 19, 37, NULL, NULL),
(28, 20, 33, NULL, NULL),
(29, 20, 33, NULL, NULL),
(30, 21, 34, NULL, NULL),
(31, 22, 33, NULL, NULL),
(32, 22, 33, NULL, NULL),
(33, 23, 39, NULL, NULL),
(34, 24, 36, NULL, NULL),
(35, 25, 37, '2021-09-01 12:55:05', 0),
(36, 26, 37, NULL, NULL),
(37, 27, 34, NULL, NULL),
(38, 28, 42, NULL, NULL),
(39, 29, 40, NULL, NULL),
(40, 30, 34, '2021-09-04 16:32:38', 0),
(41, 31, 69, '2021-09-04 16:41:07', 0),
(42, 32, 35, NULL, NULL);

--
-- Triggers `peminjaman_detail`
--
DELIMITER $$
CREATE TRIGGER `meminjam_buku` AFTER INSERT ON `peminjaman_detail` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah-1
    WHERE buku.id_buku=NEW.id_buku
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mengembalikan_buku` AFTER UPDATE ON `peminjaman_detail` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah+1
    WHERE buku.id_buku=NEW.id_buku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`, `alamat`, `no_telp`, `keterangan`) VALUES
(1, 'Intan Pariwara', 'Alamat: Jl. Ki Hajar Dewantoro Kotak Pos 111 Klaten 57438', '(0272) 322441', ''),
(2, 'Mediatama', 'Jl. Adi Sumarmo No.51, Krobyongan, Gawanan, Kec. Colomadu, Kabupaten Karanganyar, Jawa Tengah 57173', '(0271) 734088', ''),
(3, 'Tiga Serangkai', 'Jl. Dr Supomo no.23 Solo', '0271 646 994', ''),
(6, 'Erlangga', 'Jl. H. Baping Raya No. 100 Ciracas Jakarta 13740', '(021) 8717006', ''),
(7, 'Jatra Graphic', 'Jalan Professor Doktor Supomo No.23 Sriwedari Kecamatan Laweyan Kota Surakarta Jawa Tengah 57141 Indonesia', '(0271) 714344', ''),
(8, 'Yudhistira', 'Jl. Waru No. 20-B, Rawamangun Jakarta Timur 13220', '0251-8240628', ''),
(9, 'Yrama Widya', 'Jl. Permai 28 komplek Margahayu Permai No.100, Mekar Rahayu, Kec. Margaasih, Bandung, Jawa Barat 40218', '(022) 5403518', ''),
(10, 'Mirqat ', ' JL. Cipinang Muara II, No. 29 H RT.01/02, Cipinang Muara, RT.4/RW.4, Klender, Kec. Duren Sawit, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13420', '(021) 68528195', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan`
--

CREATE TABLE `pengadaan` (
  `id_pengadaan` int(11) NOT NULL,
  `no_inventaris` varchar(50) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `sumber` varchar(50) DEFAULT NULL,
  `pemasok` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengadaan`
--

INSERT INTO `pengadaan` (`id_pengadaan`, `no_inventaris`, `tanggal`, `sumber`, `pemasok`, `keterangan`) VALUES
(1, '', '2021-08-12 13:33:16', 'Sumbangan', 'Dinas Provinsi', ''),
(2, '', '2021-08-12 13:35:11', 'Pembelian', '-', ''),
(3, '', '2021-08-12 13:52:36', 'Pembelian', '', ''),
(4, '', '2021-08-12 13:53:24', 'Sumbangan', '', ''),
(5, '', '2021-08-15 11:37:40', 'Pembelian', 'Dinas Provinsi', ''),
(6, '', '2021-08-18 10:09:43', 'Sumbangan', 'Dinas Pendidikan Provinsi', ''),
(7, '9213/PS13/3/2017', '2021-08-20 19:44:10', 'Hadiah', '', ''),
(8, '9215-9249/PS13/4/2017', '2021-08-21 17:06:48', 'Hadiah', '', ''),
(9, '9250-9284/PS13/4/2017', '2021-08-21 17:09:54', 'Hadiah', '', ''),
(10, '9285-9319/PS13/4/2017', '2021-08-21 17:13:23', 'Hadiah', '', ''),
(11, '9320-9352/PS13/4/2017', '2021-08-21 17:16:04', 'Hadiah', '', ''),
(12, '9353-9364/PS13/4/2017', '2021-08-21 17:18:51', 'Hadiah', '', ''),
(13, '9365-9394/PS13/7/2017', '2021-08-21 17:28:55', 'Hadiah', '', ''),
(14, '9395-9504/PS13/7/2017', '2021-08-21 17:30:49', 'Hadiah', '', ''),
(15, '9505-9609/PS13/7/2017', '2021-08-21 17:35:18', 'Hadiah', '', ''),
(16, '9610-9639/PS13/8/2017', '2021-08-21 17:37:21', 'Hadiah', '', ''),
(17, '9640-9681/PS13/8/2017', '2021-08-21 17:39:02', 'Hadiah', '', ''),
(18, '9682-9721/PS13/8/2017', '2021-08-21 17:41:23', 'Hadiah', '', ''),
(19, '9722-9761/PS13/8/2017', '2021-08-21 17:43:50', 'Hadiah', '', ''),
(20, '10.050-10.052/PS13/12/2017', '2021-08-21 18:01:28', 'Hadiah', '', ''),
(21, '10.053-10.055/PS13/12/2017', '2021-08-21 18:03:01', 'Hadiah', '', ''),
(22, '10.056-10.058/PS13/12/2017', '2021-08-21 18:05:47', 'Hadiah', '', ''),
(23, '10.059-10.061/PS13/12/2017', '2021-08-21 18:17:34', 'Hadiah', '', ''),
(24, '10.062-10.064/PS13/12/2017', '2021-08-21 18:19:38', 'Hadiah', '', ''),
(25, '10.065-10.067/PS13/12/2017', '2021-08-21 18:22:16', 'Hadiah', '', ''),
(26, '10.068-10.070/PS13/12/2017', '2021-08-21 18:27:29', 'Hadiah', '', ''),
(27, '10.071-10.075/PS13/12/2017', '2021-08-21 18:29:08', 'Hadiah', '', ''),
(28, '10.076-10.080/PS13/12/2017', '2021-08-21 18:30:58', 'Hadiah', '', ''),
(29, '10.081-10.083/PS13/12/2017', '2021-08-21 18:34:03', 'Hadiah', '', ''),
(30, '10.092-10.096/PS13/12/2017', '2021-08-21 18:39:20', 'Hadiah', '', ''),
(31, '10.097-10.101/PS13/12/2017', '2021-08-21 18:45:13', 'Hadiah', '', ''),
(32, '10.107-10.111/PS13/12/2017', '2021-08-21 19:06:44', 'Hadiah', '', ''),
(33, '10.112-10.115/PS13/12/2017', '2021-08-22 07:11:36', 'Hadiah', 'Pemberian Provinsi', ''),
(34, '10.116-10.119/PS13/12/2017', '2021-08-22 07:14:37', 'Hadiah', 'Pemberian Provinsi', ''),
(35, '10.120-10.122/PS13/12/2017', '2021-08-22 07:17:56', 'Hadiah', 'Pemberian Provinsi', ''),
(36, '10.123-10.125/PS13/12/2017', '2021-08-22 07:21:10', 'Hadiah', 'Pemberian Provinsi', ''),
(37, '10.126-10.128/PS13/12/2017', '2021-08-22 07:26:30', 'Hadiah', 'Pemberian Provinsi', ''),
(38, '10.129-10.131/PS13/12/2017', '2021-08-22 07:29:51', 'Hadiah', '', ''),
(39, '10.134/PS13/9/2017', '2021-08-22 07:33:52', 'Pembelian', 'Dana BOS 2017', ''),
(40, '10.132-10.133/PS13/9/2017', '2021-08-22 07:38:34', 'Pembelian', 'Dana BOS 2017', ''),
(41, '10.135-10.136/PS13/9/2017', '2021-08-22 07:41:38', 'Pembelian', 'Dana BOS 2017', ''),
(42, '10.164/PS13/3/2018', '2021-08-22 07:48:24', 'Hadiah', 'Dinas Pendidikan Provinsi Kalsel', ''),
(44, '12345', '2021-08-27 07:48:39', 'Hadiah', 'Dinas Pendidikan Provinsi', ''),
(45, '9213/PS13/3/2017', '2021-09-04 16:33:53', 'Pembelian', 'Dinas Pendidikan Provinsi', '-');

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan_detail`
--

CREATE TABLE `pengadaan_detail` (
  `id_pengadaan_detail` int(11) NOT NULL,
  `id_pengadaan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengadaan_detail`
--

INSERT INTO `pengadaan_detail` (`id_pengadaan_detail`, `id_pengadaan`, `id_buku`, `jumlah`, `harga`) VALUES
(1, 1, 2, 100, 0),
(2, 2, 3, 20, 0),
(3, 3, 4, 200, 0),
(4, 4, 5, 40, 60000),
(5, 5, 25, 80, 50000),
(6, 6, 29, 200, 0),
(7, 6, 30, 40, 0),
(8, 7, 31, 1, 0),
(9, 8, 32, 35, 97000),
(10, 9, 33, 35, 100000),
(11, 10, 34, 35, 95000),
(12, 11, 35, 35, 80000),
(13, 12, 36, 12, 162000),
(14, 13, 37, 30, 98000),
(15, 14, 38, 100, 0),
(16, 15, 39, 85, 0),
(17, 16, 40, 30, 88000),
(18, 17, 41, 40, 100000),
(19, 18, 42, 40, 95000),
(20, 19, 43, 40, 80000),
(21, 20, 44, 3, 63600),
(22, 21, 45, 3, 165000),
(23, 22, 46, 3, 146700),
(24, 23, 47, 3, 78900),
(25, 24, 48, 3, 6066000),
(26, 25, 49, 3, 75600),
(27, 26, 50, 3, 170000),
(28, 27, 51, 5, 413000),
(29, 28, 52, 5, 283000),
(30, 29, 53, 3, 224100),
(31, 30, 54, 5, 351000),
(32, 31, 55, 5, 402000),
(33, 32, 56, 5, 357000),
(34, 33, 57, 4, 231000),
(35, 34, 58, 4, 240000),
(36, 35, 59, 3, 187000),
(37, 36, 60, 3, 330900),
(38, 37, 61, 3, 407100),
(39, 38, 62, 3, 454200),
(40, 39, 63, 1, 93000),
(41, 40, 64, 2, 132000),
(42, 41, 65, 2, 177000),
(43, 42, 66, 1, 19000),
(44, 43, 67, 5, 12000),
(45, 44, 68, 10, 12000),
(46, 45, 69, 80, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id_pengunjung` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp(),
  `nis` varchar(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` varchar(15) DEFAULT NULL,
  `keperluan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id_pengunjung`, `tanggal`, `nis`, `nama`, `kelas`, `keperluan`) VALUES
(2, '2021-08-13 12:39:26', '8947365', 'Amat', 'XI-IA', 'Mau Liat Buku'),
(3, '2021-08-13 12:44:40', '9876543', 'Firli Darmawan', 'XII-IS', 'Masuk sebagai Anggota'),
(4, '2021-08-14 01:15:11', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(5, '2021-08-15 03:53:03', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(6, '2021-08-15 03:55:36', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(7, '2021-08-15 03:56:18', '145678986', 'Anna', 'XII-Mipa 3', 'Mau Liat Buku'),
(8, '2021-08-17 06:54:42', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(9, '2021-08-17 07:00:10', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(10, '2021-08-19 10:32:49', '145678', 'Muhamad Khairi', 'XII-A', 'Mengerjakan Tugas'),
(11, '2021-08-19 10:34:50', 'C030318074', 'Adika Rezki Annafi', 'XII-IS', 'Masuk sebagai Anggota'),
(12, '2021-08-21 23:08:07', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(13, '2021-08-21 23:09:03', 'C123456', 'Hairi', 'XII IA', 'Mengerjakan Tugas'),
(14, '2021-08-21 23:11:54', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(15, '2021-08-22 02:23:35', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(16, '2021-08-22 04:16:02', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(17, '2021-08-22 12:17:39', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(18, '2021-08-24 04:07:11', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(19, '2021-08-24 04:09:20', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(20, '2021-08-24 11:09:53', '56', 'MUHAMMAD RAFLI NURIN', 'XII IPS 3', 'Masuk sebagai Anggota'),
(21, '2021-08-27 00:53:33', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(22, '2021-08-27 00:55:48', 'C030318078', 'Muhamad Khairi', 'XII-IS', 'Mau membaca buku'),
(23, '2021-08-28 23:18:37', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(24, '2021-08-28 23:24:12', '02', 'Ahmad Rizki Darmawan', 'XII IPA 1', 'Masuk sebagai Anggota'),
(25, '2021-08-29 00:51:57', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(26, '2021-08-29 00:59:59', '01', 'Afriliana Tri Hartika', 'XII IPA 1', 'Masuk sebagai Anggota'),
(27, '2021-08-29 01:47:47', '01', 'Afriliana Tri Hartika', 'XII IPA 1', 'Masuk sebagai Anggota'),
(28, '2021-08-29 12:19:34', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(29, '2021-08-29 14:18:11', '01', 'Afriliana Tri Hartika', 'XII IPA 1', 'Masuk sebagai Anggota'),
(30, '2021-08-29 14:20:44', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(31, '2021-08-29 14:32:34', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(32, '2021-08-30 07:16:53', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(33, '2021-08-31 02:55:28', '57', 'Firli Darmawan', 'XI-IA 2', 'Masuk sebagai Anggota'),
(34, '2021-08-31 03:49:16', '114', 'Muhamad Khairi', 'XII-IA 2', 'Masuk sebagai Anggota'),
(35, '2021-08-31 03:53:10', '214', 'Adika Rezki Annafi', 'XII-IA 2', 'Masuk sebagai Anggota'),
(36, '2021-08-31 07:07:21', '107', 'Audina Indriani', 'XII IPA 1', 'Masuk sebagai Anggota'),
(37, '2021-08-31 07:08:22', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(38, '2021-08-31 07:10:00', '107', 'Audina Indriani', 'XII IPA 1', 'Masuk sebagai Anggota'),
(39, '2021-08-31 07:11:16', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(40, '2021-08-31 07:39:36', '107', 'Audina Indriani', 'XII IPA 1', 'Masuk sebagai Anggota'),
(41, '2021-08-31 09:12:56', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(42, '2021-08-31 09:23:24', '79', 'Audina Indriani', 'XII-IA 5', 'Masuk sebagai Anggota'),
(43, '2021-08-31 09:27:05', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(44, '2021-08-31 14:00:48', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(45, '2021-08-31 14:03:20', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(46, '2021-08-31 14:04:33', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(47, '2021-08-31 14:11:44', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(48, '2021-08-31 14:21:39', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(49, '2021-08-31 14:36:56', '01', 'Afriliana Tri Hartika', 'XII IPA 1', 'Masuk sebagai Anggota'),
(50, '2021-08-31 14:37:34', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(51, '2021-08-31 14:37:40', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(52, '2021-08-31 20:42:57', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(53, '2021-08-31 20:44:00', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(54, '2021-08-31 20:44:58', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(55, '2021-08-31 20:53:56', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(56, '2021-08-31 20:58:02', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(57, '2021-08-31 21:09:06', '03', 'Amelia Suri', 'XII IPA 1', 'Masuk sebagai Anggota'),
(58, '2021-08-31 21:09:37', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(59, '2021-08-31 21:10:33', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(60, '2021-08-31 21:38:05', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(61, '2021-08-31 21:49:54', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(62, '2021-08-31 21:56:22', '56', 'MUHAMMAD RAFLI NURIN', 'XII IPS 3', 'Masuk sebagai Anggota'),
(63, '2021-08-31 22:09:16', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(64, '2021-08-31 22:40:45', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(65, '2021-08-31 22:48:11', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(66, '2021-08-31 22:51:31', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(67, '2021-08-31 23:00:41', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(68, '2021-08-31 23:02:43', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(69, '2021-08-31 23:34:39', '60', 'Haikal', 'Ips x', 'Masuk sebagai Anggota'),
(70, '2021-08-31 23:37:12', '60', 'Haikal', 'Ips x', 'Masuk sebagai Anggota'),
(71, '2021-08-31 23:38:54', '60', 'Haikal', 'Ips x', 'Masuk sebagai Anggota'),
(72, '2021-08-31 23:39:15', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(73, '2021-08-31 23:55:32', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(74, '2021-09-01 00:21:25', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(75, '2021-09-01 01:40:21', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(76, '2021-09-01 02:34:20', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(77, '2021-09-01 02:37:17', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(78, '2021-09-01 05:19:31', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(79, '2021-09-01 05:54:17', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(80, '2021-09-01 05:55:55', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(81, '2021-09-01 07:29:29', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(82, '2021-09-01 07:30:32', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(83, '2021-09-01 07:55:05', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(84, '2021-09-01 08:04:53', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(85, '2021-09-01 10:49:32', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(86, '2021-09-02 04:15:47', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(87, '2021-09-02 11:19:32', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(88, '2021-09-02 21:51:12', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(89, '2021-09-03 20:19:40', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(90, '2021-09-03 20:22:10', '08', 'Elsa Marisa', 'XII IPA 1', 'Masuk sebagai Anggota'),
(91, '2021-09-04 05:09:13', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(92, '2021-09-04 05:09:37', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(93, '2021-09-04 09:13:56', '98', 'Audina Indriani', 'XII-IA 2', 'Masuk sebagai Anggota'),
(94, '2021-09-04 09:46:29', '198', 'Muhamad Khairiiii', 'XII IPA 1', 'Masuk sebagai Anggota'),
(95, '2021-09-04 09:50:08', '198', 'Muhamad Khairiiii', 'XII IPA 1', 'Masuk sebagai Anggota'),
(96, '2021-09-04 09:51:30', '198', 'Muhamad Khairiiii', 'XII IPA 1', 'Masuk sebagai Anggota'),
(97, '2021-09-04 09:55:02', '198', 'Muhamad Khairiiii', 'XII IPA 1', 'Masuk sebagai Anggota'),
(98, '2021-09-04 09:55:47', 'C030318066', 'Adika Rezki Annafi', 'XII IPA 1', 'Mau Liat Buku');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jabatan` enum('Kepala','Petugas') NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `nip`, `jenis_kelamin`, `no_telp`, `alamat`, `jabatan`, `foto`, `id_akun`) VALUES
(1, 'Nurhidayah', '198503232009032012', 'L', NULL, NULL, 'Kepala', 'IMG_20210825_111738.jpg', 1),
(9, 'Rosa Lina Agustina', '0', 'P', '083156909789', 'Jl.Pemurus Dalam', 'Petugas', 'petugas_6125b61ef21c12_43878019.jpg', 39);

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `rak` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `rak`, `keterangan`) VALUES
(1, 'Rak Kimia', ''),
(2, 'Rak Sosiologi', ''),
(3, 'Rak Fisika', ''),
(6, 'Rak Sosiologi', ''),
(7, 'Rak Geografi', ''),
(8, 'Rak Matematika', ''),
(9, 'Rak Bahasa Indonesia', ''),
(10, 'Rak Bahasa Inggris', ''),
(11, 'Rak Ekonomi', ''),
(12, 'Rak Sejarah', ''),
(13, 'Rak Agama', ''),
(14, 'Rak Seni Budaya', ''),
(15, 'Rak Pendidikan Jasmani', ''),
(16, 'Rak PKN', ''),
(17, 'Rak Umum', ''),
(18, 'Rak Biologi', '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `tanggal` datetime DEFAULT current_timestamp(),
  `nis` varchar(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_akun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`tanggal`, `nis`, `nama`, `jenis_kelamin`, `kelas`, `alamat`, `email`, `foto`, `id_akun`) VALUES
('2021-08-21 10:38:07', '01', 'Afriliana Tri Hartika', 'P', 'XII IPA 1', 'Jl Mahligai Komp Mahligai Indah 1', '', NULL, 12),
('2021-08-21 10:52:01', '010', 'Inesya Karina Zainishfi', 'P', 'XII IPA 1', 'Jl. A.Yani KM 5.5  Komp TNI AD R.Soeprapto', '', NULL, 21),
('2021-08-21 10:52:59', '011', 'Khairunnisa', 'P', 'XII IPA 1', 'Jl. Sepakat', '', NULL, 22),
('2021-08-21 10:41:43', '02', 'Ahmad Rizki Darmawan', 'L', 'XII IPA 1', 'Jl. Nakula III No 16', '', NULL, 13),
('2021-08-21 10:43:13', '03', 'Amelia Suri', 'P', 'XII IPA 1', 'Jl Bumi Bangun benua', '', NULL, 14),
('2021-08-21 10:44:28', '04', 'Annisa', 'P', 'XII IPA 1', 'Jl. Ayanai Komp. Nusantara No.66', '', NULL, 15),
('2021-08-21 10:45:42', '05', 'Anzalia Wafiq Azizah', 'P', 'XII IPA 1', 'Jl. Nakula V blik VII No.56', '', NULL, 16),
('2021-08-21 10:46:27', '06', 'Bella Muslimah', 'P', 'XII IPA 1', 'Jl. Setia', '', NULL, 17),
('2021-08-21 10:47:56', '07', 'Divana Intan Achmada', 'P', 'XII IPA 1', 'Jl. A.Yani KM. 7.300 gang 17 Mei', '', NULL, 18),
('2021-08-21 10:49:16', '08', 'Elsa Marisa', 'P', 'XII IPA 1', 'Perum Bumi LIngkar Basirih Jl. Perkutut No.19', '', NULL, 19),
('2021-08-21 10:50:27', '09', 'Haris Fadillah', 'L', 'XII IPA 1', 'Jl. Tatah Belayung No.44', '', NULL, 20),
('2021-08-27 07:52:44', '112', 'Adika Rezki Annafi', 'L', 'XII IPA 1', 'Jl Pemurus Dalam', 'adikarezki@gmail.com', 'siswa_6128375cd03a86_48439590.jpeg', 40),
('2021-08-21 10:54:45', '12', 'Laili Nazmi', 'P', 'XII IPA 1', 'Jl. Sepakat', '', NULL, 23),
('2021-08-21 10:55:57', '13', 'M. Reza Surya Nugraha', 'L', 'XII IPA 1', 'Jl. A.Yani KM 5.5  Komp TNI AD R.Soeprapto No 15', '', NULL, 24),
('2021-08-21 10:57:03', '14', 'Mahfujatul Jannah', 'P', 'XII IPA 1', 'Jl. Tatah Belayung', '', NULL, 25),
('2021-08-21 10:58:24', '15', 'Marisa Sinta Tribun', 'P', 'XII IPA 1', 'Jl. Raya Beruntung Jaya No. 14', '', NULL, 26),
('2021-08-21 10:59:28', '16', 'Muhammad Faqihuddin', 'L', 'XII IPA 1', 'Jl. Setia', '', NULL, 27),
('2021-08-21 11:00:42', '17', 'Muhammad Fridiansyah', 'P', 'XII IPA 1', 'Jl Mahligai Komp Mahligai Indah No 26', '', NULL, 28),
('2021-08-21 11:01:46', '18', 'Muhammad Rifa\'i', 'L', 'XII IPA 1', 'Jl. Mahligai Tatah Belayung', '', NULL, 29),
('2021-08-21 11:03:16', '19', 'Muhammad Rifsan R.', 'L', 'XII IPA 1', 'Jl. Gerilya Komp. Tata Banua', '', NULL, 30),
('2021-09-04 16:45:36', '198', 'Muhamad Khairiiii', 'L', 'XII IPA 1', 'Pekapuran Raya', 'khairimuhamad23@gmail.com', 'siswa_6133404091f046_71598677.jpg', 50),
('2021-08-21 11:05:06', '20', 'Muhammad Rizky', 'L', 'XII IPA 1', 'Jl. Banjar Indah Komp. Pinang Permai Gg. Pinang Raya', '', NULL, 31),
('2021-08-21 11:06:14', '21', 'Mutiah', 'L', 'XII IPA 1', 'Jl. Banjar Permai 4', '', NULL, 32),
('2021-08-31 10:52:46', '214', 'Adika Rezki Annafi', 'L', 'XII-IA 2', 'Pemurus', 'adikaannafi@gmail.com', NULL, 43),
('2021-08-21 11:07:50', '22', 'Naimatul Hasanah', 'P', 'XII IPA 1', 'Jl. Sepakat no.24', '', NULL, 33),
('2021-08-21 11:09:19', '23', 'Naufal Hafizh Yassar', 'L', 'XII IPA 1', 'Jl. Bumi Mas Raya Komp Bumi Pertiwi II No 24', '', NULL, 34),
('2021-08-21 11:10:33', '24', 'Nazril Azmi', 'L', 'XII IPA 1', 'Jl. Tatah Belayung No 43', '', NULL, 35),
('2021-08-21 11:11:39', '25', 'Nova Hasanah', 'P', 'XII IPA 1', 'Jl. Sepakat', '', NULL, 36),
('2021-08-24 18:05:43', '56', 'MUHAMMAD RAFLI NURIN', 'L', 'XII IPS 3', 'KOMP BERUNTUNG JAYA JL HAYAM WURUK', 'raflinurin@gmail.com', 'siswa_6124d287980801_11169319.jpg', 37),
('2021-08-31 09:54:03', '57', 'Firli Darmawan', 'L', 'XI-IA 2', 'Pemurus', 'firlidarmawan11@gmail.com', NULL, 41),
('2021-09-01 06:33:34', '60', 'Haikal', 'L', 'Ips x', 'Rumah susun', 'haikaljoox2@gmail.com', NULL, 48),
('2021-08-31 16:25:43', '98', 'Audina Indriani', 'P', 'XII-IA 2', 'Jl. A. Yani', 'audinaindriani1@gmail.com', NULL, 47);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `buku_keluar`
--
ALTER TABLE `buku_keluar`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`id_ebook`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  ADD PRIMARY KEY (`kode_klasifikasi`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_peminjaman`);

--
-- Indexes for table `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`);

--
-- Indexes for table `pengadaan_detail`
--
ALTER TABLE `pengadaan_detail`
  ADD PRIMARY KEY (`id_pengadaan_detail`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `buku_keluar`
--
ALTER TABLE `buku_keluar`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `id_ebook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  MODIFY `kode_klasifikasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=904;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `no_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pengadaan`
--
ALTER TABLE `pengadaan`
  MODIFY `id_pengadaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pengadaan_detail`
--
ALTER TABLE `pengadaan_detail`
  MODIFY `id_pengadaan_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rak`
--
ALTER TABLE `rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
