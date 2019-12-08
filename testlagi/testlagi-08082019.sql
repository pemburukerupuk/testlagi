-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2019 at 05:15 PM
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
(108, 'Update', 58, 51, 33, '1', '0301c53352399984d94d82307d', 33, '2019-08-03 00:28:53');

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
(751, 'Update', 106, 13, 18, '5', '0305bb5be0dd4041e89b908f77546010c4ed3ce3f5579b', 14, '2019-08-08 06:31:13');

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
(12, 15, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:32:33'),
(13, 15, 15, '2', '03023022533298138a837e2d14e7d29166dcfc51fd9d7f', 15, '2019-05-11 04:08:26'),
(14, 15, 16, '3', '03039ed45928003bc0f6f83dc2e2dbdaef71abdf79f38d', 16, '2019-05-13 02:28:10'),
(15, 15, 17, '4', '03041153d4205d4301d9898038037052111e99a52e06d0', 17, '2019-05-13 02:02:46'),
(16, 17, 14, '1', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:33:27'),
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
(32, 18, 14, '4', '03016ca1f57c54a7af9c02042346', 14, '2019-08-02 19:34:05'),
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
(47, 16, 14, '3', '030132ac4164g0cb61da6717e2db', 14, '2019-08-02 19:32:52'),
(48, 27, 14, '2', '03014c5b33ee424f3933b0a099dc', 14, '2019-08-02 19:34:32'),
(49, 30, 14, '1', '030193636d859cab105913485c39', 14, '2019-08-02 19:34:47'),
(50, 32, 14, '1', '030169ba629f3d0a5b8f03e8fb35', 14, '2019-08-02 19:35:03'),
(51, 42, 36, '4', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:41:40'),
(52, 49, 36, '4', '0304b5a7ce5c1cca1b5c3f05', 36, '2019-08-02 19:41:55'),
(53, 50, 36, '1', '03044b47286779421f3c47c0e5', 36, '2019-08-02 19:42:12'),
(54, 47, 36, '2', '030401342985c999c2b9d2d8', 36, '2019-08-02 19:42:39'),
(55, 50, 33, '2', '0301c53352399984d94d82307d', 33, '2019-08-02 19:45:03'),
(56, 47, 34, '3', '0302db011303b7e5f55b782b', 34, '2019-08-02 19:54:26'),
(57, 50, 34, '3', '0302067543d4d50a7204b2a5ee', 34, '2019-08-02 19:55:07'),
(58, 51, 33, '1', '0301c53352399984d94d82307d', 33, '2019-08-03 00:28:53');

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
(102, 13, 14, '1', '0301b3e5ee0f8e8284419a0e5c4ec922574fedf65c4bd5', 14, '2019-08-08 06:31:13'),
(103, 13, 15, '2', '030255ff2c768d93594aa787f92f337e2e3e32526c2964', 14, '2019-08-08 06:31:13'),
(104, 13, 16, '3', '0303379bea652a63b15c549a06d17044b3fe014360cbe0', 14, '2019-08-08 06:31:13'),
(105, 13, 17, '4', '030459ba25dd66f38b77a24786327f75e58d5ac9382f47', 14, '2019-08-08 06:31:13'),
(106, 13, 18, '5', '0305bb5be0dd4041e89b908f77546010c4ed3ce3f5579b', 14, '2019-08-08 06:31:13'),
(107, 14, 14, '1', '03016ca1f57c54a7af9c02042346', 14, '2019-08-02 19:31:13'),
(108, 14, 15, '2', '030287b6ff498d0a4694d6d3bc19', 14, '2019-08-02 19:31:13'),
(109, 14, 16, '3', '0303b8b48cc9218c3416dccc42ef', 14, '2019-08-02 19:31:13'),
(110, 14, 17, '4', '0304ff9b9dfb112b792314f0b7c6', 14, '2019-08-02 19:31:14'),
(111, 14, 18, '5', '03055b6b31df5de914bb803e199f', 14, '2019-08-02 19:31:14'),
(112, 15, 14, '1', '030193636d859cab105913485c39', 14, '2019-08-02 19:31:23'),
(113, 15, 15, '2', '0302ca75ff27085484fed1ade758', 14, '2019-08-02 19:31:23'),
(114, 15, 16, '3', '03030bab2248bd5dc91b9a8f18d2', 14, '2019-08-02 19:31:23'),
(115, 15, 17, '4', '03045804d9e8b9c6dfb36feff2a6', 14, '2019-08-02 19:31:23'),
(116, 15, 18, '5', '0305b0822105fd8ec6c450cc72d5', 14, '2019-08-02 19:31:24'),
(117, 16, 14, '1', '0301c8f3c72c198d12702745f841', 14, '2019-08-02 19:31:28'),
(118, 16, 15, '2', '03029965ef665d408d0c0545d05e', 14, '2019-08-02 19:31:28'),
(119, 16, 16, '3', '0303dbcde60e427bde03fd6101cc', 14, '2019-08-02 19:31:28'),
(120, 16, 17, '4', '03048d29ac25c93d04550c998d8a', 14, '2019-08-02 19:31:28'),
(121, 16, 18, '5', '0305b07b41abf187010135ed7299', 14, '2019-08-02 19:31:28'),
(122, 17, 14, '1', '03018c7a1951f195ddb205224703', 14, '2019-08-02 19:31:32'),
(123, 17, 15, '2', '0302b47260ea81a453c7a0e84e4a', 14, '2019-08-02 19:31:32'),
(124, 17, 16, '3', '0303df5d422a288ed26d31b18e49', 14, '2019-08-02 19:31:32'),
(125, 17, 17, '4', '03040c3bc013e75358a5ba7e0600', 14, '2019-08-02 19:31:32'),
(126, 17, 18, '5', '03053d0cd9a5bcf4e76e394fb870', 14, '2019-08-02 19:31:32'),
(127, 18, 14, '1', '03014c5b33ee424f3933b0a099dc', 14, '2019-08-02 19:31:36'),
(128, 18, 15, '2', '03024e0aa6f3fb37c8b057edd2a3', 14, '2019-08-02 19:31:37'),
(129, 18, 16, '3', '03036d83c670a01919a4584723cb', 14, '2019-08-02 19:31:37'),
(130, 18, 17, '4', '0304a9c5936632f62e0fb3b08e53', 14, '2019-08-02 19:31:37'),
(131, 18, 18, '5', '030501d00dd5b2cc06f36726113c', 14, '2019-08-02 19:31:37'),
(132, 19, 14, '1', '030169ba629f3d0a5b8f03e8fb35', 14, '2019-08-02 19:31:46'),
(133, 19, 15, '2', '03028458065eb51a155734856a81', 14, '2019-08-02 19:31:46'),
(134, 19, 16, '3', '0303b8505b9fde919d87f539c858', 14, '2019-08-02 19:31:46'),
(135, 19, 17, '4', '030404a26061b86ef21e440413bb', 14, '2019-08-02 19:31:46'),
(136, 19, 18, '5', '03056a4d15a543b2131d23e74da9', 14, '2019-08-02 19:31:46'),
(137, 20, 14, '1', '0301aeace5df4bb69ccc6a0cf722', 14, '2019-08-02 19:31:52'),
(138, 20, 15, '2', '03029563143db406c64b5f5c08bf', 14, '2019-08-02 19:31:52'),
(139, 20, 16, '3', '03031c9bfe7db153ecad4150af4a', 14, '2019-08-02 19:31:52'),
(140, 20, 17, '4', '03044453a09e429c0df110e9eac5', 14, '2019-08-02 19:31:52'),
(141, 20, 18, '5', '03050c8cfca068e12b16cd25b92e', 14, '2019-08-02 19:31:52'),
(142, 21, 14, '1', '0301ef4311c48efa341b9b5e16cf', 14, '2019-08-02 19:31:56'),
(143, 21, 15, '2', '03026cb46d639058da3c4ec5a828', 14, '2019-08-02 19:31:57'),
(144, 21, 16, '3', '0303e0c7813f7d7d5e917c952d82', 14, '2019-08-02 19:31:57'),
(145, 21, 17, '4', '0304497c4d585568c21924cfa7dc', 14, '2019-08-02 19:31:57'),
(146, 21, 18, '5', '0305a9d4d2ae181904d647721435', 14, '2019-08-02 19:31:57'),
(147, 22, 14, '1', '030102cea24db1e563a795513ead', 14, '2019-08-02 19:32:01'),
(148, 22, 15, '2', '0302305df3f0222c5b89fe98cab3', 14, '2019-08-02 19:32:01'),
(149, 22, 16, '3', '0303f1236048cc3856d59c351b87', 14, '2019-08-02 19:32:01'),
(150, 22, 17, '4', '03044320eb57ad08548a70293329', 14, '2019-08-02 19:32:01'),
(151, 22, 18, '5', '03052854921cc69d55a97a74119a', 14, '2019-08-02 19:32:01'),
(152, 23, 28, '1', '0301fe88913d67626344accd', 28, '2019-08-02 19:36:06'),
(153, 23, 29, '2', '030234033674d8e020c39e11', 28, '2019-08-02 19:36:06'),
(154, 23, 30, '3', '03030de55605c0a799f63f48', 28, '2019-08-02 19:36:07'),
(155, 23, 31, '4', '0304892bf1f21fb8cddd9071', 28, '2019-08-02 19:36:07'),
(156, 23, 32, '5', '0305a7d80538f712bc78908c', 28, '2019-08-02 19:36:07'),
(157, 24, 28, '1', '030173688abe64c69fa253a3', 28, '2019-08-02 19:36:10'),
(158, 24, 29, '2', '030239d2f9280386d25a9861', 28, '2019-08-02 19:36:11'),
(159, 24, 30, '3', '0303bcafb2a14c6ffaa337b5', 28, '2019-08-02 19:36:11'),
(160, 24, 31, '4', '0304fbg0b6273e81167c319e', 28, '2019-08-02 19:36:11'),
(161, 24, 32, '5', '0305f6c404bcdabc28e6861c', 28, '2019-08-02 19:36:11'),
(162, 25, 28, '1', '030103b4faa26c93711d4e9b', 28, '2019-08-02 19:36:14'),
(163, 25, 29, '2', '03026efdc911d93359939c2b', 28, '2019-08-02 19:36:14'),
(164, 25, 30, '3', '0303a94cd4b0b40f19db522b', 28, '2019-08-02 19:36:14'),
(165, 25, 31, '4', '0304b4a31a7dfe27b2f5719b', 28, '2019-08-02 19:36:14'),
(166, 25, 32, '5', '03058f009d79b67b22e1f97a', 28, '2019-08-02 19:36:14'),
(167, 26, 28, '1', '03018a2d9c850a1c04847060', 28, '2019-08-02 19:36:18'),
(168, 26, 29, '2', '0302695a7e74e0f7929bc24a', 28, '2019-08-02 19:36:18'),
(169, 26, 30, '3', '030306f90c2eeebd09bf5e38', 28, '2019-08-02 19:36:18'),
(170, 26, 31, '4', '0304620847b4346f6bf0452a', 28, '2019-08-02 19:36:18'),
(171, 26, 32, '5', '03057c8a2e04b40db72d7720', 28, '2019-08-02 19:36:18'),
(172, 27, 28, '1', '03018a2d8a1c07f04290d4c0', 28, '2019-08-02 19:36:24'),
(173, 27, 29, '2', '030231d571c79f71ac44f0fd', 28, '2019-08-02 19:36:24'),
(174, 27, 30, '3', '03035f681b6034b39e97bd30', 28, '2019-08-02 19:36:24'),
(175, 27, 31, '4', '030413e889e9c8b518883b5b', 28, '2019-08-02 19:36:24'),
(176, 27, 32, '5', '03054e53ba6059771b176b7d', 28, '2019-08-02 19:36:25'),
(177, 28, 28, '1', '0301d0929fd09a4d263f3f38', 28, '2019-08-02 19:36:29'),
(178, 28, 29, '2', '0302872160f18ccf40bdc812', 28, '2019-08-02 19:36:29'),
(179, 28, 30, '3', '03038f20aac444b3aff30208', 28, '2019-08-02 19:36:29'),
(180, 28, 31, '4', '0304e88f7c49c3fa72e1f01a', 28, '2019-08-02 19:36:29'),
(181, 28, 32, '5', '0305916dd78107a38a878f48', 28, '2019-08-02 19:36:29'),
(182, 29, 28, '1', '0301426b6f9ag022811dca88', 28, '2019-08-02 19:36:33'),
(183, 29, 29, '2', '0302c082dffd0f08e8309b23', 28, '2019-08-02 19:36:33'),
(184, 29, 30, '3', '0303e2b7b5899ee195b3dd4c', 28, '2019-08-02 19:36:33'),
(185, 29, 31, '4', '0304a809f23fabab89a58f02', 28, '2019-08-02 19:36:34'),
(186, 29, 32, '5', '0305127a951f3667c406b246', 28, '2019-08-02 19:36:34'),
(187, 30, 28, '1', '0301298f5729df7c5601b90a', 28, '2019-08-02 19:36:39'),
(188, 30, 29, '2', '0302efa8baaf0cddafd17a42', 28, '2019-08-02 19:36:39'),
(189, 30, 30, '3', '0303b9bd8ef2f8506be8ad21', 28, '2019-08-02 19:36:39'),
(190, 30, 31, '4', '030488ced4f2a0d78b4651a8', 28, '2019-08-02 19:36:39'),
(191, 30, 32, '5', '03055cdb8baf05700eed67d6', 28, '2019-08-02 19:36:39'),
(192, 31, 28, '1', '03016abdd7974210ca696ce8', 28, '2019-08-02 19:36:43'),
(193, 31, 29, '2', '03026ca46a9fa82e03740c94', 28, '2019-08-02 19:36:43'),
(194, 31, 30, '3', '03036f2720799f880e9b4a7f', 28, '2019-08-02 19:36:43'),
(195, 31, 31, '4', '03047347fa25271debde25a9', 28, '2019-08-02 19:36:43'),
(196, 31, 32, '5', '03057803f6a441ef983c9e11', 28, '2019-08-02 19:36:44'),
(197, 32, 28, '1', '030197afbeede260963de9a0', 28, '2019-08-02 19:36:48'),
(198, 32, 29, '2', '0302c20d07ec895ac337332d', 28, '2019-08-02 19:36:48'),
(199, 32, 30, '3', '0303ea8e435e641ce8684922', 28, '2019-08-02 19:36:48'),
(200, 32, 31, '4', '03040e30714473a704d02a7f', 28, '2019-08-02 19:36:48'),
(201, 32, 32, '5', '030530f5919eb6fa196ed743', 28, '2019-08-02 19:36:48'),
(202, 33, 33, '1', '03014b25d01639cae47b4733', 33, '2019-08-02 19:37:42'),
(203, 33, 34, '2', '0302db011303b7e5f55b782b', 33, '2019-08-02 19:37:42'),
(204, 33, 35, '3', '030317063128e77f941afc62', 33, '2019-08-02 19:37:42'),
(205, 33, 36, '4', '030401342985c999c2b9d2d8', 33, '2019-08-02 19:37:42'),
(206, 33, 37, '5', '0305998bfc195d327e36fb8c', 33, '2019-08-02 19:37:43'),
(207, 34, 33, '1', '03013ec05d3badaef5648865', 33, '2019-08-02 19:37:51'),
(208, 34, 34, '2', '030275b141b6a7aa984c0498', 33, '2019-08-02 19:37:51'),
(209, 34, 35, '3', '03030d4512d15c224b32df12', 33, '2019-08-02 19:37:51'),
(210, 34, 36, '4', '0304077dd18ccd170e1616d5', 33, '2019-08-02 19:37:51'),
(211, 34, 37, '5', '030563587ce8f989e2f9acdf', 33, '2019-08-02 19:37:52'),
(212, 35, 33, '1', '0301b678b6da4029f58ffc1c', 33, '2019-08-02 19:37:56'),
(213, 35, 34, '2', '0302cfcd381ce16a1aff8e49', 33, '2019-08-02 19:37:56'),
(214, 35, 35, '3', '0303b470ee294ff1d3c92000', 33, '2019-08-02 19:37:57'),
(215, 35, 36, '4', '03046562d6008cbd1deeb342', 33, '2019-08-02 19:37:57'),
(216, 35, 37, '5', '0305e3a3f1a297cffb6d450e', 33, '2019-08-02 19:37:57'),
(217, 36, 33, '1', '030184fb43af15b9e1a555f1', 33, '2019-08-02 19:38:00'),
(218, 36, 34, '2', '0302eb9e721def27569d0273', 33, '2019-08-02 19:38:00'),
(219, 36, 35, '3', '03039d5cf3adfa7ac2627101', 33, '2019-08-02 19:38:00'),
(220, 36, 36, '4', '03049b35c55d36b123f5a19c', 33, '2019-08-02 19:38:00'),
(221, 36, 37, '5', '0305e529e92ea5cc7b549242', 33, '2019-08-02 19:38:00'),
(222, 37, 33, '1', '03017540150ea38a79cfaaaa', 33, '2019-08-02 19:38:02'),
(223, 37, 34, '2', '0302c6cc1275d62a72227169', 33, '2019-08-02 19:38:03'),
(224, 37, 35, '3', '03035b145d95060f4c75bfb8', 33, '2019-08-02 19:38:03'),
(225, 37, 36, '4', '0304351af66e353907c79396', 33, '2019-08-02 19:38:03'),
(226, 37, 37, '5', '030554dedc0062a8a417ee03', 33, '2019-08-02 19:38:03'),
(227, 38, 33, '1', '0301c53f754ce410fee7c66f', 33, '2019-08-02 19:38:06'),
(228, 38, 34, '2', '0302450ce16fa820d15bde2d', 33, '2019-08-02 19:38:06'),
(229, 38, 35, '3', '0303ebdaa9cabb5edbd8b1b5', 33, '2019-08-02 19:38:06'),
(230, 38, 36, '4', '0304b5a7ce5c1cca1b5c3f05', 33, '2019-08-02 19:38:06'),
(231, 38, 37, '5', '0305a4744f26cd6393e9891f', 33, '2019-08-02 19:38:06'),
(232, 39, 33, '1', '0301c53352399984d94d82307d', 34, '2019-08-02 19:38:31'),
(233, 39, 34, '2', '0302067543d4d50a7204b2a5ee', 34, '2019-08-02 19:38:32'),
(234, 39, 35, '3', '0303332635381ff53454f4d5bb', 34, '2019-08-02 19:38:32'),
(235, 39, 36, '4', '03044b47286779421f3c47c0e5', 34, '2019-08-02 19:38:32'),
(236, 40, 35, '1', '0301d5b2bd4ce7386918198d8e7a39fc181be8d1a3870f', 36, '2019-08-02 19:39:22'),
(237, 40, 36, '2', '0302922989905fad909cf30e5e9d7a006536g0d2471a48', 36, '2019-08-02 19:39:23'),
(238, 40, 37, '3', '030388b492fd978ea6ccb9b5a296f341138178301debe3', 36, '2019-08-02 19:39:23');

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
  `hasil` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sharesss`
--

INSERT INTO `tb_sharesss` (`id`, `idfile`, `koef1`, `koef1_pangkat2`, `koef2`, `koef2_pangkat1`, `variable_code`, `bagian`, `hasil`) VALUES
(1, 13, '32', '1', '67', '1', '80', 'Max-5-Min-3-Part_No-1-Char_No-1', 'b3'),
(2, 13, '32', '4', '67', '2', '80', 'Max-5-Min-3-Part_No-2-Char_No-1', '55'),
(3, 13, '32', '9', '67', '3', '80', 'Max-5-Min-3-Part_No-3-Char_No-1', '37'),
(4, 13, '32', '16', '67', '4', '80', 'Max-5-Min-3-Part_No-4-Char_No-1', '59'),
(5, 13, '32', '25', '67', '5', '80', 'Max-5-Min-3-Part_No-5-Char_No-1', 'bb'),
(6, 13, '32', '36', '67', '6', '80', 'Max-5-Min-3-Part_No-6-Char_No-1', '5c'),
(7, 13, '32', '49', '67', '7', '80', 'Max-5-Min-3-Part_No-7-Char_No-1', '3d'),
(8, 13, '32', '64', '67', '8', '80', 'Max-5-Min-3-Part_No-8-Char_No-1', '5e'),
(9, 13, '32', '81', '67', '9', '80', 'Max-5-Min-3-Part_No-9-Char_No-1', 'bf'),
(10, 13, '32', '100', '67', '10', '80', 'Max-5-Min-3-Part_No-10-Char_No-1', '5f'),
(11, 13, '32', '121', '67', '11', '80', 'Max-5-Min-3-Part_No-11-Char_No-1', '3f'),
(12, 13, '32', '144', '67', '12', '80', 'Max-5-Min-3-Part_No-12-Char_No-1', '5f'),
(13, 13, '32', '169', '67', '13', '80', 'Max-5-Min-3-Part_No-13-Char_No-1', 'bf'),
(14, 13, '32', '196', '67', '14', '80', 'Max-5-Min-3-Part_No-14-Char_No-1', '5e'),
(15, 13, '32', '225', '67', '15', '80', 'Max-5-Min-3-Part_No-15-Char_No-1', '3d'),
(16, 13, '32', '256', '67', '16', '80', 'Max-5-Min-3-Part_No-16-Char_No-1', '5c'),
(17, 13, '32', '289', '67', '17', '80', 'Max-5-Min-3-Part_No-17-Char_No-1', 'bb'),
(18, 13, '32', '324', '67', '18', '80', 'Max-5-Min-3-Part_No-18-Char_No-1', '59'),
(19, 13, '32', '361', '67', '19', '80', 'Max-5-Min-3-Part_No-19-Char_No-1', '37'),
(20, 13, '32', '400', '67', '20', '80', 'Max-5-Min-3-Part_No-20-Char_No-1', '55'),
(21, 13, '32', '441', '67', '21', '80', 'Max-5-Min-3-Part_No-21-Char_No-1', 'b3'),
(22, 13, '194', '1', '215', '1', '77', 'Max-5-Min-3-Part_No-1-Char_No-2', 'e5'),
(23, 13, '194', '4', '215', '2', '77', 'Max-5-Min-3-Part_No-2-Char_No-2', 'ff'),
(24, 13, '194', '9', '215', '3', '77', 'Max-5-Min-3-Part_No-3-Char_No-2', '9b'),
(25, 13, '194', '16', '215', '4', '77', 'Max-5-Min-3-Part_No-4-Char_No-2', 'ba'),
(26, 13, '194', '25', '215', '5', '77', 'Max-5-Min-3-Part_No-5-Char_No-2', '5b'),
(27, 13, '194', '36', '215', '6', '77', 'Max-5-Min-3-Part_No-6-Char_No-2', '7f'),
(28, 13, '194', '49', '215', '7', '77', 'Max-5-Min-3-Part_No-7-Char_No-2', '25'),
(29, 13, '194', '64', '215', '8', '77', 'Max-5-Min-3-Part_No-8-Char_No-2', '4e'),
(30, 13, '194', '81', '215', '9', '77', 'Max-5-Min-3-Part_No-9-Char_No-2', 'fa'),
(31, 13, '194', '100', '215', '10', '77', 'Max-5-Min-3-Part_No-10-Char_No-2', '27'),
(32, 13, '194', '121', '215', '11', '77', 'Max-5-Min-3-Part_No-11-Char_No-2', 'd8'),
(33, 13, '194', '144', '215', '12', '77', 'Max-5-Min-3-Part_No-12-Char_No-2', '0a'),
(34, 13, '194', '169', '215', '13', '77', 'Max-5-Min-3-Part_No-13-Char_No-2', 'c0'),
(35, 13, '194', '196', '215', '14', '77', 'Max-5-Min-3-Part_No-14-Char_No-2', 'f8'),
(36, 13, '194', '225', '215', '15', '77', 'Max-5-Min-3-Part_No-15-Char_No-2', 'b2'),
(37, 13, '194', '256', '215', '16', '77', 'Max-5-Min-3-Part_No-16-Char_No-2', 'ef'),
(38, 13, '194', '289', '215', '17', '77', 'Max-5-Min-3-Part_No-17-Char_No-2', 'ae'),
(39, 13, '194', '324', '215', '18', '77', 'Max-5-Min-3-Part_No-18-Char_No-2', 'f0'),
(40, 13, '194', '361', '215', '19', '77', 'Max-5-Min-3-Part_No-19-Char_No-2', 'b4'),
(41, 13, '194', '400', '215', '20', '77', 'Max-5-Min-3-Part_No-20-Char_No-2', 'fb'),
(42, 13, '194', '441', '215', '21', '77', 'Max-5-Min-3-Part_No-21-Char_No-2', 'c4'),
(43, 13, '192', '1', '1', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-3', 'ee'),
(44, 13, '192', '4', '1', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-3', '2c'),
(45, 13, '192', '9', '1', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-3', 'ea'),
(46, 13, '192', '16', '1', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-3', '25'),
(47, 13, '192', '25', '1', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-3', 'e0'),
(48, 13, '192', '36', '1', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-3', '18'),
(49, 13, '192', '49', '1', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-3', 'd0'),
(50, 13, '192', '64', '1', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-3', '05'),
(51, 13, '192', '81', '1', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-3', 'ba'),
(52, 13, '192', '100', '1', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-3', 'ed'),
(53, 13, '192', '121', '1', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-3', '9e'),
(54, 13, '192', '144', '1', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-3', 'ce'),
(55, 13, '192', '169', '1', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-3', '7c'),
(56, 13, '192', '196', '1', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-3', 'a9'),
(57, 13, '192', '225', '1', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-3', '54'),
(58, 13, '192', '256', '1', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-3', '7e'),
(59, 13, '192', '289', '1', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-3', '26'),
(60, 13, '192', '324', '1', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-3', '4d'),
(61, 13, '192', '361', '1', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-3', 'f3'),
(62, 13, '192', '400', '1', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-3', '16'),
(63, 13, '192', '441', '1', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-3', 'b9'),
(64, 13, '197', '1', '26', '1', '49', 'Max-5-Min-3-Part_No-1-Char_No-4', '0f'),
(65, 13, '197', '4', '26', '2', '49', 'Max-5-Min-3-Part_No-2-Char_No-4', '76'),
(66, 13, '197', '9', '26', '3', '49', 'Max-5-Min-3-Part_No-3-Char_No-4', '65'),
(67, 13, '197', '16', '26', '4', '49', 'Max-5-Min-3-Part_No-4-Char_No-4', 'dd'),
(68, 13, '197', '25', '26', '5', '49', 'Max-5-Min-3-Part_No-5-Char_No-4', 'dd'),
(69, 13, '197', '36', '26', '6', '49', 'Max-5-Min-3-Part_No-6-Char_No-4', '65'),
(70, 13, '197', '49', '26', '7', '49', 'Max-5-Min-3-Part_No-7-Char_No-4', '76'),
(71, 13, '197', '64', '26', '8', '49', 'Max-5-Min-3-Part_No-8-Char_No-4', '0f'),
(72, 13, '197', '81', '26', '9', '49', 'Max-5-Min-3-Part_No-9-Char_No-4', '31'),
(73, 13, '197', '100', '26', '10', '49', 'Max-5-Min-3-Part_No-10-Char_No-4', 'dc'),
(74, 13, '197', '121', '26', '11', '49', 'Max-5-Min-3-Part_No-11-Char_No-4', '0e'),
(75, 13, '197', '144', '26', '12', '49', 'Max-5-Min-3-Part_No-12-Char_No-4', 'ca'),
(76, 13, '197', '169', '26', '13', '49', 'Max-5-Min-3-Part_No-13-Char_No-4', '0d'),
(77, 13, '197', '196', '26', '14', '49', 'Max-5-Min-3-Part_No-14-Char_No-4', 'da'),
(78, 13, '197', '225', '26', '15', '49', 'Max-5-Min-3-Part_No-15-Char_No-4', '2e'),
(79, 13, '197', '256', '26', '16', '49', 'Max-5-Min-3-Part_No-16-Char_No-4', '0b'),
(80, 13, '197', '289', '26', '17', '49', 'Max-5-Min-3-Part_No-17-Char_No-4', '71'),
(81, 13, '197', '324', '26', '18', '49', 'Max-5-Min-3-Part_No-18-Char_No-4', '5f'),
(82, 13, '197', '361', '26', '19', '49', 'Max-5-Min-3-Part_No-19-Char_No-4', 'd6'),
(83, 13, '197', '400', '26', '20', '49', 'Max-5-Min-3-Part_No-20-Char_No-4', 'd5'),
(84, 13, '197', '441', '26', '21', '49', 'Max-5-Min-3-Part_No-21-Char_No-4', '5c'),
(85, 13, '208', '1', '146', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-5', '8e'),
(86, 13, '208', '4', '146', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-5', '8d'),
(87, 13, '208', '9', '146', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-5', '2a'),
(88, 13, '208', '16', '146', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-5', '66'),
(89, 13, '208', '25', '146', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-5', '40'),
(90, 13, '208', '36', '146', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-5', 'b9'),
(91, 13, '208', '49', '146', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-5', 'd0'),
(92, 13, '208', '64', '146', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-5', '85'),
(93, 13, '208', '81', '146', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-5', 'd9'),
(94, 13, '208', '100', '146', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-5', 'cb'),
(95, 13, '208', '121', '146', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-5', '5b'),
(96, 13, '208', '144', '146', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-5', '8a'),
(97, 13, '208', '169', '146', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-5', '57'),
(98, 13, '208', '196', '146', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-5', 'c3'),
(99, 13, '208', '225', '146', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-5', 'cd'),
(100, 13, '208', '256', '146', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-5', '75'),
(101, 13, '208', '289', '146', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-5', 'bc'),
(102, 13, '208', '324', '146', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-5', 'a1'),
(103, 13, '208', '361', '146', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-5', '24'),
(104, 13, '208', '400', '146', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-5', '46'),
(105, 13, '208', '441', '146', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-5', '06'),
(106, 13, '96', '1', '243', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-6', '82'),
(107, 13, '96', '4', '243', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-6', '93'),
(108, 13, '96', '9', '243', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-6', '63'),
(109, 13, '96', '16', '243', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-6', 'f3'),
(110, 13, '96', '25', '243', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-6', '41'),
(111, 13, '96', '36', '243', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-6', '4f'),
(112, 13, '96', '49', '243', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-6', '1c'),
(113, 13, '96', '64', '243', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-6', 'a9'),
(114, 13, '96', '81', '243', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-6', 'f5'),
(115, 13, '96', '100', '243', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-6', '100'),
(116, 13, '96', '121', '243', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-6', 'ca'),
(117, 13, '96', '144', '243', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-6', '53'),
(118, 13, '96', '169', '243', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-6', '9c'),
(119, 13, '96', '196', '243', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-6', 'a4'),
(120, 13, '96', '225', '243', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-6', '6b'),
(121, 13, '96', '256', '243', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-6', 'f2'),
(122, 13, '96', '289', '243', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-6', '37'),
(123, 13, '96', '324', '243', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-6', '3c'),
(124, 13, '96', '361', '243', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-6', '00'),
(125, 13, '96', '400', '243', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-6', '84'),
(126, 13, '96', '441', '243', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-6', 'c7'),
(127, 13, '194', '1', '146', '1', '49', 'Max-5-Min-3-Part_No-1-Char_No-7', '84'),
(128, 13, '194', '4', '146', '2', '49', 'Max-5-Min-3-Part_No-2-Char_No-7', '59'),
(129, 13, '194', '9', '146', '3', '49', 'Max-5-Min-3-Part_No-3-Char_No-7', 'b1'),
(130, 13, '194', '16', '146', '4', '49', 'Max-5-Min-3-Part_No-4-Char_No-7', '8b'),
(131, 13, '194', '25', '146', '5', '49', 'Max-5-Min-3-Part_No-5-Char_No-7', 'e8'),
(132, 13, '194', '36', '146', '6', '49', 'Max-5-Min-3-Part_No-6-Char_No-7', 'c7'),
(133, 13, '194', '49', '146', '7', '49', 'Max-5-Min-3-Part_No-7-Char_No-7', '28'),
(134, 13, '194', '64', '146', '8', '49', 'Max-5-Min-3-Part_No-8-Char_No-7', '0c'),
(135, 13, '194', '81', '146', '9', '49', 'Max-5-Min-3-Part_No-9-Char_No-7', '73'),
(136, 13, '194', '100', '146', '10', '49', 'Max-5-Min-3-Part_No-10-Char_No-7', '5c'),
(137, 13, '194', '121', '146', '11', '49', 'Max-5-Min-3-Part_No-11-Char_No-7', 'c8'),
(138, 13, '194', '144', '146', '12', '49', 'Max-5-Min-3-Part_No-12-Char_No-7', 'b6'),
(139, 13, '194', '169', '146', '13', '49', 'Max-5-Min-3-Part_No-13-Char_No-7', '26'),
(140, 13, '194', '196', '146', '14', '49', 'Max-5-Min-3-Part_No-14-Char_No-7', '19'),
(141, 13, '194', '225', '146', '15', '49', 'Max-5-Min-3-Part_No-15-Char_No-7', '8f'),
(142, 13, '194', '256', '146', '16', '49', 'Max-5-Min-3-Part_No-16-Char_No-7', '87'),
(143, 13, '194', '289', '146', '17', '49', 'Max-5-Min-3-Part_No-17-Char_No-7', '01'),
(144, 13, '194', '324', '146', '18', '49', 'Max-5-Min-3-Part_No-18-Char_No-7', 'ff'),
(145, 13, '194', '361', '146', '19', '49', 'Max-5-Min-3-Part_No-19-Char_No-7', '7e'),
(146, 13, '194', '400', '146', '20', '49', 'Max-5-Min-3-Part_No-20-Char_No-7', '80'),
(147, 13, '194', '441', '146', '21', '49', 'Max-5-Min-3-Part_No-21-Char_No-7', '04'),
(148, 13, '133', '1', '124', '1', '65', 'Max-5-Min-3-Part_No-1-Char_No-8', '41'),
(149, 13, '133', '4', '124', '2', '65', 'Max-5-Min-3-Part_No-2-Char_No-8', '4a'),
(150, 13, '133', '9', '124', '3', '65', 'Max-5-Min-3-Part_No-3-Char_No-8', '5c'),
(151, 13, '133', '16', '124', '4', '65', 'Max-5-Min-3-Part_No-4-Char_No-8', '77'),
(152, 13, '133', '25', '124', '5', '65', 'Max-5-Min-3-Part_No-5-Char_No-8', '9b'),
(153, 13, '133', '36', '124', '6', '65', 'Max-5-Min-3-Part_No-6-Char_No-8', 'c8'),
(154, 13, '133', '49', '124', '7', '65', 'Max-5-Min-3-Part_No-7-Char_No-8', 'fe'),
(155, 13, '133', '64', '124', '8', '65', 'Max-5-Min-3-Part_No-8-Char_No-8', '3c'),
(156, 13, '133', '81', '124', '9', '65', 'Max-5-Min-3-Part_No-9-Char_No-8', '84'),
(157, 13, '133', '100', '124', '10', '65', 'Max-5-Min-3-Part_No-10-Char_No-8', 'd5'),
(158, 13, '133', '121', '124', '11', '65', 'Max-5-Min-3-Part_No-11-Char_No-8', '2e'),
(159, 13, '133', '144', '124', '12', '65', 'Max-5-Min-3-Part_No-12-Char_No-8', '91'),
(160, 13, '133', '169', '124', '13', '65', 'Max-5-Min-3-Part_No-13-Char_No-8', 'fd'),
(161, 13, '133', '196', '124', '14', '65', 'Max-5-Min-3-Part_No-14-Char_No-8', '71'),
(162, 13, '133', '225', '124', '15', '65', 'Max-5-Min-3-Part_No-15-Char_No-8', 'ef'),
(163, 13, '133', '256', '124', '16', '65', 'Max-5-Min-3-Part_No-16-Char_No-8', '75'),
(164, 13, '133', '289', '124', '17', '65', 'Max-5-Min-3-Part_No-17-Char_No-8', '04'),
(165, 13, '133', '324', '124', '18', '65', 'Max-5-Min-3-Part_No-18-Char_No-8', '9d'),
(166, 13, '133', '361', '124', '19', '65', 'Max-5-Min-3-Part_No-19-Char_No-8', '3e'),
(167, 13, '133', '400', '124', '20', '65', 'Max-5-Min-3-Part_No-20-Char_No-8', 'e9'),
(168, 13, '133', '441', '124', '21', '65', 'Max-5-Min-3-Part_No-21-Char_No-8', '9c'),
(169, 13, '209', '1', '157', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-9', '9a'),
(170, 13, '209', '4', '157', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-9', 'a7'),
(171, 13, '209', '9', '157', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-9', '54'),
(172, 13, '209', '16', '157', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-9', 'a2'),
(173, 13, '209', '25', '157', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-9', '90'),
(174, 13, '209', '36', '157', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-9', '1e'),
(175, 13, '209', '49', '157', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-9', '4d'),
(176, 13, '209', '64', '157', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-9', '1c'),
(177, 13, '209', '81', '157', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-9', '8c'),
(178, 13, '209', '100', '157', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-9', '9c'),
(179, 13, '209', '121', '157', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-9', '4c'),
(180, 13, '209', '144', '157', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-9', '9d'),
(181, 13, '209', '169', '157', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-9', '8e'),
(182, 13, '209', '196', '157', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-9', '1f'),
(183, 13, '209', '225', '157', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-9', '51'),
(184, 13, '209', '256', '157', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-9', '23'),
(185, 13, '209', '289', '157', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-9', '96'),
(186, 13, '209', '324', '157', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-9', 'a9'),
(187, 13, '209', '361', '157', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-9', '5c'),
(188, 13, '209', '400', '157', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-9', 'b0'),
(189, 13, '209', '441', '157', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-9', 'a4'),
(190, 13, '206', '1', '17', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-10', '0e'),
(191, 13, '206', '4', '17', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-10', '87'),
(192, 13, '206', '9', '17', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-10', '9a'),
(193, 13, '206', '16', '17', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-10', '47'),
(194, 13, '206', '25', '17', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-10', '8f'),
(195, 13, '206', '36', '17', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-10', '71'),
(196, 13, '206', '49', '17', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-10', 'ee'),
(197, 13, '206', '64', '17', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-10', '04'),
(198, 13, '206', '81', '17', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-10', 'b6'),
(199, 13, '206', '100', '17', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-10', '01'),
(200, 13, '206', '121', '17', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-10', 'e8'),
(201, 13, '206', '144', '17', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-10', '68'),
(202, 13, '206', '169', '17', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-10', '83'),
(203, 13, '206', '196', '17', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-10', '38'),
(204, 13, '206', '225', '17', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-10', '88'),
(205, 13, '206', '256', '17', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-10', '72'),
(206, 13, '206', '289', '17', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-10', 'f7'),
(207, 13, '206', '324', '17', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-10', '15'),
(208, 13, '206', '361', '17', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-10', 'cf'),
(209, 13, '206', '400', '17', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-10', '22'),
(210, 13, '206', '441', '17', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-10', '10'),
(211, 13, '57', '1', '243', '1', '49', 'Max-5-Min-3-Part_No-1-Char_No-11', '5c'),
(212, 13, '57', '4', '243', '2', '49', 'Max-5-Min-3-Part_No-2-Char_No-11', 'f9'),
(213, 13, '57', '9', '243', '3', '49', 'Max-5-Min-3-Part_No-3-Char_No-11', '06'),
(214, 13, '57', '16', '243', '4', '49', 'Max-5-Min-3-Part_No-4-Char_No-11', '86'),
(215, 13, '57', '25', '243', '5', '49', 'Max-5-Min-3-Part_No-5-Char_No-11', '77'),
(216, 13, '57', '36', '243', '6', '49', 'Max-5-Min-3-Part_No-6-Char_No-11', 'da'),
(217, 13, '57', '49', '243', '7', '49', 'Max-5-Min-3-Part_No-7-Char_No-11', 'ae'),
(218, 13, '57', '64', '243', '8', '49', 'Max-5-Min-3-Part_No-8-Char_No-11', 'f4'),
(219, 13, '57', '81', '243', '9', '49', 'Max-5-Min-3-Part_No-9-Char_No-11', 'ab'),
(220, 13, '57', '100', '243', '10', '49', 'Max-5-Min-3-Part_No-10-Char_No-11', 'd4'),
(221, 13, '57', '121', '243', '11', '49', 'Max-5-Min-3-Part_No-11-Char_No-11', '6e'),
(222, 13, '57', '144', '243', '12', '49', 'Max-5-Min-3-Part_No-12-Char_No-11', '7a'),
(223, 13, '57', '169', '243', '13', '49', 'Max-5-Min-3-Part_No-13-Char_No-11', 'f8'),
(224, 13, '57', '196', '243', '14', '49', 'Max-5-Min-3-Part_No-14-Char_No-11', 'e7'),
(225, 13, '57', '225', '243', '15', '49', 'Max-5-Min-3-Part_No-15-Char_No-11', '47'),
(226, 13, '57', '256', '243', '16', '49', 'Max-5-Min-3-Part_No-16-Char_No-11', '19'),
(227, 13, '57', '289', '243', '17', '49', 'Max-5-Min-3-Part_No-17-Char_No-11', '5d'),
(228, 13, '57', '324', '243', '18', '49', 'Max-5-Min-3-Part_No-18-Char_No-11', '12'),
(229, 13, '57', '361', '243', '19', '49', 'Max-5-Min-3-Part_No-19-Char_No-11', '39'),
(230, 13, '57', '400', '243', '20', '49', 'Max-5-Min-3-Part_No-20-Char_No-11', 'd2'),
(231, 13, '57', '441', '243', '21', '49', 'Max-5-Min-3-Part_No-21-Char_No-11', 'dc'),
(232, 13, '225', '1', '65', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-12', '4e'),
(233, 13, '225', '4', '65', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-12', '2f'),
(234, 13, '225', '9', '65', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-12', 'd1'),
(235, 13, '225', '16', '65', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-12', '32'),
(236, 13, '225', '25', '65', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-12', '54'),
(237, 13, '225', '36', '65', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-12', '36'),
(238, 13, '225', '49', '65', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-12', 'd9'),
(239, 13, '225', '64', '65', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-12', '3b'),
(240, 13, '225', '81', '65', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-12', '5e'),
(241, 13, '225', '100', '65', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-12', '41'),
(242, 13, '225', '121', '65', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-12', 'e5'),
(243, 13, '225', '144', '65', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-12', '48'),
(244, 13, '225', '169', '65', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-12', '6c'),
(245, 13, '225', '196', '65', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-12', '50'),
(246, 13, '225', '225', '65', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-12', 'f5'),
(247, 13, '225', '256', '65', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-12', '59'),
(248, 13, '225', '289', '65', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-12', '7e'),
(249, 13, '225', '324', '65', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-12', '63'),
(250, 13, '225', '361', '65', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-12', '08'),
(251, 13, '225', '400', '65', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-12', '6e'),
(252, 13, '225', '441', '65', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-12', '94'),
(253, 13, '234', '1', '176', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-13', 'c9'),
(254, 13, '234', '4', '176', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-13', '33'),
(255, 13, '234', '9', '176', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-13', '70'),
(256, 13, '234', '16', '176', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-13', '7f'),
(257, 13, '234', '25', '176', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-13', '60'),
(258, 13, '234', '36', '176', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-13', '13'),
(259, 13, '234', '49', '176', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-13', '99'),
(260, 13, '234', '64', '176', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-13', 'f1'),
(261, 13, '234', '81', '176', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-13', '1a'),
(262, 13, '234', '100', '176', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-13', '16'),
(263, 13, '234', '121', '176', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-13', 'e5'),
(264, 13, '234', '144', '176', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-13', '85'),
(265, 13, '234', '169', '176', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-13', 'f8'),
(266, 13, '234', '196', '176', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-13', '3c'),
(267, 13, '234', '225', '176', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-13', '53'),
(268, 13, '234', '256', '176', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-13', '3c'),
(269, 13, '234', '289', '176', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-13', 'f8'),
(270, 13, '234', '324', '176', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-13', '85'),
(271, 13, '234', '361', '176', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-13', 'e5'),
(272, 13, '234', '400', '176', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-13', '16'),
(273, 13, '234', '441', '176', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-13', '1a'),
(274, 13, '182', '1', '60', '1', '49', 'Max-5-Min-3-Part_No-1-Char_No-14', '22'),
(275, 13, '182', '4', '60', '2', '49', 'Max-5-Min-3-Part_No-2-Char_No-14', '7e'),
(276, 13, '182', '9', '60', '3', '49', 'Max-5-Min-3-Part_No-3-Char_No-14', '44'),
(277, 13, '182', '16', '60', '4', '49', 'Max-5-Min-3-Part_No-4-Char_No-14', '75'),
(278, 13, '182', '25', '60', '5', '49', 'Max-5-Min-3-Part_No-5-Char_No-14', '10'),
(279, 13, '182', '36', '60', '6', '49', 'Max-5-Min-3-Part_No-6-Char_No-14', '16'),
(280, 13, '182', '49', '60', '7', '49', 'Max-5-Min-3-Part_No-7-Char_No-14', '87'),
(281, 13, '182', '64', '60', '8', '49', 'Max-5-Min-3-Part_No-8-Char_No-14', '62'),
(282, 13, '182', '81', '60', '9', '49', 'Max-5-Min-3-Part_No-9-Char_No-14', 'a8'),
(283, 13, '182', '100', '60', '10', '49', 'Max-5-Min-3-Part_No-10-Char_No-14', '58'),
(284, 13, '182', '121', '60', '11', '49', 'Max-5-Min-3-Part_No-11-Char_No-14', '73'),
(285, 13, '182', '144', '60', '12', '49', 'Max-5-Min-3-Part_No-12-Char_No-14', 'f9'),
(286, 13, '182', '169', '60', '13', '49', 'Max-5-Min-3-Part_No-13-Char_No-14', 'e9'),
(287, 13, '182', '196', '60', '14', '49', 'Max-5-Min-3-Part_No-14-Char_No-14', '43'),
(288, 13, '182', '225', '60', '15', '49', 'Max-5-Min-3-Part_No-15-Char_No-14', '08'),
(289, 13, '182', '256', '60', '16', '49', 'Max-5-Min-3-Part_No-16-Char_No-14', '38'),
(290, 13, '182', '289', '60', '17', '49', 'Max-5-Min-3-Part_No-17-Char_No-14', 'd3'),
(291, 13, '182', '324', '60', '18', '49', 'Max-5-Min-3-Part_No-18-Char_No-14', 'd8'),
(292, 13, '182', '361', '60', '19', '49', 'Max-5-Min-3-Part_No-19-Char_No-14', '47'),
(293, 13, '182', '400', '60', '20', '49', 'Max-5-Min-3-Part_No-20-Char_No-14', '21'),
(294, 13, '182', '441', '60', '21', '49', 'Max-5-Min-3-Part_No-21-Char_No-14', '66'),
(295, 13, '87', '1', '212', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-15', '57'),
(296, 13, '87', '4', '212', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-15', '2e'),
(297, 13, '87', '9', '212', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-15', 'b3'),
(298, 13, '87', '16', '212', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-15', 'e5'),
(299, 13, '87', '25', '212', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-15', 'c4'),
(300, 13, '87', '36', '212', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-15', '50'),
(301, 13, '87', '49', '212', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-15', '8a'),
(302, 13, '87', '64', '212', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-15', '71'),
(303, 13, '87', '81', '212', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-15', '05'),
(304, 13, '87', '100', '212', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-15', '47'),
(305, 13, '87', '121', '212', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-15', '36'),
(306, 13, '87', '144', '212', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-15', 'd3'),
(307, 13, '87', '169', '212', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-15', '1c'),
(308, 13, '87', '196', '212', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-15', '13'),
(309, 13, '87', '225', '212', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-15', 'b8'),
(310, 13, '87', '256', '212', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-15', '09'),
(311, 13, '87', '289', '212', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-15', '08'),
(312, 13, '87', '324', '212', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-15', 'b5'),
(313, 13, '87', '361', '212', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-15', '0e'),
(314, 13, '87', '400', '212', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-15', '15'),
(315, 13, '87', '441', '212', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-15', 'ca'),
(316, 13, '233', '1', '55', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-16', '4f'),
(317, 13, '233', '4', '55', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-16', '3e'),
(318, 13, '233', '9', '55', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-16', 'fe'),
(319, 13, '233', '16', '55', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-16', '8d'),
(320, 13, '233', '25', '55', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-16', 'ed'),
(321, 13, '233', '36', '55', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-16', '1c'),
(322, 13, '233', '49', '55', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-16', '1c'),
(323, 13, '233', '64', '55', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-16', 'ed'),
(324, 13, '233', '81', '55', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-16', '8d'),
(325, 13, '233', '100', '55', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-16', 'fe'),
(326, 13, '233', '121', '55', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-16', '3e'),
(327, 13, '233', '144', '55', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-16', '4f'),
(328, 13, '233', '169', '55', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-16', '30'),
(329, 13, '233', '196', '55', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-16', 'e2'),
(330, 13, '233', '225', '55', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-16', '63'),
(331, 13, '233', '256', '55', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-16', 'b5'),
(332, 13, '233', '289', '55', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-16', 'd7'),
(333, 13, '233', '324', '55', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-16', 'c9'),
(334, 13, '233', '361', '55', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-16', '8b'),
(335, 13, '233', '400', '55', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-16', '1d'),
(336, 13, '233', '441', '55', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-16', '80'),
(337, 13, '69', '1', '120', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-17', 'ed'),
(338, 13, '69', '4', '120', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-17', '32'),
(339, 13, '69', '9', '120', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-17', '01'),
(340, 13, '69', '16', '120', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-17', '5a'),
(341, 13, '69', '25', '120', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-17', '3c'),
(342, 13, '69', '36', '120', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-17', 'a8'),
(343, 13, '69', '49', '120', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-17', '9d'),
(344, 13, '69', '64', '120', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-17', '1b'),
(345, 13, '69', '81', '120', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-17', '23'),
(346, 13, '69', '100', '120', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-17', 'b5'),
(347, 13, '69', '121', '120', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-17', 'd0'),
(348, 13, '69', '144', '120', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-17', '74'),
(349, 13, '69', '169', '120', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-17', 'a2'),
(350, 13, '69', '196', '120', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-17', '59'),
(351, 13, '69', '225', '120', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-17', '9a'),
(352, 13, '69', '256', '120', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-17', '64'),
(353, 13, '69', '289', '120', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-17', 'b8'),
(354, 13, '69', '324', '120', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-17', '95'),
(355, 13, '69', '361', '120', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-17', 'fc'),
(356, 13, '69', '400', '120', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-17', 'ec'),
(357, 13, '69', '441', '120', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-17', '65'),
(358, 13, '203', '1', '255', '1', '45', 'Max-5-Min-3-Part_No-1-Char_No-18', 'f6'),
(359, 13, '203', '4', '255', '2', '45', 'Max-5-Min-3-Part_No-2-Char_No-18', '52'),
(360, 13, '203', '9', '255', '3', '45', 'Max-5-Min-3-Part_No-3-Char_No-18', '43'),
(361, 13, '203', '16', '255', '4', '45', 'Max-5-Min-3-Part_No-4-Char_No-18', 'c9'),
(362, 13, '203', '25', '255', '5', '45', 'Max-5-Min-3-Part_No-5-Char_No-18', 'e3'),
(363, 13, '203', '36', '255', '6', '45', 'Max-5-Min-3-Part_No-6-Char_No-18', '91'),
(364, 13, '203', '49', '255', '7', '45', 'Max-5-Min-3-Part_No-7-Char_No-18', 'd4'),
(365, 13, '203', '64', '255', '8', '45', 'Max-5-Min-3-Part_No-8-Char_No-18', 'ab'),
(366, 13, '203', '81', '255', '9', '45', 'Max-5-Min-3-Part_No-9-Char_No-18', '16'),
(367, 13, '203', '100', '255', '10', '45', 'Max-5-Min-3-Part_No-10-Char_No-18', '16'),
(368, 13, '203', '121', '255', '11', '45', 'Max-5-Min-3-Part_No-11-Char_No-18', 'ab'),
(369, 13, '203', '144', '255', '12', '45', 'Max-5-Min-3-Part_No-12-Char_No-18', 'd4'),
(370, 13, '203', '169', '255', '13', '45', 'Max-5-Min-3-Part_No-13-Char_No-18', '91'),
(371, 13, '203', '196', '255', '14', '45', 'Max-5-Min-3-Part_No-14-Char_No-18', 'e3'),
(372, 13, '203', '225', '255', '15', '45', 'Max-5-Min-3-Part_No-15-Char_No-18', 'c9'),
(373, 13, '203', '256', '255', '16', '45', 'Max-5-Min-3-Part_No-16-Char_No-18', '43'),
(374, 13, '203', '289', '255', '17', '45', 'Max-5-Min-3-Part_No-17-Char_No-18', '52'),
(375, 13, '203', '324', '255', '18', '45', 'Max-5-Min-3-Part_No-18-Char_No-18', 'f6'),
(376, 13, '203', '361', '255', '19', '45', 'Max-5-Min-3-Part_No-19-Char_No-18', '2d'),
(377, 13, '203', '400', '255', '20', '45', 'Max-5-Min-3-Part_No-20-Char_No-18', 'fa'),
(378, 13, '203', '441', '255', '21', '45', 'Max-5-Min-3-Part_No-21-Char_No-18', '5a'),
(379, 13, '243', '1', '58', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-19', '5c'),
(380, 13, '243', '4', '58', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-19', '6c'),
(381, 13, '243', '9', '58', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-19', '60'),
(382, 13, '243', '16', '58', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-19', '38'),
(383, 13, '243', '25', '58', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-19', 'f5'),
(384, 13, '243', '36', '58', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-19', '95'),
(385, 13, '243', '49', '58', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-19', '19'),
(386, 13, '243', '64', '58', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-19', '82'),
(387, 13, '243', '81', '58', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-19', 'cf'),
(388, 13, '243', '100', '58', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-19', '100'),
(389, 13, '243', '121', '58', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-19', '14'),
(390, 13, '243', '144', '58', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-19', '0d'),
(391, 13, '243', '169', '58', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-19', 'eb'),
(392, 13, '243', '196', '58', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-19', 'ac'),
(393, 13, '243', '225', '58', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-19', '51'),
(394, 13, '243', '256', '58', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-19', 'db'),
(395, 13, '243', '289', '58', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-19', '48'),
(396, 13, '243', '324', '58', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-19', '9a'),
(397, 13, '243', '361', '58', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-19', 'd0'),
(398, 13, '243', '400', '58', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-19', 'ea'),
(399, 13, '243', '441', '58', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-19', 'e8'),
(400, 13, '98', '1', '186', '1', '48', 'Max-5-Min-3-Part_No-1-Char_No-20', '4b'),
(401, 13, '98', '4', '186', '2', '48', 'Max-5-Min-3-Part_No-2-Char_No-20', '29'),
(402, 13, '98', '9', '186', '3', '48', 'Max-5-Min-3-Part_No-3-Char_No-20', 'cb'),
(403, 13, '98', '16', '186', '4', '48', 'Max-5-Min-3-Part_No-4-Char_No-20', '2f'),
(404, 13, '98', '25', '186', '5', '48', 'Max-5-Min-3-Part_No-5-Char_No-20', '57'),
(405, 13, '98', '36', '186', '6', '48', 'Max-5-Min-3-Part_No-6-Char_No-20', '42'),
(406, 13, '98', '49', '186', '7', '48', 'Max-5-Min-3-Part_No-7-Char_No-20', 'f1'),
(407, 13, '98', '64', '186', '8', '48', 'Max-5-Min-3-Part_No-8-Char_No-20', '62'),
(408, 13, '98', '81', '186', '9', '48', 'Max-5-Min-3-Part_No-9-Char_No-20', '97'),
(409, 13, '98', '100', '186', '10', '48', 'Max-5-Min-3-Part_No-10-Char_No-20', '8f'),
(410, 13, '98', '121', '186', '11', '48', 'Max-5-Min-3-Part_No-11-Char_No-20', '4a'),
(411, 13, '98', '144', '186', '12', '48', 'Max-5-Min-3-Part_No-12-Char_No-20', 'c9'),
(412, 13, '98', '169', '186', '13', '48', 'Max-5-Min-3-Part_No-13-Char_No-20', '0a'),
(413, 13, '98', '196', '186', '14', '48', 'Max-5-Min-3-Part_No-14-Char_No-20', '0f'),
(414, 13, '98', '225', '186', '15', '48', 'Max-5-Min-3-Part_No-15-Char_No-20', 'd8'),
(415, 13, '98', '256', '186', '16', '48', 'Max-5-Min-3-Part_No-16-Char_No-20', '63'),
(416, 13, '98', '289', '186', '17', '48', 'Max-5-Min-3-Part_No-17-Char_No-20', 'b2'),
(417, 13, '98', '324', '186', '18', '48', 'Max-5-Min-3-Part_No-18-Char_No-20', 'c4'),
(418, 13, '98', '361', '186', '19', '48', 'Max-5-Min-3-Part_No-19-Char_No-20', '99'),
(419, 13, '98', '400', '186', '20', '48', 'Max-5-Min-3-Part_No-20-Char_No-20', '31'),
(420, 13, '98', '441', '186', '21', '48', 'Max-5-Min-3-Part_No-21-Char_No-20', '8d'),
(421, 13, '247', '1', '174', '1', '49', 'Max-5-Min-3-Part_No-1-Char_No-21', 'd5'),
(422, 13, '247', '4', '174', '2', '49', 'Max-5-Min-3-Part_No-2-Char_No-21', '64'),
(423, 13, '247', '9', '174', '3', '49', 'Max-5-Min-3-Part_No-3-Char_No-21', 'e0'),
(424, 13, '247', '16', '174', '4', '49', 'Max-5-Min-3-Part_No-4-Char_No-21', '47'),
(425, 13, '247', '25', '174', '5', '49', 'Max-5-Min-3-Part_No-5-Char_No-21', '9b'),
(426, 13, '247', '36', '174', '6', '49', 'Max-5-Min-3-Part_No-6-Char_No-21', 'db'),
(427, 13, '247', '49', '174', '7', '49', 'Max-5-Min-3-Part_No-7-Char_No-21', '06'),
(428, 13, '247', '64', '174', '8', '49', 'Max-5-Min-3-Part_No-8-Char_No-21', '1e'),
(429, 13, '247', '81', '174', '9', '49', 'Max-5-Min-3-Part_No-9-Char_No-21', '22'),
(430, 13, '247', '100', '174', '10', '49', 'Max-5-Min-3-Part_No-10-Char_No-21', '12'),
(431, 13, '247', '121', '174', '11', '49', 'Max-5-Min-3-Part_No-11-Char_No-21', 'ef'),
(432, 13, '247', '144', '174', '12', '49', 'Max-5-Min-3-Part_No-12-Char_No-21', 'b7'),
(433, 13, '247', '169', '174', '13', '49', 'Max-5-Min-3-Part_No-13-Char_No-21', '6b'),
(434, 13, '247', '196', '174', '14', '49', 'Max-5-Min-3-Part_No-14-Char_No-21', '0b'),
(435, 13, '247', '225', '174', '15', '49', 'Max-5-Min-3-Part_No-15-Char_No-21', '98'),
(436, 13, '247', '256', '174', '16', '49', 'Max-5-Min-3-Part_No-16-Char_No-21', '10'),
(437, 13, '247', '289', '174', '17', '49', 'Max-5-Min-3-Part_No-17-Char_No-21', '75'),
(438, 13, '247', '324', '174', '18', '49', 'Max-5-Min-3-Part_No-18-Char_No-21', 'c6'),
(439, 13, '247', '361', '174', '19', '49', 'Max-5-Min-3-Part_No-19-Char_No-21', '02'),
(440, 13, '247', '400', '174', '20', '49', 'Max-5-Min-3-Part_No-20-Char_No-21', '2b'),
(441, 13, '247', '441', '174', '21', '49', 'Max-5-Min-3-Part_No-21-Char_No-21', '40');

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
  MODIFY `idlogrecovery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `tb_logshare`
--
ALTER TABLE `tb_logshare`
  MODIFY `idlogshare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

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
-- AUTO_INCREMENT for table `tb_recovery`
--
ALTER TABLE `tb_recovery`
  MODIFY `idrecovery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tb_share`
--
ALTER TABLE `tb_share`
  MODIFY `idshare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `tb_sharesss`
--
ALTER TABLE `tb_sharesss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

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
