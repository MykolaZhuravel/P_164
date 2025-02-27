CREATE TABLE LOCALITE(
   numero INT,
   nomLocalite VARCHAR(50),
   npa INT,
   PRIMARY KEY(numero)
);

CREATE TABLE PAYS(
   numero INT,
   nomPays VARCHAR(50),
   drapeau VARCHAR(50),
   anneeCreation DATE,
   populationDebutAnneeCourante INT,
   PRIMARY KEY(numero)
);

CREATE TABLE appartenir(
   numero INT,
   numero_1 INT,
   PRIMARY KEY(numero, numero_1),
   FOREIGN KEY(numero) REFERENCES LOCALITE(numero) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(numero_1) REFERENCES PAYS(numero)
);
