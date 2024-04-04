-- MySQL dump 10.13  Distrib 8.3.0, for macos12.3 (arm64)
--
-- Host: localhost    Database: perpustakaan
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `akun`
--

DROP TABLE IF EXISTS `akun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `akun` (
  `id_akun` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `peran` enum('kepala','petugas','anggota') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id_akun`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akun`
--

LOCK TABLES `akun` WRITE;
/*!40000 ALTER TABLE `akun` DISABLE KEYS */;
INSERT INTO `akun` VALUES (1,'admin','$2y$10$y.W/LCQwfvzkJLctOhlrJ.XeRa3BYH1zkdQFqwfW8ME8UMVSZVnCi','kepala',1),(39,'rosa','$2y$10$/V2TDE6AVipQ3U0aV.nhr.Dnodsw0tKIJ3eKBlHOd1pu6CZkZ/LUC','petugas',1),(51,'adika','$2y$10$W5ZVYCuKe1kQtzBHmMhoLODSm4dbjRLorkPmjiqiQx5yrkOq2MptW','petugas',1),(56,'riad','$2y$10$/AyoBMhdhafzSfDG9uwCE.UWMaEr0ylVDLmib2OxbcoIN5rXKFIM.','anggota',1),(58,'puspa','$2y$10$oistnVP3.Y1DPVZ2FiM1OOX.KscvYLSmGgiE0RBPxLXxBtp/W03kK','anggota',1);
/*!40000 ALTER TABLE `akun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku` (
  `id_buku` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isbn` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pengarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `id_rak` int DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  `kode_klasifikasi` int DEFAULT NULL,
  `id_penerbit` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (31,'Kompeten Berbahasa Indonesia Kelas XII','9789790151727','Tim Edukatif',2017,2,1,5,6,0,'buku_611fa632d1f873_92255208.jpg','2021-08-20 19:44:10'),(32,'Matematika Kelompok Peminatan Matematika dan Ilmu Alam Kelas XI','9786022987581','Sukino',2017,8,1,7,6,12,'buku_612185b8b8a644_78511991.jpeg','2021-08-21 17:06:48'),(33,'Biologi Peminatan Matematika dan Ilmu Alam Kelas XI','9786022414704','Irnaningtyas, dkk',2017,18,1,7,6,29,'buku_6121873a12c3b4_81388026.jpeg','2021-08-21 17:09:54'),(34,'Kimia Peminatan Matematika dan ilmu Alam Kelas XI','9786022414','Unggul Sudarmo, dkk',2017,1,1,7,6,33,'buku_61218827051fd1_87831069.jpg','2021-08-21 17:13:23'),(35,'Ekonomi K-13 Kelompok Peminatan Kelas XI','9786022541769','Alam, dkk',2017,11,1,4,6,17,'buku_6121ad15e8a093_77280716.jpg','2021-08-21 17:16:04'),(36,'Fisika Peminatan Matematika dan Ilmu Alam Kelas XI','9786022414667','Marthen Kanginan',2017,3,1,7,6,17,'buku_6121ad79a10258_50887517.jpg','2021-08-21 17:18:51'),(37,'Kimia Untuk SMA/MA Kelas XII','9789790756236','Michael Purba dan Sunardi',2017,1,1,7,6,28,'buku_61246959a25270_69555203.jpg','2021-08-21 17:28:55'),(38,'Geografi Untuk SMA/MA Kelas XI','9789790403','Bambang Niyanto Mulyo, dkk',2017,7,1,11,7,23,'buku_6121af41838f49_22907753.JPG','2021-08-21 17:30:49'),(39,'Sosiologi SMA Kelas XI','978602299583','Yadi Mulyadi, dkk',2017,2,1,4,8,84,'buku_6121b0ef5a9600_15648392.jpg','2021-08-21 17:35:18'),(40,'Sejarah Kelas X K-13 (Peminatan)','9786022988915','Ratna Hapsari dan M. Adil',2021,12,1,11,6,29,'buku_6121b165b6b624_92640193.jpg','2021-08-21 17:37:21'),(41,'Biologi Kelas XI K-13 Edisi Revisi (Peminatan)','9786024341','Irnaningtyas dan Yossa Istiadi',2017,18,1,7,6,40,'buku_6121b1f1359743_57221135.jpg','2021-08-21 17:39:02'),(42,'Kimia Kelas XI K-13 Edisi Revisi (Peminatan)','9786022988397','Unggul Sudarmo dan Nanik Mitayani',2017,1,1,7,6,39,'buku_6121b2551f6075_79733894.jpg','2021-08-21 17:41:23'),(43,'Ekonomi Kelas XI K-13 Edisi Revisi (Peminatan)','9786022989','Alam dan Rudianto',2017,11,1,4,6,39,'buku_6121b2ad04d709_76546570.jpg','2021-08-21 17:43:50'),(44,'Belajar dan Mengajar','9789795438946','Daryanto',2017,17,6,1,2,10,'buku_6121b43b3bd6e9_10724098.jpg','2021-08-21 18:01:28'),(45,'Inovasi Pembelajaran Efektif','9789795438','Daryanto',2017,17,6,1,9,11,'buku_6121b4aeb65182_09299836.jpg','2021-08-21 18:03:01'),(46,'Katalisator Profesionalisme Pendidik','9786023745','Moh. Samsul Hidayat',2017,17,6,7,9,17,'buku_6121b6370781b0_31388220.jpg','2021-08-21 18:05:47'),(47,'Menjadi Guru Hebat','9786023746','Darma Jari dan E. J Kosasih',2017,17,6,1,9,2,'buku_6121b85c30b964_52203149.jpg','2021-08-21 18:17:34'),(48,'Referensi Yuridis (PER UU) Kurikulum 2013','9786022775','Weinata Sairin',2017,17,6,2,9,3,'buku_6121b930e1f066_85723870.jpg','2021-08-21 18:19:38'),(49,'Strategi dan Tahapan Mengajar Bekal Bagi Guru','9789795439','Daryanto',2017,17,6,1,9,3,'buku_6121babdc12759_17137659.jpg','2021-08-21 18:22:16'),(51,'Bahasa Indonesia SMA-MA/SMK Kelas X','9786023744','Yadi Mulyadi',2017,9,1,5,9,11,'buku_6121bc4e6c2cf7_53178931.jpg','2021-08-21 18:29:08'),(52,'Bahasa Inggris SMA-MA/SMK Kelas X','9786023747','Otong Setiawan DJ dan Supeni',2017,10,1,5,9,14,'buku_6121bc97e22ec1_58333211.jpg','2021-08-21 18:30:58'),(53,'Matematika SMA-MA Kelas X','9786023745','Suwah Sembiring dan Marsito',2017,8,1,7,9,19,'buku_6121bce0a51a41_27168131.jpg','2021-08-21 18:34:03'),(54,'Pendidikan Pancasila dan Kewarganegaraan SMA-MA/SMK kelas X','9786023748','Muhammad Taupan dan Ine Ariyani',2017,16,1,2,9,12,'buku_6121bd3e1e2eb4_12887580.jpg','2021-08-21 18:39:20'),(55,'Pendidikan Agama Islam dan Budi Pekerti Untuk Siswa SMA-MA/SMK Kelas XI','9786023745','Nurlailah dan Endang Zainal',2017,13,1,3,9,15,'buku_6121bda44c6a17_41382163.jpg','2021-08-21 18:45:13'),(56,'Seni Budaya Untuk SMA-MA/SMK-MAK Kelas X','9786023744','Harry D. Fauzi dan Yadi Mulyadi',2017,14,1,9,9,19,'buku_6121bde7bf95e8_15712109.jpg','2021-08-21 19:06:44'),(57,'Penjas Orkes Untuk Siswa SMA-MA/SMK-MAK Kelas X','9786022770800','Khairul Hadziq dan Anwar Musadad',2017,15,1,9,9,12,'buku_6121be3de17a58_64355652.jpg','2021-08-22 07:11:36'),(58,'Penjas Orkes Untuk Siswa SMA-MA/SMK-MAK Kelas XI','9786022770824','Khairul Hadziq dan Anwar Musadad',2017,15,1,9,9,11,'buku_6121be7a4c2763_03768973.jpg','2021-08-22 07:14:37'),(59,'Langkah Awal Meraih Medali Emas Olimpiade Matematika SMA','9786023742','Muhammad Idris, dkk',2017,17,6,7,9,3,'buku_6121bee06bbb09_54968918.jpg','2021-08-22 07:17:56'),(60,'Pena Emas OSN Fisika SMA','9786022774488','Marthen Kanginan',2017,17,6,7,9,3,'buku_6121bf1964c950_68438956.jpg','2021-08-22 07:21:10'),(61,'Latihan Soal dan Solusi Internasional Biology Olympiad','9786022776819','TOBI',2017,17,6,7,9,8,'buku_6121bf92223934_39694961.jpg','2021-08-22 07:26:30'),(62,'Pena Emas OSN Ekonomi dan Olimpiade Pasar Modal','9786023742158','Wuj Purwanta dan Prathama Rahardja',2017,17,6,4,9,8,'buku_6121bff1924873_44274879.jpg','2021-08-22 07:29:51'),(63,'Buku Guru Peminatan Fisika Kelas XI K-13','9786023743','Indarti, dkk',2017,3,1,7,2,19,'buku_6121c0d8d39f71_82307837.jpg','2021-08-22 07:33:52'),(64,'Buku Guru Peminatan Matematika Kelas XI K-13','9786023743','Suparmin, dkk',2017,8,1,7,2,16,'buku_6121c1465502a6_61653591.jpg','2021-08-22 07:38:34'),(65,'Buku Guru Peminatan Sejarah Kelas XI K-13','9786023449927','Indah Sawitri',2017,12,1,11,2,11,'buku_6121c19b47b8f1_29537585.jpg','2021-08-22 07:41:38'),(66,'26 Kiat Merebut Hati Pria','9789791234719','Adil Fathi',2018,17,3,10,10,22,'buku_6121c3a517c143_89627491.jpg','2021-08-22 07:48:24'),(68,'Pemrograman','123456789','Adika',2021,2,1,3,1,12,'buku_612836a63d6270_59233311.jpg','2021-08-27 07:48:39'),(69,'Kimia Peminatan','9789790151','Aji Hidayat',2021,1,1,4,3,70,NULL,'2021-09-04 16:33:53'),(71,'Antariksa dan Gravitasi','869777361','Elon Musk',2024,NULL,NULL,NULL,NULL,50,NULL,'2024-03-19 13:40:33');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku_keluar`
--

DROP TABLE IF EXISTS `buku_keluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku_keluar` (
  `id_pengeluaran` int NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_buku` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku_keluar`
--

LOCK TABLES `buku_keluar` WRITE;
/*!40000 ALTER TABLE `buku_keluar` DISABLE KEYS */;
INSERT INTO `buku_keluar` VALUES (1,'2021-08-12 14:09:46',4,20,'Buka rusak'),(2,'2021-08-12 14:11:39',4,12,'Tebakar'),(3,'2021-08-15 11:47:20',16,5,'Buku Robek'),(4,'2021-08-22 11:40:42',36,3,'Buku rusak'),(5,'2021-08-27 07:50:22',68,5,'Buku Robek'),(6,'2021-09-04 16:35:45',69,10,'Buku Robek'),(7,'2024-03-19 14:03:57',72,10,'Buku Tidak Layak Pakai');
/*!40000 ALTER TABLE `buku_keluar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `buku_keluar` AFTER INSERT ON `buku_keluar` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah-NEW.jumlah
    WHERE buku.id_buku=NEW.id_buku */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ebook`
--

DROP TABLE IF EXISTS `ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebook` (
  `id_ebook` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isbn` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pengarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `berkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ebook`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook`
--

LOCK TABLES `ebook` WRITE;
/*!40000 ALTER TABLE `ebook` DISABLE KEYS */;
INSERT INTO `ebook` VALUES (1,'Istiqomah Merawat Indonesia','9786027807686','Isman Muayyad, Inayah Adi Oktavia, Andi Aulia Rahman,  dkk.',2017,'ebook_61221c1d2fd0f0_20103509.jpg','ebook_61221bbe4430b1_52343887.pdf','2021-08-22 16:41:18'),(2,'Aisyah','9789791479899','Sibel Eraslan',2015,'ebook_612229cf5e8702_06990357.jpg','ebook_612229cf6111b2_29047027.pdf','2021-08-22 17:41:19'),(3,'Matematika Edisi Revisi 2014 SMA/MA kelas X Semester 2','9786022824916',' Bornok Sinaga, Pardomuan N.J.M. Sinambela, dkk',2014,'ebook_612236fc8be031_57038666.jpg','ebook_612236fc8dc9a8_58561776.pdf','2021-08-22 18:37:32'),(4,'Kimia untuk SMA/MA kelas XII','9789790687318','Wening Sukmanawati',2009,'ebook_612240473e2e44_12984446.jpg','ebook_612240474514a6_14156123.pdf','2021-08-22 19:17:11'),(5,'Jurnal Pembuatan Sistem Informasi  Perpustakaan Berbasis Website Pada Sekolah Menengah  Pertama Negeri 1 Donorojo Kabupaten Pacitan','23546654','Dani Eko Handrianto',2014,'ebook_6122445ba0dc04_20685871.jpg','ebook_6122445ba3d510_46552080.pdf','2021-08-22 19:34:35');
/*!40000 ALTER TABLE `ebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Pelajaran',''),(2,'Novel',''),(3,'Fiksi',''),(6,'Non Fiksi','');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasifikasi`
--

