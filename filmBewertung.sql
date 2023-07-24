-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server-Version:               11.0.2-MariaDB-1:11.0.2+maria~ubu2204 - mariadb.org binary distribution
-- Server-Betriebssystem:        debian-linux-gnu
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für filmBewertung
CREATE DATABASE IF NOT EXISTS `filmBewertung` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `filmBewertung`;

-- Exportiere Struktur von Tabelle filmBewertung.Benutzer
CREATE TABLE IF NOT EXISTS `Benutzer` (
  `BenutzerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BenutzerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle filmBewertung.Benutzer: ~3 rows (ungefähr)
DELETE FROM `Benutzer`;
INSERT INTO `Benutzer` (`BenutzerID`, `Name`, `Email`) VALUES
	(1, 'Anna', 'anna@mueller.de'),
	(2, 'Peter', 'peter@muster.de'),
	(3, 'Max', 'max@muh.de');

-- Exportiere Struktur von Tabelle filmBewertung.Filme
CREATE TABLE IF NOT EXISTS `Filme` (
  `FilmID` int(11) NOT NULL AUTO_INCREMENT,
  `FilmName` varchar(255) NOT NULL DEFAULT '0',
  `Regisseur` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FilmID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle filmBewertung.Filme: ~5 rows (ungefähr)
DELETE FROM `Filme`;
INSERT INTO `Filme` (`FilmID`, `FilmName`, `Regisseur`) VALUES
	(1, 'Die kanadische Wildnis', 'Frank Müller'),
	(2, 'Leben in New York', 'Ben Smith'),
	(3, 'Wir laufen um die Welt', 'Jan Koch'),
	(4, 'The Job', 'Maria Huber'),
	(5, 'Am Ende des Ozeans', 'Wolfgang Horn');

-- Exportiere Struktur von Tabelle filmBewertung.filmSchauspieler
CREATE TABLE IF NOT EXISTS `filmSchauspieler` (
  `filmSchauspielerID` int(11) NOT NULL AUTO_INCREMENT,
  `filmID` int(11) DEFAULT 0,
  `schauspielerID` int(11) DEFAULT 0,
  PRIMARY KEY (`filmSchauspielerID`),
  KEY `FK__Filme` (`filmID`),
  KEY `FK_filmSchauspieler_Schauspieler` (`schauspielerID`),
  CONSTRAINT `FK__Filme` FOREIGN KEY (`filmID`) REFERENCES `Filme` (`FilmID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_filmSchauspieler_Schauspieler` FOREIGN KEY (`schauspielerID`) REFERENCES `Schauspieler` (`SchauspielerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle filmBewertung.filmSchauspieler: ~4 rows (ungefähr)
DELETE FROM `filmSchauspieler`;
INSERT INTO `filmSchauspieler` (`filmSchauspielerID`, `filmID`, `schauspielerID`) VALUES
	(1, 1, 3),
	(2, 1, 2),
	(3, 2, 1),
	(4, 2, 3);

-- Exportiere Struktur von Tabelle filmBewertung.Schauspieler
CREATE TABLE IF NOT EXISTS `Schauspieler` (
  `SchauspielerID` int(11) NOT NULL AUTO_INCREMENT,
  `SchauspielerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SchauspielerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle filmBewertung.Schauspieler: ~3 rows (ungefähr)
DELETE FROM `Schauspieler`;
INSERT INTO `Schauspieler` (`SchauspielerID`, `SchauspielerName`) VALUES
	(1, 'Will Smith'),
	(2, 'Peter Pan'),
	(3, 'John Lolan');

-- Exportiere Struktur von Tabelle filmBewertung.Sterne
CREATE TABLE IF NOT EXISTS `Sterne` (
  `SterneID` int(11) NOT NULL AUTO_INCREMENT,
  `BenutzerID` int(11) DEFAULT NULL,
  `FilmID` int(11) DEFAULT NULL,
  `Bewertung` int(11) DEFAULT NULL,
  PRIMARY KEY (`SterneID`),
  KEY `FK_Sterne_Benutzer` (`BenutzerID`),
  KEY `FK_Sterne_Filme` (`FilmID`),
  CONSTRAINT `FK_Sterne_Benutzer` FOREIGN KEY (`BenutzerID`) REFERENCES `Benutzer` (`BenutzerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sterne_Filme` FOREIGN KEY (`FilmID`) REFERENCES `Filme` (`FilmID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle filmBewertung.Sterne: ~19 rows (ungefähr)
DELETE FROM `Sterne`;
INSERT INTO `Sterne` (`SterneID`, `BenutzerID`, `FilmID`, `Bewertung`) VALUES
	(1, 1, 4, 2),
	(2, 3, 3, 3),
	(3, 2, 4, 4),
	(4, 1, 1, 2),
	(5, 1, 2, 1),
	(6, 3, 1, 1),
	(7, 3, 4, 2),
	(8, 2, 2, 3),
	(9, 1, 3, 4),
	(10, 3, 5, 5),
	(11, 1, 5, 3),
	(12, 3, 2, 1),
	(78, 1, 5, 1),
	(79, 1, 5, 1),
	(80, 1, 5, 1),
	(81, 1, 5, 3),
	(82, 3, 5, 5),
	(83, 1, 3, 4),
	(84, 1, 1, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
