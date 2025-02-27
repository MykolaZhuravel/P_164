CREATE TABLE PAYS(
   pays_id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(pays_id)
);

CREATE TABLE CATEGORIE(
   categorie_id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(categorie_id)
);

CREATE TABLE GENRE(
   genre_id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(genre_id)
);

CREATE TABLE EMISSION(
   emission_id INT,
   commentaire VARCHAR(50),
   duree TIME,
   langue VARCHAR(50),
   genre_id INT NOT NULL,
   PRIMARY KEY(emission_id),
   FOREIGN KEY(genre_id) REFERENCES GENRE(genre_id)
);

CREATE TABLE CHAINE_TV(
   chaine_id INT,
   libelle VARCHAR(50),
   pays_id INT NOT NULL,
   PRIMARY KEY(chaine_id),
   FOREIGN KEY(pays_id) REFERENCES PAYS(pays_id)
);

CREATE TABLE diffuser(
   chaine_id INT,
   emission_id INT,
   jj_mm_aaaa_hh_mm DATE,
   doublage VARCHAR(50),
   sous_titrage VARCHAR(50),
   PRIMARY KEY(chaine_id, emission_id, jj_mm_aaaa_hh_mm),
   FOREIGN KEY(chaine_id) REFERENCES CHAINE_TV(chaine_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);

CREATE TABLE produire(
   chaine_id INT,
   emission_id INT,
   PRIMARY KEY(chaine_id, emission_id),
   FOREIGN KEY(chaine_id) REFERENCES CHAINE_TV(chaine_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);

CREATE TABLE etre_destinee(
   categorie_id INT,
   emission_id INT,
   PRIMARY KEY(categorie_id, emission_id),
   FOREIGN KEY(categorie_id) REFERENCES CATEGORIE(categorie_id),
   FOREIGN KEY(emission_id) REFERENCES EMISSION(emission_id)
);
