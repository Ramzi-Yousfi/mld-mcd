-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 jan. 2021 à 12:25
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `musée`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE IF NOT EXISTS `artiste` (
  `numArtiste` int(11) NOT NULL AUTO_INCREMENT,
  `nomArtiste` varchar(45) DEFAULT NULL,
  ` prénom` varchar(45) DEFAULT NULL,
  ` dateNaissance` date DEFAULT NULL,
  `dateDécès` date DEFAULT NULL,
  `descriptionArtiste` longtext,
  `Nationalité_numNationalité` int(11) NOT NULL,
  PRIMARY KEY (`numArtiste`),
  KEY `fk_Artiste_Nationalité1_idx` (`Nationalité_numNationalité`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `Oeuvre_numOeuvre` int(11) NOT NULL,
  `Artiste_numArtiste` int(11) NOT NULL,
  KEY `fk_Auteur_Oeuvre1_idx` (`Oeuvre_numOeuvre`),
  KEY `fk_Auteur_Artiste1_idx` (`Artiste_numArtiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `courantartistique`
--

DROP TABLE IF EXISTS `courantartistique`;
CREATE TABLE IF NOT EXISTS `courantartistique` (
  `numCourant` int(11) NOT NULL,
  `nomcourant` varchar(45) DEFAULT NULL,
  `début` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `descriptionCourant` text,
  PRIMARY KEY (`numCourant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `numéro` int(11) NOT NULL AUTO_INCREMENT,
  `Oeuvre_numOeuvre` int(11) NOT NULL,
  `Musée_numMusée` int(11) NOT NULL,
  PRIMARY KEY (`numéro`),
  KEY `fk_Exemplaire_Oeuvre1_idx` (`Oeuvre_numOeuvre`),
  KEY `fk_Exemplaire_Musée1_idx` (`Musée_numMusée`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matière`
--

DROP TABLE IF EXISTS `matière`;
CREATE TABLE IF NOT EXISTS `matière` (
  `numMat` int(11) NOT NULL AUTO_INCREMENT,
  `nomMat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numMat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `musée`
--

DROP TABLE IF EXISTS `musée`;
CREATE TABLE IF NOT EXISTS `musée` (
  `numMusée` int(11) NOT NULL AUTO_INCREMENT,
  `nomMusée` varchar(45) DEFAULT NULL,
  `Ville_numVille` int(11) NOT NULL,
  PRIMARY KEY (`numMusée`),
  KEY `fk_Musée_Ville1_idx` (`Ville_numVille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `nationalité`
--

DROP TABLE IF EXISTS `nationalité`;
CREATE TABLE IF NOT EXISTS `nationalité` (
  `numNationalité` int(11) NOT NULL,
  `nomNationalité` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numNationalité`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

DROP TABLE IF EXISTS `oeuvre`;
CREATE TABLE IF NOT EXISTS `oeuvre` (
  `numOeuvre` int(11) NOT NULL AUTO_INCREMENT,
  ` titre` varchar(45) DEFAULT NULL,
  `année,` date DEFAULT NULL,
  `dimensions` int(11) DEFAULT NULL,
  `Oeuvrecol` varchar(45) DEFAULT NULL,
  `Matière_numMat` int(11) NOT NULL,
  `Type_numType` int(11) NOT NULL,
  `CourantArtistique_numCourant` int(11) NOT NULL,
  PRIMARY KEY (`numOeuvre`),
  KEY `fk_Oeuvre_Matière_idx` (`Matière_numMat`),
  KEY `fk_Oeuvre_Type1_idx` (`Type_numType`),
  KEY `fk_Oeuvre_CourantArtistique1_idx` (`CourantArtistique_numCourant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

DROP TABLE IF EXISTS `participe`;
CREATE TABLE IF NOT EXISTS `participe` (
  `CourantArtistique_numCourant` int(11) NOT NULL,
  `Artiste_numArtiste` int(11) NOT NULL,
  KEY `fk_Participe_CourantArtistique1_idx` (`CourantArtistique_numCourant`),
  KEY `fk_Participe_Artiste1_idx` (`Artiste_numArtiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `numType` int(11) NOT NULL AUTO_INCREMENT,
  `nomtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `numVille` int(11) NOT NULL,
  `nomVille` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numVille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
