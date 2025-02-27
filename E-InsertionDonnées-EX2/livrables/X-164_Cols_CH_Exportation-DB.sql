-- Création de la base de données
CREATE DATABASE IF NOT EXISTS cols_challenge;
USE cols_challenge;

-- Création de la table tbl_Cantons
CREATE TABLE IF NOT EXISTS tbl_Cantons (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    canton VARCHAR(100) UNIQUE NOT NULL
);

-- Création de la table tbl_Massifs
CREATE TABLE IF NOT EXISTS tbl_Massifs (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    massif VARCHAR(100) UNIQUE NOT NULL
);

-- Création de la table tbl_Lieux
CREATE TABLE IF NOT EXISTS tbl_Lieux (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    ville VARCHAR(100) UNIQUE NOT NULL
);

-- Création de la table tbl_CoupsCoeur
CREATE TABLE IF NOT EXISTS tbl_CoupsCoeur (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    rang INT NOT NULL,
    raison TEXT
);

-- Création de la table principale tbl_Cols
CREATE TABLE IF NOT EXISTS tbl_Cols (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    nomCol VARCHAR(100) NOT NULL,
    num_tblCantons INT,
    num_tblMassifs INT,
    num_tblLieuxDepart INT,
    num_tblLieuxArrivee INT,
    num_tblCoupsCoeur INT,
    altitude INT,
    penteMaxi INT,
    denivelee INT,
    km INT,
    FOREIGN KEY (num_tblCantons) REFERENCES tbl_Cantons(numero),
    FOREIGN KEY (num_tblMassifs) REFERENCES tbl_Massifs(numero),
    FOREIGN KEY (num_tblLieuxDepart) REFERENCES tbl_Lieux(numero),
    FOREIGN KEY (num_tblLieuxArrivee) REFERENCES tbl_Lieux(numero),
    FOREIGN KEY (num_tblCoupsCoeur) REFERENCES tbl_CoupsCoeur(numero)
);

-- Insertion des données dans tbl_Cantons
INSERT INTO tbl_Cantons (canton) VALUES ('Berne'), ('Vaud'), ('Neuchâtel'), ('Valais'), ('Uri'), ('Tessin'), ('Grisons'), ('Glaris');

-- Insertion des données dans tbl_Massifs
INSERT INTO tbl_Massifs (massif) VALUES ('Jura'), ('Alpes'), ('Préalpes'), ('Alpes bernoises');

-- Insertion des données dans tbl_Lieux
INSERT INTO tbl_Lieux (ville) VALUES ('Saint-Imier'), ('Fleurier'), ('Le Locle'), ('Martigny'), ('Le Châtelard'), ('Oberwald'), ('Gletsch'), ('Wassen'), ('Tramelan'), ('Lugano'), ('Saint-Imier'), ('Airolo'), ('Aoste'), ('Biasca'), ('Andermatt'), ('Poschiavo'), ('Susch'), ('Silvaplana'), ('Linthal'), ('Saanen'), ('Gsteig');

-- Insertion des données dans tbl_CoupsCoeur
INSERT INTO tbl_CoupsCoeur (rang, raison) VALUES (7, 'Le col à James Bond, côté Realp...'), (2, 'Dans le TOP 10 assurément...'), (4, 'Sauvage, col alpin à virolets...'), (1, 'On est dans une merveille des Alpes...');

-- Insertion des données dans tbl_Cols
INSERT INTO tbl_Cols (annee, nomCol, num_tblCantons, num_tblMassifs, num_tblLieuxDepart, num_tblLieuxArrivee, num_tblCoupsCoeur, altitude, penteMaxi, denivelee, km) 
VALUES 
(1987, 'Chasseral', 1, 1, 1, 1, NULL, 1502, 11, 1563, 107),
(1987, 'Étroits', 2, 1, 2, 2, NULL, 1152, 8, 720, 80),
(1987, 'Tourne', 3, 1, 3, 3, NULL, 1170, 10, 570, 72),
(1997, 'Forclaz', 4, 2, 4, 5, NULL, 1526, 9, 1060, 26),
(2008, 'Furka', 5, 2, 6, 6, 7, 2431, 14, 938, 29);
