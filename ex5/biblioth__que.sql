-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 jan. 2021 à 11:49
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
-- Base de données : `bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `numAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  `prenom` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  PRIMARY KEY (`numAuteur`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `caracterise`
--

DROP TABLE IF EXISTS `caracterise`;
CREATE TABLE IF NOT EXISTS `caracterise` (
  `Ouvrage_numOuvrage,` int(11) NOT NULL,
  `Motcle_numMot` int(11) NOT NULL,
  KEY `fk_Caracterise_Ouvrage1_idx` (`Ouvrage_numOuvrage,`),
  KEY `fk_Caracterise_Motcle1_idx` (`Motcle_numMot`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ecrit`
--

DROP TABLE IF EXISTS `ecrit`;
CREATE TABLE IF NOT EXISTS `ecrit` (
  `Auteur_numAuteur` int(11) NOT NULL,
  `Ouvrage_numOuvrage,` int(11) NOT NULL,
  KEY `fk_Ecrit_Auteur_idx` (`Auteur_numAuteur`),
  KEY `fk_Ecrit_Ouvrage1_idx` (`Ouvrage_numOuvrage,`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `numEditeur` int(11) NOT NULL AUTO_INCREMENT,
  `nomEditeur` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  `adresseEditeur` mediumtext COLLATE hp8_bin,
  PRIMARY KEY (`numEditeur`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

DROP TABLE IF EXISTS `emprunteur`;
CREATE TABLE IF NOT EXISTS `emprunteur` (
  `numEmprunteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomEmprunteur` mediumtext COLLATE hp8_bin,
  `telephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`numEmprunteur`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `numExemplaire` int(11) NOT NULL AUTO_INCREMENT,
  ` position` int(11) DEFAULT NULL,
  `dateAchat` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  `Ouvrage_numOuvrage,` int(11) NOT NULL,
  PRIMARY KEY (`numExemplaire`,`Ouvrage_numOuvrage,`),
  KEY `fk_Exemplaire_Ouvrage1_idx` (`Ouvrage_numOuvrage,`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `motcle`
--

DROP TABLE IF EXISTS `motcle`;
CREATE TABLE IF NOT EXISTS `motcle` (
  `numMot` int(11) NOT NULL AUTO_INCREMENT,
  `mot` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  PRIMARY KEY (`numMot`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

DROP TABLE IF EXISTS `ouvrage`;
CREATE TABLE IF NOT EXISTS `ouvrage` (
  `numOuvrage,` int(11) NOT NULL,
  ` titre` varchar(45) COLLATE hp8_bin DEFAULT NULL,
  `Editeur_numEditeur` int(11) NOT NULL,
  PRIMARY KEY (`numOuvrage,`),
  KEY `fk_Ouvrage_Editeur1_idx` (`Editeur_numEditeur`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
