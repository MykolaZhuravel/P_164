-- Auteur    : Daniel Rebetez le 13.04.2021
-- SGBD      : MySQL
-- Remarques : Visualisation des donnéees introduite dans le modèle Emissions TV
-- Codage ANSI
-- Modifications : Alain Girardet - ETML - 08.02.2023

-- PARTIE COTE PRODUCTION
SELECT Commentaire AS "Titre du film ou de l'émission",DATE_FORMAT(duree,'%H''%i') AS "Durée",langue_VO AS "Langue VO",t_Categories_Public.libelle AS "Type de public",t_Chaines_TV.libelle AS "Producteur",nomPays AS "Pays du producteur" 
FROM t_Pays_Sieges INNER JOIN t_Chaines_TV ON t_Pays_Sieges.idPaysSiege=fkPays_Sieges
INNER JOIN t_Produire ON t_Produire.fkChaines_TV=t_Chaines_TV.idChaineTV
INNER JOIN t_Emissions ON t_Emissions.idEmission = t_Produire.fkEmissions
INNER JOIN t_Genres ON t_Genres.idGenre=fkGenres
INNER JOIN t_Etre_Destine ON t_Emissions.idEmission = t_Etre_Destine.fkEmissions
INNER JOIN t_Categories_Public ON t_Categories_Public.idCategoriePublic= t_Etre_Destine.fkCategories_Public 
ORDER BY Commentaire ASC, langue_VO ASC,t_Categories_Public.libelle ASC;

-- PARTIE COTE DIFFUSION
SELECT Commentaire AS "Titre du film ou de l'émission",DATE_FORMAT(duree,'%H''%i') AS "Durée",langue_VO AS "Langue VO",t_Categories_Public.libelle AS "Type de public",t_Chaines_TV.libelle AS "Producteur",nomPays AS "Pays du producteur",DATE_FORMAT(la_date,'%d.%m.%Y') AS "Date de l'émission",doublage AS "Doublage",sous_titrage AS "Sous-titré" 
FROM t_Pays_Sieges INNER JOIN t_Chaines_TV ON t_Pays_Sieges.idPaysSiege=fkPays_Sieges
INNER JOIN t_Diffuser ON t_Diffuser.fkChaines_TV=t_Chaines_TV.idChaineTV
INNER JOIN t_Emissions ON t_Emissions.idEmission = t_Diffuser.fkEmissions
INNER JOIN t_Genres ON t_Genres.idGenre=fkGenres
INNER JOIN t_Etre_Destine ON t_Emissions.idEmission = t_Etre_Destine.fkEmissions
INNER JOIN t_Categories_Public ON t_Categories_Public.idCategoriePublic= t_Etre_Destine.fkCategories_Public
ORDER BY Commentaire ASC, langue_VO ASC,t_Categories_Public.libelle ASC, DATE_FORMAT(la_date,'%d.%m.%Y') ASC,sous_titrage ASC;

-- PARTIE COTE DIFFUSION et PRODUCTION
SELECT Commentaire AS "Titre du film ou de l'émission",DATE_FORMAT(duree,'%H''%i') AS "Durée",langue_VO AS "Langue VO",t_Categories_Public.libelle AS "Type de public",t_Chaines_TV.libelle AS "Producteur",nomPays AS "Pays du producteur",DATE_FORMAT(la_date,'%d.%m.%Y') AS "Date de l'émission",doublage AS "Doublage",sous_titrage AS "Sous-titré" 
FROM t_Chaines_TV INNER JOIN t_Pays_Sieges ON t_Pays_Sieges.idPaysSiege=fkPays_Sieges
INNER JOIN t_Produire ON t_Produire.fkChaines_TV=t_Chaines_TV.idChaineTV
INNER JOIN t_Diffuser ON t_Diffuser.fkChaines_TV=t_Chaines_TV.idChaineTV
INNER JOIN t_Emissions ON t_Emissions.idEmission = t_Diffuser.fkEmissions
INNER JOIN t_Genres ON t_Genres.idGenre=fkGenres
INNER JOIN t_Etre_Destine ON t_Emissions.idEmission = t_Etre_Destine.fkEmissions
INNER JOIN t_Categories_Public ON t_Categories_Public.idCategoriePublic= t_Etre_Destine.fkCategories_Public
WHERE t_Produire.fkEmissions = t_Emissions.idEmission
ORDER BY Commentaire ASC, langue_VO ASC,t_Categories_Public.libelle ASC, DATE_FORMAT(la_date,'%d.%m.%Y') ASC,sous_titrage ASC;
