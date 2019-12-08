-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2019 at 10:45 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testlagi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_company`
--

CREATE TABLE `tb_company` (
  `idcompany` int(11) NOT NULL,
  `company` varchar(99) NOT NULL,
  `address` text NOT NULL,
  `noextension` varchar(33) NOT NULL,
  `idlevel` int(11) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_company`
--

INSERT INTO `tb_company` (`idcompany`, `company`, `address`, `noextension`, `idlevel`, `iduser_by`, `date_at`) VALUES
(1, 'Pertamina', 'Jakarta', '1000', 1, 12, '2019-05-14 02:43:34'),
(6, 'Pertamina Upstream Data Center', 'Jakarta', '1001', 5, 12, '2019-04-17 00:29:43'),
(7, 'Pertamina Geothermal Energy', 'Bandung', '1002', 6, 12, '2019-04-17 00:31:30'),
(8, 'PHE Ogan Komering', 'Ogan Komering Ulu', '1003', 6, 12, '2019-04-17 00:37:13'),
(9, 'PHE ONWJ', 'Jakarta', '1005', 6, 12, '2019-04-17 00:39:57'),
(12, 'Elnusa', 'Jakarta', '1008', 7, 12, '2019-04-17 00:52:46'),
(13, 'Sigma Cipta Utama', 'Jakarta', '1007', 7, 12, '2019-04-17 00:42:09'),
(16, 'Promosindo Midia Tenaga', 'Jakarta', '1011', 7, 12, '2019-04-17 00:53:39');

--
-- Triggers `tb_company`
--
DELIMITER $$
CREATE TRIGGER `after_create-company` AFTER INSERT ON `tb_company` FOR EACH ROW BEGIN
	INSERT INTO tb_logcompany SET
    note 		= "Create",
    idcompany 	= new.idcompany,
    company 	= new.company,
    address		= new.address,
    noextension = new.noextension,
    idlevel		= new.idlevel,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-company` AFTER DELETE ON `tb_company` FOR EACH ROW BEGIN
	INSERT INTO tb_logcompany SET
    note 		= "Delete",
    idcompany 	= old.idcompany,
    company 	= old.company,
    address		= old.address,
    noextension = old.noextension,
    idlevel		= old.idlevel,
    updated_by	= old.iduser_by,
    updated_at	= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-company` AFTER UPDATE ON `tb_company` FOR EACH ROW BEGIN
	INSERT INTO tb_logcompany SET
    note 		= "Update",
    idcompany 	= new.idcompany,
    company 	= new.company,
    address		= new.address,
    noextension = new.noextension,
    idlevel		= new.idlevel,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_countvisit`
--

CREATE TABLE `tb_countvisit` (
  `id` int(11) NOT NULL,
  `url` varchar(333) NOT NULL,
  `count` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_countvisit`
--

INSERT INTO `tb_countvisit` (`id`, `url`, `count`) VALUES
(8, 'http://localhost/testlagi/modules/index.php?page=open_file&id=49', 5),
(9, 'http://localhost/testlagi/modules/index.php?page=open_file&id=50', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tb_file`
--

CREATE TABLE `tb_file` (
  `idfile` int(11) NOT NULL,
  `barcode` varchar(21) NOT NULL,
  `title` varchar(99) NOT NULL,
  `pathfile` text NOT NULL,
  `sendpassword` varchar(3) NOT NULL,
  `iduser_owner` int(11) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_file`
--

INSERT INTO `tb_file` (`idfile`, `barcode`, `title`, `pathfile`, `sendpassword`, `iduser_owner`, `iduser_by`, `date_at`) VALUES
(13, 'PM-1-01A-01-01-00-001', 'FINAL WELL REPORT PGE-001', '10-05-2019_PGE_SAMPLE-1_PM-1-01A-01-01-00-001.pdf', 'Yes', 14, 12, '2019-06-22 13:26:30'),
(14, 'PM-1-01A-01-01-00-002', 'FINAL WELL REPORT PGE-002', '10-05-2019_PGE_SAMPLE-2_PM-1-01A-01-01-00-002.pdf', 'Yes', 14, 12, '2019-06-22 13:26:27'),
(15, 'PM-1-01A-01-01-00-003', 'FINAL WELL REPORT PGE-003', '10-05-2019_PGE_SAMPLE-3_PM-1-01A-01-01-00-003.pdf', 'Yes', 14, 12, '2019-06-22 13:26:23'),
(16, 'PM-1-01A-01-01-00-004', 'FINAL WELL REPORT PGE-004', '10-05-2019_PGE_SAMPLE-4_PM-1-01A-01-01-00-004.pdf', 'Yes', 14, 12, '2019-06-22 13:26:17'),
(17, 'PM-1-01A-01-01-00-005', 'FINAL WELL REPORT PGE-005', '10-05-2019_PGE_SAMPLE-5_PM-1-01A-01-01-00-005.pdf', 'Yes', 14, 12, '2019-06-22 13:26:13'),
(18, 'PM-1-01A-01-01-00-006', 'FINAL WELL REPORT PGE-006', '10-05-2019_PGE_SAMPLE-6_PM-1-01A-01-01-00-006.pdf', 'Yes', 14, 12, '2019-06-22 13:26:10'),
(19, 'PM-1-01A-01-01-00-007', 'FINAL WELL REPORT PGE-007', '10-05-2019_PGE_SAMPLE-7_PM-1-01A-01-01-00-007.pdf', 'Yes', 14, 12, '2019-06-22 13:26:07'),
(20, 'PM-1-01A-01-01-00-008', 'FINAL WELL REPORT PGE-008', '10-05-2019_PGE_SAMPLE-8_PM-1-01A-01-01-00-008.pdf', 'Yes', 14, 12, '2019-06-22 13:26:04'),
(21, 'PM-1-01A-01-01-00-009', 'FINAL WELL REPORT PGE-009', '10-05-2019_PGE_SAMPLE-9_PM-1-01A-01-01-00-009.pdf', 'Yes', 14, 12, '2019-06-22 13:26:02'),
(22, 'PM-1-01A-01-01-00-010', 'FINAL WELL REPORT PGE-010', '10-05-2019_PGE_SAMPLE-10_PM-1-01A-01-01-00-010.pdf', 'Yes', 14, 12, '2019-06-22 13:25:59'),
(23, 'PM-1-01A-01-03-00-001', 'FINAL WELL REPORT PHE_OK-021', '14-05-2019_PHE-OK_SAMPLE-21_PM-1-01A-01-03-00-001.pdf', 'Yes', 28, 12, '2019-06-22 13:29:15'),
(24, 'PM-1-01A-01-03-00-002', 'FINAL WELL REPORT PHE_OK-022', '14-05-2019_PHE-OK_SAMPLE-22_PM-1-01A-01-03-00-002.pdf', 'Yes', 28, 12, '2019-06-22 13:29:11'),
(25, 'PM-1-01A-01-03-00-003', 'FINAL WELL REPORT PHE_OK-023', '14-05-2019_PHE-OK_SAMPLE-23_PM-1-01A-01-03-00-003.pdf', 'Yes', 28, 12, '2019-06-22 13:29:08'),
(26, 'PM-1-01A-01-03-00-004', 'FINAL WELL REPORT PHE_OK-024', '14-05-2019_PHE-OK_SAMPLE-24_PM-1-01A-01-03-00-004.pdf', 'Yes', 28, 12, '2019-06-22 13:29:05'),
(27, 'PM-1-01A-01-03-00-005', 'FINAL WELL REPORT PHE_OK-025', '14-05-2019_PHE-OK_SAMPLE-25_PM-1-01A-01-03-00-005.pdf', 'Yes', 28, 12, '2019-06-22 13:29:02'),
(28, 'PM-1-01A-01-03-00-006', 'FINAL WELL REPORT PHE_OK-026', '14-05-2019_PHE-OK_SAMPLE-26_PM-1-01A-01-03-00-006.pdf', 'Yes', 28, 12, '2019-06-22 13:28:59'),
(29, 'PM-1-01A-01-03-00-007', 'FINAL WELL REPORT PHE_OK-027', '14-05-2019_PHE-OK_SAMPLE-27_PM-1-01A-01-03-00-007.pdf', 'Yes', 28, 12, '2019-06-22 13:28:55'),
(30, 'PM-1-01A-01-03-00-008', 'FINAL WELL REPORT PHE_OK-028', '14-05-2019_PHE-OK_SAMPLE-28_PM-1-01A-01-03-00-008.pdf', 'Yes', 28, 12, '2019-06-22 13:28:53'),
(31, 'PM-1-01A-01-03-00-009', 'FINAL WELL REPORT PHE_OK-029', '14-05-2019_PHE-OK_SAMPLE-29_PM-1-01A-01-03-00-009.pdf', 'Yes', 28, 12, '2019-06-22 13:28:46'),
(32, 'PM-1-01A-01-03-00-010', 'FINAL WELL REPORT PHE_OK-030', '14-05-2019_PHE-OK_SAMPLE-30_PM-1-01A-01-03-00-010.pdf', 'Yes', 28, 12, '2019-06-22 13:28:44'),
(33, 'PM-1-01A-01-02-00-001', 'FINAL WELL REPORT PHE_ONWJ-011', '15-05-2019_PHE-ONWJ_SAMPLE-11_PM-1-01A-01-02-00-001.pdf', 'Yes', 33, 12, '2019-06-22 13:36:46'),
(34, 'PM-1-01A-01-02-00-002', 'FINAL WELL REPORT PHE_ONWJ-012', '15-05-2019_PHE-ONWJ_SAMPLE-12_PM-1-01A-01-02-00-002.pdf', 'Yes', 33, 12, '2019-06-22 13:36:38'),
(35, 'PM-1-01A-01-02-00-003', 'FINAL WELL REPORT PHE_ONWJ-013', '29-06-2019_PHE-ONWJ_SAMPLE-13_PM-1-01A-01-02-00-003.pdf', 'Yes', 33, 13, '2019-07-08 20:54:55'),
(36, 'PM-1-01A-01-02-00-004', 'FINAL WELL REPORT PHE_ONWJ-014', '08-07-2019_PHE-ONWJ_SAMPLE-14_PM-1-01A-01-02-00-004.pdf', 'Yes', 33, 13, '2019-07-08 20:56:16'),
(37, 'PM-1-01A-01-02-00-005', 'FINAL WELL REPORT PHE_ONWJ-015', '28-07-2019_PHE-ONWJ_SAMPLE-15_PM-1-01A-01-02-00-005.pdf', 'Yes', 33, 13, '2019-07-28 22:40:36'),
(38, 'PM-1-01A-01-02-00-006', 'FINAL WELL REPORT PHE_ONWJ-016', '02-08-2019_PHE-ONWJ_SAMPLE-16_PM-1-01A-01-02-00-006.pdf', 'Yes', 33, 13, '2019-08-02 14:17:32'),
(39, 'PM-1-01A-01-02-00-007', 'seminar isi', '02-08-2019_PHE-ONWJ_SAMPLE-17_PM-1-01A-01-02-00-007.pdf', 'Yes', 34, 13, '2019-08-02 14:43:57'),
(40, 'PM-1-01A-01-02-00-008', 'testing', '02-08-2019_PHE-ONWJ_SAMPLE-18_PM-1-01A-01-02-00-008.pdf', 'Yes', 36, 13, '2019-08-02 15:03:50');

--
-- Triggers `tb_file`
--
DELIMITER $$
CREATE TRIGGER `after_create-file` AFTER INSERT ON `tb_file` FOR EACH ROW BEGIN
	INSERT INTO tb_logfile SET
    note 		= "Create",
    idfile 		= new.idfile,
    barcode 	= new.barcode,
    title		= new.title,
    pathfile	= new.pathfile,
    sendpassword= new.sendpassword,
    iduser_owner= new.iduser_owner,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-file` AFTER DELETE ON `tb_file` FOR EACH ROW BEGIN
	INSERT INTO tb_logfile SET
    note 		= "Delete",
    idfile 		= old.idfile,
    barcode 	= old.barcode,
    title		= old.title,
    pathfile	= old.pathfile,
    sendpassword= old.sendpassword,
    iduser_owner= old.iduser_owner,
    updated_by	= old.iduser_by,
    updated_at	= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-file` AFTER UPDATE ON `tb_file` FOR EACH ROW BEGIN
	INSERT INTO tb_logfile SET
    note 		= "Update",
    idfile 		= new.idfile,
    barcode 	= new.barcode,
    title		= new.title,
    pathfile	= new.pathfile,
    sendpassword= new.sendpassword,
    iduser_owner= new.iduser_owner,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `idlevel` int(11) NOT NULL,
  `level` varchar(33) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`idlevel`, `level`, `iduser_by`, `date_at`) VALUES
(1, 'Administrator', 12, '2019-04-17 00:22:00'),
(5, 'Data Warehouse', 12, '2019-04-17 00:26:43'),
(6, 'Data Owner', 12, '2019-04-17 00:27:01'),
(7, 'Guest', 12, '2019-04-17 00:27:19');

--
-- Triggers `tb_level`
--
DELIMITER $$
CREATE TRIGGER `after_create-level` AFTER INSERT ON `tb_level` FOR EACH ROW BEGIN
	INSERT INTO tb_loglevel SET
    note 		= "Create",
    idlevel 	= new.idlevel,
    level 		= new.level,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-level` AFTER DELETE ON `tb_level` FOR EACH ROW BEGIN
	INSERT INTO tb_loglevel SET
    note 		= "Delete",
    idlevel 	= old.idlevel,
    level 		= old.level,
    updated_by	= old.iduser_by,
    updated_at	= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-level` AFTER UPDATE ON `tb_level` FOR EACH ROW BEGIN
	INSERT INTO tb_loglevel SET
    note 		= "Update",
    idlevel 	= new.idlevel,
    level 		= new.level,
    updated_by	= new.iduser_by,
    updated_at	= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_logcompany`
--

CREATE TABLE `tb_logcompany` (
  `idlogcompany` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idcompany` int(11) NOT NULL,
  `company` varchar(99) NOT NULL,
  `address` text NOT NULL,
  `noextension` varchar(33) NOT NULL,
  `idlevel` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_logcompany`
--

INSERT INTO `tb_logcompany` (`idlogcompany`, `note`, `idcompany`, `company`, `address`, `noextension`, `idlevel`, `updated_by`, `updated_at`) VALUES
(39, 'Create', 1, 'Pertamina', 'Daerah Khusus Ibukota Jakarta', '1000', 1, 12, '2019-04-17 00:26:00'),
(41, 'Create', 6, 'Pertamina Upstream Data Center', 'Jakarta', '1001', 5, 12, '2019-04-17 00:29:43'),
(42, 'Update', 1, 'Pertamina EP', 'Jakarta', '1000', 1, 12, '2019-04-17 00:30:32'),
(43, 'Create', 7, 'Pertamina Geothermal Energy', 'Bandung', '1002', 6, 12, '2019-04-17 00:31:30'),
(44, 'Create', 8, 'PHE Ogan Komering', 'Ogan Komering Ulu', '1', 6, 12, '2019-04-17 00:37:04'),
(45, 'Update', 8, 'PHE Ogan Komering', 'Ogan Komering Ulu', '1003', 6, 12, '2019-04-17 00:37:13'),
(46, 'Create', 9, 'PHE ONWJ', 'Jakarta', '1005', 6, 12, '2019-04-17 00:39:57'),
(47, 'Create', 10, 'PHE WMO', 'Jakarta', '1004', 6, 12, '2019-04-17 00:40:43'),
(48, 'Create', 11, 'Pertamina EP Cepu', 'Cepu', '1006', 6, 12, '2019-04-17 00:41:12'),
(49, 'Create', 12, 'Elnusa', 'Jakarta', '1006', 7, 12, '2019-04-17 00:41:49'),
(50, 'Create', 13, 'Sigma Cipta Utama', 'Jakarta', '1007', 7, 12, '2019-04-17 00:42:09'),
(51, 'Create', 14, 'Schlumberger', 'Jakarta', '1007', 7, 12, '2019-04-17 00:43:22'),
(52, 'Create', 15, 'Halliburton', 'Jakarta', '1008', 7, 12, '2019-04-17 00:43:46'),
(53, 'Create', 16, 'Promosindo Midia Tenaga', 'Jakarta', '1008', 7, 12, '2019-04-17 00:44:14'),
(54, 'Update', 12, 'Elnusa', 'Jakarta', '1008', 7, 12, '2019-04-17 00:52:46'),
(55, 'Update', 14, 'Schlumberger', 'Jakarta', '1009', 7, 12, '2019-04-17 00:52:52'),
(56, 'Update', 15, 'Halliburton', 'Jakarta', '1010', 7, 12, '2019-04-17 00:53:24'),
(57, 'Update', 16, 'Promosindo Midia Tenaga', 'Jakarta', '1011', 7, 12, '2019-04-17 00:53:39'),
(58, 'Delete', 10, 'PHE WMO', 'Jakarta', '1004', 6, 12, '2019-05-01 18:56:47'),
(59, 'Delete', 11, 'Pertamina EP Cepu', 'Cepu', '1006', 6, 12, '2019-05-01 18:56:54'),
(60, 'Delete', 14, 'Schlumberger', 'Jakarta', '1009', 7, 12, '2019-05-01 18:57:00'),
(61, 'Delete', 15, 'Halliburton', 'Jakarta', '1010', 7, 12, '2019-05-01 18:57:07'),
(62, 'Update', 1, 'Pertamina', 'Jakarta', '1000', 1, 12, '2019-05-14 02:43:34'),
(63, 'Create', 17, 'a', 'a', '123', 7, 12, '2019-07-08 20:19:32'),
(64, 'Delete', 17, 'a', 'a', '123', 7, 12, '2019-07-08 21:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_logfile`
--

CREATE TABLE `tb_logfile` (
  `idlogfile` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idfile` int(11) NOT NULL,
  `barcode` varchar(21) NOT NULL,
  `title` varchar(99) NOT NULL,
  `pathfile` text NOT NULL,
  `sendpassword` varchar(3) NOT NULL,
  `iduser_owner` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_logfile`
--

INSERT INTO `tb_logfile` (`idlogfile`, `note`, `idfile`, `barcode`, `title`, `pathfile`, `sendpassword`, `iduser_owner`, `updated_by`, `updated_at`) VALUES
(45, 'Create', 13, 'PM-1-01A-01-01-00-001', 'SAMPLE-1 PGE', '10-05-2019_PGE_SAMPLE-1_PM-1-01A-01-01-00-001.pdf', 'Yes', 14, 13, '2019-05-11 02:25:06'),
(46, 'Create', 14, 'PM-1-01A-01-01-00-002', 'SAMPLE-2 PGE', '10-05-2019_PGE_SAMPLE-2_PM-1-01A-01-01-00-002.pdf', 'Yes', 14, 13, '2019-05-11 02:25:52'),
(47, 'Create', 15, 'PM-1-01A-01-01-00-003', 'SAMPLE-3 PGE', '10-05-2019_PGE_SAMPLE-3_PM-1-01A-01-01-00-003.pdf', 'Yes', 14, 13, '2019-05-11 02:26:28'),
(48, 'Create', 16, 'PM-1-01A-01-01-00-004', 'SAMPLE-4 PGE', '10-05-2019_PGE_SAMPLE-4_PM-1-01A-01-01-00-004.pdf', 'Yes', 14, 13, '2019-05-11 02:27:12'),
(49, 'Create', 17, 'PM-1-01A-01-01-00-005', 'SAMPLE-5 PGE', '10-05-2019_PGE_SAMPLE-5_PM-1-01A-01-01-00-005.pdf', 'Yes', 14, 13, '2019-05-11 02:27:43'),
(50, 'Create', 18, 'PM-1-01A-01-01-00-006', 'SAMPLE-6 PGE', '10-05-2019_PGE_SAMPLE-6_PM-1-01A-01-01-00-006.pdf', 'Yes', 14, 13, '2019-05-11 02:28:12'),
(51, 'Create', 19, 'PM-1-01A-01-01-00-007', 'SAMPLE-7 PGE', '10-05-2019_PGE_SAMPLE-7_PM-1-01A-01-01-00-007.pdf', 'Yes', 14, 13, '2019-05-11 02:28:50'),
(52, 'Create', 20, 'PM-1-01A-01-01-00-008', 'SAMPLE-8 PGE', '10-05-2019_PGE_SAMPLE-8_PM-1-01A-01-01-00-008.pdf', 'Yes', 14, 13, '2019-05-11 02:29:51'),
(53, 'Create', 21, 'PM-1-01A-01-01-00-009', 'SAMPLE-9 PGE', '10-05-2019_PGE_SAMPLE-9_PM-1-01A-01-01-00-009.pdf', 'Yes', 14, 13, '2019-05-11 02:30:26'),
(54, 'Create', 22, 'PM-1-01A-01-01-00-010', 'SAMPLE-10 PGE', '10-05-2019_PGE_SAMPLE-10_PM-1-01A-01-01-00-010.pdf', 'Yes', 14, 13, '2019-05-11 02:31:02'),
(55, 'Create', 23, 'PM-1-01A-01-03-00-001', 'SAMPLE-21 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-21_PM-1-01A-01-03-00-001.pdf', 'Yes', 28, 13, '2019-05-14 22:18:35'),
(56, 'Create', 24, 'PM-1-01A-01-03-00-002', 'SAMPLE-22 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-22_PM-1-01A-01-03-00-002.pdf', 'Yes', 28, 13, '2019-05-14 22:19:19'),
(57, 'Create', 25, 'PM-1-01A-01-03-00-003', 'SAMPLE-23 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-23_PM-1-01A-01-03-00-003.pdf', 'Yes', 28, 13, '2019-05-14 22:19:59'),
(58, 'Create', 26, 'PM-1-01A-01-03-00-004', 'SAMPLE-24 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-24_PM-1-01A-01-03-00-004.pdf', 'Yes', 28, 13, '2019-05-14 22:20:56'),
(59, 'Create', 27, 'PM-1-01A-01-03-00-005', 'SAMPLE-25 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-25_PM-1-01A-01-03-00-005.pdf', 'Yes', 28, 13, '2019-05-14 22:21:44'),
(60, 'Create', 28, 'PM-1-01A-01-03-00-006', 'SAMPLE-26 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-26_PM-1-01A-01-03-00-006.pdf', 'Yes', 28, 13, '2019-05-14 22:22:51'),
(61, 'Create', 29, 'PM-1-01A-01-03-00-007', 'SAMPLE-27 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-27_PM-1-01A-01-03-00-007.pdf', 'Yes', 28, 13, '2019-05-14 22:23:37'),
(62, 'Create', 30, 'PM-1-01A-01-03-00-008', 'SAMPLE-28 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-28_PM-1-01A-01-03-00-008.pdf', 'Yes', 28, 13, '2019-05-14 22:24:18'),
(63, 'Create', 31, 'PM-1-01A-01-03-00-009', 'SAMPLE-29 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-29_PM-1-01A-01-03-00-009.pdf', 'Yes', 28, 13, '2019-05-14 22:24:50'),
(64, 'Create', 32, 'PM-1-01A-01-03-00-010', 'SAMPLE-30 PHE-OK', '14-05-2019_PHE-OK_SAMPLE-30_PM-1-01A-01-03-00-010.pdf', 'Yes', 28, 13, '2019-05-14 22:25:20'),
(65, 'Create', 33, 'PM-1-01A-01-02-00-001', 'SAMPLE-11 PHE-ONWJ', '15-05-2019_PHE-ONWJ_SAMPLE-11_PM-1-01A-01-02-00-001.pdf', 'Yes', 33, 13, '2019-05-15 18:38:52'),
(66, 'Create', 34, 'PM-1-01A-01-02-00-002', 'SAMPLE-12 PHE-ONWJ', '15-05-2019_PHE-ONWJ_SAMPLE-12_PM-1-01A-01-02-00-002.pdf', 'Yes', 33, 13, '2019-05-15 18:42:16'),
(67, 'Create', 35, '111111', 'sssss', '14-06-2019_Buku-SISTEM_BASIS_DATA (1).pdf', 'Yes', 14, 13, '2019-06-14 17:46:53'),
(68, 'Update', 22, 'PM-1-01A-01-01-00-010', 'FINAL WELL REPORT PGE-010', '10-05-2019_PGE_SAMPLE-10_PM-1-01A-01-01-00-010.pdf', 'Yes', 14, 12, '2019-06-22 13:25:59'),
(69, 'Update', 21, 'PM-1-01A-01-01-00-009', 'FINAL WELL REPORT PGE-009', '10-05-2019_PGE_SAMPLE-9_PM-1-01A-01-01-00-009.pdf', 'Yes', 14, 12, '2019-06-22 13:26:02'),
(70, 'Update', 20, 'PM-1-01A-01-01-00-008', 'FINAL WELL REPORT PGE-008', '10-05-2019_PGE_SAMPLE-8_PM-1-01A-01-01-00-008.pdf', 'Yes', 14, 12, '2019-06-22 13:26:04'),
(71, 'Update', 19, 'PM-1-01A-01-01-00-007', 'FINAL WELL REPORT PGE-007', '10-05-2019_PGE_SAMPLE-7_PM-1-01A-01-01-00-007.pdf', 'Yes', 14, 12, '2019-06-22 13:26:07'),
(72, 'Update', 18, 'PM-1-01A-01-01-00-006', 'FINAL WELL REPORT PGE-006', '10-05-2019_PGE_SAMPLE-6_PM-1-01A-01-01-00-006.pdf', 'Yes', 14, 12, '2019-06-22 13:26:10'),
(73, 'Update', 17, 'PM-1-01A-01-01-00-005', 'FINAL WELL REPORT PGE-005', '10-05-2019_PGE_SAMPLE-5_PM-1-01A-01-01-00-005.pdf', 'Yes', 14, 12, '2019-06-22 13:26:13'),
(74, 'Update', 16, 'PM-1-01A-01-01-00-004', 'FINAL WELL REPORT PGE-004', '10-05-2019_PGE_SAMPLE-4_PM-1-01A-01-01-00-004.pdf', 'Yes', 14, 12, '2019-06-22 13:26:17'),
(75, 'Update', 15, 'PM-1-01A-01-01-00-003', 'FINAL WELL REPORT PGE-003', '10-05-2019_PGE_SAMPLE-3_PM-1-01A-01-01-00-003.pdf', 'Yes', 14, 12, '2019-06-22 13:26:23'),
(76, 'Update', 14, 'PM-1-01A-01-01-00-002', 'FINAL WELL REPORT PGE-002', '10-05-2019_PGE_SAMPLE-2_PM-1-01A-01-01-00-002.pdf', 'Yes', 14, 12, '2019-06-22 13:26:27'),
(77, 'Update', 13, 'PM-1-01A-01-01-00-001', 'FINAL WELL REPORT PGE-001', '10-05-2019_PGE_SAMPLE-1_PM-1-01A-01-01-00-001.pdf', 'Yes', 14, 12, '2019-06-22 13:26:30'),
(78, 'Update', 32, 'PM-1-01A-01-03-00-010', 'FINAL WELL REPORT PHE_OK-030', '14-05-2019_PHE-OK_SAMPLE-30_PM-1-01A-01-03-00-010.pdf', 'Yes', 28, 12, '2019-06-22 13:28:44'),
(79, 'Update', 31, 'PM-1-01A-01-03-00-009', 'FINAL WELL REPORT PHE_OK-029', '14-05-2019_PHE-OK_SAMPLE-29_PM-1-01A-01-03-00-009.pdf', 'Yes', 28, 12, '2019-06-22 13:28:46'),
(80, 'Update', 30, 'PM-1-01A-01-03-00-008', 'FINAL WELL REPORT PHE_OK-028', '14-05-2019_PHE-OK_SAMPLE-28_PM-1-01A-01-03-00-008.pdf', 'Yes', 28, 12, '2019-06-22 13:28:53'),
(81, 'Update', 29, 'PM-1-01A-01-03-00-007', 'FINAL WELL REPORT PHE_OK-027', '14-05-2019_PHE-OK_SAMPLE-27_PM-1-01A-01-03-00-007.pdf', 'Yes', 28, 12, '2019-06-22 13:28:55'),
(82, 'Update', 28, 'PM-1-01A-01-03-00-006', 'FINAL WELL REPORT PHE_OK-026', '14-05-2019_PHE-OK_SAMPLE-26_PM-1-01A-01-03-00-006.pdf', 'Yes', 28, 12, '2019-06-22 13:28:59'),
(83, 'Update', 27, 'PM-1-01A-01-03-00-005', 'FINAL WELL REPORT PHE_OK-025', '14-05-2019_PHE-OK_SAMPLE-25_PM-1-01A-01-03-00-005.pdf', 'Yes', 28, 12, '2019-06-22 13:29:02'),
(84, 'Update', 26, 'PM-1-01A-01-03-00-004', 'FINAL WELL REPORT PHE_OK-024', '14-05-2019_PHE-OK_SAMPLE-24_PM-1-01A-01-03-00-004.pdf', 'Yes', 28, 12, '2019-06-22 13:29:05'),
(85, 'Update', 25, 'PM-1-01A-01-03-00-003', 'FINAL WELL REPORT PHE_OK-023', '14-05-2019_PHE-OK_SAMPLE-23_PM-1-01A-01-03-00-003.pdf', 'Yes', 28, 12, '2019-06-22 13:29:08'),
(86, 'Update', 24, 'PM-1-01A-01-03-00-002', 'FINAL WELL REPORT PHE_OK-022', '14-05-2019_PHE-OK_SAMPLE-22_PM-1-01A-01-03-00-002.pdf', 'Yes', 28, 12, '2019-06-22 13:29:11'),
(87, 'Update', 23, 'PM-1-01A-01-03-00-001', 'FINAL WELL REPORT PHE_OK-021', '14-05-2019_PHE-OK_SAMPLE-21_PM-1-01A-01-03-00-001.pdf', 'Yes', 28, 12, '2019-06-22 13:29:15'),
(88, 'Delete', 35, '111111', 'sssss', '14-06-2019_Buku-SISTEM_BASIS_DATA (1).pdf', 'Yes', 14, 13, '2019-06-22 13:35:39'),
(89, 'Update', 34, 'PM-1-01A-01-02-00-002', 'FINAL WELL REPORT PHE_ONWJ-012', '15-05-2019_PHE-ONWJ_SAMPLE-12_PM-1-01A-01-02-00-002.pdf', 'Yes', 33, 12, '2019-06-22 13:36:38'),
(90, 'Update', 33, 'PM-1-01A-01-02-00-001', 'FINAL WELL REPORT PHE_ONWJ-011', '15-05-2019_PHE-ONWJ_SAMPLE-11_PM-1-01A-01-02-00-001.pdf', 'Yes', 33, 12, '2019-06-22 13:36:46'),
(91, 'Create', 35, 'PM-1-01A-01-02-00-003', 'FINAL WELL REPORT PHE_ONWJ-012', '29-06-2019_PHE-ONWJ_SAMPLE-13_PM-1-01A-01-02-00-003.pdf', 'Yes', 33, 13, '2019-06-30 01:18:20'),
(92, 'Update', 35, 'PM-1-01A-01-02-00-003', 'FINAL WELL REPORT PHE_ONWJ-013', '29-06-2019_PHE-ONWJ_SAMPLE-13_PM-1-01A-01-02-00-003.pdf', 'Yes', 33, 13, '2019-07-08 20:54:55'),
(93, 'Create', 36, 'PM-1-01A-01-02-00-004', 'FINAL WELL REPORT PHE_ONWJ-014', '08-07-2019_PHE-ONWJ_SAMPLE-14_PM-1-01A-01-02-00-004.pdf', 'Yes', 33, 13, '2019-07-08 20:56:16'),
(94, 'Create', 37, 'PM-1-01A-01-02-00-005', 'FINAL WELL REPORT PHE_ONWJ-015', '28-07-2019_PHE-ONWJ_SAMPLE-15_PM-1-01A-01-02-00-005.pdf', 'Yes', 33, 13, '2019-07-28 22:40:36'),
(95, 'Create', 38, 'PM-1-01A-01-02-00-006', 'FINAL WELL REPORT PHE_ONWJ-016', '02-08-2019_PHE-ONWJ_SAMPLE-16_PM-1-01A-01-02-00-006.pdf', 'Yes', 33, 13, '2019-08-02 14:17:32'),
(96, 'Create', 39, 'PM-1-01A-01-02-00-007', 'seminar isi', '02-08-2019_PHE-ONWJ_SAMPLE-17_PM-1-01A-01-02-00-007.pdf', 'Yes', 34, 13, '2019-08-02 14:43:57'),
(97, 'Create', 40, 'PM-1-01A-01-02-00-008', 'testing', '02-08-2019_PHE-ONWJ_SAMPLE-18_PM-1-01A-01-02-00-008.pdf', 'Yes', 36, 13, '2019-08-02 15:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `tb_loglevel`
--

CREATE TABLE `tb_loglevel` (
  `idloglevel` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idlevel` int(11) NOT NULL,
  `level` varchar(33) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_loglevel`
--

INSERT INTO `tb_loglevel` (`idloglevel`, `note`, `idlevel`, `level`, `updated_by`, `updated_at`) VALUES
(9, 'Create', 1, 'Administrator', 12, '2019-04-17 00:22:00'),
(10, 'Create', 5, 'Data Warehouse', 12, '2019-04-17 00:26:43'),
(11, 'Create', 6, 'Data Owner', 12, '2019-04-17 00:27:01'),
(12, 'Create', 7, 'Guest', 12, '2019-04-17 00:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_logrecovery`
--

CREATE TABLE `tb_logrecovery` (
  `idlogrecovery` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idrecovery` int(11) NOT NULL,
  `idtransaction` int(11) NOT NULL,
  `iduser_recovery` int(11) NOT NULL,
  `numberofrecovery` varchar(11) NOT NULL,
  `kunci_recovery` varchar(65000) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_logrecovery`
--

INSERT INTO `tb_logrecovery` (`idlogrecovery`, `note`, `idrecovery`, `idtransaction`, `iduser_recovery`, `numberofrecovery`, `kunci_recovery`, `updated_by`, `updated_at`) VALUES
(17, 'Create', 7, 5, 34, '1', '0302b2d5c25c391e41d49ff5db99d380275340fe30e928', 34, '2019-05-09 00:12:14'),
(18, 'Create', 8, 5, 33, '2', '03011ede7f223888g008c02d532f31b5da26f6d470bc5d', 33, '2019-05-09 00:13:53'),
(19, 'Create', 9, 5, 35, '3', '03030a32f6df30f4f7a3cb86c86a149316b710ab71b798', 12, '2019-05-09 00:51:37'),
(20, 'Delete', 7, 5, 34, '1', '0302b2d5c25c391e41d49ff5db99d380275340fe30e928', 34, '2019-05-09 00:55:00'),
(21, 'Delete', 9, 5, 35, '3', '03030a32f6df30f4f7a3cb86c86a149316b710ab71b798', 12, '2019-05-09 00:58:29'),
(22, 'Delete', 8, 5, 33, '2', '03011ede7f223888g008c02d532f31b5da26f6d470bc5d', 33, '2019-05-09 00:58:33'),
(23, 'Create', 10, 13, 33, '1', '0301270d37655ac8b739659e0edabea9ebc4658256ea97', 33, '2019-05-09 01:51:31'),
(24, 'Create', 11, 13, 34, '2', '0302a42f746f8ccc7c144a9b0bb4f19f92a7c9be76d5d6', 34, '2019-05-09 01:52:23'),
(25, 'Update', 10, 13, 33, '1', '030170c207c6e80f821c8eeb997187870993ff3f6df933', 33, '2019-05-09 01:51:31'),
(26, 'Delete', 10, 13, 33, '1', '030170c207c6e80f821c8eeb997187870993ff3f6df933', 33, '2019-05-11 02:22:05'),
(27, 'Delete', 11, 13, 34, '2', '0302a42f746f8ccc7c144a9b0bb4f19f92a7c9be76d5d6', 34, '2019-05-11 02:22:06'),
(28, 'Create', 12, 15, 14, '1', '0301221ea3621017c44bf7df772c07100674c13cd0b648', 14, '2019-05-11 03:33:08'),
(29, 'Create', 13, 15, 15, '2', '03023022533298138a837e2d14e7d29166dcfc51fd9d7f', 15, '2019-05-11 04:08:26'),
(30, 'Update', 12, 15, 14, '1', '030190e5a74d48d794d0ac51bd778581487e856b0de61b', 14, '2019-05-11 04:32:11'),
(31, 'Create', 14, 15, 16, '3', '0303310632e11ce7135ba4c5387c1661874994e0fe565c', 16, '2019-05-11 04:36:09'),
(32, 'Create', 15, 15, 17, '4', '030493914458d65030581d17283753f2abc74e161011b3', 17, '2019-05-12 00:50:19'),
(33, 'Create', 16, 17, 14, '1', '030190e5a74d48d794d0ac51bd778581487e856b0de61b', 14, '2019-05-13 00:17:59'),
(34, 'Create', 17, 17, 16, '2', '0303310632e11ce7135ba4c5387c1661874994e0fe565c', 16, '2019-05-13 00:21:41'),
(35, 'Create', 18, 17, 18, '3', '030555c28999c450e17aeb25e5188842d2542af635cf83', 18, '2019-05-13 00:22:30'),
(36, 'Create', 19, 18, 18, '1', '030591998750957aacc171ec5a7446288ad74a21420f3f', 18, '2019-05-13 00:23:17'),
(37, 'Create', 20, 18, 16, '2', '030344a9942f6ff01abf246031986f6bd4bd5b18e87fc6', 16, '2019-05-13 00:24:02'),
(38, 'Update', 16, 17, 14, '1', '030189f341c9e9d796fc27edcad4ae371e35c43cba2209', 14, '2019-05-13 00:41:27'),
(39, 'Update', 17, 17, 16, '2', '0303fc1b72fd41a4b5dbg01f5e92e666fb39fd19901fce', 16, '2019-05-13 01:16:38'),
(40, 'Update', 18, 17, 18, '3', '0305c5c2afe2721cf1f35da0cde8c46ecf354df6c09357', 18, '2019-05-13 01:17:10'),
(41, 'Update', 18, 17, 18, '3', '0305b27caf96f07877e56c3727eeb4405042ea8607844f', 18, '2019-05-13 01:57:10'),
(42, 'Update', 17, 17, 16, '2', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 01:58:40'),
(43, 'Update', 16, 17, 14, '1', '03013dd186b1e9b2d8aaca153ef7bb49fd7af7a37a07be', 14, '2019-05-13 01:59:26'),
(44, 'Update', 15, 15, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:02:46'),
(45, 'Create', 21, 18, 17, '3', '030462cb40b4b600642ea9010eb3fdcc7d6acf81c39cab', 17, '2019-05-13 02:03:04'),
(46, 'Create', 22, 17, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:03:33'),
(47, 'Update', 14, 15, 16, '3', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 02:28:10'),
(48, 'Create', 23, 16, 16, '1', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 02:28:36'),
(49, 'Create', 24, 21, 16, '1', '0303b728655d1303956a33d16e5ea36b80f24d9f150e85', 16, '2019-05-13 02:29:16'),
(50, 'Create', 25, 16, 17, '2', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:30:48'),
(51, 'Create', 26, 20, 17, '1', '03046e6361c6e6c079bc7198bca5a06bb8509128ef973b', 17, '2019-05-13 02:31:03'),
(52, 'Create', 27, 23, 17, '1', '0304b4g001304469a32977cf6258f197c41ad53cb7dfa9', 17, '2019-05-13 02:31:23'),
(53, 'Create', 28, 22, 17, '1', '0304309e1bba20dbbea992e2e2g031463ea69ab151547f', 17, '2019-05-13 02:32:37'),
(54, 'Create', 29, 29, 17, '1', '0304309e1bba20dbbea992e2e2g031463ea69ab151547f', 17, '2019-05-13 02:34:48'),
(55, 'Create', 30, 28, 17, '1', '0304b4g001304469a32977cf6258f197c41ad53cb7dfa9', 17, '2019-05-13 02:35:04'),
(56, 'Create', 31, 27, 17, '1', '03046cf0014652f87ab1fba5ea3ab1a0e35e1009c03293', 17, '2019-05-13 02:35:45'),
(57, 'Create', 32, 18, 14, '4', '030103db18f31bbe621d9824173024db0f227169cc61cb', 14, '2019-05-13 02:49:54'),
(58, 'Create', 33, 18, 15, '5', '0302e5ed0ecae9df5f784ce9017f4b41de31ee9385cde0', 15, '2019-05-13 02:51:21'),
(59, 'Update', 19, 18, 18, '1', '03059b3d32d38bb61f7f2316d831f1e5d10bcaa5647009', 18, '2019-05-13 02:51:49'),
(60, 'Create', 34, 15, 18, '5', '0305b27caf96f07877e56c3727eeb4405042ea8607844f', 18, '2019-05-13 02:57:26'),
(61, 'Create', 35, 42, 33, '1', '0301cca321fe7e0256896a3613a10ebbee751eef8f2bd4', 33, '2019-05-15 18:47:01'),
(62, 'Create', 36, 42, 34, '2', '0302f573085b5aa5043beff48fb84036b317ab56f33705', 34, '2019-05-15 18:48:48'),
(63, 'Create', 37, 42, 35, '3', '0303cbbee34ac2173c58bb68a472c6a57d17d6645b54c7', 35, '2019-05-15 18:50:17'),
(64, 'Update', 35, 42, 33, '1', '0301b1f5a43b980d9c75d438bf0a1a07cb685c1f1a0cb6', 33, '2019-05-15 18:53:43'),
(65, 'Update', 12, 15, 14, '1', '03013dd186b1e9b2d8aaca153ef7bb49fd7af7a37a07be', 12, '2019-05-18 00:17:44'),
(66, 'Update', 12, 15, 14, '1', '03013dd186b1e9b2d8aaca153ef7bb49fd7af7a37a07be', 12, '2019-05-18 00:18:55'),
(67, 'Delete', 35, 42, 33, '1', '0301b1f5a43b980d9c75d438bf0a1a07cb685c1f1a0cb6', 33, '2019-05-22 00:41:18'),
(68, 'Create', 38, 42, 33, '3', '0301b1f5a43b980d9c75d438bf0a1a07cb685c1f1a0cb6', 33, '2019-06-14 17:40:13'),
(69, 'Update', 36, 42, 34, '2', '0302c47b0a2b8bfc2f5d5546426dc09d63eb474cb21c0a', 34, '2019-06-14 17:41:04'),
(70, 'Update', 37, 42, 35, '3', '030389e1610106fbecfab25abc5520f3f7b8f2b4f7602f', 35, '2019-06-14 17:42:05'),
(71, 'Create', 39, 44, 14, '1', '03018b29c802f2a2', 14, '2019-06-14 17:53:53'),
(72, 'Create', 40, 44, 16, '2', '0303d8475f3d1e84', 16, '2019-06-14 17:56:44'),
(73, 'Create', 41, 44, 15, '3', '03020376169d8652', 15, '2019-06-14 18:02:52'),
(74, 'Delete', 39, 44, 14, '1', '03018b29c802f2a2', 14, '2019-06-22 13:30:53'),
(75, 'Delete', 40, 44, 16, '2', '0303d8475f3d1e84', 16, '2019-06-22 13:30:57'),
(76, 'Delete', 41, 44, 15, '3', '03020376169d8652', 15, '2019-06-22 13:31:01'),
(77, 'Create', 39, 47, 33, '1', '0301b1f5a43b980d9c75d438bf0a1a07cb685c1f1a0cb6', 33, '2019-07-19 20:14:14'),
(78, 'Create', 40, 48, 33, '1', '0301beac7c4ee81c799e5839c1a64d9f3e9c17fb6e88f2', 33, '2019-07-28 22:45:01'),
(79, 'Create', 41, 48, 34, '2', '0302944fb285c8584f88b50ed25501985e22c8887ad4f7', 34, '2019-07-28 22:47:04'),
(80, 'Create', 42, 48, 35, '3', '0303d337cfd6cee4b4g043b0643b4d1d8dc441d6541344', 35, '2019-07-28 22:48:13'),
(81, 'Create', 43, 48, 36, '4', '03047a64d340fabfa704031d7858302fcb8084e4fd47db', 36, '2019-07-28 22:49:56'),
(82, 'Create', 44, 49, 33, '1', '0301c23e1ab4b2', 33, '2019-08-02 14:23:00'),
(83, 'Create', 45, 49, 34, '2', '0302bdfe8f9ac4', 34, '2019-08-02 14:24:19'),
(84, 'Create', 46, 49, 35, '3', '030352a0c1169b', 35, '2019-08-02 14:25:38'),
(85, 'Update', 12, 15, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:32:33'),
(86, 'Create', 47, 16, 14, '3', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:32:52'),
(87, 'Update', 16, 17, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:33:21'),
(88, 'Update', 16, 17, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:33:27'),
(89, 'Update', 32, 18, 14, '4', '03016ca1f57c54a7af9c02042346', 14, '2019-08-02 19:34:05'),
(90, 'Create', 48, 27, 14, '2', '03014c5b33ee424f3933b0a099dc', 14, '2019-08-02 19:34:32'),
(91, 'Create', 49, 30, 14, '1', '030193636d859cab105913485c39', 14, '2019-08-02 19:34:47'),
(92, 'Create', 50, 32, 14, '1', '030169ba629f3d0a5b8f03e8fb35', 14, '2019-08-02 19:35:03'),
(93, 'Update', 43, 48, 36, '4', '0304351af66e353907c79396', 36, '2019-08-02 19:41:26'),
(94, 'Create', 51, 42, 36, '4', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:41:40'),
(95, 'Create', 52, 49, 36, '4', '0304b5a7ce5c1cca1b5c3f05', 36, '2019-08-02 19:41:55'),
(96, 'Create', 53, 50, 36, '1', '03044b47286779421f3c47c0e5', 36, '2019-08-02 19:42:12'),
(97, 'Create', 54, 47, 36, '2', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:42:39'),
(98, 'Update', 38, 42, 33, '3', '03014b25d01639cae47b4733', 33, '2019-08-02 19:43:55'),
(99, 'Update', 39, 47, 33, '1', '03014b25d01639cae47b4733', 33, '2019-08-02 19:44:14'),
(100, 'Update', 40, 48, 33, '1', '03017540150ea38a79cfaaaa', 33, '2019-08-02 19:44:31'),
(101, 'Update', 44, 49, 33, '1', '0301c53f754ce410fee7c66f', 33, '2019-08-02 19:44:47'),
(102, 'Create', 55, 50, 33, '2', '0301c53352399984d94d82307d', 33, '2019-08-02 19:45:03'),
(103, 'Create', 56, 47, 34, '3', '0302db011303b7e5f55b782b', 34, '2019-08-02 19:54:26'),
(104, 'Update', 41, 48, 34, '2', '0302c6cc1275d62a72227169', 34, '2019-08-02 19:54:40'),
(105, 'Update', 45, 49, 34, '2', '0302450ce16fa820d15bde2d', 34, '2019-08-02 19:54:54'),
(106, 'Create', 57, 50, 34, '3', '0302067543d4d50a7204b2a5ee', 34, '2019-08-02 19:55:07'),
(107, 'Create', 58, 51, 33, '1', '0301c53352399984d94d82307d', 33, '2019-08-03 00:25:27'),
(108, 'Update', 58, 51, 33, '1', '0301c53352399984d94d82307d', 33, '2019-08-03 00:28:53'),
(109, 'Update', 12, 15, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:36:36'),
(110, 'Update', 47, 16, 14, '3', '03018ff5eb822e65cec2', 14, '2019-08-13 20:37:27'),
(111, 'Update', 16, 17, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:37:46'),
(112, 'Update', 32, 18, 14, '4', '0301472cf8278bd926d2', 14, '2019-08-13 20:38:05'),
(113, 'Create', 59, 19, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:38:24'),
(114, 'Create', 60, 20, 14, '2', '030131d9fbcb0152f24a', 14, '2019-08-13 20:38:49'),
(115, 'Create', 61, 21, 14, '2', '0301e1481c3398f50ec8', 14, '2019-08-13 20:39:04'),
(116, 'Create', 62, 22, 14, '2', '0301472cf8278bd926d2', 14, '2019-08-13 20:39:21'),
(117, 'Create', 63, 23, 14, '2', '03018f70f4b5123dcfea', 14, '2019-08-13 20:39:43'),
(118, 'Create', 64, 46, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:42:53'),
(119, 'Create', 65, 43, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:42:56'),
(120, 'Create', 66, 31, 14, '1', '030131d9fbcb0152f24a', 14, '2019-08-13 20:43:01'),
(121, 'Update', 49, 30, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:43:03'),
(122, 'Create', 67, 29, 14, '2', '0301472cf8278bd926d2', 14, '2019-08-13 20:43:05'),
(123, 'Update', 48, 27, 14, '2', '0301817037b2f5288e71', 14, '2019-08-13 20:43:10'),
(124, 'Create', 68, 25, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:43:14'),
(125, 'Create', 69, 24, 14, '1', '0301817037b2f5288e71', 14, '2019-08-13 20:43:17'),
(126, 'Create', 70, 26, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:44:30'),
(127, 'Create', 71, 28, 14, '2', '03018f70f4b5123dcfea', 14, '2019-08-13 20:44:32'),
(128, 'Update', 50, 32, 14, '1', '03017748cd841d527a87', 14, '2019-08-13 20:44:34'),
(129, 'Update', 52, 49, 36, '4', '03044c28cb653bc4ba8f', 36, '2019-08-13 21:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `tb_logshare`
--

CREATE TABLE `tb_logshare` (
  `idlogshare` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idshare` int(11) NOT NULL,
  `idfile` int(11) NOT NULL,
  `iduser_share` int(11) NOT NULL,
  `numberofshare` varchar(11) NOT NULL,
  `kunci` varchar(65000) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_logshare`
--

INSERT INTO `tb_logshare` (`idlogshare`, `note`, `idshare`, `idfile`, `iduser_share`, `numberofshare`, `kunci`, `updated_by`, `updated_at`) VALUES
(86, 'Create', 61, 6, 14, '1', '', 12, '2019-05-01 19:39:32'),
(87, 'Create', 62, 6, 15, '2', '', 12, '2019-05-01 19:39:32'),
(88, 'Create', 63, 6, 16, '3', '', 12, '2019-05-01 19:39:32'),
(89, 'Create', 64, 6, 17, '4', '', 12, '2019-05-01 19:39:32'),
(90, 'Create', 65, 6, 18, '5', '', 12, '2019-05-01 19:39:32'),
(91, 'Create', 66, 7, 14, '1', '', 12, '2019-05-01 19:41:20'),
(92, 'Create', 67, 7, 15, '2', '', 12, '2019-05-01 19:41:20'),
(93, 'Create', 68, 7, 16, '3', '', 12, '2019-05-01 19:41:20'),
(94, 'Create', 69, 7, 17, '4', '', 12, '2019-05-01 19:41:20'),
(95, 'Create', 70, 7, 18, '5', '', 12, '2019-05-01 19:41:21'),
(96, 'Create', 71, 8, 28, '1', '', 12, '2019-05-01 19:42:00'),
(97, 'Create', 72, 8, 29, '2', '', 12, '2019-05-01 19:42:00'),
(98, 'Create', 73, 8, 30, '3', '', 12, '2019-05-01 19:42:00'),
(99, 'Create', 74, 8, 31, '4', '', 12, '2019-05-01 19:42:01'),
(100, 'Create', 75, 8, 32, '5', '', 12, '2019-05-01 19:42:01'),
(101, 'Create', 76, 9, 28, '1', '', 12, '2019-05-01 19:43:09'),
(102, 'Create', 77, 9, 29, '2', '', 12, '2019-05-01 19:43:09'),
(103, 'Create', 78, 9, 30, '3', '', 12, '2019-05-01 19:43:09'),
(104, 'Create', 79, 9, 31, '4', '', 12, '2019-05-01 19:43:09'),
(105, 'Create', 80, 9, 32, '5', '', 12, '2019-05-01 19:43:10'),
(106, 'Create', 81, 10, 33, '1', '', 12, '2019-05-01 19:45:16'),
(107, 'Create', 82, 10, 34, '2', '', 12, '2019-05-01 19:45:16'),
(108, 'Create', 83, 10, 35, '3', '', 12, '2019-05-01 19:45:17'),
(109, 'Create', 84, 10, 36, '4', '', 12, '2019-05-01 19:45:17'),
(110, 'Create', 85, 10, 37, '5', '', 12, '2019-05-01 19:45:17'),
(111, 'Update', 61, 6, 14, '1', '03014d3f76301894b41d0cb8355a121dd22b0c4cff18d0', 14, '2019-05-01 20:28:24'),
(112, 'Update', 62, 6, 15, '2', '0302c36985af1d5fbe429656d1d1549af5c0e5e1f27860', 14, '2019-05-01 20:28:24'),
(113, 'Update', 63, 6, 16, '3', '0303b1cb5aad3c924fb0ca0b0391f6a796eeb9eb094fe3', 14, '2019-05-01 20:28:25'),
(114, 'Update', 64, 6, 17, '4', '03041764f62a752c6866a8d8ce9bf744b6b5896a469e57', 14, '2019-05-01 20:28:25'),
(115, 'Update', 65, 6, 18, '5', '0305f7355727c82e086530bb2fef57725415555fa864be', 14, '2019-05-01 20:28:25'),
(116, 'Create', 86, 11, 33, '1', '', 13, '2019-05-01 21:17:43'),
(117, 'Create', 87, 11, 34, '2', '', 13, '2019-05-01 21:17:44'),
(118, 'Create', 88, 11, 35, '3', '', 13, '2019-05-01 21:17:44'),
(119, 'Create', 89, 11, 36, '4', '', 13, '2019-05-01 21:17:45'),
(120, 'Create', 90, 11, 37, '5', '', 13, '2019-05-01 21:17:45'),
(121, 'Update', 81, 10, 33, '1', '0301c95dd4b36687afa8c5616de3c2f13f9cb617e6b13d', 33, '2019-05-01 21:18:23'),
(122, 'Update', 82, 10, 34, '2', '03020157d269ea30905a214f00f79529755b01e48f10d2', 33, '2019-05-01 21:18:23'),
(123, 'Update', 83, 10, 35, '3', '0303fb3b2754b82cd55843fbec69aadccf6e13922c4ff3', 33, '2019-05-01 21:18:23'),
(124, 'Update', 84, 10, 36, '4', '0304b409d574d17b7da22a632e3a00074cd5ec22be6da0', 33, '2019-05-01 21:18:23'),
(125, 'Update', 85, 10, 37, '5', '03052dc2dac9341c8937d789c96a99adee8f8a95436ada', 33, '2019-05-01 21:18:24'),
(126, 'Update', 86, 11, 33, '1', '030116a3ffe559a0d41cf593409fb385d9abe6e16752cf', 33, '2019-05-01 21:18:34'),
(127, 'Update', 87, 11, 34, '2', '03029d19ba2788947bb939146c9a5bd62e312fdd427217', 33, '2019-05-01 21:18:34'),
(128, 'Update', 88, 11, 35, '3', '0303e4b15ffaba0c2716fcb5b51e29232ec40d21c29010', 33, '2019-05-01 21:18:35'),
(129, 'Update', 89, 11, 36, '4', '0304eb69ef5bef09d9353b741a2c1d6ed96280afe6acba', 33, '2019-05-01 21:18:35'),
(130, 'Update', 90, 11, 37, '5', '0305b242684c268b8f15f9529dc437b62d0c8785aec613', 33, '2019-05-01 21:18:35'),
(131, 'Update', 66, 7, 14, '1', '03017287c0d169g02e85aac551g09486f4eb726a016f68', 14, '2019-05-01 21:22:46'),
(132, 'Update', 67, 7, 15, '2', '0302e5d3c4e64952469b55007d99ae0588a37f97f0a658', 14, '2019-05-01 21:22:46'),
(133, 'Update', 68, 7, 16, '3', '0303a8303970ce2879832fe4b5fa7eb0eb5957b4fbd502', 14, '2019-05-01 21:22:46'),
(134, 'Update', 69, 7, 17, '4', '0304bca02070f782c73d386ef92104851b0dfbc122fc67', 14, '2019-05-01 21:22:46'),
(135, 'Update', 70, 7, 18, '5', '0305202179e6c45f2fca70a0481041851ac069be671a86', 14, '2019-05-01 21:22:47'),
(136, 'Update', 71, 8, 28, '1', '03018652f9978f3c06becf0d9dcde693ecf1b88578f362', 28, '2019-05-01 21:23:25'),
(137, 'Update', 72, 8, 29, '2', '0302509aee4443e59a6491a11437c1b050862bcab4d937', 28, '2019-05-01 21:23:25'),
(138, 'Update', 73, 8, 30, '3', '0303af240c394a29ec3474eb986dc2885bf18bfce4e3b3', 28, '2019-05-01 21:23:26'),
(139, 'Update', 74, 8, 31, '4', '0304a2f25576a40afc2e78eb276ee91b0c30d71a0710d5', 28, '2019-05-01 21:23:26'),
(140, 'Update', 75, 8, 32, '5', '03052901c8fb5088ca529da1c33a356a64450e261f629d', 28, '2019-05-01 21:23:26'),
(141, 'Update', 76, 9, 28, '1', '0301210a3f39b97bdd968501bc50a50c850d3ca5796ce6', 28, '2019-05-01 21:23:35'),
(142, 'Update', 77, 9, 29, '2', '030244c9ab36a2a63c97dbfdcc364c28d25cc36a5487ae', 28, '2019-05-01 21:23:35'),
(143, 'Update', 78, 9, 30, '3', '0303b9887028e9b150442e2161e02685131cc47dc2818d', 28, '2019-05-01 21:23:36'),
(144, 'Update', 79, 9, 31, '4', '03047f488f0f8d9c189e80707c4c33224a4e3fdec25a83', 28, '2019-05-01 21:23:36'),
(145, 'Update', 80, 9, 32, '5', '0305970907ec8f6795a4d0e91c7c730076f2358c541290', 28, '2019-05-01 21:23:36'),
(146, 'Update', 81, 10, 33, '1', '03010fd653dccb56aced42514a53e4597150f3de828bdd', 33, '2019-05-05 02:03:41'),
(147, 'Update', 82, 10, 34, '2', '03022692c74e5c4688558a1a52aef09a3c602aba3c5506', 33, '2019-05-05 02:03:41'),
(148, 'Update', 83, 10, 35, '3', '030395828889e200c67b048c493d54f48f60d8c25f8fb3', 33, '2019-05-05 02:03:41'),
(149, 'Update', 84, 10, 36, '4', '03045ba6978c5b85655eb2a62f0111666950fbf6eb38e2', 33, '2019-05-05 02:03:41'),
(150, 'Update', 85, 10, 37, '5', '030579fef457c9d466ff926804fb27f2cb309355df5193', 33, '2019-05-05 02:03:41'),
(151, 'Update', 81, 10, 33, '1', '0301fe2b6648964e9a84a47586cf920c6766788ff1db5a', 33, '2019-05-06 23:54:08'),
(152, 'Update', 82, 10, 34, '2', '0302d91b9b908343effa1eg0eb4c2ac629fb16a2d6ae91', 33, '2019-05-06 23:54:09'),
(153, 'Update', 83, 10, 35, '3', '0303e21dcc08f50f2fa29dd05fa6fa5d74ee0b66e0aada', 33, '2019-05-06 23:54:09'),
(154, 'Update', 84, 10, 36, '4', '03041831f9b2ebb35c7d1fe6e4dcg0d3473f57dc0ecf34', 33, '2019-05-06 23:54:09'),
(155, 'Update', 85, 10, 37, '5', '03057d57218c652d758ba64178ee3c26a3f0fa02621ca1', 33, '2019-05-06 23:54:09'),
(156, 'Update', 81, 10, 33, '1', '0301d9d388b4e96c2f275dd27b9356ff33c3b555519397', 33, '2019-05-07 01:13:54'),
(157, 'Update', 82, 10, 34, '2', '0302d8231b1e9b841ddd6b2da26ca6bb6b2601f722e717', 33, '2019-05-07 01:13:54'),
(158, 'Update', 83, 10, 35, '3', '03034d3fe8714478fc615743a6b91f66d55b1611a42bb7', 33, '2019-05-07 01:13:54'),
(159, 'Update', 84, 10, 36, '4', '03043926edace548cab521138779c3007061f4a6d66175', 33, '2019-05-07 01:13:55'),
(160, 'Update', 85, 10, 37, '5', '03059cd92acf7cf588d8ca9e45ad908a3d3899b4b88852', 33, '2019-05-07 01:13:55'),
(161, 'Update', 81, 10, 33, '1', '0301a57c843f28b1c792bc21109d1f7dc713edd8f86fa6', 33, '2019-05-07 01:39:13'),
(162, 'Update', 82, 10, 34, '2', '0302206a061b09712870277dceee4a50d26f0ca93cde7c', 33, '2019-05-07 01:39:13'),
(163, 'Update', 83, 10, 35, '3', '0303c317b5c6d17156dc7043691fb1ab4e4390a1ff7cb8', 33, '2019-05-07 01:39:13'),
(164, 'Update', 84, 10, 36, '4', '03048c848f3e7eb150d59674e332538d3c9077c03e4a59', 33, '2019-05-07 01:39:14'),
(165, 'Update', 85, 10, 37, '5', '03057cb095851130165b990f3a2631f79c55c205fc4860', 33, '2019-05-07 01:39:14'),
(166, 'Update', 81, 10, 33, '1', '03016966933f8c83e1b5eb5c8c4ef29b490a08b5ccfa3b', 33, '2019-05-07 01:47:05'),
(167, 'Update', 82, 10, 34, '2', '03025482a895bd8e0736092f05cfb49165bead91fa31b9', 33, '2019-05-07 01:47:05'),
(168, 'Update', 83, 10, 35, '3', '030311a16c32c051a6c68aaa9eaf7713814a1dc2bad8ae', 33, '2019-05-07 01:47:05'),
(169, 'Update', 84, 10, 36, '4', '0304a1c3e01795cdbc636ccc55ef3b229db05a470ced1a', 33, '2019-05-07 01:47:05'),
(170, 'Update', 85, 10, 37, '5', '030502e802443c00490eb0952b8e00beb9ef6321f270ff', 33, '2019-05-07 01:47:06'),
(171, 'Update', 81, 10, 33, '1', '0301a7a587278dc292fdaae2bc05a9a81d5b37554d2a78', 33, '2019-05-07 01:48:24'),
(172, 'Update', 82, 10, 34, '2', '0302ee288f05bfd55d16feffee4a3dc027cf804ffe45b5', 33, '2019-05-07 01:48:24'),
(173, 'Update', 83, 10, 35, '3', '030324d845ccc369938f2887c7fcee794b8b0a1b4181ec', 33, '2019-05-07 01:48:25'),
(174, 'Update', 84, 10, 36, '4', '03044bb3aa7a997f33662a7b4719bad48990d7ba18de1c', 33, '2019-05-07 01:48:25'),
(175, 'Update', 85, 10, 37, '5', '030562babd1041163e9c03db6fa4a2d0e1dee52a835b47', 33, '2019-05-07 01:48:25'),
(176, 'Update', 86, 11, 33, '1', '0301427dacdb57ab1f5af8c9bf5a86ae68abcceaa3e077', 33, '2019-05-07 04:44:21'),
(177, 'Update', 87, 11, 34, '2', '03029852527925472690e9c33f1be35dab4fcb57443b08', 33, '2019-05-07 04:44:22'),
(178, 'Update', 88, 11, 35, '3', '030351cd200c980546e3001eb371463ff61d2d761443eb', 33, '2019-05-07 04:44:22'),
(179, 'Update', 89, 11, 36, '4', '03046eed1695afe67f523fdc195bb1544815f44613f81d', 33, '2019-05-07 04:44:22'),
(180, 'Update', 90, 11, 37, '5', '0305efb234126ae8d1dfa5fb73da229ca3371dc84158a1', 33, '2019-05-07 04:44:22'),
(181, 'Update', 86, 11, 33, '1', '0301b6d58662f8acdc164360ab271a4d676eb1bc0b11a6', 33, '2019-05-07 04:51:04'),
(182, 'Update', 87, 11, 34, '2', '0302c3d5b91853c70b018b2d33f631a51328c246e7a63b', 33, '2019-05-07 04:51:04'),
(183, 'Update', 88, 11, 35, '3', '0303774dc6544081c1020498cb987538325f63cdc2eef7', 33, '2019-05-07 04:51:04'),
(184, 'Update', 89, 11, 36, '4', '0304d33ead15bfdbfc19b0a0710ee607c412954f9de9d8', 33, '2019-05-07 04:51:05'),
(185, 'Update', 90, 11, 37, '5', '0305d6a86e5ccfd4bc468d4526598312c84257ce7897df', 33, '2019-05-07 04:51:05'),
(186, 'Update', 86, 11, 33, '1', '03011ede7f223888g008c02d532f31b5da26f6d470bc5d', 33, '2019-05-07 14:44:49'),
(187, 'Update', 87, 11, 34, '2', '0302b2d5c25c391e41d49ff5db99d380275340fe30e928', 33, '2019-05-07 14:44:49'),
(188, 'Update', 88, 11, 35, '3', '03030a32f6df30f4f7a3cb86c86a149316b710ab71b798', 33, '2019-05-07 14:44:49'),
(189, 'Update', 89, 11, 36, '4', '030428f71aaa1d071f7643e21aa3f7eea75166dc3226ac', 33, '2019-05-07 14:44:50'),
(190, 'Update', 90, 11, 37, '5', '03050b2130be005abc4d0807d3437990d9224190743764', 33, '2019-05-07 14:44:50'),
(191, 'Update', 81, 10, 33, '1', '030115ff17128d97a253c49b75a0764d925ccf6822f4c2', 33, '2019-05-07 16:00:15'),
(192, 'Update', 82, 10, 34, '2', '0302c59e5ed3a80c642b1622fb885b98d3bd2f1044af3e', 33, '2019-05-07 16:00:15'),
(193, 'Update', 83, 10, 35, '3', '03035e2b01727e9178ca25c7c2e6e011f05252269662ab', 33, '2019-05-07 16:00:15'),
(194, 'Update', 84, 10, 36, '4', '0304e2a701f10f24de2ef188cbb903bae91c37aa170d07', 33, '2019-05-07 16:00:16'),
(195, 'Update', 85, 10, 37, '5', '03054f105e4e5cc7955978661501c791be1bdf9bc9b154', 33, '2019-05-07 16:00:16'),
(196, 'Create', 91, 12, 33, '1', '', 13, '2019-05-08 23:26:28'),
(197, 'Create', 92, 12, 34, '2', '', 13, '2019-05-08 23:26:28'),
(198, 'Create', 93, 12, 35, '3', '', 13, '2019-05-08 23:26:29'),
(199, 'Update', 91, 12, 33, '1', '0301270d37655ac8b739659e0edabea9ebc4658256ea97', 33, '2019-05-08 23:27:00'),
(200, 'Update', 92, 12, 34, '2', '0302a42f746f8ccc7c144a9b0bb4f19f92a7c9be76d5d6', 33, '2019-05-08 23:27:00'),
(201, 'Update', 93, 12, 35, '3', '0303c6b3e44fc33c81d3dd2728bcc91323da5be190f2f4', 33, '2019-05-08 23:27:00'),
(202, 'Create', 94, 12, 36, '4', '', 13, '2019-05-08 23:32:04'),
(203, 'Create', 95, 12, 37, '5', '', 13, '2019-05-08 23:32:05'),
(204, 'Create', 96, 13, 13, '1', '', 13, '2019-05-09 01:18:32'),
(205, 'Create', 97, 13, 24, '2', '', 13, '2019-05-09 01:18:32'),
(206, 'Create', 98, 13, 25, '3', '', 13, '2019-05-09 01:18:32'),
(207, 'Create', 99, 14, 13, '1', '', 13, '2019-05-09 01:24:27'),
(208, 'Create', 100, 14, 24, '2', '', 13, '2019-05-09 01:24:28'),
(209, 'Create', 101, 14, 25, '3', '', 13, '2019-05-09 01:24:28'),
(210, 'Update', 91, 12, 33, '1', '030170c207c6e80f821c8eeb997187870993ff3f6df933', 33, '2019-05-09 01:57:28'),
(211, 'Update', 92, 12, 34, '2', '0302a685f9998d0d0c5cc631ee65e52620931ff00f55ba', 33, '2019-05-09 01:57:28'),
(212, 'Update', 93, 12, 35, '3', '0303f29700ab1d2ad100d5042f09490f7230933e1746cb', 33, '2019-05-09 01:57:28'),
(213, 'Update', 94, 12, 36, '4', '030453f81ffc9966cf09bb645e5eb542ff6b592b85cc66', 33, '2019-05-09 01:57:28'),
(214, 'Update', 95, 12, 37, '5', '0305cba7558bg0c1067778507a6327bfc64372b758e68c', 33, '2019-05-09 01:57:29'),
(215, 'Delete', 61, 6, 14, '1', '03014d3f76301894b41d0cb8355a121dd22b0c4cff18d0', 14, '2019-05-11 02:21:48'),
(216, 'Delete', 62, 6, 15, '2', '0302c36985af1d5fbe429656d1d1549af5c0e5e1f27860', 14, '2019-05-11 02:21:49'),
(217, 'Delete', 63, 6, 16, '3', '0303b1cb5aad3c924fb0ca0b0391f6a796eeb9eb094fe3', 14, '2019-05-11 02:21:49'),
(218, 'Delete', 64, 6, 17, '4', '03041764f62a752c6866a8d8ce9bf744b6b5896a469e57', 14, '2019-05-11 02:21:49'),
(219, 'Delete', 65, 6, 18, '5', '0305f7355727c82e086530bb2fef57725415555fa864be', 14, '2019-05-11 02:21:49'),
(220, 'Delete', 66, 7, 14, '1', '03017287c0d169g02e85aac551g09486f4eb726a016f68', 14, '2019-05-11 02:21:49'),
(221, 'Delete', 67, 7, 15, '2', '0302e5d3c4e64952469b55007d99ae0588a37f97f0a658', 14, '2019-05-11 02:21:50'),
(222, 'Delete', 68, 7, 16, '3', '0303a8303970ce2879832fe4b5fa7eb0eb5957b4fbd502', 14, '2019-05-11 02:21:50'),
(223, 'Delete', 69, 7, 17, '4', '0304bca02070f782c73d386ef92104851b0dfbc122fc67', 14, '2019-05-11 02:21:50'),
(224, 'Delete', 70, 7, 18, '5', '0305202179e6c45f2fca70a0481041851ac069be671a86', 14, '2019-05-11 02:21:50'),
(225, 'Delete', 71, 8, 28, '1', '03018652f9978f3c06becf0d9dcde693ecf1b88578f362', 28, '2019-05-11 02:21:50'),
(226, 'Delete', 72, 8, 29, '2', '0302509aee4443e59a6491a11437c1b050862bcab4d937', 28, '2019-05-11 02:21:50'),
(227, 'Delete', 73, 8, 30, '3', '0303af240c394a29ec3474eb986dc2885bf18bfce4e3b3', 28, '2019-05-11 02:21:50'),
(228, 'Delete', 74, 8, 31, '4', '0304a2f25576a40afc2e78eb276ee91b0c30d71a0710d5', 28, '2019-05-11 02:21:51'),
(229, 'Delete', 75, 8, 32, '5', '03052901c8fb5088ca529da1c33a356a64450e261f629d', 28, '2019-05-11 02:21:51'),
(230, 'Delete', 76, 9, 28, '1', '0301210a3f39b97bdd968501bc50a50c850d3ca5796ce6', 28, '2019-05-11 02:21:51'),
(231, 'Delete', 77, 9, 29, '2', '030244c9ab36a2a63c97dbfdcc364c28d25cc36a5487ae', 28, '2019-05-11 02:21:51'),
(232, 'Delete', 78, 9, 30, '3', '0303b9887028e9b150442e2161e02685131cc47dc2818d', 28, '2019-05-11 02:21:51'),
(233, 'Delete', 79, 9, 31, '4', '03047f488f0f8d9c189e80707c4c33224a4e3fdec25a83', 28, '2019-05-11 02:21:51'),
(234, 'Delete', 80, 9, 32, '5', '0305970907ec8f6795a4d0e91c7c730076f2358c541290', 28, '2019-05-11 02:21:52'),
(235, 'Delete', 81, 10, 33, '1', '030115ff17128d97a253c49b75a0764d925ccf6822f4c2', 33, '2019-05-11 02:21:52'),
(236, 'Delete', 82, 10, 34, '2', '0302c59e5ed3a80c642b1622fb885b98d3bd2f1044af3e', 33, '2019-05-11 02:21:52'),
(237, 'Delete', 83, 10, 35, '3', '03035e2b01727e9178ca25c7c2e6e011f05252269662ab', 33, '2019-05-11 02:21:52'),
(238, 'Delete', 84, 10, 36, '4', '0304e2a701f10f24de2ef188cbb903bae91c37aa170d07', 33, '2019-05-11 02:21:52'),
(239, 'Delete', 85, 10, 37, '5', '03054f105e4e5cc7955978661501c791be1bdf9bc9b154', 33, '2019-05-11 02:21:52'),
(240, 'Delete', 86, 11, 33, '1', '03011ede7f223888g008c02d532f31b5da26f6d470bc5d', 33, '2019-05-11 02:21:52'),
(241, 'Delete', 87, 11, 34, '2', '0302b2d5c25c391e41d49ff5db99d380275340fe30e928', 33, '2019-05-11 02:21:53'),
(242, 'Delete', 88, 11, 35, '3', '03030a32f6df30f4f7a3cb86c86a149316b710ab71b798', 33, '2019-05-11 02:21:53'),
(243, 'Delete', 89, 11, 36, '4', '030428f71aaa1d071f7643e21aa3f7eea75166dc3226ac', 33, '2019-05-11 02:21:53'),
(244, 'Delete', 90, 11, 37, '5', '03050b2130be005abc4d0807d3437990d9224190743764', 33, '2019-05-11 02:21:53'),
(245, 'Delete', 91, 12, 33, '1', '030170c207c6e80f821c8eeb997187870993ff3f6df933', 33, '2019-05-11 02:21:53'),
(246, 'Delete', 92, 12, 34, '2', '0302a685f9998d0d0c5cc631ee65e52620931ff00f55ba', 33, '2019-05-11 02:21:53'),
(247, 'Delete', 93, 12, 35, '3', '0303f29700ab1d2ad100d5042f09490f7230933e1746cb', 33, '2019-05-11 02:21:53'),
(248, 'Delete', 94, 12, 36, '4', '030453f81ffc9966cf09bb645e5eb542ff6b592b85cc66', 33, '2019-05-11 02:21:54'),
(249, 'Delete', 95, 12, 37, '5', '0305cba7558bg0c1067778507a6327bfc64372b758e68c', 33, '2019-05-11 02:21:54'),
(250, 'Delete', 96, 13, 13, '1', '', 13, '2019-05-11 02:21:54'),
(251, 'Delete', 97, 13, 24, '2', '', 13, '2019-05-11 02:21:54'),
(252, 'Delete', 98, 13, 25, '3', '', 13, '2019-05-11 02:21:54'),
(253, 'Delete', 99, 14, 13, '1', '', 13, '2019-05-11 02:21:54'),
(254, 'Delete', 100, 14, 24, '2', '', 13, '2019-05-11 02:21:54'),
(255, 'Delete', 101, 14, 25, '3', '', 13, '2019-05-11 02:21:55'),
(256, 'Create', 102, 13, 14, '1', '', 13, '2019-05-11 02:25:21'),
(257, 'Create', 103, 13, 15, '2', '', 13, '2019-05-11 02:25:21'),
(258, 'Create', 104, 13, 16, '3', '', 13, '2019-05-11 02:25:21'),
(259, 'Create', 105, 13, 17, '4', '', 13, '2019-05-11 02:25:21'),
(260, 'Create', 106, 13, 18, '5', '', 13, '2019-05-11 02:25:21'),
(261, 'Create', 107, 14, 14, '1', '', 13, '2019-05-11 02:25:59'),
(262, 'Create', 108, 14, 15, '2', '', 13, '2019-05-11 02:25:59'),
(263, 'Create', 109, 14, 16, '3', '', 13, '2019-05-11 02:25:59'),
(264, 'Create', 110, 14, 17, '4', '', 13, '2019-05-11 02:25:59'),
(265, 'Create', 111, 14, 18, '5', '', 13, '2019-05-11 02:25:59'),
(266, 'Create', 112, 15, 14, '1', '', 13, '2019-05-11 02:26:34'),
(267, 'Create', 113, 15, 15, '2', '', 13, '2019-05-11 02:26:35'),
(268, 'Create', 114, 15, 16, '3', '', 13, '2019-05-11 02:26:35'),
(269, 'Create', 115, 15, 17, '4', '', 13, '2019-05-11 02:26:35'),
(270, 'Create', 116, 15, 18, '5', '', 13, '2019-05-11 02:26:35'),
(271, 'Create', 117, 16, 14, '1', '', 13, '2019-05-11 02:27:18'),
(272, 'Create', 118, 16, 15, '2', '', 13, '2019-05-11 02:27:19'),
(273, 'Create', 119, 16, 16, '3', '', 13, '2019-05-11 02:27:19'),
(274, 'Create', 120, 16, 17, '4', '', 13, '2019-05-11 02:27:19'),
(275, 'Create', 121, 16, 18, '5', '', 13, '2019-05-11 02:27:19'),
(276, 'Create', 122, 17, 14, '1', '', 13, '2019-05-11 02:27:49'),
(277, 'Create', 123, 17, 15, '2', '', 13, '2019-05-11 02:27:49'),
(278, 'Create', 124, 17, 16, '3', '', 13, '2019-05-11 02:27:49'),
(279, 'Create', 125, 17, 17, '4', '', 13, '2019-05-11 02:27:49'),
(280, 'Create', 126, 17, 18, '5', '', 13, '2019-05-11 02:27:50'),
(281, 'Create', 127, 18, 14, '1', '', 13, '2019-05-11 02:28:18'),
(282, 'Create', 128, 18, 15, '2', '', 13, '2019-05-11 02:28:18'),
(283, 'Create', 129, 18, 16, '3', '', 13, '2019-05-11 02:28:18'),
(284, 'Create', 130, 18, 17, '4', '', 13, '2019-05-11 02:28:19'),
(285, 'Create', 131, 18, 18, '5', '', 13, '2019-05-11 02:28:19'),
(286, 'Create', 132, 19, 14, '1', '', 13, '2019-05-11 02:29:03'),
(287, 'Create', 133, 19, 15, '2', '', 13, '2019-05-11 02:29:03'),
(288, 'Create', 134, 19, 16, '3', '', 13, '2019-05-11 02:29:03'),
(289, 'Create', 135, 19, 17, '4', '', 13, '2019-05-11 02:29:03'),
(290, 'Create', 136, 19, 18, '5', '', 13, '2019-05-11 02:29:04'),
(291, 'Create', 137, 20, 14, '1', '', 13, '2019-05-11 02:29:57'),
(292, 'Create', 138, 20, 15, '2', '', 13, '2019-05-11 02:29:57'),
(293, 'Create', 139, 20, 16, '3', '', 13, '2019-05-11 02:29:57'),
(294, 'Create', 140, 20, 17, '4', '', 13, '2019-05-11 02:29:57'),
(295, 'Create', 141, 20, 18, '5', '', 13, '2019-05-11 02:29:58'),
(296, 'Create', 142, 21, 14, '1', '', 13, '2019-05-11 02:30:33'),
(297, 'Create', 143, 21, 15, '2', '', 13, '2019-05-11 02:30:33'),
(298, 'Create', 144, 21, 16, '3', '', 13, '2019-05-11 02:30:33'),
(299, 'Create', 145, 21, 17, '4', '', 13, '2019-05-11 02:30:33'),
(300, 'Create', 146, 21, 18, '5', '', 13, '2019-05-11 02:30:33'),
(301, 'Create', 147, 22, 14, '1', '', 13, '2019-05-11 02:31:15'),
(302, 'Create', 148, 22, 15, '2', '', 13, '2019-05-11 02:31:15'),
(303, 'Create', 149, 22, 16, '3', '', 13, '2019-05-11 02:31:15'),
(304, 'Create', 150, 22, 17, '4', '', 13, '2019-05-11 02:31:15'),
(305, 'Create', 151, 22, 18, '5', '', 13, '2019-05-11 02:31:16'),
(306, 'Update', 102, 13, 14, '1', '0301221ea3621017c44bf7df772c07100674c13cd0b648', 14, '2019-05-11 03:03:51'),
(307, 'Update', 103, 13, 15, '2', '0302618b638e14c4741a764213a8e60190ac694136222f', 14, '2019-05-11 03:03:51'),
(308, 'Update', 104, 13, 16, '3', '03030c936eb5393542afac5b06a0cb04cad8293c6476e7', 14, '2019-05-11 03:03:51'),
(309, 'Update', 105, 13, 17, '4', '03042436c4d77f6c2e0898295014b719b4f8012d59b16e', 14, '2019-05-11 03:03:52'),
(310, 'Update', 106, 13, 18, '5', '0305a97564f4e66838273aadf105aa404e0bf21415d3c6', 14, '2019-05-11 03:03:52'),
(311, 'Update', 102, 13, 14, '1', '030190e5a74d48d794d0ac51bd778581487e856b0de61b', 14, '2019-05-11 03:36:58'),
(312, 'Update', 103, 13, 15, '2', '03023022533298138a837e2d14e7d29166dcfc51fd9d7f', 14, '2019-05-11 03:36:58'),
(313, 'Update', 104, 13, 16, '3', '0303310632e11ce7135ba4c5387c1661874994e0fe565c', 14, '2019-05-11 03:36:59'),
(314, 'Update', 105, 13, 17, '4', '030493914458d65030581d17283753f2abc74e161011b3', 14, '2019-05-11 03:36:59'),
(315, 'Update', 106, 13, 18, '5', '030555c28999c450e17aeb25e5188842d2542af635cf83', 14, '2019-05-11 03:36:59'),
(316, 'Update', 107, 14, 14, '1', '03013b6a0a6eab078148e7f8c355899eaca08cef1e4909', 14, '2019-05-12 23:38:28'),
(317, 'Update', 108, 14, 15, '2', '0302373382c3c147cf72e407c3239e068ecff0e8b1b990', 14, '2019-05-12 23:38:28'),
(318, 'Update', 109, 14, 16, '3', '030344a9942f6ff01abf246031986f6bd4bd5b18e87fc6', 14, '2019-05-12 23:38:28'),
(319, 'Update', 110, 14, 17, '4', '030462cb40b4b600642ea9010eb3fdcc7d6acf81c39cab', 14, '2019-05-12 23:38:28'),
(320, 'Update', 111, 14, 18, '5', '030591998750957aacc171ec5a7446288ad74a21420f3f', 14, '2019-05-12 23:38:29'),
(321, 'Update', 112, 15, 14, '1', '0301726d0bb1576b27526e230684a5e18b4caea37a2502', 14, '2019-05-12 23:38:39'),
(322, 'Update', 113, 15, 15, '2', '0302b069623e0932c2be5e311fd05967399bb6b0bccd5e', 14, '2019-05-12 23:38:39'),
(323, 'Update', 114, 15, 16, '3', '0303094131da44860084fe5a7c104dc5381c4854f62646', 14, '2019-05-12 23:38:39'),
(324, 'Update', 115, 15, 17, '4', '03047ff679830766e4a54c9e1c4681fa88d165902732bb', 14, '2019-05-12 23:38:39'),
(325, 'Update', 116, 15, 18, '5', '03051086393a53d36b204afd0071f50528b80c6351f1bc', 14, '2019-05-12 23:38:39'),
(326, 'Update', 117, 16, 14, '1', '0301e5d842e8a171215b30fe8231a47c208f1ab3f9b409', 14, '2019-05-12 23:38:49'),
(327, 'Update', 118, 16, 15, '2', '03027c4eedfa4bbbda0a9387d0bac0a60aab590cd22739', 14, '2019-05-12 23:38:49'),
(328, 'Update', 119, 16, 16, '3', '030316b12c672c0d5a4f55cd1ac784afec84ed3abc8bc4', 14, '2019-05-12 23:38:50'),
(329, 'Update', 120, 16, 17, '4', '0304b4g001304469a32977cf6258f197c41ad53cb7dfa9', 14, '2019-05-12 23:38:50'),
(330, 'Update', 121, 16, 18, '5', '0305543a6c5593ceb499f98da76e055e936e1112c322e9', 14, '2019-05-12 23:38:50'),
(331, 'Update', 122, 17, 14, '1', '03017a92ca9ea558766dd70c0dc4111e749d87bc56c7a6', 14, '2019-05-12 23:39:02'),
(332, 'Update', 123, 17, 15, '2', '03028d570605c1d399bb1a67435f6f777871dfc0028a77', 14, '2019-05-12 23:39:02'),
(333, 'Update', 124, 17, 16, '3', '0303899de46881a09a2af940d3g0493b39ad3739357aa9', 14, '2019-05-12 23:39:03'),
(334, 'Update', 125, 17, 17, '4', '03046e6361c6e6c079bc7198bca5a06bb8509128ef973b', 14, '2019-05-12 23:39:03'),
(335, 'Update', 126, 17, 18, '5', '03053caa7f1eef32366f846eff4f7306f45bec8d2ee12e', 14, '2019-05-12 23:39:03'),
(336, 'Update', 127, 18, 14, '1', '03014bad578d4cdc11e4883ee2602150ec9d77868c1b3d', 14, '2019-05-12 23:39:18'),
(337, 'Update', 128, 18, 15, '2', '03024e1208dadde1932c7381109eb24249c9df486d6a24', 14, '2019-05-12 23:39:18'),
(338, 'Update', 129, 18, 16, '3', '0303597e4117df3fb61beff9bee7e20746b46774d41cec', 14, '2019-05-12 23:39:19'),
(339, 'Update', 130, 18, 17, '4', '03046cf0014652f87ab1fba5ea3ab1a0e35e1009c03293', 14, '2019-05-12 23:39:19'),
(340, 'Update', 131, 18, 18, '5', '0305876749663709e0ed978694991f0b1ec8db0831ac1a', 14, '2019-05-12 23:39:19'),
(341, 'Update', 132, 19, 14, '1', '0301c9686ccf42d097c87cbd138ddccda837765208f67f', 14, '2019-05-12 23:39:29'),
(342, 'Update', 133, 19, 15, '2', '0302a62ebc7badeba166a96d7675df56c7f56e37e7f4f1', 14, '2019-05-12 23:39:30'),
(343, 'Update', 134, 19, 16, '3', '0303e8a01c366d814f1cb44159e639ce8a6818ddcb2a8c', 14, '2019-05-12 23:39:30'),
(344, 'Update', 135, 19, 17, '4', '03048ebd8e008393a2eb9d39bddfec33f2927542b59a51', 14, '2019-05-12 23:39:30'),
(345, 'Update', 136, 19, 18, '5', '0305998510daef2099d16455a160f687fe728468a54240', 14, '2019-05-12 23:39:30'),
(346, 'Update', 137, 20, 14, '1', '03012a9a6a51d66dd70ff446e04d11d8c6d08482bd74a1', 14, '2019-05-12 23:39:40'),
(347, 'Update', 138, 20, 15, '2', '0302a238270a225e4dc8f62649b38d408cbb38a8b41365', 14, '2019-05-12 23:39:40'),
(348, 'Update', 139, 20, 16, '3', '0303b728655d1303956a33d16e5ea36b80f24d9f150e85', 14, '2019-05-12 23:39:40'),
(349, 'Update', 140, 20, 17, '4', '0304696a2349a95daef7ad454e4f5358a274c367e26500', 14, '2019-05-12 23:39:40'),
(350, 'Update', 141, 20, 18, '5', '0305b9fe62cfe36b986d6284ea869e07f24299001817d8', 14, '2019-05-12 23:39:40'),
(351, 'Update', 142, 21, 14, '1', '03016a5498f5d1a4g0fbf4363c3641506db3dbe48114e7', 14, '2019-05-12 23:39:50'),
(352, 'Update', 143, 21, 15, '2', '03027d26379f79ec47eb4fa550744d2c0982529db0e90e', 14, '2019-05-12 23:39:50'),
(353, 'Update', 144, 21, 16, '3', '030389c40b3026070811407c6de754c6029e9759bdadb1', 14, '2019-05-12 23:39:51'),
(354, 'Update', 145, 21, 17, '4', '03048e2c14a9d9f8436fc7bc938e561c5806a918a861ce', 14, '2019-05-12 23:39:51'),
(355, 'Update', 146, 21, 18, '5', '03058c60520890bcf803e364c26a53300abc88db710565', 14, '2019-05-12 23:39:51'),
(356, 'Update', 147, 22, 14, '1', '0301f154aab7c906dce26cf555ce8b70b5d680dcc6506c', 14, '2019-05-12 23:40:00'),
(357, 'Update', 148, 22, 15, '2', '03029b301a865f760c2c51728e0e8eaef8d402c5a01c49', 14, '2019-05-12 23:40:01'),
(358, 'Update', 149, 22, 16, '3', '03034fe27f9ff17fc421dda9dcf039ebf62ab8e9bf96c8', 14, '2019-05-12 23:40:01'),
(359, 'Update', 150, 22, 17, '4', '03040d68d8017d2101c10e993e718d26afdaa04722bde8', 14, '2019-05-12 23:40:01'),
(360, 'Update', 151, 22, 18, '5', '0305d6c424ae045dc60ae742b693896123e2bbe1cb91a9', 14, '2019-05-12 23:40:01'),
(361, 'Update', 102, 13, 14, '1', '030189f341c9e9d796fc27edcad4ae371e35c43cba2209', 14, '2019-05-13 00:39:00'),
(362, 'Update', 103, 13, 15, '2', '03021737580c9aa8c284c33cd9a095f40d385d8bda7293', 14, '2019-05-13 00:39:00'),
(363, 'Update', 104, 13, 16, '3', '0303fc1b72fd41a4b5dbg01f5e92e666fb39fd19901fce', 14, '2019-05-13 00:39:00'),
(364, 'Update', 105, 13, 17, '4', '0304359f8f99dfcb6fg0de965aaaa08fe638a2e8dd2aba', 14, '2019-05-13 00:39:01'),
(365, 'Update', 106, 13, 18, '5', '0305c5c2afe2721cf1f35da0cde8c46ecf354df6c09357', 14, '2019-05-13 00:39:01'),
(366, 'Update', 102, 13, 14, '1', '03013dd186b1e9b2d8aaca153ef7bb49fd7af7a37a07be', 14, '2019-05-13 01:48:06'),
(367, 'Update', 103, 13, 15, '2', '030257fe3faeda60b23bb86fc488f4d7e83a1f33e84887', 14, '2019-05-13 01:48:06'),
(368, 'Update', 104, 13, 16, '3', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 14, '2019-05-13 01:48:07'),
(369, 'Update', 105, 13, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 14, '2019-05-13 01:48:07'),
(370, 'Update', 106, 13, 18, '5', '0305b27caf96f07877e56c3727eeb4405042ea8607844f', 14, '2019-05-13 01:48:07'),
(371, 'Update', 107, 14, 14, '1', '030103db18f31bbe621d9824173024db0f227169cc61cb', 14, '2019-05-13 02:03:56'),
(372, 'Update', 108, 14, 15, '2', '0302e5ed0ecae9df5f784ce9017f4b41de31ee9385cde0', 14, '2019-05-13 02:03:56'),
(373, 'Update', 109, 14, 16, '3', '0303f4830fb7959328514a7df019a565985da6ab5c7371', 14, '2019-05-13 02:03:56'),
(374, 'Update', 110, 14, 17, '4', '0304309e1bba20dbbea992e2e2g031463ea69ab151547f', 14, '2019-05-13 02:03:56'),
(375, 'Update', 111, 14, 18, '5', '03059b3d32d38bb61f7f2316d831f1e5d10bcaa5647009', 14, '2019-05-13 02:03:57'),
(376, 'Create', 152, 23, 28, '1', '', 13, '2019-05-14 22:18:43'),
(377, 'Create', 153, 23, 29, '2', '', 13, '2019-05-14 22:18:43'),
(378, 'Create', 154, 23, 30, '3', '', 13, '2019-05-14 22:18:43'),
(379, 'Create', 155, 23, 31, '4', '', 13, '2019-05-14 22:18:43'),
(380, 'Create', 156, 23, 32, '5', '', 13, '2019-05-14 22:18:43'),
(381, 'Create', 157, 24, 28, '1', '', 13, '2019-05-14 22:19:29'),
(382, 'Create', 158, 24, 29, '2', '', 13, '2019-05-14 22:19:29'),
(383, 'Create', 159, 24, 30, '3', '', 13, '2019-05-14 22:19:29'),
(384, 'Create', 160, 24, 31, '4', '', 13, '2019-05-14 22:19:29'),
(385, 'Create', 161, 24, 32, '5', '', 13, '2019-05-14 22:19:29'),
(386, 'Create', 162, 25, 28, '1', '', 13, '2019-05-14 22:20:06'),
(387, 'Create', 163, 25, 29, '2', '', 13, '2019-05-14 22:20:06'),
(388, 'Create', 164, 25, 30, '3', '', 13, '2019-05-14 22:20:07'),
(389, 'Create', 165, 25, 31, '4', '', 13, '2019-05-14 22:20:07'),
(390, 'Create', 166, 25, 32, '5', '', 13, '2019-05-14 22:20:07'),
(391, 'Create', 167, 26, 28, '1', '', 13, '2019-05-14 22:21:06'),
(392, 'Create', 168, 26, 29, '2', '', 13, '2019-05-14 22:21:07'),
(393, 'Create', 169, 26, 30, '3', '', 13, '2019-05-14 22:21:07'),
(394, 'Create', 170, 26, 31, '4', '', 13, '2019-05-14 22:21:07'),
(395, 'Create', 171, 26, 32, '5', '', 13, '2019-05-14 22:21:07'),
(396, 'Create', 172, 27, 28, '1', '', 13, '2019-05-14 22:21:54'),
(397, 'Create', 173, 27, 29, '2', '', 13, '2019-05-14 22:21:54'),
(398, 'Create', 174, 27, 30, '3', '', 13, '2019-05-14 22:21:54'),
(399, 'Create', 175, 27, 31, '4', '', 13, '2019-05-14 22:21:54'),
(400, 'Create', 176, 27, 32, '5', '', 13, '2019-05-14 22:21:54'),
(401, 'Create', 177, 28, 28, '1', '', 13, '2019-05-14 22:22:57'),
(402, 'Create', 178, 28, 29, '2', '', 13, '2019-05-14 22:22:57'),
(403, 'Create', 179, 28, 30, '3', '', 13, '2019-05-14 22:22:58'),
(404, 'Create', 180, 28, 31, '4', '', 13, '2019-05-14 22:22:58'),
(405, 'Create', 181, 28, 32, '5', '', 13, '2019-05-14 22:22:58'),
(406, 'Create', 182, 29, 28, '1', '', 13, '2019-05-14 22:23:52'),
(407, 'Create', 183, 29, 29, '2', '', 13, '2019-05-14 22:23:52'),
(408, 'Create', 184, 29, 30, '3', '', 13, '2019-05-14 22:23:52'),
(409, 'Create', 185, 29, 31, '4', '', 13, '2019-05-14 22:23:52'),
(410, 'Create', 186, 29, 32, '5', '', 13, '2019-05-14 22:23:52'),
(411, 'Create', 187, 30, 28, '1', '', 13, '2019-05-14 22:24:24'),
(412, 'Create', 188, 30, 29, '2', '', 13, '2019-05-14 22:24:24'),
(413, 'Create', 189, 30, 30, '3', '', 13, '2019-05-14 22:24:25'),
(414, 'Create', 190, 30, 31, '4', '', 13, '2019-05-14 22:24:25'),
(415, 'Create', 191, 30, 32, '5', '', 13, '2019-05-14 22:24:25'),
(416, 'Create', 192, 31, 28, '1', '', 13, '2019-05-14 22:24:58'),
(417, 'Create', 193, 31, 29, '2', '', 13, '2019-05-14 22:24:58'),
(418, 'Create', 194, 31, 30, '3', '', 13, '2019-05-14 22:24:58'),
(419, 'Create', 195, 31, 31, '4', '', 13, '2019-05-14 22:24:59'),
(420, 'Create', 196, 31, 32, '5', '', 13, '2019-05-14 22:24:59'),
(421, 'Create', 197, 32, 28, '1', '', 13, '2019-05-14 22:25:30'),
(422, 'Create', 198, 32, 29, '2', '', 13, '2019-05-14 22:25:30'),
(423, 'Create', 199, 32, 30, '3', '', 13, '2019-05-14 22:25:31'),
(424, 'Create', 200, 32, 31, '4', '', 13, '2019-05-14 22:25:39'),
(425, 'Create', 201, 32, 32, '5', '', 13, '2019-05-14 22:25:39'),
(426, 'Update', 197, 32, 28, '1', '0301b6fdebc578327c198f402ec202757db055ba7eca47', 28, '2019-05-14 22:34:15'),
(427, 'Update', 198, 32, 29, '2', '0302b8d93f773dfbfeb9072b964762d1884fe16e71ea6a', 28, '2019-05-14 22:34:16'),
(428, 'Update', 199, 32, 30, '3', '030356e22b487d89b61f97f268be4f464e0ed34a099199', 28, '2019-05-14 22:34:16'),
(429, 'Update', 200, 32, 31, '4', '03049117af3837dea54d3d93a525cad6d0ee2b4e47c0d4', 28, '2019-05-14 22:34:16'),
(430, 'Update', 201, 32, 32, '5', '0305687aca476cf9cb42fb0f4c7ed27f0cedeb7a2a761a', 28, '2019-05-14 22:34:16'),
(431, 'Update', 192, 31, 28, '1', '03015323dc977e11361bb3f446c02bfab367ae0ec7bb25', 28, '2019-05-14 22:34:18'),
(432, 'Update', 193, 31, 29, '2', '030216f4e3879b85d20c5a3e217e4a9f0294818dcd5d02', 28, '2019-05-14 22:34:18'),
(433, 'Update', 194, 31, 30, '3', '03039abe4201848b03142310c3688d231cb7aaa94217d1', 28, '2019-05-14 22:34:18'),
(434, 'Update', 195, 31, 31, '4', '0304de82fb063923cc330e6a2a7ef48700d0286227ea90', 28, '2019-05-14 22:34:18'),
(435, 'Update', 196, 31, 32, '5', '0305e2400b96bb4e2a691b4b58c07ecaafdffdb97cd440', 28, '2019-05-14 22:34:19'),
(436, 'Update', 187, 30, 28, '1', '030100e5ffcd94829777da8eca56ca943eba3469ea6f55', 28, '2019-05-14 22:34:20'),
(437, 'Update', 188, 30, 29, '2', '030289d4b9d08c38e441b8be66f807a0537806959ffd5d', 28, '2019-05-14 22:34:21'),
(438, 'Update', 189, 30, 30, '3', '0303ea1a5c3a155317a0c8c00611ea576c6ba7b150d950', 28, '2019-05-14 22:34:21'),
(439, 'Update', 190, 30, 31, '4', '030422b9e90c30d332930994aba470ba899315bdfe032e', 28, '2019-05-14 22:34:21'),
(440, 'Update', 191, 30, 32, '5', '030533af5e46ddb7341a7d3a53af9bc8aaf052b9a77df8', 28, '2019-05-14 22:34:21'),
(441, 'Update', 182, 29, 28, '1', '0301538a7234563075615697a9cc0856c76b77149ed936', 28, '2019-05-14 22:34:23'),
(442, 'Update', 183, 29, 29, '2', '0302c2cf396744bc14189998a2d3934d13f8e9ef2e3728', 28, '2019-05-14 22:34:23'),
(443, 'Update', 184, 29, 30, '3', '03039c1b83caf8d30f67f6331c42d01813d685bce24c0d', 28, '2019-05-14 22:34:23'),
(444, 'Update', 185, 29, 31, '4', '0304e2704f5c7075664d6c69181abfb8c7054c7cb817e6', 28, '2019-05-14 22:34:23'),
(445, 'Update', 186, 29, 32, '5', '030593cd9e1eaea318cbfd39965b602b2d873e2fb199b1', 28, '2019-05-14 22:34:24'),
(446, 'Update', 177, 28, 28, '1', '03011b7b16ebac12f2358e5ce5dd4fa87c380bd1df4926', 28, '2019-05-14 22:34:25'),
(447, 'Update', 178, 28, 29, '2', '0302074184df2503edaa01fa8ecc180edbb1621652a2dc', 28, '2019-05-14 22:34:25'),
(448, 'Update', 179, 28, 30, '3', '030314a0760d9a03229f88082dfb8c67499a34ff8b3a56', 28, '2019-05-14 22:34:26'),
(449, 'Update', 180, 28, 31, '4', '03044297ed77091293142189c369aab2c8f48289891296', 28, '2019-05-14 22:34:26'),
(450, 'Update', 181, 28, 32, '5', '03059126e81b74303e0ace7b4e1772ef56be4bb64c2a9b', 28, '2019-05-14 22:34:26'),
(451, 'Update', 172, 27, 28, '1', '0301f77c8f9ed15f232aabffb98c6bbc8621c2g0d29c18', 28, '2019-05-14 22:34:28'),
(452, 'Update', 173, 27, 29, '2', '03023da7a455d5a419e6fd293267e089c17f8076b28b81', 28, '2019-05-14 22:34:28'),
(453, 'Update', 174, 27, 30, '3', '030324ce6c5739ff137322b19ebf8e9bde496b91d1fe6f', 28, '2019-05-14 22:34:28'),
(454, 'Update', 175, 27, 31, '4', '0304acf1e8a4ff6f11d31c95fc9376f2dd8083502ef4e3', 28, '2019-05-14 22:34:28'),
(455, 'Update', 176, 27, 32, '5', '0305d40f163b24f61304ebd64be4988dbe23c8b4cb6ddc', 28, '2019-05-14 22:34:29'),
(456, 'Update', 167, 26, 28, '1', '0301a7ee70f350fe747e379d08a2g085059d8723130497', 28, '2019-05-14 22:34:30'),
(457, 'Update', 168, 26, 29, '2', '03025790d1e3a2da07572f243874f18ba0a2942a14dee6', 28, '2019-05-14 22:34:30'),
(458, 'Update', 169, 26, 30, '3', '030361344f0122c5eccd15c7c1a40345fd3f574233bc20', 28, '2019-05-14 22:34:30'),
(459, 'Update', 170, 26, 31, '4', '0304c5dbec4fd2bf20dfea84a23138b41b75d16b709f47', 28, '2019-05-14 22:34:31'),
(460, 'Update', 171, 26, 32, '5', '03058283a6ccb0c8a68dac5cdc1c8fd7fd4300a5cb875a', 28, '2019-05-14 22:34:31'),
(461, 'Update', 162, 25, 28, '1', '0301cef1f620af86800123a188e8d196dc9044c911e3f6', 28, '2019-05-14 22:34:33'),
(462, 'Update', 163, 25, 29, '2', '0302c2ab608da0ac1b7cc2433e2b25dbeef1cf3d23a21f', 28, '2019-05-14 22:34:33'),
(463, 'Update', 164, 25, 30, '3', '03032c7c6d7700a203b1081754f92e016352d08b666eb1', 28, '2019-05-14 22:34:33'),
(464, 'Update', 165, 25, 31, '4', '03040d641cdfd16838a0f81dca4fec0a3cb547b2da47aa', 28, '2019-05-14 22:34:33'),
(465, 'Update', 166, 25, 32, '5', '030565636ec410ffba498f559f2f5df6791835b27e2d0a', 28, '2019-05-14 22:34:34'),
(466, 'Update', 157, 24, 28, '1', '0301ccf64f8bb02641ec09f70a2e24c83bdc426c9a8a67', 28, '2019-05-14 22:34:35'),
(467, 'Update', 158, 24, 29, '2', '0302c6fcb27c690694db9b9dcdb492c27ef03dd8cfd4f5', 28, '2019-05-14 22:34:35'),
(468, 'Update', 159, 24, 30, '3', '03033e5f550459d1290ee22378be7921f66c2170cf0ddb', 28, '2019-05-14 22:34:35'),
(469, 'Update', 160, 24, 31, '4', '03043520392480850187de8a0c4cdae7a251ef359a3719', 28, '2019-05-14 22:34:35'),
(470, 'Update', 161, 24, 32, '5', '0305ab3f5edcde231c448fd18a5fb411839fa5273051b1', 28, '2019-05-14 22:34:35'),
(471, 'Update', 152, 23, 28, '1', '0301a1b719f105e28163ec7d29f12c50a43e82f2089315', 28, '2019-05-14 22:34:37'),
(472, 'Update', 153, 23, 29, '2', '0302ed2da6a9dc59dd8174d1159ab71ae89ed411d80deb', 28, '2019-05-14 22:34:37'),
(473, 'Update', 154, 23, 30, '3', '030333b1d35ab097449bc72bf629d092f94f258d9ea0b1', 28, '2019-05-14 22:34:37'),
(474, 'Update', 155, 23, 31, '4', '03047541a004829bb8b1e48dca9f77b7d75277645b4a68', 28, '2019-05-14 22:34:38'),
(475, 'Update', 156, 23, 32, '5', '0305b2df0da8526537c3cbf692fbad8982a7c9970f0c10', 28, '2019-05-14 22:34:38'),
(476, 'Create', 202, 33, 33, '1', '', 13, '2019-05-15 18:39:59'),
(477, 'Create', 203, 33, 34, '2', '', 13, '2019-05-15 18:39:59'),
(478, 'Create', 204, 33, 35, '3', '', 13, '2019-05-15 18:39:59'),
(479, 'Create', 205, 33, 36, '4', '', 13, '2019-05-15 18:39:59'),
(480, 'Create', 206, 33, 37, '5', '', 13, '2019-05-15 18:39:59'),
(481, 'Create', 207, 34, 33, '1', '', 13, '2019-05-15 18:42:41'),
(482, 'Create', 208, 34, 34, '2', '', 13, '2019-05-15 18:42:41'),
(483, 'Create', 209, 34, 35, '3', '', 13, '2019-05-15 18:42:41'),
(484, 'Create', 210, 34, 36, '4', '', 13, '2019-05-15 18:42:41'),
(485, 'Create', 211, 34, 37, '5', '', 13, '2019-05-15 18:42:41'),
(486, 'Update', 202, 33, 33, '1', '0301cca321fe7e0256896a3613a10ebbee751eef8f2bd4', 33, '2019-05-15 18:44:23'),
(487, 'Update', 203, 33, 34, '2', '0302f573085b5aa5043beff48fb84036b317ab56f33705', 33, '2019-05-15 18:44:23'),
(488, 'Update', 204, 33, 35, '3', '0303cbbee34ac2173c58bb68a472c6a57d17d6645b54c7', 33, '2019-05-15 18:44:23'),
(489, 'Update', 205, 33, 36, '4', '03044e83b0cbb55afee0cf9452d09f064c759f18c98217', 33, '2019-05-15 18:44:23'),
(490, 'Update', 206, 33, 37, '5', '03057fc370dd336d48d22a779ad1cc5b203006733bc1f8', 33, '2019-05-15 18:44:23'),
(491, 'Update', 207, 34, 33, '1', '0301ab160356bf6a23be1ag0d270cb86bfb81bbfbaa2ca', 33, '2019-05-15 18:45:34'),
(492, 'Update', 208, 34, 34, '2', '03029e631e55a6fb9cdebabffb5c37492a04b7f8c94e12', 33, '2019-05-15 18:45:34'),
(493, 'Update', 209, 34, 35, '3', '030329337e2ee3e29ba10b6eacf2767c701602d85d350c', 33, '2019-05-15 18:45:35'),
(494, 'Update', 210, 34, 36, '4', '03044d8722e2751f20070f0de630871e90eeff5f7757b8', 33, '2019-05-15 18:45:35'),
(495, 'Update', 211, 34, 37, '5', '0305095e0b6f5db42c11c69da8186a308a8aab8e16b414', 33, '2019-05-15 18:45:35'),
(496, 'Update', 202, 33, 33, '1', '0301b1f5a43b980d9c75d438bf0a1a07cb685c1f1a0cb6', 33, '2019-05-15 18:52:56'),
(497, 'Update', 203, 33, 34, '2', '0302c47b0a2b8bfc2f5d5546426dc09d63eb474cb21c0a', 33, '2019-05-15 18:52:56'),
(498, 'Update', 204, 33, 35, '3', '030389e1610106fbecfab25abc5520f3f7b8f2b4f7602f', 33, '2019-05-15 18:52:57'),
(499, 'Update', 205, 33, 36, '4', '03040025a8be0a0ad14aea742bc33c0885d05b56e9d824', 33, '2019-05-15 18:52:57'),
(500, 'Update', 206, 33, 37, '5', '03052a49df60972bdf4ffd9491b613df0e3284338883ea', 33, '2019-05-15 18:52:57'),
(501, 'Create', 212, 35, 14, '1', '', 13, '2019-06-14 17:47:55'),
(502, 'Create', 213, 35, 15, '2', '', 13, '2019-06-14 17:47:55'),
(503, 'Create', 214, 35, 16, '3', '', 13, '2019-06-14 17:47:55'),
(504, 'Create', 215, 35, 17, '4', '', 13, '2019-06-14 17:47:55'),
(505, 'Create', 216, 35, 18, '5', '', 13, '2019-06-14 17:47:55'),
(506, 'Update', 212, 35, 14, '1', '03018b29c802f2a2', 14, '2019-06-14 17:50:24'),
(507, 'Update', 213, 35, 15, '2', '03020376169d8652', 14, '2019-06-14 17:50:24'),
(508, 'Update', 214, 35, 16, '3', '0303d8475f3d1e84', 14, '2019-06-14 17:50:24'),
(509, 'Update', 215, 35, 17, '4', '0304079da2e4bb37', 14, '2019-06-14 17:50:24'),
(510, 'Update', 216, 35, 18, '5', '03059377df905b6c', 14, '2019-06-14 17:50:24'),
(511, 'Update', 212, 35, 14, '1', '03015ace9f9a8ba3', 14, '2019-06-14 18:08:10'),
(512, 'Update', 213, 35, 15, '2', '030255f0388ffe55', 14, '2019-06-14 18:08:11'),
(513, 'Update', 214, 35, 16, '3', '03035fc73f4db98a', 14, '2019-06-14 18:08:11'),
(514, 'Update', 215, 35, 17, '4', '03047853b4d5bd41', 14, '2019-06-14 18:08:11'),
(515, 'Update', 216, 35, 18, '5', '0305a0959625097b', 14, '2019-06-14 18:08:11'),
(516, 'Delete', 212, 35, 14, '1', '03015ace9f9a8ba3', 14, '2019-06-22 13:32:16'),
(517, 'Delete', 213, 35, 15, '2', '030255f0388ffe55', 14, '2019-06-22 13:32:20'),
(518, 'Delete', 214, 35, 16, '3', '03035fc73f4db98a', 14, '2019-06-22 13:35:23'),
(519, 'Delete', 215, 35, 17, '4', '03047853b4d5bd41', 14, '2019-06-22 13:35:24'),
(520, 'Delete', 216, 35, 18, '5', '0305a0959625097b', 14, '2019-06-22 13:35:24'),
(521, 'Create', 212, 35, 33, '1', '', 13, '2019-06-30 01:18:27'),
(522, 'Create', 213, 35, 34, '2', '', 13, '2019-06-30 01:18:27'),
(523, 'Create', 214, 35, 35, '3', '', 13, '2019-06-30 01:18:27'),
(524, 'Create', 215, 35, 36, '4', '', 13, '2019-06-30 01:18:27'),
(525, 'Create', 216, 35, 37, '5', '', 13, '2019-06-30 01:18:27'),
(526, 'Update', 212, 35, 33, '1', '030129ca8a', 33, '2019-06-30 01:19:00'),
(527, 'Update', 213, 35, 34, '2', '0302004294', 33, '2019-06-30 01:19:00'),
(528, 'Update', 214, 35, 35, '3', '0303e7cc81', 33, '2019-06-30 01:19:00'),
(529, 'Update', 215, 35, 36, '4', '0304dc6651', 33, '2019-06-30 01:19:00'),
(530, 'Update', 216, 35, 37, '5', '0305e01104', 33, '2019-06-30 01:19:00'),
(531, 'Update', 212, 35, 33, '1', '03014dddab', 33, '2019-06-30 04:49:50'),
(532, 'Update', 213, 35, 34, '2', '03023cf106', 33, '2019-06-30 04:49:50'),
(533, 'Update', 214, 35, 35, '3', '03032e9e76', 33, '2019-06-30 04:49:50'),
(534, 'Update', 215, 35, 36, '4', '030423e5fa', 33, '2019-06-30 04:49:50'),
(535, 'Update', 216, 35, 37, '5', '03051bc591', 33, '2019-06-30 04:49:50'),
(536, 'Update', 212, 35, 33, '1', '030176a27d', 33, '2019-06-30 05:24:29'),
(537, 'Update', 213, 35, 34, '2', '0302177985', 33, '2019-06-30 05:24:29'),
(538, 'Update', 214, 35, 35, '3', '030345e87b', 33, '2019-06-30 05:24:30'),
(539, 'Update', 215, 35, 36, '4', '0304g0ee5f', 33, '2019-06-30 05:24:30'),
(540, 'Update', 216, 35, 37, '5', '0305468b31', 33, '2019-06-30 05:24:30'),
(541, 'Update', 212, 35, 33, '1', '0301586c0b', 33, '2019-06-30 05:25:10'),
(542, 'Update', 213, 35, 34, '2', '0302dd5206', 33, '2019-06-30 05:25:10'),
(543, 'Update', 214, 35, 35, '3', '0303ef1454', 33, '2019-06-30 05:25:10'),
(544, 'Update', 215, 35, 36, '4', '03048eb3f5', 33, '2019-06-30 05:25:10'),
(545, 'Update', 216, 35, 37, '5', '0305bb2de8', 33, '2019-06-30 05:25:10'),
(546, 'Update', 212, 35, 33, '1', '0301d64d34', 33, '2019-06-30 05:31:21'),
(547, 'Update', 213, 35, 34, '2', '0302922bf5', 33, '2019-06-30 05:31:21'),
(548, 'Update', 214, 35, 35, '3', '030396fda4', 33, '2019-06-30 05:31:21'),
(549, 'Update', 215, 35, 36, '4', '0304e2c142', 33, '2019-06-30 05:31:21'),
(550, 'Update', 216, 35, 37, '5', '03057578d0', 33, '2019-06-30 05:31:22'),
(551, 'Update', 212, 35, 33, '1', '0301c4a340', 33, '2019-06-30 05:33:37'),
(552, 'Update', 213, 35, 34, '2', '0302d7c472', 33, '2019-06-30 05:33:37'),
(553, 'Update', 214, 35, 35, '3', '03039ac5f9', 33, '2019-06-30 05:33:37'),
(554, 'Update', 215, 35, 36, '4', '03040da6d4', 33, '2019-06-30 05:33:37'),
(555, 'Update', 216, 35, 37, '5', '0305316703', 33, '2019-06-30 05:33:37'),
(556, 'Update', 212, 35, 33, '1', '0301ec7015', 33, '2019-06-30 05:35:17'),
(557, 'Update', 213, 35, 34, '2', '0302d08243', 33, '2019-06-30 05:35:17'),
(558, 'Update', 214, 35, 35, '3', '03030d98ed', 33, '2019-06-30 05:35:17'),
(559, 'Update', 215, 35, 36, '4', '0304a5b211', 33, '2019-06-30 05:35:17'),
(560, 'Update', 216, 35, 37, '5', '030596d0b2', 33, '2019-06-30 05:35:17'),
(561, 'Update', 212, 35, 33, '1', '03019f1a69', 33, '2019-06-30 05:35:49'),
(562, 'Update', 213, 35, 34, '2', '0302d85991', 33, '2019-06-30 05:35:49'),
(563, 'Update', 214, 35, 35, '3', '03030b1edb', 33, '2019-06-30 05:35:49'),
(564, 'Update', 215, 35, 36, '4', '03043a6a46', 33, '2019-06-30 05:35:49'),
(565, 'Update', 216, 35, 37, '5', '0305643cd4', 33, '2019-06-30 05:35:49'),
(566, 'Create', 217, 36, 33, '1', '', 13, '2019-07-08 20:56:23'),
(567, 'Create', 218, 36, 34, '2', '', 13, '2019-07-08 20:56:23'),
(568, 'Create', 219, 36, 35, '3', '', 13, '2019-07-08 20:56:23'),
(569, 'Create', 220, 36, 36, '4', '', 13, '2019-07-08 20:56:23'),
(570, 'Create', 221, 36, 37, '5', '', 13, '2019-07-08 20:56:23'),
(571, 'Update', 217, 36, 33, '1', '0301b7f4dded23730d58887d6453b41c4780d128d667a8', 33, '2019-07-08 20:57:57'),
(572, 'Update', 218, 36, 34, '2', '0302509de9f33da2002451a2ef1e6742ca9a5f801ef296', 33, '2019-07-08 20:57:57'),
(573, 'Update', 219, 36, 35, '3', '03031c4951437bbd0aa6899fd18f4aa4b57edc340ad0ff', 33, '2019-07-08 20:57:57'),
(574, 'Update', 220, 36, 36, '4', '03041bf916dfddc42bdd2f740aa55d41082c46459a01e2', 33, '2019-07-08 20:57:57'),
(575, 'Update', 221, 36, 37, '5', '03054dab38c562b763c944219c60a01ac5a59fb3cd873f', 33, '2019-07-08 20:57:58'),
(576, 'Create', 222, 37, 33, '1', '', 13, '2019-07-28 22:40:49'),
(577, 'Create', 223, 37, 34, '2', '', 13, '2019-07-28 22:40:50'),
(578, 'Create', 224, 37, 35, '3', '', 13, '2019-07-28 22:40:50'),
(579, 'Create', 225, 37, 36, '4', '', 13, '2019-07-28 22:40:50'),
(580, 'Create', 226, 37, 37, '5', '', 13, '2019-07-28 22:40:50'),
(581, 'Update', 222, 37, 33, '1', '0301beac7c4ee81c799e5839c1a64d9f3e9c17fb6e88f2', 33, '2019-07-28 22:42:03'),
(582, 'Update', 223, 37, 34, '2', '0302944fb285c8584f88b50ed25501985e22c8887ad4f7', 33, '2019-07-28 22:42:03'),
(583, 'Update', 224, 37, 35, '3', '0303d337cfd6cee4b4g043b0643b4d1d8dc441d6541344', 33, '2019-07-28 22:42:03'),
(584, 'Update', 225, 37, 36, '4', '03047a64d340fabfa704031d7858302fcb8084e4fd47db', 33, '2019-07-28 22:42:03'),
(585, 'Update', 226, 37, 37, '5', '03058ad6bec54bea2897f6570dacabce175790b2736fba', 33, '2019-07-28 22:42:03'),
(586, 'Create', 227, 38, 33, '1', '', 13, '2019-08-02 14:17:54'),
(587, 'Create', 228, 38, 34, '2', '', 13, '2019-08-02 14:17:54'),
(588, 'Create', 229, 38, 35, '3', '', 13, '2019-08-02 14:17:54'),
(589, 'Create', 230, 38, 36, '4', '', 13, '2019-08-02 14:17:54'),
(590, 'Create', 231, 38, 37, '5', '', 13, '2019-08-02 14:17:55'),
(591, 'Update', 227, 38, 33, '1', '0301c23e1ab4b2', 33, '2019-08-02 14:19:00'),
(592, 'Update', 228, 38, 34, '2', '0302bdfe8f9ac4', 33, '2019-08-02 14:19:01'),
(593, 'Update', 229, 38, 35, '3', '030352a0c1169b', 33, '2019-08-02 14:19:01'),
(594, 'Update', 230, 38, 36, '4', '03048225b02937', 33, '2019-08-02 14:19:01'),
(595, 'Update', 231, 38, 37, '5', '03054c8e5cd399', 33, '2019-08-02 14:19:01'),
(596, 'Create', 232, 39, 33, '1', '', 13, '2019-08-02 14:45:06'),
(597, 'Create', 233, 39, 34, '2', '', 13, '2019-08-02 14:45:06'),
(598, 'Create', 234, 39, 35, '3', '', 13, '2019-08-02 14:45:06'),
(599, 'Create', 235, 39, 36, '4', '', 13, '2019-08-02 14:45:06'),
(600, 'Update', 232, 39, 33, '1', '03017019a96b1cb70a07', 34, '2019-08-02 14:46:38'),
(601, 'Update', 233, 39, 34, '2', '03029f097db0054b4ca4', 34, '2019-08-02 14:46:39'),
(602, 'Update', 234, 39, 35, '3', '0303be02b002f1f4fd0d', 34, '2019-08-02 14:46:39'),
(603, 'Update', 235, 39, 36, '4', '0304cd044163deb01b44', 34, '2019-08-02 14:46:39'),
(604, 'Create', 236, 40, 35, '1', '', 13, '2019-08-02 15:04:53'),
(605, 'Create', 237, 40, 36, '2', '', 13, '2019-08-02 15:04:53'),
(606, 'Create', 238, 40, 37, '3', '', 13, '2019-08-02 15:04:54'),
(607, 'Update', 236, 40, 35, '1', '0301f027959a78a654b5537f', 36, '2019-08-02 15:06:17'),
(608, 'Update', 237, 40, 36, '2', '0302d001638ec7b484a8a578', 36, '2019-08-02 15:06:17'),
(609, 'Update', 238, 40, 37, '3', '03031105d04e60a30442645b', 36, '2019-08-02 15:06:17'),
(610, 'Update', 102, 13, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:31:08'),
(611, 'Update', 103, 13, 15, '2', '0302106db9dda7d5f644f24d840b', 14, '2019-08-02 19:31:08'),
(612, 'Update', 104, 13, 16, '3', '030301b9d5cb6d7f2b6e01026007', 14, '2019-08-02 19:31:09'),
(613, 'Update', 105, 13, 17, '4', '0304058f952e52ca0257973776cf', 14, '2019-08-02 19:31:09'),
(614, 'Update', 106, 13, 18, '5', '03051cf0fa0756b57bg0b2ecc661', 14, '2019-08-02 19:31:09'),
(615, 'Update', 107, 14, 14, '1', '03016ca1f57c54a7af9c02042346', 14, '2019-08-02 19:31:13'),
(616, 'Update', 108, 14, 15, '2', '030287b6ff498d0a4694d6d3bc19', 14, '2019-08-02 19:31:13'),
(617, 'Update', 109, 14, 16, '3', '0303b8b48cc9218c3416dccc42ef', 14, '2019-08-02 19:31:13'),
(618, 'Update', 110, 14, 17, '4', '0304ff9b9dfb112b792314f0b7c6', 14, '2019-08-02 19:31:14'),
(619, 'Update', 111, 14, 18, '5', '03055b6b31df5de914bb803e199f', 14, '2019-08-02 19:31:14'),
(620, 'Update', 112, 15, 14, '1', '030193636d859cab105913485c39', 14, '2019-08-02 19:31:23'),
(621, 'Update', 113, 15, 15, '2', '0302ca75ff27085484fed1ade758', 14, '2019-08-02 19:31:23'),
(622, 'Update', 114, 15, 16, '3', '03030bab2248bd5dc91b9a8f18d2', 14, '2019-08-02 19:31:23'),
(623, 'Update', 115, 15, 17, '4', '03045804d9e8b9c6dfb36feff2a6', 14, '2019-08-02 19:31:23'),
(624, 'Update', 116, 15, 18, '5', '0305b0822105fd8ec6c450cc72d5', 14, '2019-08-02 19:31:24'),
(625, 'Update', 117, 16, 14, '1', '0301c8f3c72c198d12702745f841', 14, '2019-08-02 19:31:28'),
(626, 'Update', 118, 16, 15, '2', '03029965ef665d408d0c0545d05e', 14, '2019-08-02 19:31:28'),
(627, 'Update', 119, 16, 16, '3', '0303dbcde60e427bde03fd6101cc', 14, '2019-08-02 19:31:28'),
(628, 'Update', 120, 16, 17, '4', '03048d29ac25c93d04550c998d8a', 14, '2019-08-02 19:31:28'),
(629, 'Update', 121, 16, 18, '5', '0305b07b41abf187010135ed7299', 14, '2019-08-02 19:31:28'),
(630, 'Update', 122, 17, 14, '1', '03018c7a1951f195ddb205224703', 14, '2019-08-02 19:31:32'),
(631, 'Update', 123, 17, 15, '2', '0302b47260ea81a453c7a0e84e4a', 14, '2019-08-02 19:31:32'),
(632, 'Update', 124, 17, 16, '3', '0303df5d422a288ed26d31b18e49', 14, '2019-08-02 19:31:32'),
(633, 'Update', 125, 17, 17, '4', '03040c3bc013e75358a5ba7e0600', 14, '2019-08-02 19:31:32'),
(634, 'Update', 126, 17, 18, '5', '03053d0cd9a5bcf4e76e394fb870', 14, '2019-08-02 19:31:32'),
(635, 'Update', 127, 18, 14, '1', '03014c5b33ee424f3933b0a099dc', 14, '2019-08-02 19:31:36'),
(636, 'Update', 128, 18, 15, '2', '03024e0aa6f3fb37c8b057edd2a3', 14, '2019-08-02 19:31:37'),
(637, 'Update', 129, 18, 16, '3', '03036d83c670a01919a4584723cb', 14, '2019-08-02 19:31:37'),
(638, 'Update', 130, 18, 17, '4', '0304a9c5936632f62e0fb3b08e53', 14, '2019-08-02 19:31:37'),
(639, 'Update', 131, 18, 18, '5', '030501d00dd5b2cc06f36726113c', 14, '2019-08-02 19:31:37'),
(640, 'Update', 132, 19, 14, '1', '030169ba629f3d0a5b8f03e8fb35', 14, '2019-08-02 19:31:46'),
(641, 'Update', 133, 19, 15, '2', '03028458065eb51a155734856a81', 14, '2019-08-02 19:31:46'),
(642, 'Update', 134, 19, 16, '3', '0303b8505b9fde919d87f539c858', 14, '2019-08-02 19:31:46'),
(643, 'Update', 135, 19, 17, '4', '030404a26061b86ef21e440413bb', 14, '2019-08-02 19:31:46'),
(644, 'Update', 136, 19, 18, '5', '03056a4d15a543b2131d23e74da9', 14, '2019-08-02 19:31:46'),
(645, 'Update', 137, 20, 14, '1', '0301aeace5df4bb69ccc6a0cf722', 14, '2019-08-02 19:31:52');
INSERT INTO `tb_logshare` (`idlogshare`, `note`, `idshare`, `idfile`, `iduser_share`, `numberofshare`, `kunci`, `updated_by`, `updated_at`) VALUES
(646, 'Update', 138, 20, 15, '2', '03029563143db406c64b5f5c08bf', 14, '2019-08-02 19:31:52'),
(647, 'Update', 139, 20, 16, '3', '03031c9bfe7db153ecad4150af4a', 14, '2019-08-02 19:31:52'),
(648, 'Update', 140, 20, 17, '4', '03044453a09e429c0df110e9eac5', 14, '2019-08-02 19:31:52'),
(649, 'Update', 141, 20, 18, '5', '03050c8cfca068e12b16cd25b92e', 14, '2019-08-02 19:31:52'),
(650, 'Update', 142, 21, 14, '1', '0301ef4311c48efa341b9b5e16cf', 14, '2019-08-02 19:31:56'),
(651, 'Update', 143, 21, 15, '2', '03026cb46d639058da3c4ec5a828', 14, '2019-08-02 19:31:57'),
(652, 'Update', 144, 21, 16, '3', '0303e0c7813f7d7d5e917c952d82', 14, '2019-08-02 19:31:57'),
(653, 'Update', 145, 21, 17, '4', '0304497c4d585568c21924cfa7dc', 14, '2019-08-02 19:31:57'),
(654, 'Update', 146, 21, 18, '5', '0305a9d4d2ae181904d647721435', 14, '2019-08-02 19:31:57'),
(655, 'Update', 147, 22, 14, '1', '030102cea24db1e563a795513ead', 14, '2019-08-02 19:32:01'),
(656, 'Update', 148, 22, 15, '2', '0302305df3f0222c5b89fe98cab3', 14, '2019-08-02 19:32:01'),
(657, 'Update', 149, 22, 16, '3', '0303f1236048cc3856d59c351b87', 14, '2019-08-02 19:32:01'),
(658, 'Update', 150, 22, 17, '4', '03044320eb57ad08548a70293329', 14, '2019-08-02 19:32:01'),
(659, 'Update', 151, 22, 18, '5', '03052854921cc69d55a97a74119a', 14, '2019-08-02 19:32:01'),
(660, 'Update', 152, 23, 28, '1', '0301fe88913d67626344accd', 28, '2019-08-02 19:36:06'),
(661, 'Update', 153, 23, 29, '2', '030234033674d8e020c39e11', 28, '2019-08-02 19:36:06'),
(662, 'Update', 154, 23, 30, '3', '03030de55605c0a799f63f48', 28, '2019-08-02 19:36:07'),
(663, 'Update', 155, 23, 31, '4', '0304892bf1f21fb8cddd9071', 28, '2019-08-02 19:36:07'),
(664, 'Update', 156, 23, 32, '5', '0305a7d80538f712bc78908c', 28, '2019-08-02 19:36:07'),
(665, 'Update', 157, 24, 28, '1', '030173688abe64c69fa253a3', 28, '2019-08-02 19:36:10'),
(666, 'Update', 158, 24, 29, '2', '030239d2f9280386d25a9861', 28, '2019-08-02 19:36:11'),
(667, 'Update', 159, 24, 30, '3', '0303bcafb2a14c6ffaa337b5', 28, '2019-08-02 19:36:11'),
(668, 'Update', 160, 24, 31, '4', '0304fbg0b6273e81167c319e', 28, '2019-08-02 19:36:11'),
(669, 'Update', 161, 24, 32, '5', '0305f6c404bcdabc28e6861c', 28, '2019-08-02 19:36:11'),
(670, 'Update', 162, 25, 28, '1', '030103b4faa26c93711d4e9b', 28, '2019-08-02 19:36:14'),
(671, 'Update', 163, 25, 29, '2', '03026efdc911d93359939c2b', 28, '2019-08-02 19:36:14'),
(672, 'Update', 164, 25, 30, '3', '0303a94cd4b0b40f19db522b', 28, '2019-08-02 19:36:14'),
(673, 'Update', 165, 25, 31, '4', '0304b4a31a7dfe27b2f5719b', 28, '2019-08-02 19:36:14'),
(674, 'Update', 166, 25, 32, '5', '03058f009d79b67b22e1f97a', 28, '2019-08-02 19:36:14'),
(675, 'Update', 167, 26, 28, '1', '03018a2d9c850a1c04847060', 28, '2019-08-02 19:36:18'),
(676, 'Update', 168, 26, 29, '2', '0302695a7e74e0f7929bc24a', 28, '2019-08-02 19:36:18'),
(677, 'Update', 169, 26, 30, '3', '030306f90c2eeebd09bf5e38', 28, '2019-08-02 19:36:18'),
(678, 'Update', 170, 26, 31, '4', '0304620847b4346f6bf0452a', 28, '2019-08-02 19:36:18'),
(679, 'Update', 171, 26, 32, '5', '03057c8a2e04b40db72d7720', 28, '2019-08-02 19:36:18'),
(680, 'Update', 172, 27, 28, '1', '03018a2d8a1c07f04290d4c0', 28, '2019-08-02 19:36:24'),
(681, 'Update', 173, 27, 29, '2', '030231d571c79f71ac44f0fd', 28, '2019-08-02 19:36:24'),
(682, 'Update', 174, 27, 30, '3', '03035f681b6034b39e97bd30', 28, '2019-08-02 19:36:24'),
(683, 'Update', 175, 27, 31, '4', '030413e889e9c8b518883b5b', 28, '2019-08-02 19:36:24'),
(684, 'Update', 176, 27, 32, '5', '03054e53ba6059771b176b7d', 28, '2019-08-02 19:36:25'),
(685, 'Update', 177, 28, 28, '1', '0301d0929fd09a4d263f3f38', 28, '2019-08-02 19:36:29'),
(686, 'Update', 178, 28, 29, '2', '0302872160f18ccf40bdc812', 28, '2019-08-02 19:36:29'),
(687, 'Update', 179, 28, 30, '3', '03038f20aac444b3aff30208', 28, '2019-08-02 19:36:29'),
(688, 'Update', 180, 28, 31, '4', '0304e88f7c49c3fa72e1f01a', 28, '2019-08-02 19:36:29'),
(689, 'Update', 181, 28, 32, '5', '0305916dd78107a38a878f48', 28, '2019-08-02 19:36:29'),
(690, 'Update', 182, 29, 28, '1', '0301426b6f9ag022811dca88', 28, '2019-08-02 19:36:33'),
(691, 'Update', 183, 29, 29, '2', '0302c082dffd0f08e8309b23', 28, '2019-08-02 19:36:33'),
(692, 'Update', 184, 29, 30, '3', '0303e2b7b5899ee195b3dd4c', 28, '2019-08-02 19:36:33'),
(693, 'Update', 185, 29, 31, '4', '0304a809f23fabab89a58f02', 28, '2019-08-02 19:36:34'),
(694, 'Update', 186, 29, 32, '5', '0305127a951f3667c406b246', 28, '2019-08-02 19:36:34'),
(695, 'Update', 187, 30, 28, '1', '0301298f5729df7c5601b90a', 28, '2019-08-02 19:36:39'),
(696, 'Update', 188, 30, 29, '2', '0302efa8baaf0cddafd17a42', 28, '2019-08-02 19:36:39'),
(697, 'Update', 189, 30, 30, '3', '0303b9bd8ef2f8506be8ad21', 28, '2019-08-02 19:36:39'),
(698, 'Update', 190, 30, 31, '4', '030488ced4f2a0d78b4651a8', 28, '2019-08-02 19:36:39'),
(699, 'Update', 191, 30, 32, '5', '03055cdb8baf05700eed67d6', 28, '2019-08-02 19:36:39'),
(700, 'Update', 192, 31, 28, '1', '03016abdd7974210ca696ce8', 28, '2019-08-02 19:36:43'),
(701, 'Update', 193, 31, 29, '2', '03026ca46a9fa82e03740c94', 28, '2019-08-02 19:36:43'),
(702, 'Update', 194, 31, 30, '3', '03036f2720799f880e9b4a7f', 28, '2019-08-02 19:36:43'),
(703, 'Update', 195, 31, 31, '4', '03047347fa25271debde25a9', 28, '2019-08-02 19:36:43'),
(704, 'Update', 196, 31, 32, '5', '03057803f6a441ef983c9e11', 28, '2019-08-02 19:36:44'),
(705, 'Update', 197, 32, 28, '1', '030197afbeede260963de9a0', 28, '2019-08-02 19:36:48'),
(706, 'Update', 198, 32, 29, '2', '0302c20d07ec895ac337332d', 28, '2019-08-02 19:36:48'),
(707, 'Update', 199, 32, 30, '3', '0303ea8e435e641ce8684922', 28, '2019-08-02 19:36:48'),
(708, 'Update', 200, 32, 31, '4', '03040e30714473a704d02a7f', 28, '2019-08-02 19:36:48'),
(709, 'Update', 201, 32, 32, '5', '030530f5919eb6fa196ed743', 28, '2019-08-02 19:36:48'),
(710, 'Update', 202, 33, 33, '1', '03014b25d01639cae47b4733', 33, '2019-08-02 19:37:42'),
(711, 'Update', 203, 33, 34, '2', '0302db011303b7e5f55b782b', 33, '2019-08-02 19:37:42'),
(712, 'Update', 204, 33, 35, '3', '030317063128e77f941afc62', 33, '2019-08-02 19:37:42'),
(713, 'Update', 205, 33, 36, '4', '030401342985c999c2b9d2d8', 33, '2019-08-02 19:37:42'),
(714, 'Update', 206, 33, 37, '5', '0305998bfc195d327e36fb8c', 33, '2019-08-02 19:37:43'),
(715, 'Update', 207, 34, 33, '1', '03013ec05d3badaef5648865', 33, '2019-08-02 19:37:51'),
(716, 'Update', 208, 34, 34, '2', '030275b141b6a7aa984c0498', 33, '2019-08-02 19:37:51'),
(717, 'Update', 209, 34, 35, '3', '03030d4512d15c224b32df12', 33, '2019-08-02 19:37:51'),
(718, 'Update', 210, 34, 36, '4', '0304077dd18ccd170e1616d5', 33, '2019-08-02 19:37:51'),
(719, 'Update', 211, 34, 37, '5', '030563587ce8f989e2f9acdf', 33, '2019-08-02 19:37:52'),
(720, 'Update', 212, 35, 33, '1', '0301b678b6da4029f58ffc1c', 33, '2019-08-02 19:37:56'),
(721, 'Update', 213, 35, 34, '2', '0302cfcd381ce16a1aff8e49', 33, '2019-08-02 19:37:56'),
(722, 'Update', 214, 35, 35, '3', '0303b470ee294ff1d3c92000', 33, '2019-08-02 19:37:57'),
(723, 'Update', 215, 35, 36, '4', '03046562d6008cbd1deeb342', 33, '2019-08-02 19:37:57'),
(724, 'Update', 216, 35, 37, '5', '0305e3a3f1a297cffb6d450e', 33, '2019-08-02 19:37:57'),
(725, 'Update', 217, 36, 33, '1', '030184fb43af15b9e1a555f1', 33, '2019-08-02 19:38:00'),
(726, 'Update', 218, 36, 34, '2', '0302eb9e721def27569d0273', 33, '2019-08-02 19:38:00'),
(727, 'Update', 219, 36, 35, '3', '03039d5cf3adfa7ac2627101', 33, '2019-08-02 19:38:00'),
(728, 'Update', 220, 36, 36, '4', '03049b35c55d36b123f5a19c', 33, '2019-08-02 19:38:00'),
(729, 'Update', 221, 36, 37, '5', '0305e529e92ea5cc7b549242', 33, '2019-08-02 19:38:00'),
(730, 'Update', 222, 37, 33, '1', '03017540150ea38a79cfaaaa', 33, '2019-08-02 19:38:02'),
(731, 'Update', 223, 37, 34, '2', '0302c6cc1275d62a72227169', 33, '2019-08-02 19:38:03'),
(732, 'Update', 224, 37, 35, '3', '03035b145d95060f4c75bfb8', 33, '2019-08-02 19:38:03'),
(733, 'Update', 225, 37, 36, '4', '0304351af66e353907c79396', 33, '2019-08-02 19:38:03'),
(734, 'Update', 226, 37, 37, '5', '030554dedc0062a8a417ee03', 33, '2019-08-02 19:38:03'),
(735, 'Update', 227, 38, 33, '1', '0301c53f754ce410fee7c66f', 33, '2019-08-02 19:38:06'),
(736, 'Update', 228, 38, 34, '2', '0302450ce16fa820d15bde2d', 33, '2019-08-02 19:38:06'),
(737, 'Update', 229, 38, 35, '3', '0303ebdaa9cabb5edbd8b1b5', 33, '2019-08-02 19:38:06'),
(738, 'Update', 230, 38, 36, '4', '0304b5a7ce5c1cca1b5c3f05', 33, '2019-08-02 19:38:06'),
(739, 'Update', 231, 38, 37, '5', '0305a4744f26cd6393e9891f', 33, '2019-08-02 19:38:06'),
(740, 'Update', 232, 39, 33, '1', '0301c53352399984d94d82307d', 34, '2019-08-02 19:38:31'),
(741, 'Update', 233, 39, 34, '2', '0302067543d4d50a7204b2a5ee', 34, '2019-08-02 19:38:32'),
(742, 'Update', 234, 39, 35, '3', '0303332635381ff53454f4d5bb', 34, '2019-08-02 19:38:32'),
(743, 'Update', 235, 39, 36, '4', '03044b47286779421f3c47c0e5', 34, '2019-08-02 19:38:32'),
(744, 'Update', 236, 40, 35, '1', '0301d5b2bd4ce7386918198d8e7a39fc181be8d1a3870f', 36, '2019-08-02 19:39:22'),
(745, 'Update', 237, 40, 36, '2', '0302922989905fad909cf30e5e9d7a006536g0d2471a48', 36, '2019-08-02 19:39:23'),
(746, 'Update', 238, 40, 37, '3', '030388b492fd978ea6ccb9b5a296f341138178301debe3', 36, '2019-08-02 19:39:23'),
(747, 'Update', 102, 13, 14, '1', '0301b3e5ee0f8e8284419a0e5c4ec922574fedf65c4bd5', 14, '2019-08-08 06:31:13'),
(748, 'Update', 103, 13, 15, '2', '030255ff2c768d93594aa787f92f337e2e3e32526c2964', 14, '2019-08-08 06:31:13'),
(749, 'Update', 104, 13, 16, '3', '0303379bea652a63b15c549a06d17044b3fe014360cbe0', 14, '2019-08-08 06:31:13'),
(750, 'Update', 105, 13, 17, '4', '030459ba25dd66f38b77a24786327f75e58d5ac9382f47', 14, '2019-08-08 06:31:13'),
(751, 'Update', 106, 13, 18, '5', '0305bb5be0dd4041e89b908f77546010c4ed3ce3f5579b', 14, '2019-08-08 06:31:13'),
(752, 'Update', 107, 14, 14, '1', '03015ddee558bcdea140fbf03b062206665ca09cg05c4e', 14, '2019-08-08 22:27:53'),
(753, 'Update', 108, 14, 15, '2', '0302ab507d164178fd9a280105ac7b5ed94c10afabd00d', 14, '2019-08-08 22:27:53'),
(754, 'Update', 109, 14, 16, '3', '030339a5f76cbeg0444eb766901d3a3885008266328b70', 14, '2019-08-08 22:27:53'),
(755, 'Update', 110, 14, 17, '4', '030408dc51593174785da61ddb5b60956b79f5c2968e76', 14, '2019-08-08 22:27:53'),
(756, 'Update', 111, 14, 18, '5', '030518f58dde9cd698c7f627e665ed748bb668c2d6d91f', 14, '2019-08-08 22:27:53'),
(757, 'Update', 102, 13, 14, '1', '030179309fd7e49e8d6992ee45692803ec3a350da4426a', 14, '2019-08-09 17:50:11'),
(758, 'Update', 103, 13, 15, '2', '0302c19d3ab12ebd4c31623e2c438469795b5e53d5ca84', 14, '2019-08-09 17:50:11'),
(759, 'Update', 104, 13, 16, '3', '03032793g0c00d8d6f9a9e22e7bc4362d693abffc3c77f', 14, '2019-08-09 17:50:11'),
(760, 'Update', 105, 13, 17, '4', '0304ad12ef03810ef6a3459a74d366ef01e21b0f6e395b', 14, '2019-08-09 17:50:12'),
(761, 'Update', 106, 13, 18, '5', '0305511b077c8941e04c58a5d588ed0efd47b086d72118', 14, '2019-08-09 17:50:12'),
(762, 'Update', 102, 13, 14, '1', '03019cb6502547c9e82c0f0257d42057e5b0d2f10b0606', 14, '2019-08-09 17:52:13'),
(763, 'Update', 103, 13, 15, '2', '0302ad544b69dce290d99a4fc00c3bd2ef9f8757715f8d', 14, '2019-08-09 17:52:13'),
(764, 'Update', 104, 13, 16, '3', '030383281efdeb7b2a46cd166bd881a14bfe5061613ac5', 14, '2019-08-09 17:52:13'),
(765, 'Update', 105, 13, 17, '4', '03041e32cae07495b775a8585935f2c5fbcc2d0edc98ae', 14, '2019-08-09 17:52:13'),
(766, 'Update', 106, 13, 18, '5', '03057f724d12782f35652b148a258d3dfd091e5fe17848', 14, '2019-08-09 17:52:13'),
(767, 'Update', 102, 13, 14, '1', '03016419e1f29d21875b70830977062fd0e8fdf611ed59', 14, '2019-08-09 18:11:17'),
(768, 'Update', 103, 13, 15, '2', '030215ff28e5c8fdc1f52b14edf08a4f32c40a0b800691', 14, '2019-08-09 18:11:17'),
(769, 'Update', 104, 13, 16, '3', '030364fd040aaec2df0d5fe5db97bb9155c55a6f7c7ed9', 14, '2019-08-09 18:11:17'),
(770, 'Update', 105, 13, 17, '4', '0304501375634f71e1a60bf4d46d99f538ebec20055330', 14, '2019-08-09 18:11:18'),
(771, 'Update', 106, 13, 18, '5', '0305da437aefac0ac7be3041d872247adc35bf1f1c8698', 14, '2019-08-09 18:11:18'),
(772, 'Update', 102, 13, 14, '1', '03014c487e8bf7e96f0343cee6f297ffcc6ff42d379ac0', 14, '2019-08-09 18:22:01'),
(773, 'Update', 103, 13, 15, '2', '0302443193d99333a6c71942c35cb80546f8a5d58c66a6', 14, '2019-08-09 18:22:01'),
(774, 'Update', 104, 13, 16, '3', '030338086c1a0210d68bb08ec96d93469dca44232e95e4', 14, '2019-08-09 18:22:01'),
(775, 'Update', 105, 13, 17, '4', '030428ce09504580ff5006b1f82428c1d0e6d2191e2679', 14, '2019-08-09 18:22:01'),
(776, 'Update', 106, 13, 18, '5', '030514816b7a5b8220161dab4f827875df4b4db75c1a66', 14, '2019-08-09 18:22:01'),
(777, 'Update', 102, 13, 14, '1', '0301b1dce469a6cac4a070b17c72a7cc7d68774f67c1d8', 14, '2019-08-09 18:49:02'),
(778, 'Update', 103, 13, 15, '2', '0302bbb85da6dc0598740081b32f25bc6e8c55aa02c708', 14, '2019-08-09 18:49:02'),
(779, 'Update', 104, 13, 16, '3', '03036ee29ae8cfe4aebedfa1d665ac01009ccb3d0242c4', 14, '2019-08-09 18:49:02'),
(780, 'Update', 105, 13, 17, '4', '0304cb599a2e7f64057d0a10e5133a9d3498d809673309', 14, '2019-08-09 18:49:02'),
(781, 'Update', 106, 13, 18, '5', '0305d11e5d7aed879fb284d0e03ad18e09807c0e309ada', 14, '2019-08-09 18:49:02'),
(782, 'Update', 102, 13, 14, '1', '0301abd4a954cdcc1cd26b5d42f02489d21ceee4721830', 14, '2019-08-09 18:50:52'),
(783, 'Update', 103, 13, 15, '2', '0302cfd9f0337005d5476258c747124ced456261df6143', 14, '2019-08-09 18:50:53'),
(784, 'Update', 104, 13, 16, '3', '0303bc5c01cf17de5aa21221bf34fb7b7eab8ea6760a6a', 14, '2019-08-09 18:50:53'),
(785, 'Update', 105, 13, 17, '4', '0304725edf26c354ade27cb92ab7dd15864d71b23814a5', 14, '2019-08-09 18:50:53'),
(786, 'Update', 106, 13, 18, '5', '0305f2df873a7269cd069f1e09cfb91b042c0b85257ff4', 14, '2019-08-09 18:50:53'),
(787, 'Update', 102, 13, 14, '1', '03017bfc6e8f9ef2a69977fcfcb5de323d7686ceae0273', 14, '2019-08-09 18:55:14'),
(788, 'Update', 103, 13, 15, '2', '03029ee0219b507f73ebb64e9e973c4c53b52688adb124', 14, '2019-08-09 18:55:14'),
(789, 'Update', 104, 13, 16, '3', '0303b9fa475544d99936ea2818d44c7f6fed115c2d3b45', 14, '2019-08-09 18:55:14'),
(790, 'Update', 105, 13, 17, '4', '0304cc49e0be7aff177c128a6b6b0dcb911d474a2fa2d6', 14, '2019-08-09 18:55:14'),
(791, 'Update', 106, 13, 18, '5', '0305d7cfebd5f2f1efbc3073965d802fb947c852b3e5d6', 14, '2019-08-09 18:55:14'),
(792, 'Update', 102, 13, 14, '1', '030186165f25e7e9df192ae7c44504fc47f4a9d91a7dea', 14, '2019-08-09 18:59:22'),
(793, 'Update', 103, 13, 15, '2', '030205d6248303cf39c0850cddc9fcb88377db5ebad4b2', 14, '2019-08-09 18:59:22'),
(794, 'Update', 104, 13, 16, '3', '0303cf8b7d4a84e341343da27cb81566e1bbc6be0e348a', 14, '2019-08-09 18:59:22'),
(795, 'Update', 105, 13, 17, '4', '0304e236697b6824f77753a7a212520660bf6af8189f72', 14, '2019-08-09 18:59:22'),
(796, 'Update', 106, 13, 18, '5', '03053ed8e915b0945988c71b4ed9b2990183c80bd8136a', 14, '2019-08-09 18:59:22'),
(797, 'Update', 102, 13, 14, '1', '030122f01c5add4885215bd9d049bf2f160c8059bda046', 14, '2019-08-09 19:10:22'),
(798, 'Update', 103, 13, 15, '2', '0302ac28d59972e8d603a542c945594f36c5ad1a26e993', 14, '2019-08-09 19:10:22'),
(799, 'Update', 104, 13, 16, '3', '0303edf856eeee0e23e80a6d1c21g0918d59b7716d0a17', 14, '2019-08-09 19:10:22'),
(800, 'Update', 105, 13, 17, '4', '0304e55da1584fbd6ece8c59cbdeb2f51aca9e5d9105d4', 14, '2019-08-09 19:10:22'),
(801, 'Update', 106, 13, 18, '5', '03059459b5d997f3b6b62906d47a707adf1662df92dac8', 14, '2019-08-09 19:10:22'),
(802, 'Update', 102, 13, 14, '1', '0301619d08812ea654c90bf40a3b2ca50e31dfd8e89dff', 14, '2019-08-09 19:16:09'),
(803, 'Update', 103, 13, 15, '2', '03020d04785b4bg09e8b703262641ac3f473f64544e450', 14, '2019-08-09 19:16:09'),
(804, 'Update', 104, 13, 16, '3', '030355847cc0843d0e885bed38a8fb8bddf67576460426', 14, '2019-08-09 19:16:09'),
(805, 'Update', 105, 13, 17, '4', '0304381b14afd95fa6c0cd228d06cdfecab95d6aeeg081', 14, '2019-08-09 19:16:09'),
(806, 'Update', 106, 13, 18, '5', '0305b7cb412849656432c5d46080911abbbdae213ad560', 14, '2019-08-09 19:16:09'),
(807, 'Update', 102, 13, 14, '1', '0301420e5a70c7255a861ca1ca8aed63c1d7cc49a631f9', 14, '2019-08-09 19:21:24'),
(808, 'Update', 103, 13, 15, '2', '030246273a717dbe485528a3d4d222d02d358520994955', 14, '2019-08-09 19:21:24'),
(809, 'Update', 104, 13, 16, '3', '03035c98ce3450fafcaf51364f04d277734c5cb3097847', 14, '2019-08-09 19:21:25'),
(810, 'Update', 105, 13, 17, '4', '0304846014ba40d97493975b3c22fb59921b5100f8becf', 14, '2019-08-09 19:21:25'),
(811, 'Update', 106, 13, 18, '5', '0305be800e014d5bb201fa119b2b9d768aa36409631aec', 14, '2019-08-09 19:21:25'),
(812, 'Update', 102, 13, 14, '1', '03015157baae0bfc6fd7566e0e5803cec2b5c3d056f269', 14, '2019-08-09 19:28:17'),
(813, 'Update', 103, 13, 15, '2', '03024411ac4d664c51e86365b210f097dca2ce8559467f', 14, '2019-08-09 19:28:18'),
(814, 'Update', 104, 13, 16, '3', '0303297c030f3d22d87454151b56f58d7bf8514d392e73', 14, '2019-08-09 19:28:18'),
(815, 'Update', 105, 13, 17, '4', '03040097c1f5917e027c297f4b2912b0a0b64d28f7aa45', 14, '2019-08-09 19:28:18'),
(816, 'Update', 106, 13, 18, '5', '0305ca62e4fd615fd2g0e3a2418a49g04addc21691b9f6', 14, '2019-08-09 19:28:18'),
(817, 'Update', 102, 13, 14, '1', '030167a8f357203c27885a290e8fe6aba24d4214f7d6a2', 14, '2019-08-09 19:43:25'),
(818, 'Update', 103, 13, 15, '2', '0302c328d99611d4bc33faa359720fa25d35bb36cc76e2', 14, '2019-08-09 19:43:25'),
(819, 'Update', 104, 13, 16, '3', '030363cfe0ee00f7ef430b9d11d7ae165fe99a93b011f1', 14, '2019-08-09 19:43:25'),
(820, 'Update', 105, 13, 17, '4', '0304489b075eeea5c0b8901737bdc108a867e02aa3a8cf', 14, '2019-08-09 19:43:26'),
(821, 'Update', 106, 13, 18, '5', '0305728d50e8d9df2f918712cb24487837b18cfda5397c', 14, '2019-08-09 19:43:26'),
(822, 'Update', 102, 13, 14, '1', '0301623a93475c663a7a53a3bc1786a3bace0e5e7d03a4', 14, '2019-08-09 19:46:20'),
(823, 'Update', 103, 13, 15, '2', '030205ee84372fdf2577988c4abd7a1068036752b5462b', 14, '2019-08-09 19:46:20'),
(824, 'Update', 104, 13, 16, '3', '03033a670001a79af338fcecdd1d0c7a38d23a09d8f9c8', 14, '2019-08-09 19:46:20'),
(825, 'Update', 105, 13, 17, '4', '030400a708a6c398a2be7ec273393de02a388884e61a79', 14, '2019-08-09 19:46:21'),
(826, 'Update', 106, 13, 18, '5', '030558ad9c2483d933071f0e0d100c413e3750c2dfac3f', 14, '2019-08-09 19:46:21'),
(827, 'Update', 102, 13, 14, '1', '0301ac9ca5408bda01c9720f1b109a3733c575ed1e60cd', 14, '2019-08-09 19:47:22'),
(828, 'Update', 103, 13, 15, '2', '0302c1bae00c647ae2794e322db64e1d45c3aabd7906e4', 14, '2019-08-09 19:47:22'),
(829, 'Update', 104, 13, 16, '3', '03038fa7de96b911d252c299671d4de4632acf9e402376', 14, '2019-08-09 19:47:23'),
(830, 'Update', 105, 13, 17, '4', '030416639fdd89a0d254cd43c947978a8dfce49074b784', 14, '2019-08-09 19:47:23'),
(831, 'Update', 106, 13, 18, '5', '030557ef23e1d525e27f6f3152332b10c336e99314c10d', 14, '2019-08-09 19:47:23'),
(832, 'Update', 102, 13, 14, '1', '03012c4e9e9f3ac31fc51aa5c3d5f45cc9789ba3a6e30c', 14, '2019-08-09 19:54:10'),
(833, 'Update', 103, 13, 15, '2', '0302b171b9a8bdcd0e3a1c9ab7d177a5a3b4a8dcfd4024', 14, '2019-08-09 19:54:11'),
(834, 'Update', 104, 13, 16, '3', '0303deb67e4cb54effa2330f0d21bb0bbce457d8344979', 14, '2019-08-09 19:54:11'),
(835, 'Update', 105, 13, 17, '4', '0304b31cee8c2247f0fc5f05c7c7bf901307a9974dfe0a', 14, '2019-08-09 19:54:11'),
(836, 'Update', 106, 13, 18, '5', '030530a5076705b8e247a07ce3c18332aa1f9d19475dd9', 14, '2019-08-09 19:54:11'),
(837, 'Update', 102, 13, 14, '1', '0301b905240b4b371a8e11a9300d9fe5cff2cbcbg09a3b', 14, '2019-08-09 19:58:39'),
(838, 'Update', 103, 13, 15, '2', '0302b40e35d9a2a964f2decbc34c59c035ff58b4b4f64c', 14, '2019-08-09 19:58:39'),
(839, 'Update', 104, 13, 16, '3', '03034168609931850e6c9296e9ea5fc36157d9e94d4364', 14, '2019-08-09 19:58:39'),
(840, 'Update', 105, 13, 17, '4', '03046112a54cfacc19fe2e0aa2e6b1ee52fc4c69cc8383', 14, '2019-08-09 19:58:40'),
(841, 'Update', 106, 13, 18, '5', '0305130d03f3fb7d85a6b328ef404e4008ecb3352fb5a9', 14, '2019-08-09 19:58:40'),
(842, 'Update', 102, 13, 14, '1', '030146984158a7286b4ef6400f02a480654a5574aa7171', 14, '2019-08-09 20:06:51'),
(843, 'Update', 103, 13, 15, '2', '03028831526b9a3f23e31854a32d13d5b3ce76fa7ae920', 14, '2019-08-09 20:06:52'),
(844, 'Update', 104, 13, 16, '3', '03031519606a06755aff966cecae7f2f16bb93bea1973f', 14, '2019-08-09 20:06:52'),
(845, 'Update', 105, 13, 17, '4', '0304ef506b55edca0fa26e88ea84e7909011acc11e7cce', 14, '2019-08-09 20:06:52'),
(846, 'Update', 106, 13, 18, '5', '030513d6732c4c3d43cda1a89db04af71fd2c102f398cc', 14, '2019-08-09 20:06:52'),
(847, 'Update', 102, 13, 14, '1', '0301496b16a39b8d07701af6f6864a4e8a366efceb3b35', 14, '2019-08-09 20:09:21'),
(848, 'Update', 103, 13, 15, '2', '0302c3fce2511035167322f5cba82cf0f67bdde3cbde78', 14, '2019-08-09 20:09:21'),
(849, 'Update', 104, 13, 16, '3', '0303bdff8f3c8e295e4a452db193d71570ff7ce3d117fa', 14, '2019-08-09 20:09:21'),
(850, 'Update', 105, 13, 17, '4', '030437741e641369dff683a0a84749c0fac14cfcfde9ba', 14, '2019-08-09 20:09:21'),
(851, 'Update', 106, 13, 18, '5', '0305325c90c9a1f59875dc4cb0c584ef92c24d2d4e51b9', 14, '2019-08-09 20:09:21'),
(852, 'Update', 102, 13, 14, '1', '0301863c6bdfc34944b13510ae4fd579d8c0090cc3a606', 14, '2019-08-09 20:16:38'),
(853, 'Update', 103, 13, 15, '2', '0302290144cef03a8337b10797e09a4a8082f8cd5b07c4', 14, '2019-08-09 20:16:38'),
(854, 'Update', 104, 13, 16, '3', '03033a9db9ffb403eed5a015eddf80a52677fb6efa5569', 14, '2019-08-09 20:16:38'),
(855, 'Update', 105, 13, 17, '4', '0304b90ec9710fa58489023aaf4c8789cb9f12f19e8ff7', 14, '2019-08-09 20:16:39'),
(856, 'Update', 106, 13, 18, '5', '0305a5567425021e4654d976de28aff76dfa3f5448b56c', 14, '2019-08-09 20:16:39'),
(857, 'Update', 102, 13, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:33:40'),
(858, 'Update', 103, 13, 15, '2', '03024e95953fd138a5c3', 14, '2019-08-13 20:33:40'),
(859, 'Update', 104, 13, 16, '3', '0303a5566d995edbf434', 14, '2019-08-13 20:33:40'),
(860, 'Update', 105, 13, 17, '4', '03049338738fd74cba16', 14, '2019-08-13 20:33:40'),
(861, 'Update', 106, 13, 18, '5', '0305183ba7213a8df869', 14, '2019-08-13 20:33:41'),
(862, 'Update', 107, 14, 14, '1', '0301472cf8278bd926d2', 14, '2019-08-13 20:33:56'),
(863, 'Update', 108, 14, 15, '2', '030224c7e19562692328', 14, '2019-08-13 20:33:56'),
(864, 'Update', 109, 14, 16, '3', '0303ff4429aafd126536', 14, '2019-08-13 20:33:57'),
(865, 'Update', 110, 14, 17, '4', '0304d6a5d2665ad5ecfc', 14, '2019-08-13 20:33:57'),
(866, 'Update', 111, 14, 18, '5', '0305aae9daca7bb0b778', 14, '2019-08-13 20:33:57'),
(867, 'Update', 112, 15, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:34:07'),
(868, 'Update', 113, 15, 15, '2', '03024cdbe838c178d38f', 14, '2019-08-13 20:34:07'),
(869, 'Update', 114, 15, 16, '3', '03039460101706f60001', 14, '2019-08-13 20:34:07'),
(870, 'Update', 115, 15, 17, '4', '03041472d79962142ba2', 14, '2019-08-13 20:34:07'),
(871, 'Update', 116, 15, 18, '5', '0305ce103abdd4d55370', 14, '2019-08-13 20:34:07'),
(872, 'Update', 117, 16, 14, '1', '03018f70f4b5123dcfea', 14, '2019-08-13 20:34:17'),
(873, 'Update', 118, 16, 15, '2', '0302c35ba6dc9733b2e9', 14, '2019-08-13 20:34:17'),
(874, 'Update', 119, 16, 16, '3', '0303023685d604431731', 14, '2019-08-13 20:34:17'),
(875, 'Update', 120, 16, 17, '4', '03044e0191a35b6dg0c4', 14, '2019-08-13 20:34:17'),
(876, 'Update', 121, 16, 18, '5', '0305a6bdca439bb16aa0', 14, '2019-08-13 20:34:17'),
(877, 'Update', 122, 17, 14, '1', '030131d9fbcb0152f24a', 14, '2019-08-13 20:34:30'),
(878, 'Update', 123, 17, 15, '2', '030269181aad1dc1c4c7', 14, '2019-08-13 20:34:30'),
(879, 'Update', 124, 17, 16, '3', '03030e34ce07cbade5ab', 14, '2019-08-13 20:34:30'),
(880, 'Update', 125, 17, 17, '4', '0304212c14db091654f7', 14, '2019-08-13 20:34:30'),
(881, 'Update', 126, 17, 18, '5', '0305a200ef26dafe12aa', 14, '2019-08-13 20:34:31'),
(882, 'Update', 127, 18, 14, '1', '0301817037b2f5288e71', 14, '2019-08-13 20:34:39'),
(883, 'Update', 128, 18, 15, '2', '0302d1f63fec4523003f', 14, '2019-08-13 20:34:39'),
(884, 'Update', 129, 18, 16, '3', '03035605860e6952c6a1', 14, '2019-08-13 20:34:39'),
(885, 'Update', 130, 18, 17, '4', '030411a00b1a60b5de96', 14, '2019-08-13 20:34:40'),
(886, 'Update', 131, 18, 18, '5', '030502c5d00f2a4b481e', 14, '2019-08-13 20:34:40'),
(887, 'Update', 132, 19, 14, '1', '03017748cd841d527a87', 14, '2019-08-13 20:34:50'),
(888, 'Update', 133, 19, 15, '2', '0302afdf9eeba557c5ba', 14, '2019-08-13 20:34:50'),
(889, 'Update', 134, 19, 16, '3', '03030e38e2950d704ed0', 14, '2019-08-13 20:34:50'),
(890, 'Update', 135, 19, 17, '4', '030496559883579d16c9', 14, '2019-08-13 20:34:50'),
(891, 'Update', 136, 19, 18, '5', '03054535c1b582de1da5', 14, '2019-08-13 20:34:50'),
(892, 'Update', 137, 20, 14, '1', '0301e1481c3398f50ec8', 14, '2019-08-13 20:35:01'),
(893, 'Update', 138, 20, 15, '2', '03025165d42665f3e81f', 14, '2019-08-13 20:35:01'),
(894, 'Update', 139, 20, 16, '3', '0303b9cc943adf5bfa3f', 14, '2019-08-13 20:35:01'),
(895, 'Update', 140, 20, 17, '4', '0304177c5d6f042e4427', 14, '2019-08-13 20:35:02'),
(896, 'Update', 141, 20, 18, '5', '03056d762fc5d76cc8d8', 14, '2019-08-13 20:35:02'),
(897, 'Update', 142, 21, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:35:10'),
(898, 'Update', 143, 21, 15, '2', '0302bdd191a7396c0835', 14, '2019-08-13 20:35:10'),
(899, 'Update', 144, 21, 16, '3', '03037478e540dc2a8aa3', 14, '2019-08-13 20:35:10'),
(900, 'Update', 145, 21, 17, '4', '030489c6ba7e540e2e05', 14, '2019-08-13 20:35:10'),
(901, 'Update', 146, 21, 18, '5', '0305fcba1060a318f65d', 14, '2019-08-13 20:35:10'),
(902, 'Update', 147, 22, 14, '1', '03016e370f207e861a50d6', 14, '2019-08-13 20:35:19'),
(903, 'Update', 148, 22, 15, '2', '0302fa7e6abf44ca0f725e', 14, '2019-08-13 20:35:19'),
(904, 'Update', 149, 22, 16, '3', '030309497e3cca2c4d97ca', 14, '2019-08-13 20:35:19'),
(905, 'Update', 150, 22, 17, '4', '03049e994b990eaed4bf18', 14, '2019-08-13 20:35:19'),
(906, 'Update', 151, 22, 18, '5', '0305b76dd2d5124ea3ea4a', 14, '2019-08-13 20:35:19'),
(907, 'Update', 197, 32, 28, '1', '0301ec799005c853b1', 28, '2019-08-13 20:47:10'),
(908, 'Update', 198, 32, 29, '2', '0302aaebf114e3a02d', 28, '2019-08-13 20:47:10'),
(909, 'Update', 199, 32, 30, '3', '0303a4c7888ebf17a6', 28, '2019-08-13 20:47:10'),
(910, 'Update', 200, 32, 31, '4', '0304da0d56725cba1a', 28, '2019-08-13 20:47:10'),
(911, 'Update', 201, 32, 32, '5', '03054bbf5bc1bb878b', 28, '2019-08-13 20:47:10'),
(912, 'Update', 192, 31, 28, '1', '0301d55630376da2', 28, '2019-08-13 20:47:27'),
(913, 'Update', 193, 31, 29, '2', '0302b45319f26159', 28, '2019-08-13 20:47:27'),
(914, 'Update', 194, 31, 30, '3', '0303066921904a5f', 28, '2019-08-13 20:47:27'),
(915, 'Update', 195, 31, 31, '4', '0304cd98481228b4', 28, '2019-08-13 20:47:27'),
(916, 'Update', 196, 31, 32, '5', '030506e08e79fc57', 28, '2019-08-13 20:47:27'),
(917, 'Update', 187, 30, 28, '1', '0301be967708g0dd', 28, '2019-08-13 20:47:34'),
(918, 'Update', 188, 30, 29, '2', '03028097c3cf2996', 28, '2019-08-13 20:47:34'),
(919, 'Update', 189, 30, 30, '3', '0303b07549b4ec64', 28, '2019-08-13 20:47:34'),
(920, 'Update', 190, 30, 31, '4', '03044d300ab84647', 28, '2019-08-13 20:47:34'),
(921, 'Update', 191, 30, 32, '5', '030558c906db393f', 28, '2019-08-13 20:47:34'),
(922, 'Update', 182, 29, 28, '1', '030107ca62dadc16', 28, '2019-08-13 20:47:42'),
(923, 'Update', 183, 29, 29, '2', '0302025713g0ef1c', 28, '2019-08-13 20:47:42'),
(924, 'Update', 184, 29, 30, '3', '03035a1a7ad3a749', 28, '2019-08-13 20:47:42'),
(925, 'Update', 185, 29, 31, '4', '03040e139653049d', 28, '2019-08-13 20:47:42'),
(926, 'Update', 186, 29, 32, '5', '03051f4267810717', 28, '2019-08-13 20:47:42'),
(927, 'Update', 177, 28, 28, '1', '030173c475246c1f', 28, '2019-08-13 20:47:53'),
(928, 'Update', 178, 28, 29, '2', '03028d2c3e3242cf', 28, '2019-08-13 20:47:53'),
(929, 'Update', 179, 28, 30, '3', '0303b7acc28bf144', 28, '2019-08-13 20:47:53'),
(930, 'Update', 180, 28, 31, '4', '0304f142g02e7780', 28, '2019-08-13 20:47:53'),
(931, 'Update', 181, 28, 32, '5', '03053af0f81cd682', 28, '2019-08-13 20:47:54'),
(932, 'Update', 172, 27, 28, '1', '030167e886c17b57', 28, '2019-08-13 20:48:00'),
(933, 'Update', 173, 27, 29, '2', '03027bac27cfe5e6', 28, '2019-08-13 20:48:00'),
(934, 'Update', 174, 27, 30, '3', '0303a5bf4a8babe1', 28, '2019-08-13 20:48:00'),
(935, 'Update', 175, 27, 31, '4', '0304e520eff6ce48', 28, '2019-08-13 20:48:00'),
(936, 'Update', 176, 27, 32, '5', '03053ad1140e4d1c', 28, '2019-08-13 20:48:00'),
(937, 'Update', 167, 26, 28, '1', '0301b6310f6c1fbb', 28, '2019-08-13 20:48:07'),
(938, 'Update', 168, 26, 29, '2', '03022b634f993ba4', 28, '2019-08-13 20:48:07'),
(939, 'Update', 169, 26, 30, '3', '0303ca0725e8c2f0', 28, '2019-08-13 20:48:07'),
(940, 'Update', 170, 26, 31, '4', '0304911e9258b39e', 28, '2019-08-13 20:48:08'),
(941, 'Update', 171, 26, 32, '5', '030581a895eb0eaf', 28, '2019-08-13 20:48:08'),
(942, 'Update', 162, 25, 28, '1', '0301fcfd69a7e6ff', 28, '2019-08-13 20:48:14'),
(943, 'Update', 163, 25, 29, '2', '03021c4a785117d6', 28, '2019-08-13 20:48:14'),
(944, 'Update', 164, 25, 30, '3', '0303cc5b936003b9', 28, '2019-08-13 20:48:14'),
(945, 'Update', 165, 25, 31, '4', '0304092fbad4aaa8', 28, '2019-08-13 20:48:15'),
(946, 'Update', 166, 25, 32, '5', '0305d6c7edac0aa3', 28, '2019-08-13 20:48:15'),
(947, 'Update', 157, 24, 28, '1', '0301dfb79dc776df', 28, '2019-08-13 20:48:20'),
(948, 'Update', 158, 24, 29, '2', '030205b17c4210ac', 28, '2019-08-13 20:48:20'),
(949, 'Update', 159, 24, 30, '3', '0303de6003d43d9a', 28, '2019-08-13 20:48:20'),
(950, 'Update', 160, 24, 31, '4', '030467c5337bfda9', 28, '2019-08-13 20:48:20'),
(951, 'Update', 161, 24, 32, '5', '0305a2df0b384ed9', 28, '2019-08-13 20:48:20'),
(952, 'Update', 152, 23, 28, '1', '030172g05bcccc15', 28, '2019-08-13 20:48:31'),
(953, 'Update', 153, 23, 29, '2', '03025f4f2b7de121', 28, '2019-08-13 20:48:31'),
(954, 'Update', 154, 23, 30, '3', '03033061d775ad55', 28, '2019-08-13 20:48:32'),
(955, 'Update', 155, 23, 31, '4', '0304e6355db430b1', 28, '2019-08-13 20:48:32'),
(956, 'Update', 156, 23, 32, '5', '03057fccbf396b34', 28, '2019-08-13 20:48:32'),
(957, 'Update', 227, 38, 33, '1', '0301603072cf5701f1ca', 33, '2019-08-13 20:50:36'),
(958, 'Update', 228, 38, 34, '2', '03028137593d9cecfe34', 33, '2019-08-13 20:50:36'),
(959, 'Update', 229, 38, 35, '3', '0303d08a21c53d2c9676', 33, '2019-08-13 20:50:36'),
(960, 'Update', 230, 38, 36, '4', '03044c28cb653bc4ba8f', 33, '2019-08-13 20:50:37'),
(961, 'Update', 231, 38, 37, '5', '0305f712551e96b2697f', 33, '2019-08-13 20:50:37'),
(962, 'Update', 222, 37, 33, '1', '0301684319bdc82fa893', 33, '2019-08-13 20:50:58'),
(963, 'Update', 223, 37, 34, '2', '030278d65c44859f66be', 33, '2019-08-13 20:50:58'),
(964, 'Update', 224, 37, 35, '3', '03039d2c340fa7bdaab6', 33, '2019-08-13 20:50:58'),
(965, 'Update', 225, 37, 36, '4', '0304d747a21e2d89737b', 33, '2019-08-13 20:50:58'),
(966, 'Update', 226, 37, 37, '5', '03052526a5711803c20d', 33, '2019-08-13 20:50:58'),
(967, 'Update', 217, 36, 33, '1', '0301cfdd98bf04b58150', 33, '2019-08-13 20:51:12'),
(968, 'Update', 218, 36, 34, '2', '030283ee70d3eb2b67ae', 33, '2019-08-13 20:51:12'),
(969, 'Update', 219, 36, 35, '3', '03038aa8f5b521d2214d', 33, '2019-08-13 20:51:12'),
(970, 'Update', 220, 36, 36, '4', '0304e40b2565a9a8b02e', 33, '2019-08-13 20:51:12'),
(971, 'Update', 221, 36, 37, '5', '0305901802e481ae1251', 33, '2019-08-13 20:51:13'),
(972, 'Update', 212, 35, 33, '1', '03015154db6bg012340c', 33, '2019-08-13 20:51:24'),
(973, 'Update', 213, 35, 34, '2', '030211a18cf85acb5fdf', 33, '2019-08-13 20:51:24'),
(974, 'Update', 214, 35, 35, '3', '0303ae5b801e7f97f0aa', 33, '2019-08-13 20:51:24'),
(975, 'Update', 215, 35, 36, '4', '03042683b7e06e77e66e', 33, '2019-08-13 20:51:24'),
(976, 'Update', 216, 35, 37, '5', '03057b18303b276b412b', 33, '2019-08-13 20:51:24'),
(977, 'Update', 207, 34, 33, '1', '03010c09586c4bcdac46', 33, '2019-08-13 20:51:31'),
(978, 'Update', 208, 34, 34, '2', '0302ed09641cdceb1c7e', 33, '2019-08-13 20:51:31'),
(979, 'Update', 209, 34, 35, '3', '03030d75908a20c8c1da', 33, '2019-08-13 20:51:32'),
(980, 'Update', 210, 34, 36, '4', '03046f4cdcb519649959', 33, '2019-08-13 20:51:32'),
(981, 'Update', 211, 34, 37, '5', '0305118f479dc7c0a5fd', 33, '2019-08-13 20:51:32'),
(982, 'Update', 202, 33, 33, '1', '03017f23a4992088dc62', 33, '2019-08-13 20:53:09'),
(983, 'Update', 203, 33, 34, '2', '0302d19840b0d20b5369', 33, '2019-08-13 20:53:09'),
(984, 'Update', 204, 33, 35, '3', '030362d341be83f9d646', 33, '2019-08-13 20:53:09'),
(985, 'Update', 205, 33, 36, '4', '030433d4a7c3344f63fa', 33, '2019-08-13 20:53:10'),
(986, 'Update', 206, 33, 37, '5', '0305449b71bfe60ffc83', 33, '2019-08-13 20:53:10'),
(987, 'Update', 232, 39, 33, '1', '0301546ab5387fba2fd78b97', 34, '2019-08-13 20:54:19'),
(988, 'Update', 233, 39, 34, '2', '0302a6cc7ff4f83084a536d8', 34, '2019-08-13 20:54:19'),
(989, 'Update', 234, 39, 35, '3', '0303688acc9bd8c570d4752b', 34, '2019-08-13 20:54:20'),
(990, 'Update', 235, 39, 36, '4', '03049ba59b2e1f77f4634792', 34, '2019-08-13 20:54:20'),
(991, 'Update', 236, 40, 35, '1', '030170d9ff39cc91fc', 36, '2019-08-13 20:54:47'),
(992, 'Update', 237, 40, 36, '2', '0302912e6371a5ca38', 36, '2019-08-13 20:54:47'),
(993, 'Update', 238, 40, 37, '3', '0303d766a11bf5181d', 36, '2019-08-13 20:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_logtransaction`
--

CREATE TABLE `tb_logtransaction` (
  `idlogtransaction` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `idtransaction` int(11) NOT NULL,
  `transactioncode` varchar(100) NOT NULL,
  `idfile` int(11) NOT NULL,
  `iduser_req` int(11) NOT NULL,
  `date_req` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_logtransaction`
--

INSERT INTO `tb_logtransaction` (`idlogtransaction`, `note`, `idtransaction`, `transactioncode`, `idfile`, `iduser_req`, `date_req`, `updated_by`, `updated_at`) VALUES
(9, 'Create', 5, 'PO-20190501_11_19', 11, 19, '2019-05-01 21:24:57', 19, '2019-05-01 21:24:57'),
(10, 'Create', 6, 'PO-20190505_10_19', 10, 19, '2019-05-05 00:56:57', 19, '2019-05-05 00:56:57'),
(11, 'Create', 7, 'PO-20190505_6_40', 6, 40, '2019-05-05 01:05:14', 40, '2019-05-05 01:05:14'),
(12, 'Create', 8, 'PO-20190505_7_40', 7, 40, '2019-05-05 01:05:23', 40, '2019-05-05 01:05:23'),
(13, 'Create', 9, 'PO-20190505_8_43', 8, 43, '2019-05-05 01:07:02', 43, '2019-05-05 01:07:02'),
(14, 'Create', 10, 'PO-20190505_9_43', 9, 43, '2019-05-05 01:07:13', 43, '2019-05-05 01:07:13'),
(15, 'Create', 11, 'PO-20190508_12_19', 12, 19, '2019-05-08 23:30:39', 19, '2019-05-08 23:30:39'),
(16, 'Delete', 5, 'PO-20190501_11_19', 11, 19, '2019-05-01 21:24:57', 19, '2019-05-09 00:59:22'),
(17, 'Delete', 6, 'PO-20190505_10_19', 10, 19, '2019-05-05 00:56:57', 19, '2019-05-09 00:59:26'),
(18, 'Delete', 7, 'PO-20190505_6_40', 6, 40, '2019-05-05 01:05:14', 40, '2019-05-09 00:59:34'),
(19, 'Delete', 8, 'PO-20190505_7_40', 7, 40, '2019-05-05 01:05:23', 40, '2019-05-09 00:59:37'),
(20, 'Delete', 9, 'PO-20190505_8_43', 8, 43, '2019-05-05 01:07:02', 43, '2019-05-09 00:59:40'),
(21, 'Delete', 10, 'PO-20190505_9_43', 9, 43, '2019-05-05 01:07:13', 43, '2019-05-09 00:59:43'),
(22, 'Delete', 11, 'PO-20190508_12_19', 12, 19, '2019-05-08 23:30:39', 19, '2019-05-09 00:59:47'),
(23, 'Create', 12, 'PO-20190509_6_13', 6, 13, '2019-05-09 01:31:39', 13, '2019-05-09 01:31:39'),
(24, 'Create', 13, 'PO-20190509_12_13', 12, 13, '2019-05-09 01:47:57', 13, '2019-05-09 01:47:57'),
(25, 'Create', 14, 'PO-20190509_11_13', 11, 13, '2019-05-09 01:48:23', 13, '2019-05-09 01:48:23'),
(26, 'Delete', 12, 'PO-20190509_6_13', 6, 13, '2019-05-09 01:31:39', 13, '2019-05-11 02:21:08'),
(27, 'Delete', 13, 'PO-20190509_12_13', 12, 13, '2019-05-09 01:47:57', 13, '2019-05-11 02:21:08'),
(28, 'Delete', 14, 'PO-20190509_11_13', 11, 13, '2019-05-09 01:48:23', 13, '2019-05-11 02:21:08'),
(29, 'Create', 15, 'PO-20190511_13_19', 13, 19, '2019-05-11 03:06:24', 19, '2019-05-11 03:06:24'),
(30, 'Create', 16, 'PO-20190511_13_40', 13, 40, '2019-05-11 03:17:50', 40, '2019-05-11 03:17:50'),
(31, 'Create', 17, 'PO-20190512_13_14', 13, 14, '2019-05-12 17:41:47', 14, '2019-05-12 17:41:47'),
(32, 'Create', 18, 'PO-20190513_14_14', 14, 14, '2019-05-13 00:22:44', 14, '2019-05-13 00:22:44'),
(33, 'Create', 19, 'PO-20190513_13_15', 13, 15, '2019-05-13 02:24:33', 15, '2019-05-13 02:24:33'),
(34, 'Create', 20, 'PO-20190513_17_15', 17, 15, '2019-05-13 02:24:38', 15, '2019-05-13 02:24:38'),
(35, 'Create', 21, 'PO-20190513_20_15', 20, 15, '2019-05-13 02:24:41', 15, '2019-05-13 02:24:41'),
(36, 'Create', 22, 'PO-20190513_14_16', 14, 16, '2019-05-13 02:25:11', 16, '2019-05-13 02:25:11'),
(37, 'Create', 23, 'PO-20190513_16_16', 16, 16, '2019-05-13 02:25:12', 16, '2019-05-13 02:25:12'),
(38, 'Create', 24, 'PO-20190513_18_16', 18, 16, '2019-05-13 02:25:13', 16, '2019-05-13 02:25:13'),
(39, 'Create', 25, 'PO-20190513_21_16', 21, 16, '2019-05-13 02:25:15', 16, '2019-05-13 02:25:15'),
(40, 'Create', 26, 'PO-20190513_21_17', 21, 17, '2019-05-13 02:33:08', 17, '2019-05-13 02:33:08'),
(41, 'Create', 27, 'PO-20190513_18_17', 18, 17, '2019-05-13 02:33:11', 17, '2019-05-13 02:33:11'),
(42, 'Create', 28, 'PO-20190513_16_17', 16, 17, '2019-05-13 02:33:15', 17, '2019-05-13 02:33:15'),
(43, 'Create', 29, 'PO-20190513_14_17', 14, 17, '2019-05-13 02:33:19', 17, '2019-05-13 02:33:19'),
(44, 'Create', 30, 'PO-20190513_15_19', 15, 19, '2019-05-13 02:50:33', 19, '2019-05-13 02:50:33'),
(45, 'Create', 31, 'PO-20190513_17_19', 17, 19, '2019-05-13 02:50:36', 19, '2019-05-13 02:50:36'),
(46, 'Create', 32, 'PO-20190513_19_19', 19, 19, '2019-05-13 02:50:39', 19, '2019-05-13 02:50:39'),
(47, 'Create', 33, 'PO-20190514_23_19', 23, 19, '2019-05-14 22:46:35', 19, '2019-05-14 22:46:35'),
(48, 'Create', 34, 'PO-20190514_26_19', 26, 19, '2019-05-14 22:46:38', 19, '2019-05-14 22:46:38'),
(49, 'Create', 35, 'PO-20190514_29_19', 29, 19, '2019-05-14 22:46:40', 19, '2019-05-14 22:46:40'),
(50, 'Create', 36, 'PO-20190514_32_19', 32, 19, '2019-05-14 22:46:43', 19, '2019-05-14 22:46:43'),
(51, 'Create', 37, 'PO-20190514_23_40', 23, 40, '2019-05-14 22:47:21', 40, '2019-05-14 22:47:21'),
(52, 'Create', 38, 'PO-20190514_25_40', 25, 40, '2019-05-14 22:47:23', 40, '2019-05-14 22:47:23'),
(53, 'Create', 39, 'PO-20190514_27_40', 27, 40, '2019-05-14 22:47:26', 40, '2019-05-14 22:47:26'),
(54, 'Create', 40, 'PO-20190514_29_40', 29, 40, '2019-05-14 22:47:29', 40, '2019-05-14 22:47:29'),
(55, 'Create', 41, 'PO-20190514_31_40', 31, 40, '2019-05-14 22:47:32', 40, '2019-05-14 22:47:32'),
(56, 'Create', 42, 'PO-20190515_33_33', 33, 33, '2019-05-15 18:45:48', 33, '2019-05-15 18:45:48'),
(57, 'Create', 43, 'PO-20190614_15_33', 15, 33, '2019-06-14 17:39:25', 33, '2019-06-14 17:39:25'),
(58, 'Create', 44, 'PO-20190614_35_14', 35, 14, '2019-06-14 17:52:03', 14, '2019-06-14 17:52:03'),
(59, 'Delete', 44, 'PO-20190614_35_14', 35, 14, '2019-06-14 17:52:03', 14, '2019-06-22 13:31:18'),
(60, 'Create', 45, 'PO-20190622_25_14', 25, 14, '2019-06-22 14:26:17', 14, '2019-06-22 14:26:17'),
(61, 'Create', 46, 'PO-20190708_13_19', 13, 19, '2019-07-08 20:45:32', 19, '2019-07-08 20:45:32'),
(62, 'Create', 47, 'PO-20190719_33_33', 33, 33, '2019-07-19 20:13:20', 33, '2019-07-19 20:13:20'),
(63, 'Create', 48, 'PO-20190728_37_43', 37, 43, '2019-07-28 22:43:54', 43, '2019-07-28 22:43:54'),
(64, 'Create', 49, 'PO-20190802_38_19', 38, 19, '2019-08-02 14:20:48', 19, '2019-08-02 14:20:48'),
(65, 'Create', 50, 'PO-20190802_39_19', 39, 19, '2019-08-02 14:48:17', 19, '2019-08-02 14:48:17'),
(66, 'Create', 51, 'PO-20190802_39_33', 39, 33, '2019-08-02 22:38:44', 33, '2019-08-02 22:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `tb_loguser`
--

CREATE TABLE `tb_loguser` (
  `idloguser` int(11) NOT NULL,
  `note` varchar(10) NOT NULL,
  `iduser` int(11) NOT NULL,
  `email` varchar(99) NOT NULL,
  `username` varchar(33) NOT NULL,
  `encrypted_password` varchar(99) NOT NULL,
  `salt` varchar(11) NOT NULL,
  `info` varchar(10) NOT NULL,
  `idcompany` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_loguser`
--

INSERT INTO `tb_loguser` (`idloguser`, `note`, `iduser`, `email`, `username`, `encrypted_password`, `salt`, `info`, `idcompany`, `updated_by`, `updated_at`) VALUES
(57, 'Create', 12, 'dewi.sarfika@pertamina.com', 'Dewi Sarfika', '2muBVeS245qZdeJ2AW6nCiT7Zu1iMzVjMGNkMjk0Yw==', 'b35c0cd294c', 'Pending', 0, 0, '2019-04-17 00:20:39'),
(58, 'Update', 12, 'dewi.sarfika@pertamina.com', 'Dewi Sarfika', '2muBVeS245qZdeJ2AW6nCiT7Zu1iMzVjMGNkMjk0Yw==', 'b35c0cd294c', 'Active', 0, 0, '2019-04-17 00:20:39'),
(59, 'Update', 12, 'dewi.sarfika@pertamina.com', 'Dewi Sarfika', '2muBVeS245qZdeJ2AW6nCiT7Zu1iMzVjMGNkMjk0Yw==', 'b35c0cd294c', 'Active', 1, 0, '2019-04-17 00:20:39'),
(60, 'Create', 13, 'fransisca.dyah@pertamina.com', 'Fransisca Dyah', 'tOTwU6AfhdOaoMGwaYapkNXMa0E1NzUwZTU0ZjdhOA==', '5750e54f7a8', 'Pending', 6, 12, '2019-04-19 00:57:01'),
(61, 'Create', 14, 'gunawan.bayu@pertamina.com', 'Gunawan Bayu', 'cOeNkhDSagRX6J3rV9j8djByJWJjMTgwYmE3M2QxMw==', 'c180ba73d13', 'Pending', 7, 12, '2019-04-19 00:58:41'),
(62, 'Update', 13, 'fransisca.dyah@pertamina.com', 'Fransisca Dyah', 'YBg1Oi2DCnBI+qJgW9f9PgysxpdiMWM5NGI4NDFjOA==', 'b1c94b841c8', 'Active', 6, 12, '2019-04-19 00:59:08'),
(63, 'Update', 14, 'gunawan.bayu@pertamina.com', 'Gunawan Bayu', '3WdOH4ugobShRyXoJMrbTLN4Vo9mYzEyMDBjN2E3YQ==', 'fc1200c7a7a', 'Active', 7, 12, '2019-04-19 00:59:24'),
(64, 'Create', 15, 'arif.rachman@pertamina.com', 'Arif Rachman', 'NkJOMGuE16vYNfwj2LjuJcAy6KQ2YzU2MDM0ZWNmMw==', '6c56034ecf3', 'Pending', 7, 12, '2019-04-19 01:00:04'),
(65, 'Update', 15, 'arif.rachman@pertamina.com', 'Arif Rachman', 'CpOoxwEG81NM8Ymu469ac6VmcCdhYjM5ZWMyM2ZmNA==', 'ab39ec23ff4', 'Active', 7, 12, '2019-04-19 01:00:25'),
(66, 'Create', 16, 'deo.vrima@pertamina.com', 'Deo Vrima', 'TLRrYXdl6b5tmCt5TfzOlbAVDMIwYzdhMjU2ZWZmNA==', '0c7a256eff4', 'Pending', 7, 12, '2019-04-19 01:01:39'),
(67, 'Update', 16, 'deo.vrima@pertamina.com', 'Deo Vrima', 'wa3FwjM6dlt/mhlnOtzDu08Z6ERlYjg0MGNmNWY2NQ==', 'eb840cf5f65', 'Active', 7, 12, '2019-04-19 01:01:50'),
(68, 'Create', 17, 'donny.hesya@pertamina.com', 'Donny Hesya', 'QlS/Heav2gip/s8xfJNHlKnt+Pw1NGE4MzMxZjlkOA==', '54a8331f9d8', 'Pending', 7, 12, '2019-04-19 01:07:23'),
(69, 'Update', 17, 'donny.hesya@pertamina.com', 'Donny Hesya', 'Egs+P7kmaTYIT1L3HBAkQ+2pqhllYjI0OGMwNmQzMQ==', 'eb248c06d31', 'Active', 7, 12, '2019-04-19 01:08:23'),
(70, 'Create', 18, 'gunadi@pertamina.com', 'Gunadi', 'cx8o2FRufD9A5GsutGeCgRoTvuQ0NmRhZWEyNWY1YQ==', '46daea25f5a', 'Pending', 7, 12, '2019-04-19 01:09:07'),
(71, 'Update', 18, 'gunadi@pertamina.com', 'Gunadi', 'ZQifcHnzPsIMd55XBekZwrG1Pjc4YmNjMmRkZjAxZg==', '8bcc2ddf01f', 'Active', 7, 12, '2019-04-19 01:09:31'),
(72, 'Create', 19, 'zufrian.firliansyah@pertamina.com', 'Zufrian Firliansyah', 'HmGXmDGhYKkneBgJaq8NV/SWbP0xYjRhMzY0Zjc2ZQ==', '1b4a364f76e', 'Pending', 12, 12, '2019-04-19 01:10:51'),
(73, 'Update', 19, 'zufrian.firliansyah@pertamina.com', 'Zufrian Firliansyah', 'o5ES9SpvB7TTUgWFnrLd0ePchiY2NTlhYjFkNGZjNw==', '659ab1d4fc7', 'Active', 12, 12, '2019-04-19 01:11:06'),
(74, 'Create', 20, 'krisnanto.nugroho@pertamina.com', 'Krisnanto Nugroho', 'SyxtARGAIc6AhSQmLExLBMJjYSU4ZjNlYTM0YmQ5YQ==', '8f3ea34bd9a', 'Active', 1, 12, '2019-05-01 18:42:50'),
(75, 'Create', 21, 'yudha.nenggala@pertamina.com', 'Yudha Nenggala', 'xC8nJB/j69MWW5w4TOtTiB62UsUxMmFiY2QzZTg0Yg==', '12abcd3e84b', 'Active', 1, 12, '2019-05-01 18:43:13'),
(76, 'Create', 22, 'widyanti.nurmala@pertamina.com', 'Widyanti Nurmala', 'o3qFirpB5aYD+SPXJTqNRUo0HtsyNDk1YjJkNmRkYw==', '2495b2d6ddc', 'Active', 1, 12, '2019-05-01 18:43:32'),
(77, 'Create', 23, 'adri@pertamina.com', 'Adri', 'yb2D7BQYN+jOS8/bcIS/pic/qwYzMzg5Njg3ZDMzOA==', '3389687d338', 'Active', 1, 12, '2019-05-01 18:44:14'),
(78, 'Create', 24, 'yuninggar.dwi@pertamina.com', 'Yuninggar Dwi', '61AxAU1go+VBoYyAt1U+7+MCKlpjYmQzNGJlOTllMw==', 'cbd34be99e3', 'Active', 6, 12, '2019-05-01 18:45:58'),
(79, 'Create', 25, 'ifal.rahman@pertamina.com', 'Ifal Rahman', 'pkTh3rh++1X0IGP/vaxUHiywL4k5ZjNiZGJmNjA1Mg==', '9f3bdbf6052', 'Active', 6, 12, '2019-05-01 18:46:24'),
(80, 'Create', 26, 'hanusa.sanabakti@pertamina.com', 'Hanusa Sanabakti', 'xrnGhWJzrjG+pu4C96AIuYKakbo1Nzk0ZjkxZGM2MA==', '5794f91dc60', 'Active', 6, 12, '2019-05-01 18:46:50'),
(81, 'Create', 27, 'henny.sipahutar@pertamina.com', 'Henny Sipahutar', 'b9z7wQ3YWrqJN3YBlDDL6mAedpAyM2M0ZTY2N2JkZQ==', '23c4e667bde', 'Active', 6, 12, '2019-05-01 18:47:39'),
(82, 'Create', 28, 'irfan.aziz@pertamina.com', 'Irfan Aziz', '5OmzMhN6rsFnuxlB8FDdeWxlsRpkOGU3MzIyYWUzMQ==', 'd8e7322ae31', 'Active', 8, 12, '2019-05-01 18:48:31'),
(83, 'Create', 29, 'jumardi.sudirman@pertamina.com', 'Jumardi Sudirman', 'iQnqLOEuAzduk8FZN2u1g+5rOR0zOWE3ZTQyY2QwYg==', '39a7e42cd0b', 'Active', 8, 12, '2019-05-01 18:48:55'),
(84, 'Create', 30, 'lamijan@pertamina.com', 'Lamijan', 'Up424W1MUbygnlnXrvY3hE/W+YpkOTM3ZWY4ZjgzNw==', 'd937ef8f837', 'Active', 8, 12, '2019-05-01 18:49:48'),
(85, 'Create', 31, 'lingga.galih@pertamina.com', 'Lingga Galih', '9QaZf+8cSn1YKJy3j3xWlT0Q0bVlMzBjZTlhNzE2MQ==', 'e30ce9a7161', 'Active', 8, 12, '2019-05-01 18:50:18'),
(86, 'Create', 32, 'mohammad.kafi@pertamina.com', 'Mohammad Kafi', 'TBDhrD9zx1xRfZRpYy7NLjTpTABlMWY4ZTkwZjE0Yw==', 'e1f8e90f14c', 'Active', 8, 12, '2019-05-01 18:50:49'),
(87, 'Create', 33, 'mulyono@pertamina.com', 'Mulyono', 'GgyZLteUrcC9gFgALUexS5shf41iMDgzNmQ5YTY1OA==', 'b0836d9a658', 'Active', 9, 12, '2019-05-01 18:53:36'),
(88, 'Create', 34, 'nabilah.dwi@pertamina.com', 'Nabilah Dwi', 'RF55v3qs+F7T01kqon8zRH3GYRk2MDlmZDZjYmEzYw==', '609fd6cba3c', 'Active', 9, 12, '2019-05-01 18:54:05'),
(89, 'Create', 35, 'rahayu.winarni@pertamina.com', 'Rahayu Winarni', 'Dz3PKnJnOAtyw16sySyj0+PMm6Q0YWZjMjc3M2ExZg==', '4afc2773a1f', 'Active', 9, 12, '2019-05-01 18:54:55'),
(90, 'Create', 36, 'reza.muhammad@pertamina.com', 'Reza Muhammad', '0BLLF8kcabi5JSpQMlZkXok62n5lZWY1MTI4ODM3Mw==', 'eef51288373', 'Active', 9, 12, '2019-05-01 18:55:34'),
(91, 'Create', 37, 'rian.antoni@pertamina.com', 'Rian Antoni', 'bUdTCjxy4AHvJY4DRg92kDUMQYw4YjFjM2FhMDIzNA==', '8b1c3aa0234', 'Active', 8, 12, '2019-05-01 18:56:15'),
(92, 'Create', 38, 'adhityawarman@pertamina.com', 'Adhityawarman', '6aTb7OZTgElRHjStM2JZhj4iTZ04ZDJjYzI0YmE2Ng==', '8d2cc24ba66', 'Active', 12, 12, '2019-05-01 18:59:04'),
(93, 'Delete', 26, 'hanusa.sanabakti@pertamina.com', 'Hanusa Sanabakti', 'xrnGhWJzrjG+pu4C96AIuYKakbo1Nzk0ZjkxZGM2MA==', '5794f91dc60', 'Active', 6, 12, '2019-05-01 18:59:34'),
(94, 'Delete', 27, 'henny.sipahutar@pertamina.com', 'Henny Sipahutar', 'b9z7wQ3YWrqJN3YBlDDL6mAedpAyM2M0ZTY2N2JkZQ==', '23c4e667bde', 'Active', 6, 12, '2019-05-01 18:59:39'),
(95, 'Delete', 22, 'widyanti.nurmala@pertamina.com', 'Widyanti Nurmala', 'o3qFirpB5aYD+SPXJTqNRUo0HtsyNDk1YjJkNmRkYw==', '2495b2d6ddc', 'Active', 1, 12, '2019-05-01 19:00:02'),
(96, 'Delete', 23, 'adri@pertamina.com', 'Adri', 'yb2D7BQYN+jOS8/bcIS/pic/qwYzMzg5Njg3ZDMzOA==', '3389687d338', 'Active', 1, 12, '2019-05-01 19:00:10'),
(97, 'Create', 39, 'agus.pratikno@pertamina.com', 'Agus Pratikno', 'QC6h58rzyOTiFCVgBZog+fcIwkgzMTNhYzliYjQzYQ==', '313ac9bb43a', 'Active', 12, 12, '2019-05-01 19:01:07'),
(98, 'Create', 40, 'angga.arista.putra@pertamina.com', 'Angga Arista Putra', 'U8z5Td8Q6DGjvqw+Q0vFBk99+TplYTE2MjAxOWQ2MQ==', 'ea162019d61', 'Active', 13, 12, '2019-05-01 19:01:31'),
(99, 'Create', 41, 'ferizal.arifin@pertamina.com', 'Ferizal Arifin', 'PTJlfwh6VEd9thJW8/EvuLDGJcY2M2ViYmMzZGNkOA==', '63ebbc3dcd8', 'Active', 13, 12, '2019-05-01 19:02:29'),
(100, 'Create', 42, 'yogi.dwiarto@pertamina.com', 'Yogi Dwiarto', '/Cfgsk8uryOE+idhHmAC/PvDHDcwNWE1M2UzNjk2ZQ==', '05a53e3696e', 'Active', 13, 12, '2019-05-01 19:02:56'),
(101, 'Create', 43, 'dodi.alian@pertamina.com', 'Dodi Alian', '8ekqA4IH0bRQ4EwoPiMfgt0uaz5jNzQxMGI0MjhiZA==', 'c7410b428bd', 'Active', 16, 12, '2019-05-01 19:03:27'),
(102, 'Create', 44, 'eko.budiono@pertamina.com', 'Eko Budiono', 'X1i+63bCq9GYsckinoPgYg/mMP8yYzk5NWQwOTdhOA==', '2c995d097a8', 'Active', 16, 12, '2019-05-01 19:03:48'),
(103, 'Create', 45, 'hendra.ferdian@pertamina.com', 'Hendra Ferdian', 'mAxdf/KhPK+VKuQySR92TSZi7VU2ODdmOGQ1NjcyNA==', '687f8d56724', 'Active', 16, 12, '2019-05-01 19:04:09'),
(104, 'Update', 37, 'rian.antoni@pertamina.com', 'Rian Antoni', 'rT9AE7rT1alrgDuulDA2xdQ8i9gwM2IxOTIyYjI2Zg==', '03b1922b26f', 'Active', 9, 12, '2019-05-01 19:45:04'),
(105, 'Update', 14, 'gunawan.bayu@pertamina.com', 'Gunawan Bayu', 'ichguQzt5WnknhL45a/7WooQyOcxYzEyM2JlYmI2Ng==', '1c123bebb66', 'Active', 7, 14, '2019-05-14 02:22:44'),
(106, 'Update', 14, 'gunawan.bayu1@pertamina.com', 'Gunawan Bayu', 'z2Ukbc5jhc8F8E4Uwpzd76pArls5ZDc5OGI5MmI3Mw==', '9d798b92b73', 'Active', 7, 14, '2019-05-14 02:24:12'),
(107, 'Update', 14, 'gunawan.bayu@pertamina.com', 'Gunawan Bayu', 'T9wWmahHlD+A5j6t0Eaqglnlxx5iMWI5ODY5OTAzMw==', 'b1b98699033', 'Active', 7, 14, '2019-05-14 02:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_recoversss`
--

CREATE TABLE `tb_recoversss` (
  `id` int(11) NOT NULL,
  `idfile` int(11) NOT NULL,
  `char_no` varchar(10) NOT NULL,
  `r_dec` varchar(10) NOT NULL,
  `r_koef` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_recoversss`
--

INSERT INTO `tb_recoversss` (`id`, `idfile`, `char_no`, `r_dec`, `r_koef`) VALUES
(24078, 13, '1', '143', '3'),
(24079, 13, '1', '78', '254'),
(24080, 13, '1', '165', '1'),
(24081, 13, '2', '245', '3'),
(24082, 13, '2', '149', '254'),
(24083, 13, '2', '86', '1'),
(24084, 13, '3', '235', '3'),
(24085, 13, '3', '149', '254'),
(24086, 13, '3', '109', '1'),
(24087, 13, '4', '130', '3'),
(24088, 13, '4', '63', '254'),
(24089, 13, '4', '153', '1'),
(24090, 13, '5', '46', '3'),
(24091, 13, '5', '209', '254'),
(24092, 13, '5', '94', '1'),
(24093, 13, '6', '101', '3'),
(24094, 13, '6', '56', '254'),
(24095, 13, '6', '219', '1'),
(24096, 13, '7', '206', '3'),
(24097, 13, '7', '165', '254'),
(24098, 13, '7', '244', '1'),
(24099, 13, '8', '194', '3'),
(24100, 13, '8', '195', '254'),
(24101, 13, '8', '52', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_recovery`
--

CREATE TABLE `tb_recovery` (
  `idrecovery` int(11) NOT NULL,
  `idtransaction` int(11) NOT NULL,
  `iduser_recovery` int(11) NOT NULL,
  `numberofrecovery` varchar(11) NOT NULL,
  `kunci_recovery` varchar(65000) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_recovery`
--

INSERT INTO `tb_recovery` (`idrecovery`, `idtransaction`, `iduser_recovery`, `numberofrecovery`, `kunci_recovery`, `iduser_by`, `date_at`) VALUES
(12, 15, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:36:36'),
(13, 15, 15, '2', '03023022533298138a837e2d14e7d29166dcfc51fd9d7f', 15, '2019-05-11 04:08:26'),
(14, 15, 16, '3', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 02:28:10'),
(15, 15, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:02:46'),
(16, 17, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:37:46'),
(17, 17, 16, '2', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 01:58:40'),
(18, 17, 18, '3', '0305b27caf96f07877e56c3727eeb4405042ea8607844f', 18, '2019-05-13 01:57:10'),
(19, 18, 18, '1', '03059b3d32d38bb61f7f2316d831f1e5d10bcaa5647009', 18, '2019-05-13 02:51:49'),
(20, 18, 16, '2', '030344a9942f6ff01abf246031986f6bd4bd5b18e87fc6', 16, '2019-05-13 00:24:02'),
(21, 18, 17, '3', '030462cb40b4b600642ea9010eb3fdcc7d6acf81c39cab', 17, '2019-05-13 02:03:04'),
(22, 17, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:03:33'),
(23, 16, 16, '1', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 02:28:36'),
(24, 21, 16, '1', '0303b728655d1303956a33d16e5ea36b80f24d9f150e85', 16, '2019-05-13 02:29:16'),
(25, 16, 17, '2', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:30:48'),
(26, 20, 17, '1', '03046e6361c6e6c079bc7198bca5a06bb8509128ef973b', 17, '2019-05-13 02:31:03'),
(27, 23, 17, '1', '0304b4g001304469a32977cf6258f197c41ad53cb7dfa9', 17, '2019-05-13 02:31:23'),
(28, 22, 17, '1', '0304309e1bba20dbbea992e2e2g031463ea69ab151547f', 17, '2019-05-13 02:32:37'),
(29, 29, 17, '1', '0304309e1bba20dbbea992e2e2g031463ea69ab151547f', 17, '2019-05-13 02:34:48'),
(30, 28, 17, '1', '0304b4g001304469a32977cf6258f197c41ad53cb7dfa9', 17, '2019-05-13 02:35:04'),
(31, 27, 17, '1', '03046cf0014652f87ab1fba5ea3ab1a0e35e1009c03293', 17, '2019-05-13 02:35:45'),
(32, 18, 14, '4', '0301472cf8278bd926d2', 14, '2019-08-13 20:38:05'),
(33, 18, 15, '5', '0302e5ed0ecae9df5f784ce9017f4b41de31ee9385cde0', 15, '2019-05-13 02:51:21'),
(34, 15, 18, '5', '0305b27caf96f07877e56c3727eeb4405042ea8607844f', 18, '2019-05-13 02:57:26'),
(36, 42, 34, '2', '0302c47b0a2b8bfc2f5d5546426dc09d63eb474cb21c0a', 34, '2019-06-14 17:41:04'),
(37, 42, 35, '3', '030389e1610106fbecfab25abc5520f3f7b8f2b4f7602f', 35, '2019-06-14 17:42:05'),
(38, 42, 33, '3', '03014b25d01639cae47b4733', 33, '2019-08-02 19:43:55'),
(39, 47, 33, '1', '03014b25d01639cae47b4733', 33, '2019-08-02 19:44:14'),
(40, 48, 33, '1', '03017540150ea38a79cfaaaa', 33, '2019-08-02 19:44:31'),
(41, 48, 34, '2', '0302c6cc1275d62a72227169', 34, '2019-08-02 19:54:40'),
(42, 48, 35, '3', '0303d337cfd6cee4b4g043b0643b4d1d8dc441d6541344', 35, '2019-07-28 22:48:13'),
(43, 48, 36, '4', '0304351af66e353907c79396', 36, '2019-08-02 19:41:26'),
(44, 49, 33, '1', '0301c53f754ce410fee7c66f', 33, '2019-08-02 19:44:47'),
(45, 49, 34, '2', '0302450ce16fa820d15bde2d', 34, '2019-08-02 19:54:54'),
(46, 49, 35, '3', '030352a0c1169b', 35, '2019-08-02 14:25:38'),
(47, 16, 14, '3', '03018ff5eb822e65cec2', 14, '2019-08-13 20:37:27'),
(48, 27, 14, '2', '0301817037b2f5288e71', 14, '2019-08-13 20:43:10'),
(49, 30, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:43:03'),
(50, 32, 14, '1', '03017748cd841d527a87', 14, '2019-08-13 20:44:34'),
(51, 42, 36, '4', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:41:40'),
(52, 49, 36, '4', '03044c28cb653bc4ba8f', 36, '2019-08-13 21:03:59'),
(53, 50, 36, '1', '03044b47286779421f3c47c0e5', 36, '2019-08-02 19:42:12'),
(54, 47, 36, '2', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:42:39'),
(55, 50, 33, '2', '0301c53352399984d94d82307d', 33, '2019-08-02 19:45:03'),
(56, 47, 34, '3', '0302db011303b7e5f55b782b', 34, '2019-08-02 19:54:26'),
(57, 50, 34, '3', '0302067543d4d50a7204b2a5ee', 34, '2019-08-02 19:55:07'),
(58, 51, 33, '1', '0301c53352399984d94d82307d', 33, '2019-08-03 00:28:53'),
(59, 19, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:38:24'),
(60, 20, 14, '2', '030131d9fbcb0152f24a', 14, '2019-08-13 20:38:49'),
(61, 21, 14, '2', '0301e1481c3398f50ec8', 14, '2019-08-13 20:39:04'),
(62, 22, 14, '2', '0301472cf8278bd926d2', 14, '2019-08-13 20:39:21'),
(63, 23, 14, '2', '03018f70f4b5123dcfea', 14, '2019-08-13 20:39:43'),
(64, 46, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:42:53'),
(65, 43, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:42:56'),
(66, 31, 14, '1', '030131d9fbcb0152f24a', 14, '2019-08-13 20:43:01'),
(67, 29, 14, '2', '0301472cf8278bd926d2', 14, '2019-08-13 20:43:05'),
(68, 25, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:43:14'),
(69, 24, 14, '1', '0301817037b2f5288e71', 14, '2019-08-13 20:43:17'),
(70, 26, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:44:30'),
(71, 28, 14, '2', '03018f70f4b5123dcfea', 14, '2019-08-13 20:44:32');

--
-- Triggers `tb_recovery`
--
DELIMITER $$
CREATE TRIGGER `after_create-recovery` AFTER INSERT ON `tb_recovery` FOR EACH ROW BEGIN
	INSERT INTO tb_logrecovery SET
    note 			= "Create",
    idrecovery 		= new.idrecovery,
    idtransaction	= new.idtransaction,
    iduser_recovery	= new.iduser_recovery,
    numberofrecovery= new.numberofrecovery,
    kunci_recovery 	= new.kunci_recovery,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-recovery` AFTER DELETE ON `tb_recovery` FOR EACH ROW BEGIN
	INSERT INTO tb_logrecovery SET
    note 			= "Delete",
    idrecovery 		= old.idrecovery,
    idtransaction	= old.idtransaction,
    iduser_recovery	= old.iduser_recovery,
    numberofrecovery= old.numberofrecovery,
    kunci_recovery 	= old.kunci_recovery,
    updated_by		= old.iduser_by,
    updated_at		= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-recovery` AFTER UPDATE ON `tb_recovery` FOR EACH ROW BEGIN
	INSERT INTO tb_logrecovery SET
    note 			= "Update",
    idrecovery 		= new.idrecovery,
    idtransaction	= new.idtransaction,
    iduser_recovery	= new.iduser_recovery,
    numberofrecovery= new.numberofrecovery,
    kunci_recovery 	= new.kunci_recovery,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_share`
--

CREATE TABLE `tb_share` (
  `idshare` int(11) NOT NULL,
  `idfile` int(11) NOT NULL,
  `iduser_share` int(11) NOT NULL,
  `numberofshare` varchar(11) NOT NULL,
  `kunci` varchar(65000) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_share`
--

INSERT INTO `tb_share` (`idshare`, `idfile`, `iduser_share`, `numberofshare`, `kunci`, `iduser_by`, `date_at`) VALUES
(102, 13, 14, '1', '03018ff5eb822e65cec2', 14, '2019-08-13 20:33:40'),
(103, 13, 15, '2', '03024e95953fd138a5c3', 14, '2019-08-13 20:33:40'),
(104, 13, 16, '3', '0303a5566d995edbf434', 14, '2019-08-13 20:33:40'),
(105, 13, 17, '4', '03049338738fd74cba16', 14, '2019-08-13 20:33:40'),
(106, 13, 18, '5', '0305183ba7213a8df869', 14, '2019-08-13 20:33:41'),
(107, 14, 14, '1', '0301472cf8278bd926d2', 14, '2019-08-13 20:33:56'),
(108, 14, 15, '2', '030224c7e19562692328', 14, '2019-08-13 20:33:56'),
(109, 14, 16, '3', '0303ff4429aafd126536', 14, '2019-08-13 20:33:57'),
(110, 14, 17, '4', '0304d6a5d2665ad5ecfc', 14, '2019-08-13 20:33:57'),
(111, 14, 18, '5', '0305aae9daca7bb0b778', 14, '2019-08-13 20:33:57'),
(112, 15, 14, '1', '03013de25cfc919ca24a', 14, '2019-08-13 20:34:07'),
(113, 15, 15, '2', '03024cdbe838c178d38f', 14, '2019-08-13 20:34:07'),
(114, 15, 16, '3', '03039460101706f60001', 14, '2019-08-13 20:34:07'),
(115, 15, 17, '4', '03041472d79962142ba2', 14, '2019-08-13 20:34:07'),
(116, 15, 18, '5', '0305ce103abdd4d55370', 14, '2019-08-13 20:34:07'),
(117, 16, 14, '1', '03018f70f4b5123dcfea', 14, '2019-08-13 20:34:17'),
(118, 16, 15, '2', '0302c35ba6dc9733b2e9', 14, '2019-08-13 20:34:17'),
(119, 16, 16, '3', '0303023685d604431731', 14, '2019-08-13 20:34:17'),
(120, 16, 17, '4', '03044e0191a35b6dg0c4', 14, '2019-08-13 20:34:17'),
(121, 16, 18, '5', '0305a6bdca439bb16aa0', 14, '2019-08-13 20:34:17'),
(122, 17, 14, '1', '030131d9fbcb0152f24a', 14, '2019-08-13 20:34:30'),
(123, 17, 15, '2', '030269181aad1dc1c4c7', 14, '2019-08-13 20:34:30'),
(124, 17, 16, '3', '03030e34ce07cbade5ab', 14, '2019-08-13 20:34:30'),
(125, 17, 17, '4', '0304212c14db091654f7', 14, '2019-08-13 20:34:30'),
(126, 17, 18, '5', '0305a200ef26dafe12aa', 14, '2019-08-13 20:34:31'),
(127, 18, 14, '1', '0301817037b2f5288e71', 14, '2019-08-13 20:34:39'),
(128, 18, 15, '2', '0302d1f63fec4523003f', 14, '2019-08-13 20:34:39'),
(129, 18, 16, '3', '03035605860e6952c6a1', 14, '2019-08-13 20:34:39'),
(130, 18, 17, '4', '030411a00b1a60b5de96', 14, '2019-08-13 20:34:40'),
(131, 18, 18, '5', '030502c5d00f2a4b481e', 14, '2019-08-13 20:34:40'),
(132, 19, 14, '1', '03017748cd841d527a87', 14, '2019-08-13 20:34:50'),
(133, 19, 15, '2', '0302afdf9eeba557c5ba', 14, '2019-08-13 20:34:50'),
(134, 19, 16, '3', '03030e38e2950d704ed0', 14, '2019-08-13 20:34:50'),
(135, 19, 17, '4', '030496559883579d16c9', 14, '2019-08-13 20:34:50'),
(136, 19, 18, '5', '03054535c1b582de1da5', 14, '2019-08-13 20:34:50'),
(137, 20, 14, '1', '0301e1481c3398f50ec8', 14, '2019-08-13 20:35:01'),
(138, 20, 15, '2', '03025165d42665f3e81f', 14, '2019-08-13 20:35:01'),
(139, 20, 16, '3', '0303b9cc943adf5bfa3f', 14, '2019-08-13 20:35:01'),
(140, 20, 17, '4', '0304177c5d6f042e4427', 14, '2019-08-13 20:35:02'),
(141, 20, 18, '5', '03056d762fc5d76cc8d8', 14, '2019-08-13 20:35:02'),
(142, 21, 14, '1', '030163d0bfb26dd4aabd', 14, '2019-08-13 20:35:10'),
(143, 21, 15, '2', '0302bdd191a7396c0835', 14, '2019-08-13 20:35:10'),
(144, 21, 16, '3', '03037478e540dc2a8aa3', 14, '2019-08-13 20:35:10'),
(145, 21, 17, '4', '030489c6ba7e540e2e05', 14, '2019-08-13 20:35:10'),
(146, 21, 18, '5', '0305fcba1060a318f65d', 14, '2019-08-13 20:35:10'),
(147, 22, 14, '1', '03016e370f207e861a50d6', 14, '2019-08-13 20:35:19'),
(148, 22, 15, '2', '0302fa7e6abf44ca0f725e', 14, '2019-08-13 20:35:19'),
(149, 22, 16, '3', '030309497e3cca2c4d97ca', 14, '2019-08-13 20:35:19'),
(150, 22, 17, '4', '03049e994b990eaed4bf18', 14, '2019-08-13 20:35:19'),
(151, 22, 18, '5', '0305b76dd2d5124ea3ea4a', 14, '2019-08-13 20:35:19'),
(152, 23, 28, '1', '030172g05bcccc15', 28, '2019-08-13 20:48:31'),
(153, 23, 29, '2', '03025f4f2b7de121', 28, '2019-08-13 20:48:31'),
(154, 23, 30, '3', '03033061d775ad55', 28, '2019-08-13 20:48:32'),
(155, 23, 31, '4', '0304e6355db430b1', 28, '2019-08-13 20:48:32'),
(156, 23, 32, '5', '03057fccbf396b34', 28, '2019-08-13 20:48:32'),
(157, 24, 28, '1', '0301dfb79dc776df', 28, '2019-08-13 20:48:20'),
(158, 24, 29, '2', '030205b17c4210ac', 28, '2019-08-13 20:48:20'),
(159, 24, 30, '3', '0303de6003d43d9a', 28, '2019-08-13 20:48:20'),
(160, 24, 31, '4', '030467c5337bfda9', 28, '2019-08-13 20:48:20'),
(161, 24, 32, '5', '0305a2df0b384ed9', 28, '2019-08-13 20:48:20'),
(162, 25, 28, '1', '0301fcfd69a7e6ff', 28, '2019-08-13 20:48:14'),
(163, 25, 29, '2', '03021c4a785117d6', 28, '2019-08-13 20:48:14'),
(164, 25, 30, '3', '0303cc5b936003b9', 28, '2019-08-13 20:48:14'),
(165, 25, 31, '4', '0304092fbad4aaa8', 28, '2019-08-13 20:48:15'),
(166, 25, 32, '5', '0305d6c7edac0aa3', 28, '2019-08-13 20:48:15'),
(167, 26, 28, '1', '0301b6310f6c1fbb', 28, '2019-08-13 20:48:07'),
(168, 26, 29, '2', '03022b634f993ba4', 28, '2019-08-13 20:48:07'),
(169, 26, 30, '3', '0303ca0725e8c2f0', 28, '2019-08-13 20:48:07'),
(170, 26, 31, '4', '0304911e9258b39e', 28, '2019-08-13 20:48:08'),
(171, 26, 32, '5', '030581a895eb0eaf', 28, '2019-08-13 20:48:08'),
(172, 27, 28, '1', '030167e886c17b57', 28, '2019-08-13 20:48:00'),
(173, 27, 29, '2', '03027bac27cfe5e6', 28, '2019-08-13 20:48:00'),
(174, 27, 30, '3', '0303a5bf4a8babe1', 28, '2019-08-13 20:48:00'),
(175, 27, 31, '4', '0304e520eff6ce48', 28, '2019-08-13 20:48:00'),
(176, 27, 32, '5', '03053ad1140e4d1c', 28, '2019-08-13 20:48:00'),
(177, 28, 28, '1', '030173c475246c1f', 28, '2019-08-13 20:47:53'),
(178, 28, 29, '2', '03028d2c3e3242cf', 28, '2019-08-13 20:47:53'),
(179, 28, 30, '3', '0303b7acc28bf144', 28, '2019-08-13 20:47:53'),
(180, 28, 31, '4', '0304f142g02e7780', 28, '2019-08-13 20:47:53'),
(181, 28, 32, '5', '03053af0f81cd682', 28, '2019-08-13 20:47:54'),
(182, 29, 28, '1', '030107ca62dadc16', 28, '2019-08-13 20:47:42'),
(183, 29, 29, '2', '0302025713g0ef1c', 28, '2019-08-13 20:47:42'),
(184, 29, 30, '3', '03035a1a7ad3a749', 28, '2019-08-13 20:47:42'),
(185, 29, 31, '4', '03040e139653049d', 28, '2019-08-13 20:47:42'),
(186, 29, 32, '5', '03051f4267810717', 28, '2019-08-13 20:47:42'),
(187, 30, 28, '1', '0301be967708g0dd', 28, '2019-08-13 20:47:34'),
(188, 30, 29, '2', '03028097c3cf2996', 28, '2019-08-13 20:47:34'),
(189, 30, 30, '3', '0303b07549b4ec64', 28, '2019-08-13 20:47:34'),
(190, 30, 31, '4', '03044d300ab84647', 28, '2019-08-13 20:47:34'),
(191, 30, 32, '5', '030558c906db393f', 28, '2019-08-13 20:47:34'),
(192, 31, 28, '1', '0301d55630376da2', 28, '2019-08-13 20:47:27'),
(193, 31, 29, '2', '0302b45319f26159', 28, '2019-08-13 20:47:27'),
(194, 31, 30, '3', '0303066921904a5f', 28, '2019-08-13 20:47:27'),
(195, 31, 31, '4', '0304cd98481228b4', 28, '2019-08-13 20:47:27'),
(196, 31, 32, '5', '030506e08e79fc57', 28, '2019-08-13 20:47:27'),
(197, 32, 28, '1', '0301ec799005c853b1', 28, '2019-08-13 20:47:10'),
(198, 32, 29, '2', '0302aaebf114e3a02d', 28, '2019-08-13 20:47:10'),
(199, 32, 30, '3', '0303a4c7888ebf17a6', 28, '2019-08-13 20:47:10'),
(200, 32, 31, '4', '0304da0d56725cba1a', 28, '2019-08-13 20:47:10'),
(201, 32, 32, '5', '03054bbf5bc1bb878b', 28, '2019-08-13 20:47:10'),
(202, 33, 33, '1', '03017f23a4992088dc62', 33, '2019-08-13 20:53:09'),
(203, 33, 34, '2', '0302d19840b0d20b5369', 33, '2019-08-13 20:53:09'),
(204, 33, 35, '3', '030362d341be83f9d646', 33, '2019-08-13 20:53:09'),
(205, 33, 36, '4', '030433d4a7c3344f63fa', 33, '2019-08-13 20:53:10'),
(206, 33, 37, '5', '0305449b71bfe60ffc83', 33, '2019-08-13 20:53:10'),
(207, 34, 33, '1', '03010c09586c4bcdac46', 33, '2019-08-13 20:51:31'),
(208, 34, 34, '2', '0302ed09641cdceb1c7e', 33, '2019-08-13 20:51:31'),
(209, 34, 35, '3', '03030d75908a20c8c1da', 33, '2019-08-13 20:51:32'),
(210, 34, 36, '4', '03046f4cdcb519649959', 33, '2019-08-13 20:51:32'),
(211, 34, 37, '5', '0305118f479dc7c0a5fd', 33, '2019-08-13 20:51:32'),
(212, 35, 33, '1', '03015154db6bg012340c', 33, '2019-08-13 20:51:24'),
(213, 35, 34, '2', '030211a18cf85acb5fdf', 33, '2019-08-13 20:51:24'),
(214, 35, 35, '3', '0303ae5b801e7f97f0aa', 33, '2019-08-13 20:51:24'),
(215, 35, 36, '4', '03042683b7e06e77e66e', 33, '2019-08-13 20:51:24'),
(216, 35, 37, '5', '03057b18303b276b412b', 33, '2019-08-13 20:51:24'),
(217, 36, 33, '1', '0301cfdd98bf04b58150', 33, '2019-08-13 20:51:12'),
(218, 36, 34, '2', '030283ee70d3eb2b67ae', 33, '2019-08-13 20:51:12'),
(219, 36, 35, '3', '03038aa8f5b521d2214d', 33, '2019-08-13 20:51:12'),
(220, 36, 36, '4', '0304e40b2565a9a8b02e', 33, '2019-08-13 20:51:12'),
(221, 36, 37, '5', '0305901802e481ae1251', 33, '2019-08-13 20:51:13'),
(222, 37, 33, '1', '0301684319bdc82fa893', 33, '2019-08-13 20:50:58'),
(223, 37, 34, '2', '030278d65c44859f66be', 33, '2019-08-13 20:50:58'),
(224, 37, 35, '3', '03039d2c340fa7bdaab6', 33, '2019-08-13 20:50:58'),
(225, 37, 36, '4', '0304d747a21e2d89737b', 33, '2019-08-13 20:50:58'),
(226, 37, 37, '5', '03052526a5711803c20d', 33, '2019-08-13 20:50:58'),
(227, 38, 33, '1', '0301603072cf5701f1ca', 33, '2019-08-13 20:50:36'),
(228, 38, 34, '2', '03028137593d9cecfe34', 33, '2019-08-13 20:50:36'),
(229, 38, 35, '3', '0303d08a21c53d2c9676', 33, '2019-08-13 20:50:36'),
(230, 38, 36, '4', '03044c28cb653bc4ba8f', 33, '2019-08-13 20:50:37'),
(231, 38, 37, '5', '0305f712551e96b2697f', 33, '2019-08-13 20:50:37'),
(232, 39, 33, '1', '0301546ab5387fba2fd78b97', 34, '2019-08-13 20:54:19'),
(233, 39, 34, '2', '0302a6cc7ff4f83084a536d8', 34, '2019-08-13 20:54:19'),
(234, 39, 35, '3', '0303688acc9bd8c570d4752b', 34, '2019-08-13 20:54:20'),
(235, 39, 36, '4', '03049ba59b2e1f77f4634792', 34, '2019-08-13 20:54:20'),
(236, 40, 35, '1', '030170d9ff39cc91fc', 36, '2019-08-13 20:54:47'),
(237, 40, 36, '2', '0302912e6371a5ca38', 36, '2019-08-13 20:54:47'),
(238, 40, 37, '3', '0303d766a11bf5181d', 36, '2019-08-13 20:54:48');

--
-- Triggers `tb_share`
--
DELIMITER $$
CREATE TRIGGER `after_create-share` AFTER INSERT ON `tb_share` FOR EACH ROW BEGIN
	INSERT INTO tb_logshare SET
    note 			= "Create",
    idshare 		= new.idshare,
    idfile			= new.idfile,
    iduser_share	= new.iduser_share,
    numberofshare	= new.numberofshare,
    kunci 			= new.kunci,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-share` AFTER DELETE ON `tb_share` FOR EACH ROW BEGIN
	INSERT INTO tb_logshare SET
    note 			= "Delete",
    idshare 		= old.idshare,
    idfile			= old.idfile,
    iduser_share	= old.iduser_share,
    numberofshare	= old.numberofshare,
    kunci 			= old.kunci,
    updated_by		= old.iduser_by,
    updated_at		= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-share` AFTER UPDATE ON `tb_share` FOR EACH ROW BEGIN
	INSERT INTO tb_logshare SET
    note 			= "Update",
    idshare 		= new.idshare,
    idfile			= new.idfile,
    iduser_share	= new.iduser_share,
    numberofshare	= new.numberofshare,
    kunci 			= new.kunci,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sharesss`
--

CREATE TABLE `tb_sharesss` (
  `id` int(11) NOT NULL,
  `idfile` int(11) NOT NULL,
  `koef1` varchar(10) NOT NULL,
  `koef1_pangkat2` varchar(10) NOT NULL,
  `koef2` varchar(10) NOT NULL,
  `koef2_pangkat1` varchar(10) NOT NULL,
  `variable_code` varchar(10) NOT NULL,
  `bagian` varchar(255) NOT NULL,
  `max` varchar(100) NOT NULL,
  `min` varchar(100) NOT NULL,
  `part_no` varchar(100) NOT NULL,
  `char_no` varchar(100) NOT NULL,
  `hasil_dec` varchar(10) NOT NULL,
  `hasil` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sharesss`
--

INSERT INTO `tb_sharesss` (`id`, `idfile`, `koef1`, `koef1_pangkat2`, `koef2`, `koef2_pangkat1`, `variable_code`, `bagian`, `max`, `min`, `part_no`, `char_no`, `hasil_dec`, `hasil`) VALUES
(3970, 13, '76', '1', '221', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '143', '8f'),
(3971, 13, '76', '4', '221', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '78', '4e'),
(3972, 13, '76', '9', '221', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '165', 'a5'),
(3973, 13, '76', '16', '221', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '147', '93'),
(3974, 13, '76', '25', '221', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '24', '18'),
(3975, 13, '145', '1', '240', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '245', 'f5'),
(3976, 13, '145', '4', '240', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '149', '95'),
(3977, 13, '145', '9', '240', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '86', '56'),
(3978, 13, '145', '16', '240', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '56', '38'),
(3979, 13, '145', '25', '240', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '59', '3b'),
(3980, 13, '23', '1', '102', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '235', 'eb'),
(3981, 13, '23', '4', '102', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '149', '95'),
(3982, 13, '23', '9', '102', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '109', '6d'),
(3983, 13, '23', '16', '102', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '115', '73'),
(3984, 13, '23', '25', '102', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '167', 'a7'),
(3985, 13, '207', '1', '83', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '130', '82'),
(3986, 13, '207', '4', '83', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '63', '3f'),
(3987, 13, '207', '9', '83', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '153', '99'),
(3988, 13, '207', '16', '83', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '143', '8f'),
(3989, 13, '207', '25', '83', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '33', '21'),
(3990, 13, '118', '1', '66', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '46', '2e'),
(3991, 13, '118', '4', '66', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '209', 'd1'),
(3992, 13, '118', '9', '66', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '94', '5e'),
(3993, 13, '118', '16', '66', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '215', 'd7'),
(3994, 13, '118', '25', '66', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '58', '3a'),
(3995, 13, '104', '1', '157', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '101', '65'),
(3996, 13, '104', '4', '157', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '56', '38'),
(3997, 13, '104', '9', '157', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '219', 'db'),
(3998, 13, '104', '16', '157', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '76', '4c'),
(3999, 13, '104', '25', '157', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '141', '8d'),
(4000, 13, '60', '1', '36', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '206', 'ce'),
(4001, 13, '60', '4', '36', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '165', 'a5'),
(4002, 13, '60', '9', '36', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '244', 'f4'),
(4003, 13, '60', '16', '36', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '186', 'ba'),
(4004, 13, '60', '25', '36', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '248', 'f8'),
(4005, 13, '185', '1', '217', '1', '49', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '194', 'c2'),
(4006, 13, '185', '4', '217', '2', '49', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '195', 'c3'),
(4007, 13, '185', '9', '217', '3', '49', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '52', '34'),
(4008, 13, '185', '16', '217', '4', '49', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '22', '16'),
(4009, 13, '185', '25', '217', '5', '49', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '105', '69'),
(4010, 14, '127', '1', '98', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '71', '47'),
(4011, 14, '127', '4', '98', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '36', '24'),
(4012, 14, '127', '9', '98', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '255', 'ff'),
(4013, 14, '127', '16', '98', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '214', 'd6'),
(4014, 14, '127', '25', '98', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '170', 'aa'),
(4015, 14, '114', '1', '70', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '44', '2c'),
(4016, 14, '114', '4', '70', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '199', 'c7'),
(4017, 14, '114', '9', '70', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '68', '44'),
(4018, 14, '114', '16', '70', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '165', 'a5'),
(4019, 14, '114', '25', '70', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '233', 'e9'),
(4020, 14, '48', '1', '90', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '248', 'f8'),
(4021, 14, '48', '4', '90', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '225', 'e1'),
(4022, 14, '48', '9', '90', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '41', '29'),
(4023, 14, '48', '16', '90', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '210', 'd2'),
(4024, 14, '48', '25', '90', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '218', 'da'),
(4025, 14, '84', '1', '115', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '39', '27'),
(4026, 14, '84', '4', '115', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '149', '95'),
(4027, 14, '84', '9', '115', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '170', 'aa'),
(4028, 14, '84', '16', '115', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '102', '66'),
(4029, 14, '84', '25', '115', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '202', 'ca'),
(4030, 14, '98', '1', '179', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '139', '8b'),
(4031, 14, '98', '4', '179', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '98', '62'),
(4032, 14, '98', '9', '179', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '253', 'fd'),
(4033, 14, '98', '16', '179', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '90', '5a'),
(4034, 14, '98', '25', '179', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '123', '7b'),
(4035, 14, '141', '1', '236', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '217', 'd9'),
(4036, 14, '141', '4', '236', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '105', '69'),
(4037, 14, '141', '9', '236', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '18', '12'),
(4038, 14, '141', '16', '236', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '213', 'd5'),
(4039, 14, '141', '25', '236', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '176', 'b0'),
(4040, 14, '163', '1', '22', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '38', '26'),
(4041, 14, '163', '4', '22', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '35', '23'),
(4042, 14, '163', '9', '22', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '101', '65'),
(4043, 14, '163', '16', '22', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '236', 'ec'),
(4044, 14, '163', '25', '22', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '183', 'b7'),
(4045, 14, '92', '1', '68', '1', '50', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '210', 'd2'),
(4046, 14, '92', '4', '68', '2', '50', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '40', '28'),
(4047, 14, '92', '9', '68', '3', '50', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '54', '36'),
(4048, 14, '92', '16', '68', '4', '50', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '252', 'fc'),
(4049, 14, '92', '25', '68', '5', '50', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '120', '78'),
(4050, 15, '157', '1', '58', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '61', '3d'),
(4051, 15, '157', '4', '58', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '76', '4c'),
(4052, 15, '157', '9', '58', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '148', '94'),
(4053, 15, '157', '16', '58', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '20', '14'),
(4054, 15, '157', '25', '58', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '206', 'ce'),
(4055, 15, '199', '1', '167', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '226', 'e2'),
(4056, 15, '199', '4', '167', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '219', 'db'),
(4057, 15, '199', '9', '167', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '96', '60'),
(4058, 15, '199', '16', '167', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '114', '72'),
(4059, 15, '199', '25', '167', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '16', '10'),
(4060, 15, '79', '1', '160', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '92', '5c'),
(4061, 15, '79', '4', '160', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '232', 'e8'),
(4062, 15, '79', '9', '160', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '16', '10'),
(4063, 15, '79', '16', '160', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '215', 'd7'),
(4064, 15, '79', '25', '160', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '58', '3a'),
(4065, 15, '210', '1', '202', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '252', 'fc'),
(4066, 15, '210', '4', '202', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '56', '38'),
(4067, 15, '210', '9', '202', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '23', '17'),
(4068, 15, '210', '16', '202', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '153', '99'),
(4069, 15, '210', '25', '202', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '189', 'bd'),
(4070, 15, '11', '1', '15', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '145', '91'),
(4071, 15, '11', '4', '15', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '193', 'c1'),
(4072, 15, '11', '9', '15', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '6', '06'),
(4073, 15, '11', '16', '15', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '98', '62'),
(4074, 15, '11', '25', '15', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '212', 'd4'),
(4075, 15, '81', '1', '235', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '156', '9c'),
(4076, 15, '81', '4', '235', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '120', '78'),
(4077, 15, '81', '9', '235', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '246', 'f6'),
(4078, 15, '81', '16', '235', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '20', '14'),
(4079, 15, '81', '25', '235', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '213', 'd5'),
(4080, 15, '127', '1', '182', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '162', 'a2'),
(4081, 15, '127', '4', '182', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '211', 'd3'),
(4082, 15, '127', '9', '182', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '0', '00'),
(4083, 15, '127', '16', '182', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '43', '2b'),
(4084, 15, '127', '25', '182', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '83', '53'),
(4085, 15, '23', '1', '0', '1', '51', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '74', '4a'),
(4086, 15, '23', '4', '0', '2', '51', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '143', '8f'),
(4087, 15, '23', '9', '0', '3', '51', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '1', '01'),
(4088, 15, '23', '16', '0', '4', '51', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '162', 'a2'),
(4089, 15, '23', '25', '0', '5', '51', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '112', '70'),
(4090, 16, '6', '1', '34', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '143', '8f'),
(4091, 16, '6', '4', '34', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '195', 'c3'),
(4092, 16, '6', '9', '34', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '2', '02'),
(4093, 16, '6', '16', '34', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '78', '4e'),
(4094, 16, '6', '25', '34', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '166', 'a6'),
(4095, 16, '249', '1', '3', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '112', '70'),
(4096, 16, '249', '4', '3', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '91', '5b'),
(4097, 16, '249', '9', '3', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '54', '36'),
(4098, 16, '249', '16', '3', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '1', '01'),
(4099, 16, '249', '25', '3', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '189', 'bd'),
(4100, 16, '151', '1', '240', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '244', 'f4'),
(4101, 16, '151', '4', '240', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '166', 'a6'),
(4102, 16, '151', '9', '240', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '133', '85'),
(4103, 16, '151', '16', '240', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '145', '91'),
(4104, 16, '151', '25', '240', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '202', 'ca'),
(4105, 16, '106', '1', '235', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '181', 'b5'),
(4106, 16, '106', '4', '235', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '220', 'dc'),
(4107, 16, '106', '9', '235', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '214', 'd6'),
(4108, 16, '106', '16', '235', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '163', 'a3'),
(4109, 16, '106', '25', '235', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '67', '43'),
(4110, 16, '117', '1', '39', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '18', '12'),
(4111, 16, '117', '4', '39', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '151', '97'),
(4112, 16, '117', '9', '39', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '4', '04'),
(4113, 16, '117', '16', '39', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '91', '5b'),
(4114, 16, '117', '25', '39', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '155', '9b'),
(4115, 16, '13', '1', '208', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '61', '3d'),
(4116, 16, '13', '4', '208', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '51', '33'),
(4117, 16, '13', '9', '208', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '67', '43'),
(4118, 16, '13', '16', '208', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '109', '6d'),
(4119, 16, '13', '25', '208', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '177', 'b1'),
(4120, 16, '194', '1', '160', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '207', 'cf'),
(4121, 16, '194', '4', '160', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '178', 'b2'),
(4122, 16, '194', '9', '160', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '23', '17'),
(4123, 16, '194', '16', '160', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '256', '100'),
(4124, 16, '194', '25', '160', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '106', '6a'),
(4125, 16, '37', '1', '145', '1', '52', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '234', 'ea'),
(4126, 16, '37', '4', '145', '2', '52', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '233', 'e9'),
(4127, 16, '37', '9', '145', '3', '52', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '49', '31'),
(4128, 16, '37', '16', '145', '4', '52', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '196', 'c4'),
(4129, 16, '37', '25', '145', '5', '52', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '160', 'a0'),
(4130, 17, '55', '1', '148', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '49', '31'),
(4131, 17, '55', '4', '148', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '105', '69'),
(4132, 17, '55', '9', '148', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '14', '0e'),
(4133, 17, '55', '16', '148', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '33', '21'),
(4134, 17, '55', '25', '148', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '162', 'a2'),
(4135, 17, '239', '1', '118', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '217', 'd9'),
(4136, 17, '239', '4', '118', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '24', '18'),
(4137, 17, '239', '9', '118', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '52', '34'),
(4138, 17, '239', '16', '118', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '44', '2c'),
(4139, 17, '239', '25', '118', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '0', '00'),
(4140, 17, '74', '1', '67', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '251', 'fb'),
(4141, 17, '74', '4', '67', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '26', '1a'),
(4142, 17, '74', '9', '67', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '206', 'ce'),
(4143, 17, '74', '16', '67', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '20', '14'),
(4144, 17, '74', '25', '67', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '239', 'ef'),
(4145, 17, '189', '1', '174', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '203', 'cb'),
(4146, 17, '189', '4', '174', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '173', 'ad'),
(4147, 17, '189', '9', '174', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '7', '07'),
(4148, 17, '189', '16', '174', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '219', 'db'),
(4149, 17, '189', '25', '174', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '38', '26'),
(4150, 17, '73', '1', '66', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '1', '01'),
(4151, 17, '73', '4', '66', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '29', '1d'),
(4152, 17, '73', '9', '66', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '203', 'cb'),
(4153, 17, '73', '16', '66', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '9', '09'),
(4154, 17, '73', '25', '66', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '218', 'da'),
(4155, 17, '63', '1', '179', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '82', '52'),
(4156, 17, '63', '4', '179', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '193', 'c1'),
(4157, 17, '63', '9', '179', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '173', 'ad'),
(4158, 17, '63', '16', '179', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '22', '16'),
(4159, 17, '63', '25', '179', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '254', 'fe'),
(4160, 17, '168', '1', '221', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '242', 'f2'),
(4161, 17, '168', '4', '221', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '196', 'c4'),
(4162, 17, '168', '9', '221', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '229', 'e5'),
(4163, 17, '168', '16', '221', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '84', '54'),
(4164, 17, '168', '25', '221', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '18', '12'),
(4165, 17, '52', '1', '226', '1', '53', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '74', '4a'),
(4166, 17, '52', '4', '226', '2', '53', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '199', 'c7'),
(4167, 17, '52', '9', '226', '3', '53', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '171', 'ab'),
(4168, 17, '52', '16', '226', '4', '53', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '247', 'f7'),
(4169, 17, '52', '25', '226', '5', '53', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '170', 'aa'),
(4170, 18, '27', '1', '256', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '129', '81'),
(4171, 18, '27', '4', '256', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '209', 'd1'),
(4172, 18, '27', '9', '256', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '86', '56'),
(4173, 18, '27', '16', '256', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '17', '11'),
(4174, 18, '27', '25', '256', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '2', '02'),
(4175, 18, '198', '1', '54', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '112', '70'),
(4176, 18, '198', '4', '54', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '246', 'f6'),
(4177, 18, '198', '9', '54', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '5', '05'),
(4178, 18, '198', '16', '54', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '160', 'a0'),
(4179, 18, '198', '25', '54', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '197', 'c5'),
(4180, 18, '160', '1', '42', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '55', '37'),
(4181, 18, '160', '4', '42', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '63', '3f'),
(4182, 18, '160', '9', '42', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '134', '86'),
(4183, 18, '160', '16', '42', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '11', '0b'),
(4184, 18, '160', '25', '42', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '208', 'd0'),
(4185, 18, '117', '1', '221', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '178', 'b2'),
(4186, 18, '117', '4', '221', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '236', 'ec'),
(4187, 18, '117', '9', '221', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '14', '0e'),
(4188, 18, '117', '16', '221', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '26', '1a'),
(4189, 18, '117', '25', '221', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '15', '0f'),
(4190, 18, '106', '1', '20', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '245', 'f5'),
(4191, 18, '106', '4', '20', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '69', '45'),
(4192, 18, '106', '9', '20', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '105', '69'),
(4193, 18, '106', '16', '20', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '96', '60'),
(4194, 18, '106', '25', '20', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '42', '2a'),
(4195, 18, '26', '1', '174', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '40', '28'),
(4196, 18, '26', '4', '174', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '35', '23'),
(4197, 18, '26', '9', '174', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '82', '52'),
(4198, 18, '26', '16', '174', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '181', 'b5'),
(4199, 18, '26', '25', '174', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '75', '4b'),
(4200, 18, '170', '1', '119', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '142', '8e'),
(4201, 18, '170', '4', '119', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '0', '00'),
(4202, 18, '170', '9', '119', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '198', 'c6'),
(4203, 18, '170', '16', '119', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '222', 'de'),
(4204, 18, '170', '25', '119', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '72', '48'),
(4205, 18, '74', '1', '242', '1', '54', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '113', '71'),
(4206, 18, '74', '4', '242', '2', '54', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '63', '3f'),
(4207, 18, '74', '9', '242', '3', '54', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '161', 'a1'),
(4208, 18, '74', '16', '242', '4', '54', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '150', '96'),
(4209, 18, '74', '25', '242', '5', '54', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '30', '1e'),
(4210, 19, '20', '1', '253', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '119', '77'),
(4211, 19, '20', '4', '253', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '175', 'af'),
(4212, 19, '20', '9', '253', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '14', '0e'),
(4213, 19, '20', '16', '253', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '150', '96'),
(4214, 19, '20', '25', '253', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '69', '45'),
(4215, 19, '98', '1', '114', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '72', '48'),
(4216, 19, '98', '4', '114', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '223', 'df'),
(4217, 19, '98', '9', '114', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '56', '38'),
(4218, 19, '98', '16', '114', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '85', '55'),
(4219, 19, '98', '25', '114', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '53', '35'),
(4220, 19, '186', '1', '166', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '205', 'cd'),
(4221, 19, '186', '4', '166', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '158', '9e'),
(4222, 19, '186', '9', '166', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '226', 'e2'),
(4223, 19, '186', '16', '166', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '152', '98'),
(4224, 19, '186', '25', '166', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '193', 'c1'),
(4225, 19, '34', '1', '1', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '132', '84'),
(4226, 19, '34', '4', '1', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '235', 'eb'),
(4227, 19, '34', '9', '1', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '149', '95'),
(4228, 19, '34', '16', '1', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '131', '83'),
(4229, 19, '34', '25', '1', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '181', 'b5'),
(4230, 19, '113', '1', '54', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '29', '1d'),
(4231, 19, '113', '4', '54', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '165', 'a5'),
(4232, 19, '113', '9', '54', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '13', '0d'),
(4233, 19, '113', '16', '54', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '87', '57'),
(4234, 19, '113', '25', '54', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '130', '82'),
(4235, 19, '10', '1', '232', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '82', '52'),
(4236, 19, '10', '4', '232', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '87', '57'),
(4237, 19, '10', '9', '232', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '112', '70'),
(4238, 19, '10', '16', '232', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '157', '9d'),
(4239, 19, '10', '25', '232', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '222', 'de'),
(4240, 19, '160', '1', '109', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '122', '7a'),
(4241, 19, '160', '4', '109', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '197', 'c5'),
(4242, 19, '160', '9', '109', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '78', '4e'),
(4243, 19, '160', '16', '109', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '22', '16'),
(4244, 19, '160', '25', '109', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '29', '1d'),
(4245, 19, '114', '1', '223', '1', '55', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '135', '87'),
(4246, 19, '114', '4', '223', '2', '55', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '186', 'ba'),
(4247, 19, '114', '9', '223', '3', '55', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '208', 'd0'),
(4248, 19, '114', '16', '223', '4', '55', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '201', 'c9'),
(4249, 19, '114', '25', '223', '5', '55', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '165', 'a5'),
(4250, 20, '124', '1', '255', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '225', 'e1'),
(4251, 20, '124', '4', '255', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '81', '51'),
(4252, 20, '124', '9', '255', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '185', 'b9'),
(4253, 20, '124', '16', '255', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '23', '17'),
(4254, 20, '124', '25', '255', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '109', '6d'),
(4255, 20, '37', '1', '175', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '72', '48'),
(4256, 20, '37', '4', '175', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '101', '65'),
(4257, 20, '37', '9', '175', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '204', 'cc'),
(4258, 20, '37', '16', '175', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '124', '7c'),
(4259, 20, '37', '25', '175', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '118', '76'),
(4260, 20, '133', '1', '42', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '28', '1c'),
(4261, 20, '133', '4', '42', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '212', 'd4'),
(4262, 20, '133', '9', '42', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '148', '94'),
(4263, 20, '133', '16', '42', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '93', '5d'),
(4264, 20, '133', '25', '42', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '47', '2f'),
(4265, 20, '145', '1', '66', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '51', '33'),
(4266, 20, '145', '4', '66', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '38', '26'),
(4267, 20, '145', '9', '66', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '58', '3a'),
(4268, 20, '145', '16', '66', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '111', '6f'),
(4269, 20, '145', '25', '66', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '197', 'c5'),
(4270, 20, '215', '1', '75', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '152', '98'),
(4271, 20, '215', '4', '75', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '101', '65'),
(4272, 20, '215', '9', '75', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '223', 'df'),
(4273, 20, '215', '16', '75', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '4', '04'),
(4274, 20, '215', '25', '75', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '215', 'd7'),
(4275, 20, '182', '1', '223', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '245', 'f5'),
(4276, 20, '182', '4', '223', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '243', 'f3'),
(4277, 20, '182', '9', '223', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '91', '5b'),
(4278, 20, '182', '16', '223', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '46', '2e'),
(4279, 20, '182', '25', '223', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '108', '6c'),
(4280, 20, '157', '1', '4', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '14', '0e'),
(4281, 20, '157', '4', '4', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '232', 'e8'),
(4282, 20, '157', '9', '4', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '250', 'fa'),
(4283, 20, '157', '16', '4', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '68', '44'),
(4284, 20, '157', '25', '4', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '200', 'c8'),
(4285, 20, '229', '1', '172', '1', '56', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '200', 'c8'),
(4286, 20, '229', '4', '172', '2', '56', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '31', '1f'),
(4287, 20, '229', '9', '172', '3', '56', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '63', '3f'),
(4288, 20, '229', '16', '172', '4', '56', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '39', '27'),
(4289, 20, '229', '25', '172', '5', '56', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '216', 'd8'),
(4290, 21, '47', '1', '206', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '99', '63'),
(4291, 21, '47', '4', '206', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '189', 'bd'),
(4292, 21, '47', '9', '206', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '116', '74'),
(4293, 21, '47', '16', '206', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '137', '89'),
(4294, 21, '47', '25', '206', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '252', 'fc'),
(4295, 21, '212', '1', '136', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '208', 'd0'),
(4296, 21, '212', '4', '136', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '209', 'd1'),
(4297, 21, '212', '9', '136', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '120', '78'),
(4298, 21, '212', '16', '136', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '198', 'c6'),
(4299, 21, '212', '25', '136', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '186', 'ba'),
(4300, 21, '65', '1', '16', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '191', 'bf'),
(4301, 21, '65', '4', '16', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '145', '91'),
(4302, 21, '65', '9', '16', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '229', 'e5'),
(4303, 21, '65', '16', '16', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '186', 'ba'),
(4304, 21, '65', '25', '16', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '16', '10'),
(4305, 21, '211', '1', '127', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '178', 'b2'),
(4306, 21, '211', '4', '127', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '167', 'a7'),
(4307, 21, '211', '9', '127', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '64', '40'),
(4308, 21, '211', '16', '127', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '126', '7e'),
(4309, 21, '211', '25', '127', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '96', '60'),
(4310, 21, '236', '1', '11', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '109', '6d'),
(4311, 21, '236', '4', '11', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '57', '39'),
(4312, 21, '236', '9', '11', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '220', 'dc'),
(4313, 21, '236', '16', '11', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '84', '54'),
(4314, 21, '236', '25', '11', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '163', 'a3'),
(4315, 21, '19', '1', '96', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '212', 'd4'),
(4316, 21, '19', '4', '96', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '108', '6c'),
(4317, 21, '19', '9', '96', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '42', '2a'),
(4318, 21, '19', '16', '96', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '14', '0e'),
(4319, 21, '19', '25', '96', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '24', '18'),
(4320, 21, '146', '1', '171', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '170', 'aa'),
(4321, 21, '146', '4', '171', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '8', '08'),
(4322, 21, '146', '9', '171', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '138', '8a'),
(4323, 21, '146', '16', '171', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '46', '2e'),
(4324, 21, '146', '25', '171', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '246', 'f6'),
(4325, 21, '123', '1', '9', '1', '57', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '189', 'bd'),
(4326, 21, '123', '4', '9', '2', '57', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '53', '35'),
(4327, 21, '123', '9', '9', '3', '57', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '163', 'a3'),
(4328, 21, '123', '16', '9', '4', '57', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '5', '05'),
(4329, 21, '123', '25', '9', '5', '57', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '93', '5d'),
(4330, 22, '195', '1', '69', '1', '103', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '110', '6e'),
(4331, 22, '195', '4', '69', '2', '103', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '250', 'fa'),
(4332, 22, '195', '9', '69', '3', '103', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '9', '09'),
(4333, 22, '195', '16', '69', '4', '103', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '158', '9e'),
(4334, 22, '195', '25', '69', '5', '103', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '183', 'b7'),
(4335, 22, '195', '1', '0', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '55', '37'),
(4336, 22, '195', '4', '0', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '126', '7e'),
(4337, 22, '195', '9', '0', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '73', '49'),
(4338, 22, '195', '16', '0', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '153', '99'),
(4339, 22, '195', '25', '0', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '109', '6d'),
(4340, 22, '93', '1', '69', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '15', '0f'),
(4341, 22, '93', '4', '69', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '106', '6a'),
(4342, 22, '93', '9', '69', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '126', '7e'),
(4343, 22, '93', '16', '69', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '75', '4b'),
(4344, 22, '93', '25', '69', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '210', 'd2'),
(4345, 22, '112', '1', '80', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '32', '20'),
(4346, 22, '112', '4', '80', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '191', 'bf'),
(4347, 22, '112', '9', '80', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '60', '3c'),
(4348, 22, '112', '16', '80', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '153', '99'),
(4349, 22, '112', '25', '80', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '213', 'd5'),
(4350, 22, '96', '1', '168', '1', '119', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '126', '7e'),
(4351, 22, '96', '4', '168', '2', '119', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '68', '44'),
(4352, 22, '96', '9', '168', '3', '119', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '202', 'ca'),
(4353, 22, '96', '16', '168', '4', '119', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '14', '0e'),
(4354, 22, '96', '25', '168', '5', '119', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '18', '12'),
(4355, 22, '144', '1', '150', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '134', '86'),
(4356, 22, '144', '4', '150', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '202', 'ca'),
(4357, 22, '144', '9', '150', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '44', '2c'),
(4358, 22, '144', '16', '150', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '174', 'ae'),
(4359, 22, '144', '25', '150', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '78', '4e'),
(4360, 22, '165', '1', '8', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '26', '1a'),
(4361, 22, '165', '4', '8', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '15', '0f'),
(4362, 22, '165', '9', '8', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '77', '4d'),
(4363, 22, '165', '16', '8', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '212', 'd4'),
(4364, 22, '165', '25', '8', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '163', 'a3'),
(4365, 22, '130', '1', '158', '1', '49', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '80', '50'),
(4366, 22, '130', '4', '158', '2', '49', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '114', '72'),
(4367, 22, '130', '9', '158', '3', '49', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '151', '97'),
(4368, 22, '130', '16', '158', '4', '49', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '191', 'bf'),
(4369, 22, '130', '25', '158', '5', '49', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '234', 'ea'),
(4370, 22, '114', '1', '52', '1', '48', 'Max-5-Min-03-Part_No-01-Char_No-9', '5', '03', '01', '9', '214', 'd6'),
(4371, 22, '114', '4', '52', '2', '48', 'Max-5-Min-03-Part_No-02-Char_No-9', '5', '03', '02', '9', '94', '5e'),
(4372, 22, '114', '9', '52', '3', '48', 'Max-5-Min-03-Part_No-03-Char_No-9', '5', '03', '03', '9', '202', 'ca'),
(4373, 22, '114', '16', '52', '4', '48', 'Max-5-Min-03-Part_No-04-Char_No-9', '5', '03', '04', '9', '24', '18'),
(4374, 22, '114', '25', '52', '5', '48', 'Max-5-Min-03-Part_No-05-Char_No-9', '5', '03', '05', '9', '74', '4a'),
(4375, 32, '30', '1', '101', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '236', 'ec'),
(4376, 32, '30', '4', '101', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '170', 'aa'),
(4377, 32, '30', '9', '101', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '164', 'a4'),
(4378, 32, '30', '16', '101', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '218', 'da'),
(4379, 32, '30', '25', '101', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '75', '4b'),
(4380, 32, '182', '1', '82', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '121', '79'),
(4381, 32, '182', '4', '82', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '235', 'eb'),
(4382, 32, '182', '9', '82', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '199', 'c7'),
(4383, 32, '182', '16', '82', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '13', '0d'),
(4384, 32, '182', '25', '82', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '191', 'bf'),
(4385, 32, '156', '1', '143', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '144', '90'),
(4386, 32, '156', '4', '143', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '241', 'f1'),
(4387, 32, '156', '9', '143', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '136', '88'),
(4388, 32, '156', '16', '143', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '86', '56'),
(4389, 32, '156', '25', '143', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '91', '5b'),
(4390, 32, '182', '1', '240', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '5', '05'),
(4391, 32, '182', '4', '240', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '20', '14'),
(4392, 32, '182', '9', '240', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '142', '8e'),
(4393, 32, '182', '16', '240', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '114', '72'),
(4394, 32, '182', '25', '240', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '193', 'c1'),
(4395, 32, '97', '1', '250', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '200', 'c8'),
(4396, 32, '97', '4', '250', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '227', 'e3'),
(4397, 32, '97', '9', '250', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '191', 'bf'),
(4398, 32, '97', '16', '250', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '92', '5c'),
(4399, 32, '97', '25', '250', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '187', 'bb'),
(4400, 32, '150', '1', '141', '1', '49', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '83', '53'),
(4401, 32, '150', '4', '141', '2', '49', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '160', 'a0'),
(4402, 32, '150', '9', '141', '3', '49', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '23', '17'),
(4403, 32, '150', '16', '141', '4', '49', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '186', 'ba'),
(4404, 32, '150', '25', '141', '5', '49', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '135', '87'),
(4405, 32, '255', '1', '131', '1', '48', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '177', 'b1'),
(4406, 32, '255', '4', '131', '2', '48', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '45', '2d'),
(4407, 32, '255', '9', '131', '3', '48', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '166', 'a6'),
(4408, 32, '255', '16', '131', '4', '48', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '26', '1a'),
(4409, 32, '255', '25', '131', '5', '48', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '139', '8b'),
(4410, 31, '58', '1', '50', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '213', 'd5'),
(4411, 31, '58', '4', '50', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '180', 'b4'),
(4412, 31, '58', '9', '50', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '6', '06'),
(4413, 31, '58', '16', '50', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '205', 'cd'),
(4414, 31, '58', '25', '50', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '6', '06'),
(4415, 31, '141', '1', '88', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '86', '56');
INSERT INTO `tb_sharesss` (`id`, `idfile`, `koef1`, `koef1_pangkat2`, `koef2`, `koef2_pangkat1`, `variable_code`, `bagian`, `max`, `min`, `part_no`, `char_no`, `hasil_dec`, `hasil`) VALUES
(4416, 31, '141', '4', '88', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '83', '53'),
(4417, 31, '141', '9', '88', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '105', '69'),
(4418, 31, '141', '16', '88', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '152', '98'),
(4419, 31, '141', '25', '88', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '224', 'e0'),
(4420, 31, '144', '1', '59', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '48', '30'),
(4421, 31, '144', '4', '59', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '25', '19'),
(4422, 31, '144', '9', '59', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '33', '21'),
(4423, 31, '144', '16', '59', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '72', '48'),
(4424, 31, '144', '25', '59', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '142', '8e'),
(4425, 31, '243', '1', '229', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '55', '37'),
(4426, 31, '243', '4', '229', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '242', 'f2'),
(4427, 31, '243', '9', '229', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '144', '90'),
(4428, 31, '243', '16', '229', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '18', '12'),
(4429, 31, '243', '25', '229', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '121', '79'),
(4430, 31, '123', '1', '133', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '109', '6d'),
(4431, 31, '123', '4', '133', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '97', '61'),
(4432, 31, '123', '9', '133', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '74', '4a'),
(4433, 31, '123', '16', '133', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '40', '28'),
(4434, 31, '123', '25', '133', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '252', 'fc'),
(4435, 31, '168', '1', '194', '1', '57', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '162', 'a2'),
(4436, 31, '168', '4', '194', '2', '57', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '89', '59'),
(4437, 31, '168', '9', '194', '3', '57', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '95', '5f'),
(4438, 31, '168', '16', '194', '4', '57', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '180', 'b4'),
(4439, 31, '168', '25', '194', '5', '57', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '87', '57'),
(4440, 30, '55', '1', '30', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '190', 'be'),
(4441, 30, '55', '4', '30', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '128', '80'),
(4442, 30, '55', '9', '30', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '176', 'b0'),
(4443, 30, '55', '16', '30', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '77', '4d'),
(4444, 30, '55', '25', '30', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '88', '58'),
(4445, 30, '111', '1', '182', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '150', '96'),
(4446, 30, '111', '4', '182', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '151', '97'),
(4447, 30, '111', '9', '182', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '117', '75'),
(4448, 30, '111', '16', '182', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '48', '30'),
(4449, 30, '111', '25', '182', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '201', 'c9'),
(4450, 30, '158', '1', '116', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '119', '77'),
(4451, 30, '158', '4', '116', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '195', 'c3'),
(4452, 30, '158', '9', '116', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '73', '49'),
(4453, 30, '158', '16', '116', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '10', '0a'),
(4454, 30, '158', '25', '116', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '6', '06'),
(4455, 30, '144', '1', '24', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '8', '08'),
(4456, 30, '144', '4', '24', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '207', 'cf'),
(4457, 30, '144', '9', '24', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '180', 'b4'),
(4458, 30, '144', '16', '24', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '184', 'b8'),
(4459, 30, '144', '25', '24', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '219', 'db'),
(4460, 30, '205', '1', '198', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '256', '100'),
(4461, 30, '205', '4', '198', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '41', '29'),
(4462, 30, '205', '9', '198', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '236', 'ec'),
(4463, 30, '205', '16', '198', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '70', '46'),
(4464, 30, '205', '25', '198', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '57', '39'),
(4465, 30, '139', '1', '26', '1', '56', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '221', 'dd'),
(4466, 30, '139', '4', '26', '2', '56', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '150', '96'),
(4467, 30, '139', '9', '26', '3', '56', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '100', '64'),
(4468, 30, '139', '16', '26', '4', '56', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '71', '47'),
(4469, 30, '139', '25', '26', '5', '56', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '63', '3f'),
(4470, 29, '175', '1', '241', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '7', '07'),
(4471, 29, '175', '4', '241', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '2', '02'),
(4472, 29, '175', '9', '241', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '90', '5a'),
(4473, 29, '175', '16', '241', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '14', '0e'),
(4474, 29, '175', '25', '241', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '31', '1f'),
(4475, 29, '27', '1', '61', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '202', 'ca'),
(4476, 29, '27', '4', '61', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '87', '57'),
(4477, 29, '27', '9', '61', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '26', '1a'),
(4478, 29, '27', '16', '61', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '19', '13'),
(4479, 29, '27', '25', '61', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '66', '42'),
(4480, 29, '91', '1', '162', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '98', '62'),
(4481, 29, '91', '4', '162', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '19', '13'),
(4482, 29, '91', '9', '162', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '122', '7a'),
(4483, 29, '91', '16', '162', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '150', '96'),
(4484, 29, '91', '25', '162', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '103', '67'),
(4485, 29, '87', '1', '34', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '218', 'da'),
(4486, 29, '87', '4', '34', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '256', '100'),
(4487, 29, '87', '9', '34', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '211', 'd3'),
(4488, 29, '87', '16', '34', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '83', '53'),
(4489, 29, '87', '25', '34', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '129', '81'),
(4490, 29, '83', '1', '27', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '220', 'dc'),
(4491, 29, '83', '4', '27', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '239', 'ef'),
(4492, 29, '83', '9', '27', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '167', 'a7'),
(4493, 29, '83', '16', '27', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '4', '04'),
(4494, 29, '83', '25', '27', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '7', '07'),
(4495, 29, '148', '1', '76', '1', '55', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '22', '16'),
(4496, 29, '148', '4', '76', '2', '55', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '28', '1c'),
(4497, 29, '148', '9', '76', '3', '55', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '73', '49'),
(4498, 29, '148', '16', '76', '4', '55', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '157', '9d'),
(4499, 29, '148', '25', '76', '5', '55', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '23', '17'),
(4500, 28, '8', '1', '2', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '115', '73'),
(4501, 28, '8', '4', '2', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '141', '8d'),
(4502, 28, '8', '9', '2', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '183', 'b7'),
(4503, 28, '8', '16', '2', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '241', 'f1'),
(4504, 28, '8', '25', '2', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '58', '3a'),
(4505, 28, '140', '1', '199', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '196', 'c4'),
(4506, 28, '140', '4', '199', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '44', '2c'),
(4507, 28, '140', '9', '199', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '172', 'ac'),
(4508, 28, '140', '16', '199', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '66', '42'),
(4509, 28, '140', '25', '199', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '240', 'f0'),
(4510, 28, '222', '1', '50', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '117', '75'),
(4511, 28, '222', '4', '50', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '62', '3e'),
(4512, 28, '222', '9', '50', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '194', 'c2'),
(4513, 28, '222', '16', '50', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '256', '100'),
(4514, 28, '222', '25', '50', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '248', 'f8'),
(4515, 28, '166', '1', '30', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '36', '24'),
(4516, 28, '166', '4', '30', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '50', '32'),
(4517, 28, '166', '9', '30', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '139', '8b'),
(4518, 28, '166', '16', '30', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '46', '2e'),
(4519, 28, '166', '25', '30', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '28', '1c'),
(4520, 28, '237', '1', '18', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '108', '6c'),
(4521, 28, '237', '4', '18', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '66', '42'),
(4522, 28, '237', '9', '18', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '241', 'f1'),
(4523, 28, '237', '16', '18', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '119', '77'),
(4524, 28, '237', '25', '18', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '214', 'd6'),
(4525, 28, '228', '1', '6', '1', '54', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '31', '1f'),
(4526, 28, '228', '4', '6', '2', '54', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '207', 'cf'),
(4527, 28, '228', '9', '6', '3', '54', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '68', '44'),
(4528, 28, '228', '16', '6', '4', '54', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '128', '80'),
(4529, 28, '228', '25', '6', '5', '54', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '130', '82'),
(4530, 27, '11', '1', '244', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '103', '67'),
(4531, 27, '11', '4', '244', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '123', '7b'),
(4532, 27, '11', '9', '244', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '165', 'a5'),
(4533, 27, '11', '16', '244', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '229', 'e5'),
(4534, 27, '11', '25', '244', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '58', '3a'),
(4535, 27, '168', '1', '207', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '232', 'e8'),
(4536, 27, '168', '4', '207', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '172', 'ac'),
(4537, 27, '168', '9', '207', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '191', 'bf'),
(4538, 27, '168', '16', '207', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '32', '20'),
(4539, 27, '168', '25', '207', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '209', 'd1'),
(4540, 27, '65', '1', '224', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '134', '86'),
(4541, 27, '65', '4', '224', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '39', '27'),
(4542, 27, '65', '9', '224', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '74', '4a'),
(4543, 27, '65', '16', '224', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '239', 'ef'),
(4544, 27, '65', '25', '224', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '20', '14'),
(4545, 27, '216', '1', '137', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '193', 'c1'),
(4546, 27, '216', '4', '137', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '207', 'cf'),
(4547, 27, '216', '9', '137', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '139', '8b'),
(4548, 27, '216', '16', '137', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '246', 'f6'),
(4549, 27, '216', '25', '137', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '14', '0e'),
(4550, 27, '175', '1', '95', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '123', '7b'),
(4551, 27, '175', '4', '95', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '229', 'e5'),
(4552, 27, '175', '9', '95', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '171', 'ab'),
(4553, 27, '175', '16', '95', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '206', 'ce'),
(4554, 27, '175', '25', '95', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '77', '4d'),
(4555, 27, '183', '1', '108', '1', '53', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '87', '57'),
(4556, 27, '183', '4', '108', '2', '53', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '230', 'e6'),
(4557, 27, '183', '9', '108', '3', '53', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '225', 'e1'),
(4558, 27, '183', '16', '108', '4', '53', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '72', '48'),
(4559, 27, '183', '25', '108', '5', '53', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '28', '1c'),
(4560, 26, '149', '1', '185', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '182', 'b6'),
(4561, 26, '149', '4', '185', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '43', '2b'),
(4562, 26, '149', '9', '185', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '202', 'ca'),
(4563, 26, '149', '16', '185', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '145', '91'),
(4564, 26, '149', '25', '185', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '129', '81'),
(4565, 26, '186', '1', '6', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '49', '31'),
(4566, 26, '186', '4', '6', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '99', '63'),
(4567, 26, '186', '9', '6', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '7', '07'),
(4568, 26, '186', '16', '6', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '30', '1e'),
(4569, 26, '186', '25', '6', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '168', 'a8'),
(4570, 26, '204', '1', '223', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '15', '0f'),
(4571, 26, '204', '4', '223', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '79', '4f'),
(4572, 26, '204', '9', '223', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '37', '25'),
(4573, 26, '204', '16', '223', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '146', '92'),
(4574, 26, '204', '25', '223', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '149', '95'),
(4575, 26, '17', '1', '251', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '108', '6c'),
(4576, 26, '17', '4', '251', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '153', '99'),
(4577, 26, '17', '9', '251', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '232', 'e8'),
(4578, 26, '17', '16', '251', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '88', '58'),
(4579, 26, '17', '25', '251', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '235', 'eb'),
(4580, 26, '182', '1', '253', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '31', '1f'),
(4581, 26, '182', '4', '253', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '59', '3b'),
(4582, 26, '182', '9', '253', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '194', 'c2'),
(4583, 26, '182', '16', '253', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '179', 'b3'),
(4584, 26, '182', '25', '253', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '14', '0e'),
(4585, 26, '178', '1', '214', '1', '52', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '187', 'bb'),
(4586, 26, '178', '4', '214', '2', '52', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '164', 'a4'),
(4587, 26, '178', '9', '214', '3', '52', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '240', 'f0'),
(4588, 26, '178', '16', '214', '4', '52', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '158', '9e'),
(4589, 26, '178', '25', '214', '5', '52', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '175', 'af'),
(4590, 25, '200', '1', '204', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '252', 'fc'),
(4591, 25, '200', '4', '204', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '28', '1c'),
(4592, 25, '200', '9', '204', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '204', 'cc'),
(4593, 25, '200', '16', '204', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '9', '09'),
(4594, 25, '200', '25', '204', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '214', 'd6'),
(4595, 25, '98', '1', '41', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '253', 'fd'),
(4596, 25, '98', '4', '41', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '74', '4a'),
(4597, 25, '98', '9', '41', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '91', '5b'),
(4598, 25, '98', '16', '41', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '47', '2f'),
(4599, 25, '98', '25', '41', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '199', 'c7'),
(4600, 25, '6', '1', '254', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '105', '69'),
(4601, 25, '6', '4', '254', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '120', '78'),
(4602, 25, '6', '9', '254', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '147', '93'),
(4603, 25, '6', '16', '254', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '186', 'ba'),
(4604, 25, '6', '25', '254', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '237', 'ed'),
(4605, 25, '179', '1', '148', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '167', 'a7'),
(4606, 25, '179', '4', '148', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '81', '51'),
(4607, 25, '179', '9', '148', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '96', '60'),
(4608, 25, '179', '16', '148', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '212', 'd4'),
(4609, 25, '179', '25', '148', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '172', 'ac'),
(4610, 25, '222', '1', '155', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '230', 'e6'),
(4611, 25, '222', '4', '155', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '23', '17'),
(4612, 25, '222', '9', '155', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '3', '03'),
(4613, 25, '222', '16', '155', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '170', 'aa'),
(4614, 25, '222', '25', '155', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '10', '0a'),
(4615, 25, '6', '1', '198', '1', '51', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '255', 'ff'),
(4616, 25, '6', '4', '198', '2', '51', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '214', 'd6'),
(4617, 25, '6', '9', '198', '3', '51', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '185', 'b9'),
(4618, 25, '6', '16', '198', '4', '51', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '168', 'a8'),
(4619, 25, '6', '25', '198', '5', '51', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '163', 'a3'),
(4620, 24, '89', '1', '29', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '223', 'df'),
(4621, 24, '89', '4', '29', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '5', '05'),
(4622, 24, '89', '9', '29', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '222', 'de'),
(4623, 24, '89', '16', '29', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '103', '67'),
(4624, 24, '89', '25', '29', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '162', 'a2'),
(4625, 24, '91', '1', '235', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '183', 'b7'),
(4626, 24, '91', '4', '235', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '177', 'b1'),
(4627, 24, '91', '9', '235', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '96', '60'),
(4628, 24, '91', '16', '235', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '197', 'c5'),
(4629, 24, '91', '25', '235', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '223', 'df'),
(4630, 24, '213', '1', '99', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '157', '9d'),
(4631, 24, '213', '4', '99', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '124', '7c'),
(4632, 24, '213', '9', '99', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '3', '03'),
(4633, 24, '213', '16', '99', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '51', '33'),
(4634, 24, '213', '25', '99', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '11', '0b'),
(4635, 24, '11', '1', '91', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '199', 'c7'),
(4636, 24, '11', '4', '91', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '66', '42'),
(4637, 24, '11', '9', '91', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '212', 'd4'),
(4638, 24, '11', '16', '91', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '123', '7b'),
(4639, 24, '11', '25', '91', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '56', '38'),
(4640, 24, '202', '1', '63', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '118', '76'),
(4641, 24, '202', '4', '63', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '16', '10'),
(4642, 24, '202', '9', '63', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '61', '3d'),
(4643, 24, '202', '16', '63', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '253', 'fd'),
(4644, 24, '202', '25', '63', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '78', '4e'),
(4645, 24, '145', '1', '28', '1', '50', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '223', 'df'),
(4646, 24, '145', '4', '28', '2', '50', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '172', 'ac'),
(4647, 24, '145', '9', '28', '3', '50', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '154', '9a'),
(4648, 24, '145', '16', '28', '4', '50', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '169', 'a9'),
(4649, 24, '145', '25', '28', '5', '50', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '217', 'd9'),
(4650, 23, '243', '1', '23', '1', '105', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '114', '72'),
(4651, 23, '243', '4', '23', '2', '105', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '95', '5f'),
(4652, 23, '243', '9', '23', '3', '105', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '48', '30'),
(4653, 23, '243', '16', '23', '4', '105', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '230', 'e6'),
(4654, 23, '243', '25', '23', '5', '105', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '127', '7f'),
(4655, 23, '226', '1', '173', '1', '114', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '256', '100'),
(4656, 23, '226', '4', '173', '2', '114', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '79', '4f'),
(4657, 23, '226', '9', '173', '3', '114', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '97', '61'),
(4658, 23, '226', '16', '173', '4', '114', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '53', '35'),
(4659, 23, '226', '25', '173', '5', '114', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '204', 'cc'),
(4660, 23, '110', '1', '136', '1', '102', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '91', '5b'),
(4661, 23, '110', '4', '136', '2', '102', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '43', '2b'),
(4662, 23, '110', '9', '136', '3', '102', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '215', 'd7'),
(4663, 23, '110', '16', '136', '4', '102', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '93', '5d'),
(4664, 23, '110', '25', '136', '5', '102', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '191', 'bf'),
(4665, 23, '164', '1', '200', '1', '97', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '204', 'cc'),
(4666, 23, '164', '4', '200', '2', '97', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '125', '7d'),
(4667, 23, '164', '9', '200', '3', '97', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '117', '75'),
(4668, 23, '164', '16', '200', '4', '97', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '180', 'b4'),
(4669, 23, '164', '25', '200', '5', '97', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '57', '39'),
(4670, 23, '92', '1', '2', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '204', 'cc'),
(4671, 23, '92', '4', '2', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '225', 'e1'),
(4672, 23, '92', '9', '2', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '173', 'ad'),
(4673, 23, '92', '16', '2', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '48', '30'),
(4674, 23, '92', '25', '2', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '107', '6b'),
(4675, 23, '20', '1', '209', '1', '49', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '21', '15'),
(4676, 23, '20', '4', '209', '2', '49', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '33', '21'),
(4677, 23, '20', '9', '209', '3', '49', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '85', '55'),
(4678, 23, '20', '16', '209', '4', '49', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '177', 'b1'),
(4679, 23, '20', '25', '209', '5', '49', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '52', '34'),
(4680, 38, '23', '1', '221', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '96', '60'),
(4681, 38, '23', '4', '221', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '129', '81'),
(4682, 38, '23', '9', '221', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '208', 'd0'),
(4683, 38, '23', '16', '221', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '76', '4c'),
(4684, 38, '23', '25', '221', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '247', 'f7'),
(4685, 38, '38', '1', '150', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '48', '30'),
(4686, 38, '38', '4', '150', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '55', '37'),
(4687, 38, '38', '9', '150', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '138', '8a'),
(4688, 38, '38', '16', '150', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '40', '28'),
(4689, 38, '38', '25', '150', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '18', '12'),
(4690, 38, '113', '1', '150', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '114', '72'),
(4691, 38, '113', '4', '150', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '89', '59'),
(4692, 38, '113', '9', '150', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '33', '21'),
(4693, 38, '113', '16', '150', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '203', 'cb'),
(4694, 38, '113', '25', '150', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '85', '55'),
(4695, 38, '141', '1', '202', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '207', 'cf'),
(4696, 38, '141', '4', '202', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '61', '3d'),
(4697, 38, '141', '9', '202', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '197', 'c5'),
(4698, 38, '141', '16', '202', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '101', '65'),
(4699, 38, '141', '25', '202', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '30', '1e'),
(4700, 38, '175', '1', '58', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '87', '57'),
(4701, 38, '175', '4', '58', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '156', '9c'),
(4702, 38, '175', '9', '58', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '61', '3d'),
(4703, 38, '175', '16', '58', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '59', '3b'),
(4704, 38, '175', '25', '58', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '150', '96'),
(4705, 38, '172', '1', '233', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '1', '01'),
(4706, 38, '172', '4', '233', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '236', 'ec'),
(4707, 38, '172', '9', '233', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '44', '2c'),
(4708, 38, '172', '16', '233', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '196', 'c4'),
(4709, 38, '172', '25', '233', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '178', 'b2'),
(4710, 38, '70', '1', '60', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '241', 'f1'),
(4711, 38, '70', '4', '60', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '254', 'fe'),
(4712, 38, '70', '9', '60', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '150', '96'),
(4713, 38, '70', '16', '60', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '186', 'ba'),
(4714, 38, '70', '25', '60', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '105', '69'),
(4715, 38, '108', '1', '40', '1', '54', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '202', 'ca'),
(4716, 38, '108', '4', '40', '2', '54', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '52', '34'),
(4717, 38, '108', '9', '40', '3', '54', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '118', '76'),
(4718, 38, '108', '16', '40', '4', '54', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '143', '8f'),
(4719, 38, '108', '25', '40', '5', '54', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '127', '7f'),
(4720, 37, '139', '1', '113', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '104', '68'),
(4721, 37, '139', '4', '113', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '120', '78'),
(4722, 37, '139', '9', '113', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '157', '9d'),
(4723, 37, '139', '16', '113', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '215', 'd7'),
(4724, 37, '139', '25', '113', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '37', '25'),
(4725, 37, '227', '1', '237', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '67', '43'),
(4726, 37, '227', '4', '237', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '214', 'd6'),
(4727, 37, '227', '9', '237', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '44', '2c'),
(4728, 37, '227', '16', '237', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '71', '47'),
(4729, 37, '227', '25', '237', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '38', '26'),
(4730, 37, '75', '1', '99', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '25', '19'),
(4731, 37, '75', '4', '99', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '92', '5c'),
(4732, 37, '75', '9', '99', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '52', '34'),
(4733, 37, '75', '16', '99', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '162', 'a2'),
(4734, 37, '75', '25', '99', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '165', 'a5'),
(4735, 37, '34', '1', '34', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '189', 'bd'),
(4736, 37, '34', '4', '34', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '68', '44'),
(4737, 37, '34', '9', '34', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '15', '0f'),
(4738, 37, '34', '16', '34', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '30', '1e'),
(4739, 37, '34', '25', '34', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '113', '71'),
(4740, 37, '179', '1', '167', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '200', 'c8'),
(4741, 37, '179', '4', '167', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '133', '85'),
(4742, 37, '179', '9', '167', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '167', 'a7'),
(4743, 37, '179', '16', '167', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '45', '2d'),
(4744, 37, '179', '25', '167', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '24', '18'),
(4745, 37, '216', '1', '235', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '47', '2f'),
(4746, 37, '216', '4', '235', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '159', '9f'),
(4747, 37, '216', '9', '235', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '189', 'bd'),
(4748, 37, '216', '16', '235', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '137', '89'),
(4749, 37, '216', '25', '235', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '3', '03'),
(4750, 37, '67', '1', '247', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '168', 'a8'),
(4751, 37, '67', '4', '247', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '102', '66'),
(4752, 37, '67', '9', '247', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '170', 'aa'),
(4753, 37, '67', '16', '247', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '115', '73'),
(4754, 37, '67', '25', '247', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '194', 'c2'),
(4755, 37, '103', '1', '248', '1', '53', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '147', '93'),
(4756, 37, '103', '4', '248', '2', '53', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '190', 'be'),
(4757, 37, '103', '9', '248', '3', '53', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '182', 'b6'),
(4758, 37, '103', '16', '248', '4', '53', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '123', '7b'),
(4759, 37, '103', '25', '248', '5', '53', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '13', '0d'),
(4760, 36, '170', '1', '185', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '207', 'cf'),
(4761, 36, '170', '4', '185', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '131', '83'),
(4762, 36, '170', '9', '185', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '138', '8a'),
(4763, 36, '170', '16', '185', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '228', 'e4'),
(4764, 36, '170', '25', '185', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '144', '90'),
(4765, 36, '85', '1', '19', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '221', 'dd'),
(4766, 36, '85', '4', '19', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '238', 'ee'),
(4767, 36, '85', '9', '19', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '168', 'a8'),
(4768, 36, '85', '16', '19', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '11', '0b'),
(4769, 36, '85', '25', '19', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '24', '18'),
(4770, 36, '215', '1', '86', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '152', '98'),
(4771, 36, '215', '4', '86', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '112', '70'),
(4772, 36, '215', '9', '86', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '245', 'f5'),
(4773, 36, '215', '16', '86', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '37', '25'),
(4774, 36, '215', '25', '86', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '2', '02'),
(4775, 36, '232', '1', '95', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '191', 'bf'),
(4776, 36, '232', '4', '95', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '211', 'd3'),
(4777, 36, '232', '9', '95', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '181', 'b5'),
(4778, 36, '232', '16', '95', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '101', '65'),
(4779, 36, '232', '25', '95', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '228', 'e4'),
(4780, 36, '169', '1', '238', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '4', '04'),
(4781, 36, '169', '4', '238', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '235', 'eb'),
(4782, 36, '169', '9', '238', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '33', '21'),
(4783, 36, '169', '16', '238', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '169', 'a9'),
(4784, 36, '169', '25', '238', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '129', '81'),
(4785, 36, '24', '1', '47', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '181', 'b5'),
(4786, 36, '24', '4', '47', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '43', '2b'),
(4787, 36, '24', '9', '47', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '210', 'd2'),
(4788, 36, '24', '16', '47', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '168', 'a8'),
(4789, 36, '24', '25', '47', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '174', 'ae'),
(4790, 36, '235', '1', '40', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '129', '81'),
(4791, 36, '235', '4', '40', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '103', '67'),
(4792, 36, '235', '9', '40', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '33', '21'),
(4793, 36, '235', '16', '40', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '176', 'b0'),
(4794, 36, '235', '25', '40', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '18', '12'),
(4795, 36, '33', '1', '252', '1', '52', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '80', '50'),
(4796, 36, '33', '4', '252', '2', '52', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '174', 'ae'),
(4797, 36, '33', '9', '252', '3', '52', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '77', '4d'),
(4798, 36, '33', '16', '252', '4', '52', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '46', '2e'),
(4799, 36, '33', '25', '252', '5', '52', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '81', '51'),
(4800, 35, '239', '1', '247', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '81', '51'),
(4801, 35, '239', '4', '247', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '17', '11'),
(4802, 35, '239', '9', '247', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '174', 'ae'),
(4803, 35, '239', '16', '247', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '38', '26'),
(4804, 35, '239', '25', '247', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '123', '7b'),
(4805, 35, '55', '1', '169', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '84', '54'),
(4806, 35, '55', '4', '169', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '161', 'a1'),
(4807, 35, '55', '9', '169', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '91', '5b'),
(4808, 35, '55', '16', '169', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '131', '83'),
(4809, 35, '55', '25', '169', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '24', '18'),
(4810, 35, '162', '1', '206', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '219', 'db'),
(4811, 35, '162', '4', '206', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '140', '8c'),
(4812, 35, '162', '9', '206', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '128', '80'),
(4813, 35, '162', '16', '206', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '183', 'b7'),
(4814, 35, '162', '25', '206', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '48', '30'),
(4815, 35, '206', '1', '37', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '107', '6b'),
(4816, 35, '206', '4', '37', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '248', 'f8'),
(4817, 35, '206', '9', '37', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '30', '1e'),
(4818, 35, '206', '16', '37', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '224', 'e0'),
(4819, 35, '206', '25', '37', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '59', '3b'),
(4820, 35, '230', '1', '172', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '256', '100'),
(4821, 35, '230', '4', '172', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '90', '5a'),
(4822, 35, '230', '9', '172', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '127', '7f'),
(4823, 35, '230', '16', '172', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '110', '6e'),
(4824, 35, '230', '25', '172', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '39', '27'),
(4825, 35, '10', '1', '155', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '18', '12'),
(4826, 35, '10', '4', '155', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '203', 'cb'),
(4827, 35, '10', '9', '155', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '151', '97'),
(4828, 35, '10', '16', '155', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '119', '77'),
(4829, 35, '10', '25', '155', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '107', '6b'),
(4830, 35, '51', '1', '147', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '52', '34'),
(4831, 35, '51', '4', '147', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '95', '5f'),
(4832, 35, '51', '9', '147', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '240', 'f0'),
(4833, 35, '51', '16', '147', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '230', 'e6'),
(4834, 35, '51', '25', '147', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '65', '41'),
(4835, 35, '125', '1', '93', '1', '51', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '12', '0c'),
(4836, 35, '125', '4', '93', '2', '51', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '223', 'df'),
(4837, 35, '125', '9', '93', '3', '51', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '170', 'aa'),
(4838, 35, '125', '16', '93', '4', '51', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '110', '6e'),
(4839, 35, '125', '25', '93', '5', '51', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '43', '2b'),
(4840, 34, '161', '1', '256', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '12', '0c'),
(4841, 34, '161', '4', '256', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '237', 'ed'),
(4842, 34, '161', '9', '256', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '13', '0d'),
(4843, 34, '161', '16', '256', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '111', '6f'),
(4844, 34, '161', '25', '256', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '17', '11'),
(4845, 34, '54', '1', '95', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '9', '09'),
(4846, 34, '54', '4', '95', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '9', '09'),
(4847, 34, '54', '9', '95', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '117', '75'),
(4848, 34, '54', '16', '95', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '76', '4c'),
(4849, 34, '54', '25', '95', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '143', '8f'),
(4850, 34, '16', '1', '221', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '88', '58'),
(4851, 34, '16', '4', '221', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '100', '64'),
(4852, 34, '16', '9', '221', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '144', '90'),
(4853, 34, '16', '16', '221', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '220', 'dc'),
(4854, 34, '16', '25', '221', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '71', '47'),
(4855, 34, '95', '1', '149', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '108', '6c'),
(4856, 34, '95', '4', '149', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '28', '1c'),
(4857, 34, '95', '9', '149', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '138', '8a'),
(4858, 34, '95', '16', '149', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '181', 'b5'),
(4859, 34, '95', '25', '149', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '157', '9d'),
(4860, 34, '219', '1', '2', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '75', '4b');
INSERT INTO `tb_sharesss` (`id`, `idfile`, `koef1`, `koef1_pangkat2`, `koef2`, `koef2_pangkat1`, `variable_code`, `bagian`, `max`, `min`, `part_no`, `char_no`, `hasil_dec`, `hasil`) VALUES
(4861, 34, '219', '4', '2', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '220', 'dc'),
(4862, 34, '219', '9', '2', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '32', '20'),
(4863, 34, '219', '16', '2', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '25', '19'),
(4864, 34, '219', '25', '2', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '199', 'c7'),
(4865, 34, '96', '1', '256', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '205', 'cd'),
(4866, 34, '96', '4', '256', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '235', 'eb'),
(4867, 34, '96', '9', '256', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '200', 'c8'),
(4868, 34, '96', '16', '256', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '100', '64'),
(4869, 34, '96', '25', '256', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '192', 'c0'),
(4870, 34, '26', '1', '35', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '172', 'ac'),
(4871, 34, '26', '4', '35', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '28', '1c'),
(4872, 34, '26', '9', '35', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '193', 'c1'),
(4873, 34, '26', '16', '35', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '153', '99'),
(4874, 34, '26', '25', '35', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '165', 'a5'),
(4875, 34, '18', '1', '2', '1', '50', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '70', '46'),
(4876, 34, '18', '4', '2', '2', '50', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '126', '7e'),
(4877, 34, '18', '9', '2', '3', '50', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '218', 'da'),
(4878, 34, '18', '16', '2', '4', '50', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '89', '59'),
(4879, 34, '18', '25', '2', '5', '50', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '253', 'fd'),
(4880, 33, '32', '1', '243', '1', '109', 'Max-5-Min-03-Part_No-01-Char_No-1', '5', '03', '01', '1', '127', '7f'),
(4881, 33, '32', '4', '243', '2', '109', 'Max-5-Min-03-Part_No-02-Char_No-1', '5', '03', '02', '1', '209', 'd1'),
(4882, 33, '32', '9', '243', '3', '109', 'Max-5-Min-03-Part_No-03-Char_No-1', '5', '03', '03', '1', '98', '62'),
(4883, 33, '32', '16', '243', '4', '109', 'Max-5-Min-03-Part_No-04-Char_No-1', '5', '03', '04', '1', '51', '33'),
(4884, 33, '32', '25', '243', '5', '109', 'Max-5-Min-03-Part_No-05-Char_No-1', '5', '03', '05', '1', '68', '44'),
(4885, 33, '228', '1', '204', '1', '117', 'Max-5-Min-03-Part_No-01-Char_No-2', '5', '03', '01', '2', '35', '23'),
(4886, 33, '228', '4', '204', '2', '117', 'Max-5-Min-03-Part_No-02-Char_No-2', '5', '03', '02', '2', '152', '98'),
(4887, 33, '228', '9', '204', '3', '117', 'Max-5-Min-03-Part_No-03-Char_No-2', '5', '03', '03', '2', '211', 'd3'),
(4888, 33, '228', '16', '204', '4', '117', 'Max-5-Min-03-Part_No-04-Char_No-2', '5', '03', '04', '2', '212', 'd4'),
(4889, 33, '228', '25', '204', '5', '117', 'Max-5-Min-03-Part_No-05-Char_No-2', '5', '03', '05', '2', '155', '9b'),
(4890, 33, '179', '1', '134', '1', '108', 'Max-5-Min-03-Part_No-01-Char_No-3', '5', '03', '01', '3', '164', 'a4'),
(4891, 33, '179', '4', '134', '2', '108', 'Max-5-Min-03-Part_No-02-Char_No-3', '5', '03', '02', '3', '64', '40'),
(4892, 33, '179', '9', '134', '3', '108', 'Max-5-Min-03-Part_No-03-Char_No-3', '5', '03', '03', '3', '65', '41'),
(4893, 33, '179', '16', '134', '4', '108', 'Max-5-Min-03-Part_No-04-Char_No-3', '5', '03', '04', '3', '167', 'a7'),
(4894, 33, '179', '25', '134', '5', '108', 'Max-5-Min-03-Part_No-05-Char_No-3', '5', '03', '05', '3', '113', '71'),
(4895, 33, '124', '1', '165', '1', '121', 'Max-5-Min-03-Part_No-01-Char_No-4', '5', '03', '01', '4', '153', '99'),
(4896, 33, '124', '4', '165', '2', '121', 'Max-5-Min-03-Part_No-02-Char_No-4', '5', '03', '02', '4', '176', 'b0'),
(4897, 33, '124', '9', '165', '3', '121', 'Max-5-Min-03-Part_No-03-Char_No-4', '5', '03', '03', '4', '190', 'be'),
(4898, 33, '124', '16', '165', '4', '121', 'Max-5-Min-03-Part_No-04-Char_No-4', '5', '03', '04', '4', '195', 'c3'),
(4899, 33, '124', '25', '165', '5', '121', 'Max-5-Min-03-Part_No-05-Char_No-4', '5', '03', '05', '4', '191', 'bf'),
(4900, 33, '0', '1', '178', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-5', '5', '03', '01', '5', '32', '20'),
(4901, 33, '0', '4', '178', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-5', '5', '03', '02', '5', '210', 'd2'),
(4902, 33, '0', '9', '178', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-5', '5', '03', '03', '5', '131', '83'),
(4903, 33, '0', '16', '178', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-5', '5', '03', '04', '5', '52', '34'),
(4904, 33, '0', '25', '178', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-5', '5', '03', '05', '5', '230', 'e6'),
(4905, 33, '53', '1', '230', '1', '110', 'Max-5-Min-03-Part_No-01-Char_No-6', '5', '03', '01', '6', '136', '88'),
(4906, 33, '53', '4', '230', '2', '110', 'Max-5-Min-03-Part_No-02-Char_No-6', '5', '03', '02', '6', '11', '0b'),
(4907, 33, '53', '9', '230', '3', '110', 'Max-5-Min-03-Part_No-03-Char_No-6', '5', '03', '03', '6', '249', 'f9'),
(4908, 33, '53', '16', '230', '4', '110', 'Max-5-Min-03-Part_No-04-Char_No-6', '5', '03', '04', '6', '79', '4f'),
(4909, 33, '53', '25', '230', '5', '110', 'Max-5-Min-03-Part_No-05-Char_No-6', '5', '03', '05', '6', '15', '0f'),
(4910, 33, '134', '1', '232', '1', '111', 'Max-5-Min-03-Part_No-01-Char_No-7', '5', '03', '01', '7', '220', 'dc'),
(4911, 33, '134', '4', '232', '2', '111', 'Max-5-Min-03-Part_No-02-Char_No-7', '5', '03', '02', '7', '83', '53'),
(4912, 33, '134', '9', '232', '3', '111', 'Max-5-Min-03-Part_No-03-Char_No-7', '5', '03', '03', '7', '214', 'd6'),
(4913, 33, '134', '16', '232', '4', '111', 'Max-5-Min-03-Part_No-04-Char_No-7', '5', '03', '04', '7', '99', '63'),
(4914, 33, '134', '25', '232', '5', '111', 'Max-5-Min-03-Part_No-05-Char_No-7', '5', '03', '05', '7', '252', 'fc'),
(4915, 33, '236', '1', '70', '1', '49', 'Max-5-Min-03-Part_No-01-Char_No-8', '5', '03', '01', '8', '98', '62'),
(4916, 33, '236', '4', '70', '2', '49', 'Max-5-Min-03-Part_No-02-Char_No-8', '5', '03', '02', '8', '105', '69'),
(4917, 33, '236', '9', '70', '3', '49', 'Max-5-Min-03-Part_No-03-Char_No-8', '5', '03', '03', '8', '70', '46'),
(4918, 33, '236', '16', '70', '4', '49', 'Max-5-Min-03-Part_No-04-Char_No-8', '5', '03', '04', '8', '250', 'fa'),
(4919, 33, '236', '25', '70', '5', '49', 'Max-5-Min-03-Part_No-05-Char_No-8', '5', '03', '05', '8', '131', '83'),
(4920, 39, '185', '1', '41', '1', '115', 'Max-4-Min-03-Part_No-01-Char_No-1', '4', '03', '01', '1', '84', '54'),
(4921, 39, '185', '4', '41', '2', '115', 'Max-4-Min-03-Part_No-02-Char_No-1', '4', '03', '02', '1', '166', 'a6'),
(4922, 39, '185', '9', '41', '3', '115', 'Max-4-Min-03-Part_No-03-Char_No-1', '4', '03', '03', '1', '104', '68'),
(4923, 39, '185', '16', '41', '4', '115', 'Max-4-Min-03-Part_No-04-Char_No-1', '4', '03', '04', '1', '155', '9b'),
(4924, 39, '175', '1', '87', '1', '101', 'Max-4-Min-03-Part_No-01-Char_No-2', '4', '03', '01', '2', '106', '6a'),
(4925, 39, '175', '4', '87', '2', '101', 'Max-4-Min-03-Part_No-02-Char_No-2', '4', '03', '02', '2', '204', 'cc'),
(4926, 39, '175', '9', '87', '3', '101', 'Max-4-Min-03-Part_No-03-Char_No-2', '4', '03', '03', '2', '138', '8a'),
(4927, 39, '175', '16', '87', '4', '101', 'Max-4-Min-03-Part_No-04-Char_No-2', '4', '03', '04', '2', '165', 'a5'),
(4928, 39, '194', '1', '135', '1', '109', 'Max-4-Min-03-Part_No-01-Char_No-3', '4', '03', '01', '3', '181', 'b5'),
(4929, 39, '194', '4', '135', '2', '109', 'Max-4-Min-03-Part_No-02-Char_No-3', '4', '03', '02', '3', '127', '7f'),
(4930, 39, '194', '9', '135', '3', '109', 'Max-4-Min-03-Part_No-03-Char_No-3', '4', '03', '03', '3', '204', 'cc'),
(4931, 39, '194', '16', '135', '4', '109', 'Max-4-Min-03-Part_No-04-Char_No-3', '4', '03', '04', '3', '155', '9b'),
(4932, 39, '247', '1', '218', '1', '105', 'Max-4-Min-03-Part_No-01-Char_No-4', '4', '03', '01', '4', '56', '38'),
(4933, 39, '247', '4', '218', '2', '105', 'Max-4-Min-03-Part_No-02-Char_No-4', '4', '03', '02', '4', '244', 'f4'),
(4934, 39, '247', '9', '218', '3', '105', 'Max-4-Min-03-Part_No-03-Char_No-4', '4', '03', '03', '4', '155', '9b'),
(4935, 39, '247', '16', '218', '4', '105', 'Max-4-Min-03-Part_No-04-Char_No-4', '4', '03', '04', '4', '46', '2e'),
(4936, 39, '52', '1', '222', '1', '110', 'Max-4-Min-03-Part_No-01-Char_No-5', '4', '03', '01', '5', '127', '7f'),
(4937, 39, '52', '4', '222', '2', '110', 'Max-4-Min-03-Part_No-02-Char_No-5', '4', '03', '02', '5', '248', 'f8'),
(4938, 39, '52', '9', '222', '3', '110', 'Max-4-Min-03-Part_No-03-Char_No-5', '4', '03', '03', '5', '216', 'd8'),
(4939, 39, '52', '16', '222', '4', '110', 'Max-4-Min-03-Part_No-04-Char_No-5', '4', '03', '04', '5', '31', '1f'),
(4940, 39, '15', '1', '74', '1', '97', 'Max-4-Min-03-Part_No-01-Char_No-6', '4', '03', '01', '6', '186', 'ba'),
(4941, 39, '15', '4', '74', '2', '97', 'Max-4-Min-03-Part_No-02-Char_No-6', '4', '03', '02', '6', '48', '30'),
(4942, 39, '15', '9', '74', '3', '97', 'Max-4-Min-03-Part_No-03-Char_No-6', '4', '03', '03', '6', '197', 'c5'),
(4943, 39, '15', '16', '74', '4', '97', 'Max-4-Min-03-Part_No-04-Char_No-6', '4', '03', '04', '6', '119', '77'),
(4944, 39, '76', '1', '114', '1', '114', 'Max-4-Min-03-Part_No-01-Char_No-7', '4', '03', '01', '7', '47', '2f'),
(4945, 39, '76', '4', '114', '2', '114', 'Max-4-Min-03-Part_No-02-Char_No-7', '4', '03', '02', '7', '132', '84'),
(4946, 39, '76', '9', '114', '3', '114', 'Max-4-Min-03-Part_No-03-Char_No-7', '4', '03', '03', '7', '112', '70'),
(4947, 39, '76', '16', '114', '4', '114', 'Max-4-Min-03-Part_No-04-Char_No-7', '4', '03', '04', '7', '244', 'f4'),
(4948, 39, '177', '1', '190', '1', '105', 'Max-4-Min-03-Part_No-01-Char_No-8', '4', '03', '01', '8', '215', 'd7'),
(4949, 39, '177', '4', '190', '2', '105', 'Max-4-Min-03-Part_No-02-Char_No-8', '4', '03', '02', '8', '165', 'a5'),
(4950, 39, '177', '9', '190', '3', '105', 'Max-4-Min-03-Part_No-03-Char_No-8', '4', '03', '03', '8', '212', 'd4'),
(4951, 39, '177', '16', '190', '4', '105', 'Max-4-Min-03-Part_No-04-Char_No-8', '4', '03', '04', '8', '99', '63'),
(4952, 39, '74', '1', '207', '1', '115', 'Max-4-Min-03-Part_No-01-Char_No-9', '4', '03', '01', '9', '139', '8b'),
(4953, 39, '74', '4', '207', '2', '115', 'Max-4-Min-03-Part_No-02-Char_No-9', '4', '03', '02', '9', '54', '36'),
(4954, 39, '74', '9', '207', '3', '115', 'Max-4-Min-03-Part_No-03-Char_No-9', '4', '03', '03', '9', '117', '75'),
(4955, 39, '74', '16', '207', '4', '115', 'Max-4-Min-03-Part_No-04-Char_No-9', '4', '03', '04', '9', '71', '47'),
(4956, 39, '138', '1', '165', '1', '105', 'Max-4-Min-03-Part_No-01-Char_No-10', '4', '03', '01', '10', '151', '97'),
(4957, 39, '138', '4', '165', '2', '105', 'Max-4-Min-03-Part_No-02-Char_No-10', '4', '03', '02', '10', '216', 'd8'),
(4958, 39, '138', '9', '165', '3', '105', 'Max-4-Min-03-Part_No-03-Char_No-10', '4', '03', '03', '10', '43', '2b'),
(4959, 39, '138', '16', '165', '4', '105', 'Max-4-Min-03-Part_No-04-Char_No-10', '4', '03', '04', '10', '146', '92'),
(4960, 40, '147', '1', '106', '1', '116', 'Max-3-Min-03-Part_No-01-Char_No-1', '3', '03', '01', '1', '112', '70'),
(4961, 40, '147', '4', '106', '2', '116', 'Max-3-Min-03-Part_No-02-Char_No-1', '3', '03', '02', '1', '145', '91'),
(4962, 40, '147', '9', '106', '3', '116', 'Max-3-Min-03-Part_No-03-Char_No-1', '3', '03', '03', '1', '215', 'd7'),
(4963, 40, '242', '1', '131', '1', '101', 'Max-3-Min-03-Part_No-01-Char_No-2', '3', '03', '01', '2', '217', 'd9'),
(4964, 40, '242', '4', '131', '2', '101', 'Max-3-Min-03-Part_No-02-Char_No-2', '3', '03', '02', '2', '46', '2e'),
(4965, 40, '242', '9', '131', '3', '101', 'Max-3-Min-03-Part_No-03-Char_No-2', '3', '03', '03', '2', '102', '66'),
(4966, 40, '109', '1', '31', '1', '115', 'Max-3-Min-03-Part_No-01-Char_No-3', '3', '03', '01', '3', '255', 'ff'),
(4967, 40, '109', '4', '31', '2', '115', 'Max-3-Min-03-Part_No-02-Char_No-3', '3', '03', '02', '3', '99', '63'),
(4968, 40, '109', '9', '31', '3', '115', 'Max-3-Min-03-Part_No-03-Char_No-3', '3', '03', '03', '3', '161', 'a1'),
(4969, 40, '186', '1', '12', '1', '116', 'Max-3-Min-03-Part_No-01-Char_No-4', '3', '03', '01', '4', '57', '39'),
(4970, 40, '186', '4', '12', '2', '116', 'Max-3-Min-03-Part_No-02-Char_No-4', '3', '03', '02', '4', '113', '71'),
(4971, 40, '186', '9', '12', '3', '116', 'Max-3-Min-03-Part_No-03-Char_No-4', '3', '03', '03', '4', '27', '1b'),
(4972, 40, '188', '1', '168', '1', '105', 'Max-3-Min-03-Part_No-01-Char_No-5', '3', '03', '01', '5', '204', 'cc'),
(4973, 40, '188', '4', '168', '2', '105', 'Max-3-Min-03-Part_No-02-Char_No-5', '3', '03', '02', '5', '165', 'a5'),
(4974, 40, '188', '9', '168', '3', '105', 'Max-3-Min-03-Part_No-03-Char_No-5', '3', '03', '03', '5', '245', 'f5'),
(4975, 40, '11', '1', '24', '1', '110', 'Max-3-Min-03-Part_No-01-Char_No-6', '3', '03', '01', '6', '145', '91'),
(4976, 40, '11', '4', '24', '2', '110', 'Max-3-Min-03-Part_No-02-Char_No-6', '3', '03', '02', '6', '202', 'ca'),
(4977, 40, '11', '9', '24', '3', '110', 'Max-3-Min-03-Part_No-03-Char_No-6', '3', '03', '03', '6', '24', '18'),
(4978, 40, '213', '1', '193', '1', '103', 'Max-3-Min-03-Part_No-01-Char_No-7', '3', '03', '01', '7', '252', 'fc'),
(4979, 40, '213', '4', '193', '2', '103', 'Max-3-Min-03-Part_No-02-Char_No-7', '3', '03', '02', '7', '56', '38'),
(4980, 40, '213', '9', '193', '3', '103', 'Max-3-Min-03-Part_No-03-Char_No-7', '3', '03', '03', '7', '29', '1d');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaction`
--

CREATE TABLE `tb_transaction` (
  `idtransaction` int(11) NOT NULL,
  `transactioncode` varchar(100) NOT NULL,
  `idfile` int(11) NOT NULL,
  `iduser_req` int(11) NOT NULL,
  `date_req` datetime NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaction`
--

INSERT INTO `tb_transaction` (`idtransaction`, `transactioncode`, `idfile`, `iduser_req`, `date_req`, `iduser_by`, `date_at`) VALUES
(15, 'PO-20190511_13_19', 13, 19, '2019-05-11 03:06:24', 19, '2019-05-11 03:06:24'),
(16, 'PO-20190511_13_40', 13, 40, '2019-05-11 03:17:50', 40, '2019-05-11 03:17:50'),
(17, 'PO-20190512_13_14', 13, 14, '2019-05-12 17:41:47', 14, '2019-05-12 17:41:47'),
(18, 'PO-20190513_14_14', 14, 14, '2019-05-13 00:22:44', 14, '2019-05-13 00:22:44'),
(19, 'PO-20190513_13_15', 13, 15, '2019-05-13 02:24:33', 15, '2019-05-13 02:24:33'),
(20, 'PO-20190513_17_15', 17, 15, '2019-05-13 02:24:38', 15, '2019-05-13 02:24:38'),
(21, 'PO-20190513_20_15', 20, 15, '2019-05-13 02:24:41', 15, '2019-05-13 02:24:41'),
(22, 'PO-20190513_14_16', 14, 16, '2019-05-13 02:25:11', 16, '2019-05-13 02:25:11'),
(23, 'PO-20190513_16_16', 16, 16, '2019-05-13 02:25:12', 16, '2019-05-13 02:25:12'),
(24, 'PO-20190513_18_16', 18, 16, '2019-05-13 02:25:13', 16, '2019-05-13 02:25:13'),
(25, 'PO-20190513_21_16', 21, 16, '2019-05-13 02:25:15', 16, '2019-05-13 02:25:15'),
(26, 'PO-20190513_21_17', 21, 17, '2019-05-13 02:33:08', 17, '2019-05-13 02:33:08'),
(27, 'PO-20190513_18_17', 18, 17, '2019-05-13 02:33:11', 17, '2019-05-13 02:33:11'),
(28, 'PO-20190513_16_17', 16, 17, '2019-05-13 02:33:15', 17, '2019-05-13 02:33:15'),
(29, 'PO-20190513_14_17', 14, 17, '2019-05-13 02:33:19', 17, '2019-05-13 02:33:19'),
(30, 'PO-20190513_15_19', 15, 19, '2019-05-13 02:50:33', 19, '2019-05-13 02:50:33'),
(31, 'PO-20190513_17_19', 17, 19, '2019-05-13 02:50:36', 19, '2019-05-13 02:50:36'),
(32, 'PO-20190513_19_19', 19, 19, '2019-05-13 02:50:39', 19, '2019-05-13 02:50:39'),
(33, 'PO-20190514_23_19', 23, 19, '2019-05-14 22:46:35', 19, '2019-05-14 22:46:35'),
(34, 'PO-20190514_26_19', 26, 19, '2019-05-14 22:46:38', 19, '2019-05-14 22:46:38'),
(35, 'PO-20190514_29_19', 29, 19, '2019-05-14 22:46:40', 19, '2019-05-14 22:46:40'),
(36, 'PO-20190514_32_19', 32, 19, '2019-05-14 22:46:43', 19, '2019-05-14 22:46:43'),
(37, 'PO-20190514_23_40', 23, 40, '2019-05-14 22:47:21', 40, '2019-05-14 22:47:21'),
(38, 'PO-20190514_25_40', 25, 40, '2019-05-14 22:47:23', 40, '2019-05-14 22:47:23'),
(39, 'PO-20190514_27_40', 27, 40, '2019-05-14 22:47:26', 40, '2019-05-14 22:47:26'),
(40, 'PO-20190514_29_40', 29, 40, '2019-05-14 22:47:29', 40, '2019-05-14 22:47:29'),
(41, 'PO-20190514_31_40', 31, 40, '2019-05-14 22:47:32', 40, '2019-05-14 22:47:32'),
(42, 'PO-20190515_33_33', 33, 33, '2019-05-15 18:45:48', 33, '2019-05-15 18:45:48'),
(43, 'PO-20190614_15_33', 15, 33, '2019-06-14 17:39:25', 33, '2019-06-14 17:39:25'),
(45, 'PO-20190622_25_14', 25, 14, '2019-06-22 14:26:17', 14, '2019-06-22 14:26:17'),
(46, 'PO-20190708_13_19', 13, 19, '2019-07-08 20:45:32', 19, '2019-07-08 20:45:32'),
(47, 'PO-20190719_33_33', 33, 33, '2019-07-19 20:13:20', 33, '2019-07-19 20:13:20'),
(48, 'PO-20190728_37_43', 37, 43, '2019-07-28 22:43:54', 43, '2019-07-28 22:43:54'),
(49, 'PO-20190802_38_19', 38, 19, '2019-08-02 14:20:48', 19, '2019-08-02 14:20:48'),
(50, 'PO-20190802_39_19', 39, 19, '2019-08-02 14:48:17', 19, '2019-08-02 14:48:17'),
(51, 'PO-20190802_39_33', 39, 33, '2019-08-02 22:38:44', 33, '2019-08-02 22:38:44');

--
-- Triggers `tb_transaction`
--
DELIMITER $$
CREATE TRIGGER `after_create-transaction` AFTER INSERT ON `tb_transaction` FOR EACH ROW BEGIN
	INSERT INTO tb_logtransaction SET
    note 			= "Create",
    idtransaction 	= new.idtransaction,
    transactioncode = new.transactioncode,
    idfile			= new.idfile,
    iduser_req		= new.iduser_req,
    date_req		= new.date_req,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-transaction` AFTER DELETE ON `tb_transaction` FOR EACH ROW BEGIN
	INSERT INTO tb_logtransaction SET
    note 			= "Delete",
    idtransaction 	= old.idtransaction,
    transactioncode = old.transactioncode,
    idfile			= old.idfile,
    iduser_req		= old.iduser_req,
    date_req		= old.date_req,
    updated_by		= old.iduser_by,
    updated_at		= NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_upate-transaction` AFTER UPDATE ON `tb_transaction` FOR EACH ROW BEGIN
	INSERT INTO tb_logtransaction SET
    note 			= "Update",
    idtransaction 	= new.idtransaction,
    transactioncode = new.transactioncode,
    idfile			= new.idfile,
    iduser_req		= new.iduser_req,
    date_req		= new.date_req,
    updated_by		= new.iduser_by,
    updated_at		= new.date_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `iduser` int(11) NOT NULL,
  `email` varchar(99) NOT NULL,
  `username` varchar(33) NOT NULL,
  `encrypted_password` varchar(99) NOT NULL,
  `salt` varchar(11) NOT NULL,
  `info` varchar(10) NOT NULL,
  `idcompany` int(11) NOT NULL,
  `iduser_by` int(11) NOT NULL,
  `date_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`iduser`, `email`, `username`, `encrypted_password`, `salt`, `info`, `idcompany`, `iduser_by`, `date_at`) VALUES
(12, 'dewi.sarfika@pertamina.com', 'Dewi Sarfika', '2muBVeS245qZdeJ2AW6nCiT7Zu1iMzVjMGNkMjk0Yw==', 'b35c0cd294c', 'Active', 1, 0, '2019-04-17 00:20:39'),
(13, 'fransisca.dyah@pertamina.com', 'Fransisca Dyah', 'YBg1Oi2DCnBI+qJgW9f9PgysxpdiMWM5NGI4NDFjOA==', 'b1c94b841c8', 'Active', 6, 12, '2019-04-19 00:59:08'),
(14, 'gunawan.bayu@pertamina.com', 'Gunawan Bayu', 'T9wWmahHlD+A5j6t0Eaqglnlxx5iMWI5ODY5OTAzMw==', 'b1b98699033', 'Active', 7, 14, '2019-05-14 02:24:25'),
(15, 'arif.rachman@pertamina.com', 'Arif Rachman', 'CpOoxwEG81NM8Ymu469ac6VmcCdhYjM5ZWMyM2ZmNA==', 'ab39ec23ff4', 'Active', 7, 12, '2019-04-19 01:00:25'),
(16, 'deo.vrima@pertamina.com', 'Deo Vrima', 'wa3FwjM6dlt/mhlnOtzDu08Z6ERlYjg0MGNmNWY2NQ==', 'eb840cf5f65', 'Active', 7, 12, '2019-04-19 01:01:50'),
(17, 'donny.hesya@pertamina.com', 'Donny Hesya', 'Egs+P7kmaTYIT1L3HBAkQ+2pqhllYjI0OGMwNmQzMQ==', 'eb248c06d31', 'Active', 7, 12, '2019-04-19 01:08:23'),
(18, 'gunadi@pertamina.com', 'Gunadi', 'ZQifcHnzPsIMd55XBekZwrG1Pjc4YmNjMmRkZjAxZg==', '8bcc2ddf01f', 'Active', 7, 12, '2019-04-19 01:09:31'),
(19, 'zufrian.firliansyah@pertamina.com', 'Zufrian Firliansyah', 'o5ES9SpvB7TTUgWFnrLd0ePchiY2NTlhYjFkNGZjNw==', '659ab1d4fc7', 'Active', 12, 12, '2019-04-19 01:11:06'),
(20, 'krisnanto.nugroho@pertamina.com', 'Krisnanto Nugroho', 'SyxtARGAIc6AhSQmLExLBMJjYSU4ZjNlYTM0YmQ5YQ==', '8f3ea34bd9a', 'Active', 1, 12, '2019-05-01 18:42:50'),
(21, 'yudha.nenggala@pertamina.com', 'Yudha Nenggala', 'xC8nJB/j69MWW5w4TOtTiB62UsUxMmFiY2QzZTg0Yg==', '12abcd3e84b', 'Active', 1, 12, '2019-05-01 18:43:13'),
(24, 'yuninggar.dwi@pertamina.com', 'Yuninggar Dwi', '61AxAU1go+VBoYyAt1U+7+MCKlpjYmQzNGJlOTllMw==', 'cbd34be99e3', 'Active', 6, 12, '2019-05-01 18:45:58'),
(25, 'ifal.rahman@pertamina.com', 'Ifal Rahman', 'pkTh3rh++1X0IGP/vaxUHiywL4k5ZjNiZGJmNjA1Mg==', '9f3bdbf6052', 'Active', 6, 12, '2019-05-01 18:46:24'),
(28, 'irfan.aziz@pertamina.com', 'Irfan Aziz', '5OmzMhN6rsFnuxlB8FDdeWxlsRpkOGU3MzIyYWUzMQ==', 'd8e7322ae31', 'Active', 8, 12, '2019-05-01 18:48:31'),
(29, 'jumardi.sudirman@pertamina.com', 'Jumardi Sudirman', 'iQnqLOEuAzduk8FZN2u1g+5rOR0zOWE3ZTQyY2QwYg==', '39a7e42cd0b', 'Active', 8, 12, '2019-05-01 18:48:55'),
(30, 'lamijan@pertamina.com', 'Lamijan', 'Up424W1MUbygnlnXrvY3hE/W+YpkOTM3ZWY4ZjgzNw==', 'd937ef8f837', 'Active', 8, 12, '2019-05-01 18:49:48'),
(31, 'lingga.galih@pertamina.com', 'Lingga Galih', '9QaZf+8cSn1YKJy3j3xWlT0Q0bVlMzBjZTlhNzE2MQ==', 'e30ce9a7161', 'Active', 8, 12, '2019-05-01 18:50:18'),
(32, 'mohammad.kafi@pertamina.com', 'Mohammad Kafi', 'TBDhrD9zx1xRfZRpYy7NLjTpTABlMWY4ZTkwZjE0Yw==', 'e1f8e90f14c', 'Active', 8, 12, '2019-05-01 18:50:49'),
(33, 'mulyono@pertamina.com', 'Mulyono', 'GgyZLteUrcC9gFgALUexS5shf41iMDgzNmQ5YTY1OA==', 'b0836d9a658', 'Active', 9, 12, '2019-05-01 18:53:36'),
(34, 'nabilah.dwi@pertamina.com', 'Nabilah Dwi', 'RF55v3qs+F7T01kqon8zRH3GYRk2MDlmZDZjYmEzYw==', '609fd6cba3c', 'Active', 9, 12, '2019-05-01 18:54:05'),
(35, 'rahayu.winarni@pertamina.com', 'Rahayu Winarni', 'Dz3PKnJnOAtyw16sySyj0+PMm6Q0YWZjMjc3M2ExZg==', '4afc2773a1f', 'Active', 9, 12, '2019-05-01 18:54:55'),
(36, 'reza.muhammad@pertamina.com', 'Reza Muhammad', '0BLLF8kcabi5JSpQMlZkXok62n5lZWY1MTI4ODM3Mw==', 'eef51288373', 'Active', 9, 12, '2019-05-01 18:55:34'),
(37, 'rian.antoni@pertamina.com', 'Rian Antoni', 'rT9AE7rT1alrgDuulDA2xdQ8i9gwM2IxOTIyYjI2Zg==', '03b1922b26f', 'Active', 9, 12, '2019-05-01 19:45:04'),
(38, 'adhityawarman@pertamina.com', 'Adhityawarman', '6aTb7OZTgElRHjStM2JZhj4iTZ04ZDJjYzI0YmE2Ng==', '8d2cc24ba66', 'Active', 12, 12, '2019-05-01 18:59:04'),
(39, 'agus.pratikno@pertamina.com', 'Agus Pratikno', 'QC6h58rzyOTiFCVgBZog+fcIwkgzMTNhYzliYjQzYQ==', '313ac9bb43a', 'Active', 12, 12, '2019-05-01 19:01:07'),
(40, 'angga.arista.putra@pertamina.com', 'Angga Arista Putra', 'U8z5Td8Q6DGjvqw+Q0vFBk99+TplYTE2MjAxOWQ2MQ==', 'ea162019d61', 'Active', 13, 12, '2019-05-01 19:01:31'),
(41, 'ferizal.arifin@pertamina.com', 'Ferizal Arifin', 'PTJlfwh6VEd9thJW8/EvuLDGJcY2M2ViYmMzZGNkOA==', '63ebbc3dcd8', 'Active', 13, 12, '2019-05-01 19:02:29'),
(42, 'yogi.dwiarto@pertamina.com', 'Yogi Dwiarto', '/Cfgsk8uryOE+idhHmAC/PvDHDcwNWE1M2UzNjk2ZQ==', '05a53e3696e', 'Active', 13, 12, '2019-05-01 19:02:56'),
(43, 'dodi.alian@pertamina.com', 'Dodi Alian', '8ekqA4IH0bRQ4EwoPiMfgt0uaz5jNzQxMGI0MjhiZA==', 'c7410b428bd', 'Active', 16, 12, '2019-05-01 19:03:27'),
(44, 'eko.budiono@pertamina.com', 'Eko Budiono', 'X1i+63bCq9GYsckinoPgYg/mMP8yYzk5NWQwOTdhOA==', '2c995d097a8', 'Active', 16, 12, '2019-05-01 19:03:48'),
(45, 'hendra.ferdian@pertamina.com', 'Hendra Ferdian', 'mAxdf/KhPK+VKuQySR92TSZi7VU2ODdmOGQ1NjcyNA==', '687f8d56724', 'Active', 16, 12, '2019-05-01 19:04:09');

--
-- Triggers `tb_user`
--
DELIMITER $$
CREATE TRIGGER `after_create-user` AFTER INSERT ON `tb_user` FOR EACH ROW BEGIN
	INSERT INTO tb_loguser SET
    note 				= "Create",
    iduser 				= new.iduser,
    email 				= new.email,
    username			= new.username,
    encrypted_password 	= new.encrypted_password,
    salt				= new.salt,
    info				= new.info,
    idcompany			= new.idcompany,
    updated_by			= new.iduser_by,
    updated_at			= new.date_at;	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete-user` AFTER DELETE ON `tb_user` FOR EACH ROW BEGIN
	INSERT INTO tb_loguser SET
    note 				= "Delete",
    iduser 				= old.iduser,
    email 				= old.email,
    username			= old.username,
    encrypted_password 	= old.encrypted_password,
    salt				= old.salt,
    info				= old.info,
    idcompany			= old.idcompany,
    updated_by			= old.iduser_by,
    updated_at			= NOW();	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update-user` AFTER UPDATE ON `tb_user` FOR EACH ROW BEGIN
	INSERT INTO tb_loguser SET
    note 				= "Update",
    iduser 				= new.iduser,
    email 				= new.email,
    username			= new.username,
    encrypted_password 	= new.encrypted_password,
    salt				= new.salt,
    info				= new.info,
    idcompany			= new.idcompany,
    updated_by			= new.iduser_by,
    updated_at			= new.date_at;	
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_company`
--
ALTER TABLE `tb_company`
  ADD PRIMARY KEY (`idcompany`),
  ADD UNIQUE KEY `company` (`company`);

--
-- Indexes for table `tb_countvisit`
--
ALTER TABLE `tb_countvisit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `tb_file`
--
ALTER TABLE `tb_file`
  ADD PRIMARY KEY (`idfile`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`idlevel`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `tb_logcompany`
--
ALTER TABLE `tb_logcompany`
  ADD PRIMARY KEY (`idlogcompany`);

--
-- Indexes for table `tb_logfile`
--
ALTER TABLE `tb_logfile`
  ADD PRIMARY KEY (`idlogfile`);

--
-- Indexes for table `tb_loglevel`
--
ALTER TABLE `tb_loglevel`
  ADD PRIMARY KEY (`idloglevel`);

--
-- Indexes for table `tb_logrecovery`
--
ALTER TABLE `tb_logrecovery`
  ADD PRIMARY KEY (`idlogrecovery`);

--
-- Indexes for table `tb_logshare`
--
ALTER TABLE `tb_logshare`
  ADD PRIMARY KEY (`idlogshare`);

--
-- Indexes for table `tb_logtransaction`
--
ALTER TABLE `tb_logtransaction`
  ADD PRIMARY KEY (`idlogtransaction`);

--
-- Indexes for table `tb_loguser`
--
ALTER TABLE `tb_loguser`
  ADD PRIMARY KEY (`idloguser`);

--
-- Indexes for table `tb_recoversss`
--
ALTER TABLE `tb_recoversss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_recovery`
--
ALTER TABLE `tb_recovery`
  ADD PRIMARY KEY (`idrecovery`);

--
-- Indexes for table `tb_share`
--
ALTER TABLE `tb_share`
  ADD PRIMARY KEY (`idshare`);

--
-- Indexes for table `tb_sharesss`
--
ALTER TABLE `tb_sharesss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD PRIMARY KEY (`idtransaction`),
  ADD UNIQUE KEY `transactioncode` (`transactioncode`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_company`
--
ALTER TABLE `tb_company`
  MODIFY `idcompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_countvisit`
--
ALTER TABLE `tb_countvisit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_file`
--
ALTER TABLE `tb_file`
  MODIFY `idfile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `idlevel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_logcompany`
--
ALTER TABLE `tb_logcompany`
  MODIFY `idlogcompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tb_logfile`
--
ALTER TABLE `tb_logfile`
  MODIFY `idlogfile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tb_loglevel`
--
ALTER TABLE `tb_loglevel`
  MODIFY `idloglevel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_logrecovery`
--
ALTER TABLE `tb_logrecovery`
  MODIFY `idlogrecovery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tb_logshare`
--
ALTER TABLE `tb_logshare`
  MODIFY `idlogshare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;

--
-- AUTO_INCREMENT for table `tb_logtransaction`
--
ALTER TABLE `tb_logtransaction`
  MODIFY `idlogtransaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tb_loguser`
--
ALTER TABLE `tb_loguser`
  MODIFY `idloguser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tb_recoversss`
--
ALTER TABLE `tb_recoversss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24102;

--
-- AUTO_INCREMENT for table `tb_recovery`
--
ALTER TABLE `tb_recovery`
  MODIFY `idrecovery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tb_share`
--
ALTER TABLE `tb_share`
  MODIFY `idshare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `tb_sharesss`
--
ALTER TABLE `tb_sharesss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4981;

--
-- AUTO_INCREMENT for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  MODIFY `idtransaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
