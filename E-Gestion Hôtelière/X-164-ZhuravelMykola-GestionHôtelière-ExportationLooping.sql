CREATE TABLE CHAMBRE(
   chambre_id INT,
   Numero INT,
   Etage INT,
   Taille VARCHAR(50),
   Prix INT,
   PRIMARY KEY(chambre_id)
);

CREATE TABLE RESTAURANT(
   restaurant_id VARCHAR(50),
   Nom VARCHAR(50),
   Horaires TIME,
   Plats VARCHAR(50),
   Prix DECIMAL(15,2),
   Chef_de_rang VARCHAR(30),
   PRIMARY KEY(restaurant_id)
);

CREATE TABLE BOUTIQUE(
   boutique_id VARCHAR(50),
   Nom VARCHAR(50),
   Produits VARCHAR(50),
   Prix DECIMAL(15,2),
   PRIMARY KEY(boutique_id)
);

CREATE TABLE BAR(
   bar_id VARCHAR(50),
   Nom VARCHAR(50),
   Horaires TIME,
   Boissons VARCHAR(50),
   Prix DECIMAL(15,2),
   Barman VARCHAR(50),
   PRIMARY KEY(bar_id)
);

CREATE TABLE ACTIVITE(
   activite_id VARCHAR(50),
   Prix DECIMAL(15,2),
   Dates DATE,
   Horaires TIME,
   Nom VARCHAR(50),
   PRIMARY KEY(activite_id)
);

CREATE TABLE EVENEMENT(
   evenement_id VARCHAR(50),
   Nom VARCHAR(50),
   Prix DECIMAL(15,2),
   Horaires TIME,
   Dates DATE,
   PRIMARY KEY(evenement_id)
);

CREATE TABLE CLIENT(
   client_id CHAR(50),
   Nom VARCHAR(25),
   Prénom VARCHAR(25),
   Age INT,
   Mail VARCHAR(50),
   Adresse VARCHAR(30),
   Données_banquaires INT,
   Num_de_chambre SMALLINT,
   PRIMARY KEY(client_id)
);

CREATE TABLE HOTEL(
   hotel_id VARCHAR(50),
   Nom VARCHAR(50),
   Adresse VARCHAR(50),
   Prix DECIMAL(15,2),
   Niveau SMALLINT,
   Proposition VARCHAR(50),
   Directeur VARCHAR(50),
   PRIMARY KEY(hotel_id)
);

CREATE TABLE OFFRE(
   offre_id VARCHAR(50),
   Nom VARCHAR(50),
   Prix DECIMAL(15,2),
   Dates DATE,
   hotel_id VARCHAR(50),
   PRIMARY KEY(offre_id),
   FOREIGN KEY(hotel_id) REFERENCES HOTEL(hotel_id)
);

CREATE TABLE HEBERGER(
   chambre_id INT,
   client_id CHAR(50),
   PRIMARY KEY(chambre_id, client_id),
   FOREIGN KEY(chambre_id) REFERENCES CHAMBRE(chambre_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE VISITER(
   client_id CHAR(50),
   hotel_id VARCHAR(50),
   PRIMARY KEY(client_id, hotel_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id),
   FOREIGN KEY(hotel_id) REFERENCES HOTEL(hotel_id)
);

CREATE TABLE MANGER(
   restaurant_id VARCHAR(50),
   client_id CHAR(50),
   PRIMARY KEY(restaurant_id, client_id),
   FOREIGN KEY(restaurant_id) REFERENCES RESTAURANT(restaurant_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE PARTICIPER(
   evenement_id VARCHAR(50),
   client_id CHAR(50),
   PRIMARY KEY(evenement_id, client_id),
   FOREIGN KEY(evenement_id) REFERENCES EVENEMENT(evenement_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE BOIRE(
   bar_id VARCHAR(50),
   client_id CHAR(50),
   Boire_les_boisssons VARCHAR(50),
   PRIMARY KEY(bar_id, client_id),
   FOREIGN KEY(bar_id) REFERENCES BAR(bar_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE SE_JOINDRE(
   activite_id VARCHAR(50),
   client_id CHAR(50),
   PRIMARY KEY(activite_id, client_id),
   FOREIGN KEY(activite_id) REFERENCES ACTIVITE(activite_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE ACHETER(
   boutique_id VARCHAR(50),
   client_id CHAR(50),
   acheter_des_produits VARCHAR(50),
   PRIMARY KEY(boutique_id, client_id),
   FOREIGN KEY(boutique_id) REFERENCES BOUTIQUE(boutique_id),
   FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);

CREATE TABLE Creer(
   activite_id VARCHAR(50),
   hotel_id VARCHAR(50),
   l_hôtel_crée_met_en_place_les_activité_pour_les_clients VARCHAR(50),
   PRIMARY KEY(activite_id, hotel_id),
   FOREIGN KEY(activite_id) REFERENCES ACTIVITE(activite_id),
   FOREIGN KEY(hotel_id) REFERENCES HOTEL(hotel_id)
);
