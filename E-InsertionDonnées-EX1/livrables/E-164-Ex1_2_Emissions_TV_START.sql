-- Auteur    : Daniel Rebetez le 13.04.2021
-- SGBD      : MySQL
-- Remarques : Donn�es du mod�le Emissions TV
-- Codage ANSI
-- Modifications : Alain Girardet - ETML - 08.02.2023
-- Dans ce fichier, il y manque des TABLES et les contraintes des cl� primaires ainsi que celles des cl�s �trang�res.
-- A vous de le compl�ter

-- Création de la table PAYS
CREATE TABLE IF NOT EXISTS PAYS (
   pays_id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(pays_id)
);

-- Création de la table CATEGORIE
CREATE TABLE IF NOT EXISTS CATEGORIE (
   categorie_id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(categorie_id)
);

-- Création de la table GENRE
CREATE TABLE IF NOT EXISTS GENRE (
   genre_id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(genre_id)
);

-- Création de la table EMISSION
CREATE TABLE IF NOT EXISTS EMISSION (
   emission_id INT,
   commentaire VARCHAR(50),
   duree TIME,
   langue VARCHAR(50),
   genre_id INT NOT NULL,
   PRIMARY KEY(emission_id),
   FOREIGN KEY(genre_id) REFERENCES GENRE(genre_id)
);

-- Création de la table CHAINE_TV
CREATE TABLE IF NOT EXISTS CHAINE_TV (
   chaine_id INT,
   libelle VARCHAR(50),
   pays_id INT NOT NULL,
   PRIMARY KEY(chaine_id),
   FOREIGN KEY(pays_id) REFERENCES PAYS(pays_id)
);

-- Création de la table diffuser
CREATE TABLE IF NOT EXISTS diffuser (
   chaine_id INT,
   emission_id INT,
   jj_mm_aaaa_hh_mm DATE,
   doublage VARCHAR(50),
   sous_titrage VARCHAR(50),
   PRIMARY KEY(chaine_id, emission_id, jj_mm_aaaa_hh_mm),
   FOREIGN KEY(chaine_id) REFERENCES CHAINE_TV(chaine_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);

-- Création de la table produire
CREATE TABLE IF NOT EXISTS produire (
   chaine_id INT,
   emission_id INT,
   PRIMARY KEY(chaine_id, emission_id),
   FOREIGN KEY(chaine_id) REFERENCES CHAINE_TV(chaine_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);

-- Création de la table etre_destinee
CREATE TABLE IF NOT EXISTS etre_destinee (
   categorie_id INT,
   emission_id INT,
   PRIMARY KEY(categorie_id, emission_id),
   FOREIGN KEY(categorie_id) REFERENCES CATEGORIE(categorie_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);