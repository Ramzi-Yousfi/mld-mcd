-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 jan. 2021 à 08:19
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
-- Base de données : `test-php`
--

-- --------------------------------------------------------

--
-- Structure de la table `jeux_video`
--

DROP TABLE IF EXISTS `jeux_video`;
CREATE TABLE IF NOT EXISTS `jeux_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `possesseur` varchar(255) NOT NULL,
  `console` varchar(255) NOT NULL,
  `prix` decimal(7,2) NOT NULL,
  `nbre_joueurs_max` int(5) NOT NULL,
  `commentaires` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jeux_video`
--

INSERT INTO `jeux_video` (`id`, `nom`, `possesseur`, `console`, `prix`, `nbre_joueurs_max`, `commentaires`) VALUES
(1, 'Pokémon Soleil 3DS', 'Alex', 'Nintendo DS', '34.90', 1, 'Incarnez un dresseur Pokémon'),
(2, 'Pokémon Lune 3DS', 'Patrick', 'Nintendo DS', '34.00', 1, 'Incarnez un dresseur Pokémon'),
(3, 'Super Mario Maker', 'Tom', 'Wii U', '49.00', 4, 'Devenez créateur de votre propre jeu Super Mario Bros. !');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
