-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 22 Février 2025 à 12:44
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `x`
--

-- --------------------------------------------------------

--
-- Structure de la table `caine_tv`
--

CREATE TABLE `caine_tv` (
  `numero` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `numero_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_public`
--

CREATE TABLE `categorie_public` (
  `numero` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `diffuser`
--

CREATE TABLE `diffuser` (
  `numero` int(11) NOT NULL,
  `numero_1` int(11) NOT NULL,
  `jj_mm_aaaa_hh_mm` date NOT NULL,
  `sous_titrage` varchar(50) DEFAULT NULL,
  `doublage` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emission`
--

CREATE TABLE `emission` (
  `numero` int(11) NOT NULL,
  `commentaire` varchar(50) DEFAULT NULL,
  `duree` varchar(50) DEFAULT NULL,
  `langue_VO` varchar(50) DEFAULT NULL,
  `numero_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etre_destinee`
--

CREATE TABLE `etre_destinee` (
  `numero` int(11) NOT NULL,
  `numero_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `numero` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays_siege`
--

CREATE TABLE `pays_siege` (
  `numero` int(11) NOT NULL,
  `nomPays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produire`
--

CREATE TABLE `produire` (
  `numero` int(11) NOT NULL,
  `numero_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `_la_date_`
--

CREATE TABLE `_la_date_` (
  `jj_mm_aaaa_hh_mm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `caine_tv`
--
ALTER TABLE `caine_tv`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numero_1` (`numero_1`);

--
-- Index pour la table `categorie_public`
--
ALTER TABLE `categorie_public`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `diffuser`
--
ALTER TABLE `diffuser`
  ADD PRIMARY KEY (`numero`,`numero_1`,`jj_mm_aaaa_hh_mm`),
  ADD KEY `numero_1` (`numero_1`),
  ADD KEY `jj_mm_aaaa_hh_mm` (`jj_mm_aaaa_hh_mm`);

--
-- Index pour la table `emission`
--
ALTER TABLE `emission`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numero_1` (`numero_1`);

--
-- Index pour la table `etre_destinee`
--
ALTER TABLE `etre_destinee`
  ADD PRIMARY KEY (`numero`,`numero_1`),
  ADD KEY `numero_1` (`numero_1`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `pays_siege`
--
ALTER TABLE `pays_siege`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `produire`
--
ALTER TABLE `produire`
  ADD PRIMARY KEY (`numero`,`numero_1`),
  ADD KEY `numero_1` (`numero_1`);

--
-- Index pour la table `_la_date_`
--
ALTER TABLE `_la_date_`
  ADD PRIMARY KEY (`jj_mm_aaaa_hh_mm`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `caine_tv`
--
ALTER TABLE `caine_tv`
  ADD CONSTRAINT `caine_tv_ibfk_1` FOREIGN KEY (`numero_1`) REFERENCES `pays_siege` (`numero`);

--
-- Contraintes pour la table `diffuser`
--
ALTER TABLE `diffuser`
  ADD CONSTRAINT `diffuser_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `caine_tv` (`numero`),
  ADD CONSTRAINT `diffuser_ibfk_2` FOREIGN KEY (`numero_1`) REFERENCES `emission` (`numero`),
  ADD CONSTRAINT `diffuser_ibfk_3` FOREIGN KEY (`jj_mm_aaaa_hh_mm`) REFERENCES `_la_date_` (`jj_mm_aaaa_hh_mm`);

--
-- Contraintes pour la table `emission`
--
ALTER TABLE `emission`
  ADD CONSTRAINT `emission_ibfk_1` FOREIGN KEY (`numero_1`) REFERENCES `genre` (`numero`);

--
-- Contraintes pour la table `etre_destinee`
--
ALTER TABLE `etre_destinee`
  ADD CONSTRAINT `etre_destinee_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `emission` (`numero`),
  ADD CONSTRAINT `etre_destinee_ibfk_2` FOREIGN KEY (`numero_1`) REFERENCES `categorie_public` (`numero`);

--
-- Contraintes pour la table `produire`
--
ALTER TABLE `produire`
  ADD CONSTRAINT `produire_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `caine_tv` (`numero`),
  ADD CONSTRAINT `produire_ibfk_2` FOREIGN KEY (`numero_1`) REFERENCES `emission` (`numero`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
