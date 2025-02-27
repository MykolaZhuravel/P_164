-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 11 Février 2019 à 12:49
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_bibliotheque`
--
CREATE DATABASE IF NOT EXISTS `db_bibliotheque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_bibliotheque`;

-- --------------------------------------------------------

--
-- Structure de la table `t_achat`
--

DROP TABLE IF EXISTS `t_achat`;
CREATE TABLE `t_achat` (
  `idLivre` int(4) UNSIGNED NOT NULL,
  `achDate` date NOT NULL,
  `achPrix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_auteur`
--

DROP TABLE IF EXISTS `t_auteur`;
CREATE TABLE `t_auteur` (
  `idAuteur` int(4) UNSIGNED NOT NULL,
  `autAuteur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_editeur`
--

DROP TABLE IF EXISTS `t_editeur`;
CREATE TABLE `t_editeur` (
  `idEditeur` tinyint(4) UNSIGNED NOT NULL,
  `ediEditeur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_livre`
--

DROP TABLE IF EXISTS `t_livre`;
CREATE TABLE `t_livre` (
  `idLivre` int(4) UNSIGNED NOT NULL,
  `livTitre` varchar(50) NOT NULL,
  `idAuteur` int(10) UNSIGNED NOT NULL,
  `idSujet` tinyint(3) UNSIGNED NOT NULL,
  `idEditeur` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_sujet`
--

DROP TABLE IF EXISTS `t_sujet`;
CREATE TABLE `t_sujet` (
  `idSujet` tinyint(4) UNSIGNED NOT NULL,
  `sujSujet` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_achat`
--
ALTER TABLE `t_achat`
  ADD PRIMARY KEY (`idLivre`);

--
-- Index pour la table `t_auteur`
--
ALTER TABLE `t_auteur`
  ADD PRIMARY KEY (`idAuteur`);

--
-- Index pour la table `t_editeur`
--
ALTER TABLE `t_editeur`
  ADD PRIMARY KEY (`idEditeur`);

--
-- Index pour la table `t_livre`
--
ALTER TABLE `t_livre`
  ADD PRIMARY KEY (`idLivre`),
  ADD KEY `idAuteur` (`idAuteur`,`idSujet`,`idEditeur`),
  ADD KEY `idEditeur` (`idEditeur`),
  ADD KEY `idSujet` (`idSujet`);

--
-- Index pour la table `t_sujet`
--
ALTER TABLE `t_sujet`
  ADD PRIMARY KEY (`idSujet`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_achat`
--
ALTER TABLE `t_achat`
  MODIFY `idLivre` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_auteur`
--
ALTER TABLE `t_auteur`
  MODIFY `idAuteur` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_editeur`
--
ALTER TABLE `t_editeur`
  MODIFY `idEditeur` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_livre`
--
ALTER TABLE `t_livre`
  MODIFY `idLivre` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_sujet`
--
ALTER TABLE `t_sujet`
  MODIFY `idSujet` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_achat`
--
ALTER TABLE `t_achat`
  ADD CONSTRAINT `t_achat_ibfk_1` FOREIGN KEY (`idLivre`) REFERENCES `t_livre` (`idLivre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `t_livre`
--
ALTER TABLE `t_livre`
  ADD CONSTRAINT `t_livre_ibfk_1` FOREIGN KEY (`idAuteur`) REFERENCES `t_auteur` (`idAuteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_livre_ibfk_2` FOREIGN KEY (`idEditeur`) REFERENCES `t_editeur` (`idEditeur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_livre_ibfk_3` FOREIGN KEY (`idSujet`) REFERENCES `t_sujet` (`idSujet`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
