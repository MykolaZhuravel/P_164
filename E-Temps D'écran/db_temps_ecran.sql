-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 06 Février 2025 à 18:01
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_temps_ecran`
--

-- --------------------------------------------------------

--
-- Structure de la table `appareil`
--

CREATE TABLE `appareil` (
  `appareil_id` int(11) NOT NULL,
  `Plateforme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `appareil`
--

INSERT INTO `appareil` (`appareil_id`, `Plateforme`) VALUES
(1, 'Smartphone'),
(2, 'PC'),
(3, 'Console');

-- --------------------------------------------------------

--
-- Structure de la table `application`
--

CREATE TABLE `application` (
  `application_id` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `application`
--

INSERT INTO `application` (`application_id`, `Nom`, `Type`) VALUES
(1, 'TikTok', 'Divertissement'),
(2, 'Gmail', 'Messagerie'),
(3, 'Clash-Royale', 'Jeux');

-- --------------------------------------------------------

--
-- Structure de la table `temps`
--

CREATE TABLE `temps` (
  `temps_id` int(11) NOT NULL,
  `TempsPasse` time DEFAULT NULL,
  `DateUtilisation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `temps`
--

INSERT INTO `temps` (`temps_id`, `TempsPasse`, `DateUtilisation`) VALUES
(1, '08:16:00', '2024-11-03'),
(2, '00:53:00', '2024-11-06'),
(3, '10:20:00', '2024-11-17');

-- --------------------------------------------------------

--
-- Structure de la table `temps_passe`
--

CREATE TABLE `temps_passe` (
  `application_id` int(11) NOT NULL,
  `temps_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `temps_utilisation_appareil`
--

CREATE TABLE `temps_utilisation_appareil` (
  `appareil_id` int(11) NOT NULL,
  `temps_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilise_sur`
--

CREATE TABLE `utilise_sur` (
  `appareil_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appareil`
--
ALTER TABLE `appareil`
  ADD PRIMARY KEY (`appareil_id`);

--
-- Index pour la table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`application_id`);

--
-- Index pour la table `temps`
--
ALTER TABLE `temps`
  ADD PRIMARY KEY (`temps_id`);

--
-- Index pour la table `temps_passe`
--
ALTER TABLE `temps_passe`
  ADD PRIMARY KEY (`application_id`,`temps_id`),
  ADD KEY `temps_id` (`temps_id`);

--
-- Index pour la table `temps_utilisation_appareil`
--
ALTER TABLE `temps_utilisation_appareil`
  ADD PRIMARY KEY (`appareil_id`,`temps_id`),
  ADD KEY `temps_id` (`temps_id`);

--
-- Index pour la table `utilise_sur`
--
ALTER TABLE `utilise_sur`
  ADD PRIMARY KEY (`appareil_id`,`application_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `temps_passe`
--
ALTER TABLE `temps_passe`
  ADD CONSTRAINT `temps_passe_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`),
  ADD CONSTRAINT `temps_passe_ibfk_2` FOREIGN KEY (`temps_id`) REFERENCES `temps` (`temps_id`);

--
-- Contraintes pour la table `temps_utilisation_appareil`
--
ALTER TABLE `temps_utilisation_appareil`
  ADD CONSTRAINT `temps_utilisation_appareil_ibfk_1` FOREIGN KEY (`appareil_id`) REFERENCES `appareil` (`appareil_id`),
  ADD CONSTRAINT `temps_utilisation_appareil_ibfk_2` FOREIGN KEY (`temps_id`) REFERENCES `temps` (`temps_id`);

--
-- Contraintes pour la table `utilise_sur`
--
ALTER TABLE `utilise_sur`
  ADD CONSTRAINT `utilise_sur_ibfk_1` FOREIGN KEY (`appareil_id`) REFERENCES `appareil` (`appareil_id`),
  ADD CONSTRAINT `utilise_sur_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
