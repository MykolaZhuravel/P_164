LOAD DATA INFILE 'E:/02PROJETS/P_Soutien_164/E-LoadData/exercices/st_auteurt_auteur.txt'
INTO TABLE t_auteur
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID, Auteur);
