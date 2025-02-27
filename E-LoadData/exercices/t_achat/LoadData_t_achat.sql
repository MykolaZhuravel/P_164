LOAD DATA INFILE 'E:/02PROJETS/P_Soutien_164/E-LoadData/exercices/t_achat.csv'
INTO TABLE t_achat
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Achat, ID_Livre, Quantite, Date_Achat);
