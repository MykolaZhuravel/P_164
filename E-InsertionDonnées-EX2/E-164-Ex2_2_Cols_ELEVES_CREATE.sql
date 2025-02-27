-- Auteur    : Daniel Rebetez le 15.04.2021
-- SGBD      : MySQL
-- Remarques : modèle Cols_CH
-- Codage ANSI
-- Modifications : Alain Girardet - ETML le 08.02.2023
-- CREE SANS L'INTEGRITE REFERENTIELLE et SANS FK, juste les champs sont créés sans contrainte


DROP TABLE if exists tbl_Cols;
DROP TABLE if exists tbl_Cantons;
DROP TABLE if exists tbl_Massifs;
DROP TABLE if exists tbl_Lieux;
DROP TABLE if exists tbl_CoupsCoeur;

CREATE TABLE tbl_Cantons(
   numero INT AUTO_INCREMENT,
   cantonImplique VARCHAR(50) NOT NULL,
   PRIMARY KEY(numero),
   UNIQUE(cantonImplique)
);

CREATE TABLE tbl_Massifs(
   numero INT AUTO_INCREMENT,
   massif VARCHAR(50) NOT NULL,
   PRIMARY KEY(numero),
   UNIQUE(massif)
);

CREATE TABLE tbl_Lieux(
   numero INT AUTO_INCREMENT,
   ville VARCHAR(50) NOT NULL,
   PRIMARY KEY(numero),
   UNIQUE(ville)
);

CREATE TABLE tbl_CoupsCoeur(
   numero INT AUTO_INCREMENT,
   rang INT NOT NULL,
   raison TEXT NOT NULL,
   PRIMARY KEY(numero)
);

CREATE TABLE tbl_Cols(
   numero SERIAL,
   annee INTEGER NOT NULL,
   nomCol VARCHAR(50) NOT NULL,
   altitude INTEGER NOT NULL,
   penteMaxi NUMERIC(3,1),
   denivelee INTEGER,
   km NUMERIC(4,1),
   cantonImplique VARCHAR(50) NOT NULL,
   massif VARCHAR(50) NOT NULL,
   villeDepart VARCHAR(50) NOT NULL,   
   villeArrivee VARCHAR(50) NOT NULL,   
   rang INTEGER,
   num_tblCoupsCoeur INTEGER,
   num_tblLieuxArrivee INTEGER,
   num_tblLieuxDepart INTEGER,
   num_tblMassifs INTEGER,
   num_tblCantons INTEGER,
   PRIMARY KEY(numero)
);
