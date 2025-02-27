-- Insertion des genres
INSERT INTO GENRE (LIBELLE) VALUES ('Documentaire'), ('Sport');

-- Insertion des catégories de public
INSERT INTO CATEGORIE (LIBELLE) VALUES ('Adolescents'), ('Adultes'), ('Enfants'), ('Sportifs'), ('7-97 ans');

-- Insertion des chaînes de télévision
INSERT INTO CHAINE_TV (LIBELLE, PAYS_ID, TYPE) VALUES 
('Netflix', 1, 'Privée'),
('V Télé', 2, 'Privée'),
('CNN', 3, 'Privée'),
('TSR', 4, 'Service public'),
('TF1', 5, 'Service public'),
('ZDF', 6, 'Service public');

-- Insertion des émissions
INSERT INTO EMISSION (COMMENTAIRE, DUREE, LANGUE, GENRE_ID) VALUES 
('Émission sur la pêche de masse et ses conséquences', '01:30:00', 'Anglais', 1),
('Documentaire sur l’industrie de la viande et son impact', '01:30:00', 'Anglais', 1),
('Descente à ski du Lauberhorn', '01:15:00', 'Français', 2);