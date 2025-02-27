CREATE TABLE t_fournisseur(
   fournisseur_id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(fournisseur_id)
);

CREATE TABLE t_magasin(
   magasin_id INT,
   Localite VARCHAR(50),
   Gerant VARCHAR(50),
   PRIMARY KEY(magasin_id)
);

CREATE TABLE t_client(
   client_id INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   CodePays INT,
   Localite VARCHAR(50),
   ChiffreAffaire DECIMAL(15,2),
   TypeClient VARCHAR(50),
   PRIMARY KEY(client_id)
);

CREATE TABLE t_article(
   article_id INT,
   Nom VARCHAR(50),
   Poids DECIMAL(15,2),
   Couleur VARCHAR(50),
   Stock INT,
   PrixAchat DECIMAL(15,2),
   PrixVente DECIMAL(15,2),
   fournisseur_fk INT NOT NULL,
   PRIMARY KEY(article_id),
   FOREIGN KEY(fournisseur_fk) REFERENCES t_fournisseur(fournisseur_id)
);

CREATE TABLE t_commande(
   commande_id INT,
   DateCommande DATE,
   client_id INT NOT NULL,
   magasin_id INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(client_id) REFERENCES t_client(client_id),
   FOREIGN KEY(magasin_id) REFERENCES t_magasin(magasin_id)
);

CREATE TABLE t_livraison(
   livraison_id INT,
   DateLivraison DATE,
   client_id INT NOT NULL,
   magasin_id INT NOT NULL,
   PRIMARY KEY(livraison_id),
   FOREIGN KEY(client_id) REFERENCES t_client(client_id),
   FOREIGN KEY(magasin_id) REFERENCES t_magasin(magasin_id)
);

CREATE TABLE t_detail_commande(
   commande_id INT,
   article_id INT,
   QuantiteComandee INT,
   QuantiteTotaleLivree INT,
   PrixVenteReel DECIMAL(15,2),
   PRIMARY KEY(commande_id, article_id),
   FOREIGN KEY(commande_id) REFERENCES t_commande(commande_id),
   FOREIGN KEY(article_id) REFERENCES t_article(article_id)
);

CREATE TABLE t_detail_livraison(
   livraison_id INT,
   article_id INT,
   commande_id INT,
   article_id_1 INT,
   QuantiteLivree INT,
   PRIMARY KEY(livraison_id, article_id, commande_id, article_id_1),
   FOREIGN KEY(livraison_id) REFERENCES t_livraison(livraison_id),
   FOREIGN KEY(article_id) REFERENCES t_article(article_id),
   FOREIGN KEY(commande_id, article_id_1) REFERENCES t_detail_commande(commande_id, article_id)
);

CREATE TABLE assemblage(
   article_id INT,
   article_id_1 INT,
   qteComposant INT,
   PRIMARY KEY(article_id, article_id_1),
   FOREIGN KEY(article_id) REFERENCES t_article(article_id),
   FOREIGN KEY(article_id_1) REFERENCES t_article(article_id)
);
