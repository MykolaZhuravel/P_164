CREATE TABLE APPAREIL(
   appareil_id INT,
   Plateforme VARCHAR(50),
   PRIMARY KEY(appareil_id)
);

CREATE TABLE APPLICATION(
   application_id INT,
   Nom VARCHAR(50),
   Type VARCHAR(50),
   PRIMARY KEY(application_id)
);

CREATE TABLE Temps(
   temps_id INT,
   TempsPasse TIME,
   DateUtilisation DATE,
   PRIMARY KEY(temps_id)
);

CREATE TABLE utilise_sur(
   appareil_id INT,
   application_id INT,
   PRIMARY KEY(appareil_id, application_id),
   FOREIGN KEY(appareil_id) REFERENCES APPAREIL(appareil_id),
   FOREIGN KEY(application_id) REFERENCES APPLICATION(application_id)
);

CREATE TABLE temps_passe(
   application_id INT,
   temps_id INT,
   PRIMARY KEY(application_id, temps_id),
   FOREIGN KEY(application_id) REFERENCES APPLICATION(application_id),
   FOREIGN KEY(temps_id) REFERENCES Temps(temps_id)
);

CREATE TABLE temps_utilisation_appareil(
   appareil_id INT,
   temps_id INT,
   PRIMARY KEY(appareil_id, temps_id),
   FOREIGN KEY(appareil_id) REFERENCES APPAREIL(appareil_id),
   FOREIGN KEY(temps_id) REFERENCES Temps(temps_id)
);
