-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 09 Octobre 2019 à 07:10
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `clicom`
--
CREATE DATABASE IF NOT EXISTS `clicom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `clicom`;

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

DROP TABLE IF EXISTS `t_client`;
CREATE TABLE `t_client` (
  `idClient` int(11) NOT NULL,
  `cliCode` char(4) NOT NULL,
  `cliNom` varchar(50) NOT NULL,
  `cliAdresse` varchar(50) NOT NULL,
  `cliLocalite` varchar(50) NOT NULL,
  `cliCategorie` varchar(2) DEFAULT NULL,
  `cliCompte` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_client`
--

INSERT INTO `t_client` (`idClient`, `cliCode`, `cliNom`, `cliAdresse`, `cliLocalite`, `cliCategorie`, `cliCompte`) VALUES
(37, 'B062', 'GOFFIN', '72, r. de la Gare', 'Namur', 'B2', '-3200.00'),
(38, 'B112', 'HANSENNE', '23, a. Dumont', 'Poitiers', 'C1', '1250.00'),
(39, 'B332', 'MONTI', '112, r. Neuve', 'Genève', 'B2', '0.00'),
(40, 'B512', 'GILLET', '14, r. de l\'Eté', 'Toulouse', 'B1', '-8700.00'),
(41, 'B987', 'BLANC', '2, r. de Lausanne', 'Genève', 'B1', '1234.00'),
(42, 'C003', 'AVRON', '8, ch. de la Cure', 'Toulouse', 'B1', '-1700.00'),
(43, 'C123', 'MERCIER', '25, r. Lemaître', 'Namur', 'C1', '-2300.00'),
(44, 'C400', 'FERARD', '65, r. du Tertre', 'Poitiers', 'B2', '350.00'),
(45, 'D063', 'MERCIER', '201, bvd du Nord', 'Toulouse', NULL, '-2250.00'),
(46, 'F010', 'TOUSSAINT', '5, r. Godefroid', 'Poitiers', 'C1', '0.00'),
(47, 'F011', 'PONCELET', '17, Clos des Erables', 'Toulouse', 'B2', '0.00'),
(48, 'F400', 'JACOB', '78, ch. du Moulin', 'Bruxelles', 'C2', '0.00'),
(49, 'K111', 'VANBIST', '180, r. Florimont', 'Lille', 'B1', '720.00'),
(50, 'K729', 'NEUMAN', '40, r. Bransart', 'Toulouse', NULL, '0.00'),
(51, 'L422', 'FRANCK', '60, r. de Wepion', 'Namur', 'C1', '0.00'),
(52, 'S127', 'VANDERKA', '3, av. des Roses', 'Namur', 'C1', '-4580.00'),
(53, 'S448', 'MULLER', '55, av. du Léman', 'Geneve', 'C1', '0.00'),
(54, 'S712', 'GUILLAUME', '14a, ch. des Roses', 'Paris', 'B1', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `t_commande`
--

DROP TABLE IF EXISTS `t_commande`;
CREATE TABLE `t_commande` (
  `idCommande` int(11) NOT NULL,
  `comDate` date NOT NULL DEFAULT '0000-00-00',
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_commande`
--

INSERT INTO `t_commande` (`idCommande`, `comDate`, `idClient`) VALUES
(30178, '2005-12-21', 49),
(30179, '2005-12-22', 44),
(30182, '2005-12-23', 52),
(30184, '2005-12-23', 44),
(30185, '2006-01-02', 47),
(30186, '2006-01-02', 44),
(30188, '2006-01-03', 40);

-- --------------------------------------------------------

--
-- Structure de la table `t_concerner`
--

DROP TABLE IF EXISTS `t_concerner`;
CREATE TABLE `t_concerner` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `conQuantite` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_concerner`
--

INSERT INTO `t_concerner` (`idCommande`, `idProduit`, `conQuantite`) VALUES
(30178, 3, 25),
(30179, 1, 60),
(30179, 5, 20),
(30182, 5, 30),
(30184, 3, 120),
(30184, 4, 20),
(30185, 3, 260),
(30185, 5, 15),
(30185, 7, 600),
(30186, 4, 3),
(30188, 3, 180),
(30188, 4, 22),
(30188, 5, 70),
(30188, 6, 92);

-- --------------------------------------------------------

--
-- Structure de la table `t_produit`
--

DROP TABLE IF EXISTS `t_produit`;
CREATE TABLE `t_produit` (
  `idProduit` int(11) NOT NULL,
  `proCode` char(5) NOT NULL,
  `proLibelle` varchar(50) NOT NULL,
  `proPrix` int(11) NOT NULL DEFAULT '0',
  `proQuantiteStock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_produit`
--

INSERT INTO `t_produit` (`idProduit`, `proCode`, `proLibelle`, `proPrix`, `proQuantiteStock`) VALUES
(1, 'CS262', 'CHEV. SAPIN 200x6x2', 75, 45),
(2, 'CS264', 'CHEV. SAPIN 200x6x4', 120, 2690),
(3, 'CS464', 'CHEV. SAPIN 400x6x4', 220, 450),
(4, 'PA45', 'POINTE ACIER 45 (1K)', 105, 580),
(5, 'PA60', 'POINTE ACIER 60 (1K)', 95, 134),
(6, 'PH222', 'PL. HÊTRE 200x20x2', 230, 782),
(7, 'PS222', 'PL. SAPIN 200x20x2', 185, 1220);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `ID_t_client_IND` (`idClient`);

--
-- Index pour la table `t_commande`
--
ALTER TABLE `t_commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD UNIQUE KEY `ID_t_commande_IND` (`idCommande`),
  ADD KEY `FKpasser_IND` (`idClient`);

--
-- Index pour la table `t_concerner`
--
ALTER TABLE `t_concerner`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD UNIQUE KEY `ID_t_concerner_IND` (`idCommande`,`idProduit`),
  ADD KEY `FKt_c_t_p_IND` (`idProduit`);

--
-- Index pour la table `t_produit`
--
ALTER TABLE `t_produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD UNIQUE KEY `ID_t_produit_IND` (`idProduit`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT pour la table `t_commande`
--
ALTER TABLE `t_commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30189;
--
-- AUTO_INCREMENT pour la table `t_produit`
--
ALTER TABLE `t_produit`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_commande`
--
ALTER TABLE `t_commande`
  ADD CONSTRAINT `FKpasser_FK` FOREIGN KEY (`idClient`) REFERENCES `t_client` (`idClient`);

--
-- Contraintes pour la table `t_concerner`
--
ALTER TABLE `t_concerner`
  ADD CONSTRAINT `FKt_c_t_c` FOREIGN KEY (`idCommande`) REFERENCES `t_commande` (`idCommande`),
  ADD CONSTRAINT `FKt_c_t_p_FK` FOREIGN KEY (`idProduit`) REFERENCES `t_produit` (`idProduit`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
