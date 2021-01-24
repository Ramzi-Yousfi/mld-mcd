-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 jan. 2021 à 10:24
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
-- Base de données : `clinique_vétérinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DatesDeces` date DEFAULT NULL,
  `Propriétaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_animal_Propriétaire_idx` (`Propriétaire_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `animal_id` int(11) NOT NULL,
  `Race_chat_id` int(11) NOT NULL,
  `taille` int(11) DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  KEY `fk_chat_animal1` (`animal_id`),
  KEY `fk_chat_Race_chat1` (`Race_chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `animal_id` int(11) NOT NULL,
  `Race_chien_id` int(11) NOT NULL,
  `taille` int(11) DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  KEY `fk_chien_animal1` (`animal_id`),
  KEY `fk_chien_Race_chien1` (`Race_chien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antecedents` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `Veterinaire_id` int(11) NOT NULL,
  `Garde_id` int(11) NOT NULL,
  KEY `fk_Effectuer_Veterinaire1` (`Veterinaire_id`),
  KEY `fk_Effectuer_Garde1` (`Garde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

DROP TABLE IF EXISTS `garde`;
CREATE TABLE IF NOT EXISTS `garde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  ` heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
CREATE TABLE IF NOT EXISTS `horaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jour` date DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `Veterinaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horaire_Veterinaire1` (`Veterinaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `dosage` varchar(45) DEFAULT NULL,
  `effetsSecondaires` text,
  `laboratoire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `Medicament_id` int(11) NOT NULL,
  `visite_id` int(11) NOT NULL,
  `Posologie` varchar(45) DEFAULT NULL,
  KEY `fk_Prescrire_Medicament1` (`Medicament_id`),
  KEY `fk_Prescrire_visite1` (`visite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `propriétaire`
--

DROP TABLE IF EXISTS `propriétaire`;
CREATE TABLE IF NOT EXISTS `propriétaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prénom` varchar(45) NOT NULL,
  `rue` varchar(45) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tetephone` int(11) DEFAULT NULL,
  `telephone_mobile` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chat`
--

DROP TABLE IF EXISTS `race_chat`;
CREATE TABLE IF NOT EXISTS `race_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chien`
--

DROP TABLE IF EXISTS `race_chien`;
CREATE TABLE IF NOT EXISTS `race_chien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

DROP TABLE IF EXISTS `veterinaire`;
CREATE TABLE IF NOT EXISTS `veterinaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneMobile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateVisite` date DEFAULT NULL,
  `heureVisite` datetime DEFAULT NULL,
  `raison` longtext,
  `visitecol` varchar(45) DEFAULT NULL,
  `animal_id` int(11) NOT NULL,
  `Dossier_id` int(11) NOT NULL,
  `Veterinaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_visite_animal1` (`animal_id`),
  KEY `fk_visite_Dossier1` (`Dossier_id`),
  KEY `fk_visite_Veterinaire1` (`Veterinaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_chat_Race_chat1` FOREIGN KEY (`Race_chat_id`) REFERENCES `race_chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chat_animal1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `fk_chien_Race_chien1` FOREIGN KEY (`Race_chien_id`) REFERENCES `race_chien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chien_animal1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `fk_Effectuer_Garde1` FOREIGN KEY (`Garde_id`) REFERENCES `garde` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Effectuer_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `fk_Horaire_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `fk_Prescrire_Medicament1` FOREIGN KEY (`Medicament_id`) REFERENCES `medicament` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prescrire_visite1` FOREIGN KEY (`visite_id`) REFERENCES `visite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `fk_visite_Dossier1` FOREIGN KEY (`Dossier_id`) REFERENCES `dossier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visite_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visite_animal1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