DROP TABLE IF EXISTS `klasifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi` (
  `kode_klasifikasi` int NOT NULL AUTO_INCREMENT,
  `nmr_klasifikasi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `klasifikasi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`kode_klasifikasi`)
) ENGINE=InnoDB AUTO_INCREMENT=905 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasifikasi`
--

LOCK TABLES `klasifikasi` WRITE;
/*!40000 ALTER TABLE `klasifikasi` DISABLE KEYS */;
INSERT INTO `klasifikasi` VALUES (1,'000.1','000','Komputer, Informasi dan Referensi Umum'),(2,'100','100','Filsafat dan psikologi'),(3,'200','200','Agama'),(4,'300','300','Ilmu Sosial'),(5,'400','400','Bahasa'),(7,'500','500','Sains dan Matematika'),(8,'600','600','Teknologi'),(9,'700','700','Kesenian dan Rekreasi'),(10,'800','800','Sastra'),(11,'900','900','Sejarah dan Geografi'),(12,'300.10','300','Ilmu Sosial');
/*!40000 ALTER TABLE `klasifikasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset` (
  `created_at` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `id_akun` int DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset`
--

LOCK TABLES `password_reset` WRITE;
/*!40000 ALTER TABLE `password_reset` DISABLE KEYS */;
INSERT INTO `password_reset` VALUES ('0000-00-00 00:00:00',2,42,'8f7b36b1ef2a1145b9b44c8fac9236084c8dd005a9bba9374085cb215a6c333439bd5db733d171521f465ac294938db1110534e2455b397e84bf4677555402ed'),('0000-00-00 00:00:00',3,43,'0328d07db1f413948be47fae0994c9b934c17fc2b1f676dd49afdd718864c4c16caa4042c4471fa2457eccbcc33f4dc68ae7dc20491297da4f65e667a2a13903'),('0000-00-00 00:00:00',5,48,'03fd61499720ad17a0fd280e8c90b63b9d2d8548ec0eb06f986dd9cd201e2ea5410d4f098e2cd04e04a7b2514d2686bee52dfd4b62fc193707ccd9f040bf2366'),('0000-00-00 00:00:00',8,55,'0ceb7c88b5059c191036bc1bc4706f28079bce8856d50e445db1f47ba47c31a1ae0de19614bd2bc604b952565320355239b5cb934639da223d5d293f0e8d251b'),('0000-00-00 00:00:00',9,55,'577e4d2169a0cf64bc3df565fd60d958cecb6785f3457b8b13ef16b64864134f1e52c20cfd8943ab0d8a1bbf78e4c84def15739ab1e8be315ff64adcf58f62d0'),('0000-00-00 00:00:00',10,55,'d9dc78c8ba2ab75a0f6ea8ac091170c7169018fe469c5e87a62f15ea18e0091c379cb8250224259ae0778ad0009ecc24b8fbe178da104b691287f9694ae95a6d'),('0000-00-00 00:00:00',11,55,'0bb09844f783677fd6a2a919a8c1a495b44ec1010edc7d7a52048395a7a7586eeddbd0d37f36cfa574c7ef493b00e12223df4dd1b5d3edb40cd1a4755380e3f7'),('0000-00-00 00:00:00',12,55,'42ed07e58e4ad74f87a8afd0b7f0d8b037e5ccfd90d174c0dd657056d23089082708d29372f08923d53ad19986d71bc07580e4d214df19adefab65cd7cccf1e1'),('0000-00-00 00:00:00',13,55,'ce81ec593f4beea36dfaa0fc9df13d766fb7c1ea5374b85a1ad7f135fcb9ebcb4a7c2239707af739769d8c969f7ac62660e5e3c5bae134fbc11ac6ccbbd7a802'),('0000-00-00 00:00:00',14,55,'f20c5f080031d1456ea84dbb43c6f541a29c53c308cef630a8250dc673fd3dd8c3f85293396b5cc21f188f62b118b9ea5f7e560a0a10691eae729e82855f4317'),('0000-00-00 00:00:00',17,55,'5117c82af7f8821da0f67850e0690e857b943fce16b63a63d8ec0a09cee00c74f8307a02207d2dd75616ad32d266c2b06163e14304569a16941cb0614b80475d'),('0000-00-00 00:00:00',16,55,'b074b9af8679b18b3683d27cf6cd84ed363b5e189360e37589d478cd8737e597acb9903d3038e0bd6a4f2de03454ad9bf0da5d1312cbbbb99fa6b055c961d104'),('0000-00-00 00:00:00',18,57,'77d1209a2082b05279d96973a370ef80907a4cec8e7ad2393ec5fe5be4313250e342222cbf0297fcc0373949cb5fab86ad4e0252403973801cfaee958a12e29e'),('0000-00-00 00:00:00',19,56,'6cc77a3a988403f324520d47dc60d6a6596527cf5a92a27d837ec5c30e6a194526ffcff362f0a6a6665f2dc08b771954deb151ebd66dd70abfabb854e8066eb0');
/*!40000 ALTER TABLE `password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peminjaman` (
  `no_peminjaman` int NOT NULL AUTO_INCREMENT,
  `nis` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` int DEFAULT NULL,
  `tanggal_pinjam` datetime DEFAULT CURRENT_TIMESTAMP,
  `tanggal_tenggat` datetime DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_peminjaman`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES (1,'01',NULL,'2024-03-19 18:23:47','2024-03-30 00:00:00','Pinjam buku','riadhussh07@gmail.com'),(2,'02',NULL,'2024-03-20 12:20:15','2024-03-23 00:00:00','Pinjam buku','rosiana.puspa@gmail.com'),(3,'02',NULL,'2024-03-20 12:27:08','2024-03-23 00:00:00','Pinjam buku','rosiana.puspa@gmail.com');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman_detail`
--

DROP TABLE IF EXISTS `peminjaman_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peminjaman_detail` (
  `id_peminjaman` int NOT NULL AUTO_INCREMENT,
  `no_peminjaman` int NOT NULL,
  `id_buku` int NOT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `denda` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id_peminjaman`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman_detail`
--

LOCK TABLES `peminjaman_detail` WRITE;
/*!40000 ALTER TABLE `peminjaman_detail` DISABLE KEYS */;
INSERT INTO `peminjaman_detail` VALUES (1,1,31,'2024-03-19 13:50:52',0,1),(2,1,32,'2024-03-19 13:50:48',0,1),(3,1,33,'2024-03-19 13:50:42',0,1),(4,2,34,'2024-04-02 15:37:12',5500,1),(5,3,31,NULL,NULL,1);
/*!40000 ALTER TABLE `peminjaman_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `meminjam_buku` AFTER INSERT ON `peminjaman_detail` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah-1
    WHERE buku.id_buku=NEW.id_buku */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mengembalikan_buku` AFTER UPDATE ON `peminjaman_detail` FOR EACH ROW UPDATE buku SET buku.jumlah=buku.jumlah+1
    WHERE buku.id_buku=NEW.id_buku */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerbit` (
  `id_penerbit` int NOT NULL AUTO_INCREMENT,
  `penerbit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_penerbit`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
INSERT INTO `penerbit` VALUES (1,'Intan Pariwara','Alamat: Jl. Ki Hajar Dewantoro Kotak Pos 111 Klaten 57438','(0272) 322441',''),(2,'Mediatama','Jl. Adi Sumarmo No.51, Krobyongan, Gawanan, Kec. Colomadu, Kabupaten Karanganyar, Jawa Tengah 57173','(0271) 734088',''),(3,'Tiga Serangkai','Jl. Dr Supomo no.23 Solo','0271 646 994',''),(6,'Erlangga','Jl. H. Baping Raya No. 100 Ciracas Jakarta 13740','(021) 8717006',''),(7,'Jatra Graphic','Jalan Professor Doktor Supomo No.23 Sriwedari Kecamatan Laweyan Kota Surakarta Jawa Tengah 57141 Indonesia','(0271) 714344',''),(8,'Yudhistira','Jl. Waru No. 20-B, Rawamangun Jakarta Timur 13220','0251-8240628',''),(9,'Yrama Widya','Jl. Permai 28 komplek Margahayu Permai No.100, Mekar Rahayu, Kec. Margaasih, Bandung, Jawa Barat 40218','(022) 5403518',''),(10,'Mirqat ',' JL. Cipinang Muara II, No. 29 H RT.01/02, Cipinang Muara, RT.4/RW.4, Klender, Kec. Duren Sawit, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13420','(021) 68528195','');
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengadaan`
--

DROP TABLE IF EXISTS `pengadaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengadaan` (
  `id_pengadaan` int NOT NULL AUTO_INCREMENT,
  `no_inventaris` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  `sumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pemasok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_pengadaan`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengadaan`
--

LOCK TABLES `pengadaan` WRITE;
/*!40000 ALTER TABLE `pengadaan` DISABLE KEYS */;
INSERT INTO `pengadaan` VALUES (1,'','2021-08-12 13:33:16','Sumbangan','Dinas Provinsi',''),(2,'','2021-08-12 13:35:11','Pembelian','-',''),(3,'','2021-08-12 13:52:36','Pembelian','',''),(4,'','2021-08-12 13:53:24','Sumbangan','',''),(5,'','2021-08-15 11:37:40','Pembelian','Dinas Provinsi',''),(6,'','2021-08-18 10:09:43','Sumbangan','Dinas Pendidikan Provinsi',''),(7,'9213/PS13/3/2017','2021-08-20 19:44:10','Hadiah','',''),(8,'9215-9249/PS13/4/2017','2021-08-21 17:06:48','Hadiah','',''),(9,'9250-9284/PS13/4/2017','2021-08-21 17:09:54','Hadiah','',''),(10,'9285-9319/PS13/4/2017','2021-08-21 17:13:23','Hadiah','',''),(11,'9320-9352/PS13/4/2017','2021-08-21 17:16:04','Hadiah','',''),(12,'9353-9364/PS13/4/2017','2021-08-21 17:18:51','Hadiah','',''),(13,'9365-9394/PS13/7/2017','2021-08-21 17:28:55','Hadiah','',''),(14,'9395-9504/PS13/7/2017','2021-08-21 17:30:49','Hadiah','',''),(15,'9505-9609/PS13/7/2017','2021-08-21 17:35:18','Hadiah','',''),(16,'9610-9639/PS13/8/2017','2021-08-21 17:37:21','Hadiah','',''),(17,'9640-9681/PS13/8/2017','2021-08-21 17:39:02','Hadiah','',''),(18,'9682-9721/PS13/8/2017','2021-08-21 17:41:23','Hadiah','',''),(19,'9722-9761/PS13/8/2017','2021-08-21 17:43:50','Hadiah','',''),(20,'10.050-10.052/PS13/12/2017','2021-08-21 18:01:28','Hadiah','',''),(21,'10.053-10.055/PS13/12/2017','2021-08-21 18:03:01','Hadiah','',''),(22,'10.056-10.058/PS13/12/2017','2021-08-21 18:05:47','Hadiah','',''),(23,'10.059-10.061/PS13/12/2017','2021-08-21 18:17:34','Hadiah','',''),(24,'10.062-10.064/PS13/12/2017','2021-08-21 18:19:38','Hadiah','',''),(25,'10.065-10.067/PS13/12/2017','2021-08-21 18:22:16','Hadiah','',''),(26,'10.068-10.070/PS13/12/2017','2021-08-21 18:27:29','Hadiah','',''),(27,'10.071-10.075/PS13/12/2017','2021-08-21 18:29:08','Hadiah','',''),(28,'10.076-10.080/PS13/12/2017','2021-08-21 18:30:58','Hadiah','',''),(29,'10.081-10.083/PS13/12/2017','2021-08-21 18:34:03','Hadiah','',''),(30,'10.092-10.096/PS13/12/2017','2021-08-21 18:39:20','Hadiah','',''),(31,'10.097-10.101/PS13/12/2017','2021-08-21 18:45:13','Hadiah','',''),(32,'10.107-10.111/PS13/12/2017','2021-08-21 19:06:44','Hadiah','',''),(33,'10.112-10.115/PS13/12/2017','2021-08-22 07:11:36','Hadiah','Pemberian Provinsi',''),(34,'10.116-10.119/PS13/12/2017','2021-08-22 07:14:37','Hadiah','Pemberian Provinsi',''),(35,'10.120-10.122/PS13/12/2017','2021-08-22 07:17:56','Hadiah','Pemberian Provinsi',''),(36,'10.123-10.125/PS13/12/2017','2021-08-22 07:21:10','Hadiah','Pemberian Provinsi',''),(37,'10.126-10.128/PS13/12/2017','2021-08-22 07:26:30','Hadiah','Pemberian Provinsi',''),(38,'10.129-10.131/PS13/12/2017','2021-08-22 07:29:51','Hadiah','',''),(39,'10.134/PS13/9/2017','2021-08-22 07:33:52','Pembelian','Dana BOS 2017',''),(40,'10.132-10.133/PS13/9/2017','2021-08-22 07:38:34','Pembelian','Dana BOS 2017',''),(41,'10.135-10.136/PS13/9/2017','2021-08-22 07:41:38','Pembelian','Dana BOS 2017',''),(42,'10.164/PS13/3/2018','2021-08-22 07:48:24','Hadiah','Dinas Pendidikan Provinsi Kalsel',''),(44,'12345','2021-08-27 07:48:39','Hadiah','Dinas Pendidikan Provinsi',''),(45,'9213/PS13/3/2017','2021-09-04 16:33:53','Pembelian','Dinas Pendidikan Provinsi','-'),(46,'9003-9211/PS13/4/2024','2024-03-19 13:40:33','Pembelian','-','-');
/*!40000 ALTER TABLE `pengadaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengadaan_detail`
--

DROP TABLE IF EXISTS `pengadaan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengadaan_detail` (
  `id_pengadaan_detail` int NOT NULL AUTO_INCREMENT,
  `id_pengadaan` int DEFAULT NULL,
  `id_buku` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  PRIMARY KEY (`id_pengadaan_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengadaan_detail`
--

LOCK TABLES `pengadaan_detail` WRITE;
/*!40000 ALTER TABLE `pengadaan_detail` DISABLE KEYS */;
INSERT INTO `pengadaan_detail` VALUES (1,1,2,100,0),(2,2,3,20,0),(3,3,4,200,0),(4,4,5,40,60000),(5,5,25,80,50000),(6,6,29,200,0),(7,6,30,40,0),(8,7,31,1,0),(9,8,32,35,97000),(10,9,33,35,100000),(11,10,34,35,95000),(12,11,35,35,80000),(13,12,36,12,162000),(14,13,37,30,98000),(15,14,38,100,0),(16,15,39,85,0),(17,16,40,30,88000),(18,17,41,40,100000),(19,18,42,40,95000),(20,19,43,40,80000),(21,20,44,3,63600),(22,21,45,3,165000),(23,22,46,3,146700),(24,23,47,3,78900),(25,24,48,3,6066000),(26,25,49,3,75600),(27,26,50,3,170000),(28,27,51,5,413000),(29,28,52,5,283000),(30,29,53,3,224100),(31,30,54,5,351000),(32,31,55,5,402000),(33,32,56,5,357000),(34,33,57,4,231000),(35,34,58,4,240000),(36,35,59,3,187000),(37,36,60,3,330900),(38,37,61,3,407100),(39,38,62,3,454200),(40,39,63,1,93000),(41,40,64,2,132000),(42,41,65,2,177000),(43,42,66,1,19000),(44,43,67,5,12000),(45,44,68,10,12000),(46,45,69,80,50000),(47,46,71,50,35000);
/*!40000 ALTER TABLE `pengadaan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengajuan_peminjaman`
--

DROP TABLE IF EXISTS `pengajuan_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengajuan_peminjaman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `konten` text NOT NULL,
  `id_akun` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_akun` (`id_akun`),
  CONSTRAINT `pengajuan_peminjaman_ibfk_1` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengajuan_peminjaman`
--

LOCK TABLES `pengajuan_peminjaman` WRITE;
/*!40000 ALTER TABLE `pengajuan_peminjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengajuan_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengunjung`
--

DROP TABLE IF EXISTS `pengunjung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengunjung` (
  `id_pengunjung` int NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nis` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelas` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keperluan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_pengunjung`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengunjung`
--

LOCK TABLES `pengunjung` WRITE;
/*!40000 ALTER TABLE `pengunjung` DISABLE KEYS */;
INSERT INTO `pengunjung` VALUES (100,'2024-03-19 04:28:41','01','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(101,'2024-03-19 04:30:43','02','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(102,'2024-03-19 04:41:29','01','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(103,'2024-03-19 04:43:13','02','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(104,'2024-03-19 05:19:20','02','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(109,'2024-03-19 09:25:07','02','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(110,'2024-03-19 09:29:21','02','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(111,'2024-03-19 09:31:00','01','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(113,'2024-03-19 10:23:30','01','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(114,'2024-03-19 13:07:29','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(115,'2024-03-19 17:45:01','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(116,'2024-03-19 17:47:50','01','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(117,'2024-03-19 17:51:46','01','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(118,'2024-03-19 17:56:24','01','Ahmad Riadhusshalihin','XII IPA 3','Masuk sebagai Anggota'),(119,'2024-03-20 04:14:36','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(120,'2024-03-20 04:24:29','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(121,'2024-03-20 04:26:26','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(122,'2024-03-20 04:26:57','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(123,'2024-04-02 13:25:27','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(124,'2024-04-02 13:55:05','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota'),(125,'2024-04-02 14:02:13','02','Puspa Rosiana Syafitri','XII IPA 3','Masuk sebagai Anggota');
/*!40000 ALTER TABLE `pengunjung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petugas`
--

DROP TABLE IF EXISTS `petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petugas` (
  `id_petugas` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jabatan` enum('Kepala','Petugas') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_akun` int NOT NULL,
  PRIMARY KEY (`id_petugas`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petugas`
--

LOCK TABLES `petugas` WRITE;
/*!40000 ALTER TABLE `petugas` DISABLE KEYS */;
INSERT INTO `petugas` VALUES (1,'Nurhidayah','198503232009032012','L',NULL,NULL,'Kepala','IMG_20210825_111738.jpg',1),(9,'Rosa Lina Agustina','121212','P','083156909789','Jl.Pemurus Dalam','Petugas','petugas_6125b61ef21c12_43878019.jpg',39),(11,'Adika Rezki Annafi','290300','L','083156909777','Jl.Raya Bima','Petugas',NULL,51);
/*!40000 ALTER TABLE `petugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rak`
--

DROP TABLE IF EXISTS `rak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rak` (
  `id_rak` int NOT NULL AUTO_INCREMENT,
  `rak` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_rak`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rak`
--

LOCK TABLES `rak` WRITE;
/*!40000 ALTER TABLE `rak` DISABLE KEYS */;
INSERT INTO `rak` VALUES (1,'Rak Kimia',''),(2,'Rak Sosiologi',''),(3,'Rak Fisika',''),(6,'Rak Sosiologi',''),(7,'Rak Geografi',''),(8,'Rak Matematika',''),(9,'Rak Bahasa Indonesia',''),(10,'Rak Bahasa Inggris',''),(11,'Rak Ekonomi',''),(12,'Rak Sejarah',''),(13,'Rak Agama',''),(14,'Rak Seni Budaya',''),(15,'Rak Pendidikan Jasmani',''),(16,'Rak PKN',''),(17,'Rak Umum',''),(18,'Rak Biologi','');
/*!40000 ALTER TABLE `rak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa` (
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  `nis` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_akun` int DEFAULT NULL,
  PRIMARY KEY (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES ('2024-03-19 18:23:04','01','Ahmad Riadhusshalihin','L','XII IPA 3','Handil Bakti','riadhussh07@gmail.com',NULL,56),('2024-03-20 12:14:21','02','Puspa Rosiana Syafitri','P','XII IPA 3','Jl.Meratus','rosiana.puspa@gmail.com',NULL,58);
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 17:04:01
