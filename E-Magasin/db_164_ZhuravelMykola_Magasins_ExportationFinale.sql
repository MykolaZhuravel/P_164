-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : jeu. 30 jan. 2025 à 14:50
-- Version du serveur : 8.0.30
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_magasins`
--

-- --------------------------------------------------------

--
-- Structure de la table `assemblage`
--

CREATE TABLE `assemblage` (
  `article_id` int NOT NULL,
  `article_id_1` int NOT NULL,
  `qteComposant` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_article`
--

CREATE TABLE `t_article` (
  `article_id` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Poids` decimal(15,2) DEFAULT NULL,
  `Couleur` varchar(50) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `PrixAchat` decimal(15,2) DEFAULT NULL,
  `PrixVente` decimal(15,2) DEFAULT NULL,
  `fournisseur_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

CREATE TABLE `t_client` (
  `client_id` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `CodePays` int DEFAULT NULL,
  `Localite` varchar(50) DEFAULT NULL,
  `ChiffreAffaire` decimal(15,2) DEFAULT NULL,
  `TypeClient` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_commande`
--

CREATE TABLE `t_commande` (
  `commande_id` int NOT NULL,
  `DateCommande` date DEFAULT NULL,
  `client_id` int NOT NULL,
  `magasin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_detail_commande`
--

CREATE TABLE `t_detail_commande` (
  `commande_id` int NOT NULL,
  `article_id` int NOT NULL,
  `QuantiteComandee` int DEFAULT NULL,
  `QuantiteTotaleLivree` int DEFAULT NULL,
  `PrixVenteReel` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_detail_livraison`
--

CREATE TABLE `t_detail_livraison` (
  `livraison_id` int NOT NULL,
  `article_id` int NOT NULL,
  `commande_id` int NOT NULL,
  `article_id_1` int NOT NULL,
  `QuantiteLivree` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_fournisseur`
--

CREATE TABLE `t_fournisseur` (
  `fournisseur_id` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_livraison`
--

CREATE TABLE `t_livraison` (
  `livraison_id` int NOT NULL,
  `DateLivraison` date DEFAULT NULL,
  `client_id` int NOT NULL,
  `magasin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_magasin`
--

CREATE TABLE `t_magasin` (
  `magasin_id` int NOT NULL,
  `Localite` varchar(50) DEFAULT NULL,
  `Gerant` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assemblage`
--
ALTER TABLE `assemblage`
  ADD PRIMARY KEY (`article_id`,`article_id_1`),
  ADD KEY `article_id_1` (`article_id_1`);

--
-- Index pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `fournisseur_fk` (`fournisseur_fk`);

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `t_commande`
--
ALTER TABLE `t_commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `magasin_id` (`magasin_id`);

--
-- Index pour la table `t_detail_commande`
--
ALTER TABLE `t_detail_commande`
  ADD PRIMARY KEY (`commande_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Index pour la table `t_detail_livraison`
--
ALTER TABLE `t_detail_livraison`
  ADD PRIMARY KEY (`livraison_id`,`article_id`,`commande_id`,`article_id_1`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `commande_id` (`commande_id`,`article_id_1`);

--
-- Index pour la table `t_fournisseur`
--
ALTER TABLE `t_fournisseur`
  ADD PRIMARY KEY (`fournisseur_id`);

--
-- Index pour la table `t_livraison`
--
ALTER TABLE `t_livraison`
  ADD PRIMARY KEY (`livraison_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `magasin_id` (`magasin_id`);

--
-- Index pour la table `t_magasin`
--
ALTER TABLE `t_magasin`
  ADD PRIMARY KEY (`magasin_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assemblage`
--
ALTER TABLE `assemblage`
  ADD CONSTRAINT `assemblage_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`article_id`),
  ADD CONSTRAINT `assemblage_ibfk_2` FOREIGN KEY (`article_id_1`) REFERENCES `t_article` (`article_id`);

--
-- Contraintes pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`fournisseur_fk`) REFERENCES `t_fournisseur` (`fournisseur_id`);

--
-- Contraintes pour la table `t_commande`
--
ALTER TABLE `t_commande`
  ADD CONSTRAINT `t_commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `t_client` (`client_id`),
  ADD CONSTRAINT `t_commande_ibfk_2` FOREIGN KEY (`magasin_id`) REFERENCES `t_magasin` (`magasin_id`);

--
-- Contraintes pour la table `t_detail_commande`
--
ALTER TABLE `t_detail_commande`
  ADD CONSTRAINT `t_detail_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `t_commande` (`commande_id`),
  ADD CONSTRAINT `t_detail_commande_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`article_id`);

--
-- Contraintes pour la table `t_detail_livraison`
--
ALTER TABLE `t_detail_livraison`
  ADD CONSTRAINT `t_detail_livraison_ibfk_1` FOREIGN KEY (`livraison_id`) REFERENCES `t_livraison` (`livraison_id`),
  ADD CONSTRAINT `t_detail_livraison_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`article_id`),
  ADD CONSTRAINT `t_detail_livraison_ibfk_3` FOREIGN KEY (`commande_id`,`article_id_1`) REFERENCES `t_detail_commande` (`commande_id`, `article_id`);

--
-- Contraintes pour la table `t_livraison`
--
ALTER TABLE `t_livraison`
  ADD CONSTRAINT `t_livraison_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `t_client` (`client_id`),
  ADD CONSTRAINT `t_livraison_ibfk_2` FOREIGN KEY (`magasin_id`) REFERENCES `t_magasin` (`magasin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
