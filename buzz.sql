-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for buzzworks
DROP DATABASE IF EXISTS `buzzworks`;
CREATE DATABASE IF NOT EXISTS `buzzworks` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `buzzworks`;

-- Dumping structure for table buzzworks.rating
DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `receipe_id` int(20) NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_rating_receipes` (`receipe_id`),
  CONSTRAINT `FK_rating_receipes` FOREIGN KEY (`receipe_id`) REFERENCES `receipes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table buzzworks.rating: ~1 rows (approximately)
INSERT INTO `rating` (`id`, `receipe_id`, `rating`, `created_at`, `updated_at`) VALUES
	(1, 5, '4', '2023-02-04 11:34:01', '2023-02-04 11:34:01');

-- Dumping structure for table buzzworks.receipes
DROP TABLE IF EXISTS `receipes`;
CREATE TABLE IF NOT EXISTS `receipes` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `prep_time` varchar(250) NOT NULL,
  `difficulty` int(1) NOT NULL,
  `vegetarian` enum('1','2') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table buzzworks.receipes: ~3 rows (approximately)
INSERT INTO `receipes` (`id`, `name`, `prep_time`, `difficulty`, `vegetarian`, `created_at`, `updated_at`) VALUES
	(1, 'Tea', '3.30 PM', 1, '1', '2023-02-04 10:30:58', '2023-02-04 10:33:28'),
	(2, 'Idly', '6.30 PM', 2, '1', '2023-02-04 10:33:51', '2023-02-04 10:33:51'),
	(5, 'Mutton', '10.30 PM', 3, '2', '2023-02-04 10:42:08', '2023-02-04 10:42:08'),
	(6, 'Chicken', '10.30 PM', 2, '2', '2023-02-04 10:55:33', '2023-02-04 10:55:33'),
	(7, 'Vada Sambar', '10.30 PM', 2, '1', '2023-02-04 11:10:52', '2023-02-04 11:10:52');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
