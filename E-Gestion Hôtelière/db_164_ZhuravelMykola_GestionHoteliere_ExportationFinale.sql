-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : jeu. 30 jan. 2025 à 12:53
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
-- Base de données : `db_GestionHoteliere`
--

-- --------------------------------------------------------

--
-- Structure de la table `ACHETER`
--

CREATE TABLE `ACHETER` (
  `boutique_id` varchar(50) NOT NULL,
  `client_id` char(50) NOT NULL,
  `acheter_des_produits` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ACTIVITE`
--

CREATE TABLE `ACTIVITE` (
  `activite_id` varchar(50) NOT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Dates` date DEFAULT NULL,
  `Horaires` time DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `BAR`
--

CREATE TABLE `BAR` (
  `bar_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Horaires` time DEFAULT NULL,
  `Boissons` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Barman` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `BOIRE`
--

CREATE TABLE `BOIRE` (
  `bar_id` varchar(50) NOT NULL,
  `client_id` char(50) NOT NULL,
  `Boire_les_boisssons` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `BOUTIQUE`
--

CREATE TABLE `BOUTIQUE` (
  `boutique_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Produits` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `CHAMBRE`
--

CREATE TABLE `CHAMBRE` (
  `chambre_id` int NOT NULL,
  `Numero` int DEFAULT NULL,
  `Etage` int DEFAULT NULL,
  `Taille` varchar(50) DEFAULT NULL,
  `Prix` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `CLIENT`
--

CREATE TABLE `CLIENT` (
  `client_id` char(50) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prénom` varchar(25) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Adresse` varchar(30) DEFAULT NULL,
  `Données_banquaires` int DEFAULT NULL,
  `Num_de_chambre` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Creer`
--

CREATE TABLE `Creer` (
  `activite_id` varchar(50) NOT NULL,
  `hotel_id` varchar(50) NOT NULL,
  `l_hôtel_crée_met_en_place_les_activité_pour_les_clients` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `EVENEMENT`
--

CREATE TABLE `EVENEMENT` (
  `evenement_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Horaires` time DEFAULT NULL,
  `Dates` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `HEBERGER`
--

CREATE TABLE `HEBERGER` (
  `chambre_id` int NOT NULL,
  `client_id` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `HOTEL`
--

CREATE TABLE `HOTEL` (
  `hotel_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Niveau` smallint DEFAULT NULL,
  `Proposition` varchar(50) DEFAULT NULL,
  `Directeur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `MANGER`
--

CREATE TABLE `MANGER` (
  `restaurant_id` varchar(50) NOT NULL,
  `client_id` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `OFFRE`
--

CREATE TABLE `OFFRE` (
  `offre_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Dates` date DEFAULT NULL,
  `hotel_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `PARTICIPER`
--

CREATE TABLE `PARTICIPER` (
  `evenement_id` varchar(50) NOT NULL,
  `client_id` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `RESTAURANT`
--

CREATE TABLE `RESTAURANT` (
  `restaurant_id` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Horaires` time DEFAULT NULL,
  `Plats` varchar(50) DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Chef_de_rang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `SE_JOINDRE`
--

CREATE TABLE `SE_JOINDRE` (
  `activite_id` varchar(50) NOT NULL,
  `client_id` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `VISITER`
--

CREATE TABLE `VISITER` (
  `client_id` char(50) NOT NULL,
  `hotel_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ACHETER`
--
ALTER TABLE `ACHETER`
  ADD PRIMARY KEY (`boutique_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `ACTIVITE`
--
ALTER TABLE `ACTIVITE`
  ADD PRIMARY KEY (`activite_id`);

--
-- Index pour la table `BAR`
--
ALTER TABLE `BAR`
  ADD PRIMARY KEY (`bar_id`);

--
-- Index pour la table `BOIRE`
--
ALTER TABLE `BOIRE`
  ADD PRIMARY KEY (`bar_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `BOUTIQUE`
--
ALTER TABLE `BOUTIQUE`
  ADD PRIMARY KEY (`boutique_id`);

--
-- Index pour la table `CHAMBRE`
--
ALTER TABLE `CHAMBRE`
  ADD PRIMARY KEY (`chambre_id`);

--
-- Index pour la table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `Creer`
--
ALTER TABLE `Creer`
  ADD PRIMARY KEY (`activite_id`,`hotel_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Index pour la table `EVENEMENT`
--
ALTER TABLE `EVENEMENT`
  ADD PRIMARY KEY (`evenement_id`);

--
-- Index pour la table `HEBERGER`
--
ALTER TABLE `HEBERGER`
  ADD PRIMARY KEY (`chambre_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `HOTEL`
--
ALTER TABLE `HOTEL`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Index pour la table `MANGER`
--
ALTER TABLE `MANGER`
  ADD PRIMARY KEY (`restaurant_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `OFFRE`
--
ALTER TABLE `OFFRE`
  ADD PRIMARY KEY (`offre_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Index pour la table `PARTICIPER`
--
ALTER TABLE `PARTICIPER`
  ADD PRIMARY KEY (`evenement_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `RESTAURANT`
--
ALTER TABLE `RESTAURANT`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Index pour la table `SE_JOINDRE`
--
ALTER TABLE `SE_JOINDRE`
  ADD PRIMARY KEY (`activite_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `VISITER`
--
ALTER TABLE `VISITER`
  ADD PRIMARY KEY (`client_id`,`hotel_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ACHETER`
--
ALTER TABLE `ACHETER`
  ADD CONSTRAINT `ACHETER_ibfk_1` FOREIGN KEY (`boutique_id`) REFERENCES `BOUTIQUE` (`boutique_id`),
  ADD CONSTRAINT `ACHETER_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `BOIRE`
--
ALTER TABLE `BOIRE`
  ADD CONSTRAINT `BOIRE_ibfk_1` FOREIGN KEY (`bar_id`) REFERENCES `BAR` (`bar_id`),
  ADD CONSTRAINT `BOIRE_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `Creer`
--
ALTER TABLE `Creer`
  ADD CONSTRAINT `Creer_ibfk_1` FOREIGN KEY (`activite_id`) REFERENCES `ACTIVITE` (`activite_id`),
  ADD CONSTRAINT `Creer_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `HOTEL` (`hotel_id`);

--
-- Contraintes pour la table `HEBERGER`
--
ALTER TABLE `HEBERGER`
  ADD CONSTRAINT `HEBERGER_ibfk_1` FOREIGN KEY (`chambre_id`) REFERENCES `CHAMBRE` (`chambre_id`),
  ADD CONSTRAINT `HEBERGER_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `MANGER`
--
ALTER TABLE `MANGER`
  ADD CONSTRAINT `MANGER_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `RESTAURANT` (`restaurant_id`),
  ADD CONSTRAINT `MANGER_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `OFFRE`
--
ALTER TABLE `OFFRE`
  ADD CONSTRAINT `OFFRE_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `HOTEL` (`hotel_id`);

--
-- Contraintes pour la table `PARTICIPER`
--
ALTER TABLE `PARTICIPER`
  ADD CONSTRAINT `PARTICIPER_ibfk_1` FOREIGN KEY (`evenement_id`) REFERENCES `EVENEMENT` (`evenement_id`),
  ADD CONSTRAINT `PARTICIPER_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `SE_JOINDRE`
--
ALTER TABLE `SE_JOINDRE`
  ADD CONSTRAINT `SE_JOINDRE_ibfk_1` FOREIGN KEY (`activite_id`) REFERENCES `ACTIVITE` (`activite_id`),
  ADD CONSTRAINT `SE_JOINDRE_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`);

--
-- Contraintes pour la table `VISITER`
--
ALTER TABLE `VISITER`
  ADD CONSTRAINT `VISITER_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`),
  ADD CONSTRAINT `VISITER_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `HOTEL` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
