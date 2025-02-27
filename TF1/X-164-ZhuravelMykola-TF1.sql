CREATE TABLE CatalogueProduit(
   idCatalogue INT,
   Cible VARCHAR(50),
   PRIMARY KEY(idCatalogue)
);

CREATE TABLE ProduiFini(
   idProduit INT,
   Description VARCHAR(50),
   Poids DECIMAL(15,2),
   Taille VARCHAR(50),
   PrixVente DECIMAL(15,2),
   PRIMARY KEY(idProduit)
);

CREATE TABLE Fournisseur(
   idFournisseur INT,
   NomEntreprise VARCHAR(50),
   NomContact VARCHAR(50),
   PrenomContact VARCHAR(50),
   Adresse VARCHAR(50),
   NPA VARCHAR(50),
   Ville VARCHAR(50),
   DateDebutActivite DATE,
   PRIMARY KEY(idFournisseur)
);

CREATE TABLE PieceDetachee(
   idPiece INT,
   Description VARCHAR(50),
   Cout DECIMAL(15,2),
   StockDisponible INT,
   PrixAchat DECIMAL(15,2),
   idFournisseur INT NOT NULL,
   PRIMARY KEY(idPiece),
   FOREIGN KEY(idFournisseur) REFERENCES Fournisseur(idFournisseur) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Composer(
   idCatalogue INT,
   idProduit INT,
   PRIMARY KEY(idCatalogue, idProduit),
   FOREIGN KEY(idCatalogue) REFERENCES CatalogueProduit(idCatalogue) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(idProduit) REFERENCES ProduiFini(idProduit) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Utiliser(
   idProduit INT,
   idPiece INT,
   PRIMARY KEY(idProduit, idPiece),
   FOREIGN KEY(idProduit) REFERENCES ProduiFini(idProduit) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(idPiece) REFERENCES PieceDetachee(idPiece) ON DELETE CASCADE ON UPDATE CASCADE
);
