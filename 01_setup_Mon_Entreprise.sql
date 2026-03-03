/*-- Cr�ation d'une base de donn�es [Jointure]
CREATE DATABASE [Jointure]
GO

-- S�lection de la base de donn�es [Jointure]
USE [Jointure]
GO

-- Cr�ation d'une table nomm�e [TableA]
CREATE TABLE [dbo].[TableA](
	[TableA_ID] [tinyint] NULL
) ON [PRIMARY]
GO

-- Insertion de donn�es dans la table [TableA]
INSERT INTO [dbo].[TableA]
VALUES
('1'),('2'),('3'),('50'),('70'), (NULL)
GO

-- Cr�ation d'une table nomm�e [TableB]
CREATE TABLE [dbo].[TableB](
	[TableB_ID] [tinyint] NULL
) ON [PRIMARY]
GO

-- Insertion de donn�es dans la table [TableB]
INSERT INTO [dbo].[TableB]
VALUES
('1'),('2'),('3'),('40'),('60')
GO

-- Cr�ation d'une table nomm�e [TableC]
CREATE TABLE [dbo].[TableC](
	[ID] [tinyint] NULL,
	[Prenom] varchar(50) NULL
) ON [PRIMARY]
GO

-- Insertion de donn�es dans la table [TableC]
INSERT INTO [dbo].[TableC]
VALUES
('1','Victor'),('2','Marie'),('3','Pierre'),('4','Esther')
GO

-- Cr�ation d'une table nomm�e [TableD]
CREATE TABLE [dbo].[TableD](
	[ID] [tinyint] NULL,
	[Prenom] varchar(50) NULL
) ON [PRIMARY]
GO

-- Insertion de donn�es dans la table [TableD]
INSERT INTO [dbo].[TableD]
VALUES
('4','Esther'),('5','Jonathan'),('6','Lucie')
GO

-- S�lection des enregistrements de la table [TableA]
SELECT [TableA_ID]
  FROM [dbo].[TableA]
GO

-- S�lection des enregistrements de la table [TableB]
SELECT [TableB_ID]
  FROM [dbo].[TableB]
GO

-- S�lection des enregistrements de la table [TableC]
SELECT [ID], [Prenom]
  FROM [dbo].[TableC]
GO

-- S�lection des enregistrements de la table [TableD]
SELECT [ID], [Prenom]
  FROM [dbo].[TableD]
GO
CREATE TABLE dbo.Vente (
    VenteID INT PRIMARY KEY,
    ClientID VARCHAR(20),
    ProduitID VARCHAR(20),
    DateVente DATE,
    Quantite INT,
    MontantVente DECIMAL(10,2)
);
GO
INSERT INTO dbo.Vente VALUES
(101, 'CLIENT_1', 'PROD_1', '2026-01-10', 5, 200.00),
(102, 'CLIENT_2', 'PROD_2', '2026-01-12', 3, 150.00),
(103, 'CLIENT_1', 'PROD_1', '2026-01-15', 2, 80.00),
(104, 'CLIENT_3', 'PROD_3', '2026-01-20', 7, 350.00),
(105, 'CLIENT_2', 'PROD_1', '2026-01-22', 1, 50.00);
GO
USE [Mon_Entreprise]
GO*/
--SELECT * FROM [Mon_Entreprise].[dbo].[Vente];
--SELECT DISTINCT [ClientID] FROM [Mon_Entreprise].[dbo].[Vente];
--SELECT * FROM [Mon_Entreprise].[dbo].[Vente];
-- Sélectionner toutes les colonnes et toutes les lignes de la table Vente
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente];

-- Sélectionner les ClientID sans répétition (valeurs distinctes)
SELECT DISTINCT [ClientID] 
FROM [Mon_entreprise].[dbo].[Vente];

-- Sélectionner toutes les ventes du client CLIENT_1
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente]
WHERE [ClientID] = 'CLIENT_1';

-- Sélectionner les ventes des clients CLIENT_1 et CLIENT_2
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente]
WHERE [ClientID] IN ('CLIENT_1','CLIENT_2');

-- Sélectionner les ventes sauf celles des clients CLIENT_1, CLIENT_2 et CLIENT_3
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente]
WHERE [ClientID] NOT IN ('CLIENT_1','CLIENT_2','CLIENT_3');

-- Sélectionner les ventes dont le VenteID commence par 10
-- Le symbole % signifie "n'importe quelle suite de caractères"
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente]
WHERE [VenteID] LIKE '10%';

-- Sélectionner les ventes du CLIENT_1 pour le produit PROD_1
-- Trier les résultats par MontantVente du plus grand au plus petit
SELECT * 
FROM [Mon_entreprise].[dbo].[Vente]
WHERE [ClientID] = 'CLIENT_1' 
AND [ProduitID] = 'PROD_1'
ORDER BY [MontantVente] DESC;

-- Insérer une nouvelle vente dans la table Vente
INSERT INTO [Mon_entreprise].[dbo].[Vente]
([VenteID],[ClientID],[ProduitID],[DateVente],[Quantite],[MontantVente])
VALUES (101,'CLIENT_4','PROD_2','2026-01-25',10,250.00);

-- Modifier le montant de la vente ayant VenteID = 101
UPDATE [Mon_entreprise].[dbo].[Vente]
SET [MontantVente] = 300
WHERE [VenteID] = 101;

-- Supprimer la vente ayant VenteID = 101
DELETE FROM [Mon_entreprise].[dbo].[Vente]
WHERE [VenteID] = 101;

-- LEFT JOIN :
-- Retourne toutes les lignes de TableA
-- et les lignes correspondantes de TableB
-- Si pas de correspondance → valeurs NULL pour TableB
SELECT TableA_ID , TableB_ID
FROM dbo.TableA
LEFT JOIN dbo.TableB
ON dbo.TableA.TableA_ID = dbo.TableB.TableB_ID;

-- RIGHT JOIN :
-- Retourne toutes les lignes de TableB
-- et les lignes correspondantes de TableA
-- Si pas de correspondance → valeurs NULL pour TableA
SELECT TableA_ID , TableB_ID
FROM dbo.TableA
RIGHT JOIN dbo.TableB
ON dbo.TableA.TableA_ID = dbo.TableB.TableB_ID;

-- INNER JOIN :
-- Retourne uniquement les lignes ayant une correspondance dans les deux tables
SELECT TableA_ID , TableB_ID
FROM dbo.TableA
INNER JOIN dbo.TableB
ON dbo.TableA.TableA_ID = dbo.TableB.TableB_ID;

-- FULL OUTER JOIN :
-- Retourne toutes les lignes des deux tables
-- Même sans correspondance (NULL là où il n'y a pas de match)
SELECT TableA_ID , TableB_ID
FROM dbo.TableA
FULL OUTER JOIN dbo.TableB
ON dbo.TableA.TableA_ID = dbo.TableB.TableB_ID;

-- CROSS JOIN :
-- Produit cartésien (toutes les combinaisons possibles entre TableA et TableB)
SELECT TableA_ID , TableB_ID
FROM dbo.TableA
CROSS JOIN dbo.TableB;

-- Jointure entre TableC et TableD avec alias
-- C et D sont des raccourcis pour simplifier l'écriture
SELECT *
FROM dbo.TableC C
INNER JOIN dbo.TableD D
ON C.ID = D.ID;