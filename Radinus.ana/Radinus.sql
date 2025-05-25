-- Script généré par WINDEV le 28/04/2025 06:30:58
-- Tables de l'analyse Radinus.wda
-- pour MariaDB

-- Création de la table Affectation
CREATE TABLE `Affectation` (
    `IDAffectation` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(50) );
CREATE INDEX `WDIDX_Affectation_Libelle` ON `Affectation` (`Libelle`);

-- Création de la table Banques
CREATE TABLE `Banques` (
    `IDBanques` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `NomBanque` VARCHAR(50) );

-- Création de la table Budget
CREATE TABLE `Budget` (
    `IDBudget` BIGINT  UNIQUE  DEFAULT 0,
    `Annee` SMALLINT DEFAULT 0,
    `Mois` TINYINT DEFAULT 0,
    `IDPosteBudget` BIGINT DEFAULT 0,
    `Montant` NUMERIC(24,6) DEFAULT 0);
CREATE INDEX `WDIDX_Budget_Annee` ON `Budget` (`Annee`);
CREATE INDEX `WDIDX_Budget_Mois` ON `Budget` (`Mois`);
CREATE INDEX `WDIDX_Budget_IDPosteBudget` ON `Budget` (`IDPosteBudget`);
CREATE INDEX `WDIDX_Budget_AnMoisIDpBudget` ON `Budget` (`Annee`,`Mois`,`IDPosteBudget`);

-- Création de la table CalOpPeriodique
CREATE TABLE `CalOpPeriodique` (
    `GUIDCalOpPeriode` VARCHAR(40)  NOT NULL  UNIQUE  DEFAULT '0',
    `Libelle` VARCHAR(100) ,
    `IDModeOperation` BIGINT DEFAULT 0,
    `IDCategorie` BIGINT DEFAULT 0,
    `IDAffectation` BIGINT DEFAULT 0,
    `IDCompte` BIGINT DEFAULT 0,
    `IDStatutOperation` BIGINT DEFAULT 0,
    `Montant` NUMERIC(24,6) DEFAULT 0,
    `DateFin` DATE ,
    `Periode` INTEGER DEFAULT 0,
    `PeriodeNbrRepete` INTEGER DEFAULT 0,
    `PeriodeFreq` INTEGER DEFAULT 1,
    `ModeFinInsertion` INTEGER DEFAULT 1,
    `DateDernOpGen` DATE ,
    `NbrOpInsert` INTEGER DEFAULT 0,
    `NbrOpAnterieur` INTEGER DEFAULT 0,
    `IDOperation` BIGINT  UNIQUE  DEFAULT 0,
    `DateProchOp` DATE ,
    `MontantInsert` NUMERIC(24,6) DEFAULT 0);
CREATE INDEX `WDIDX_CalOpPeriodique_Libelle` ON `CalOpPeriodique` (`Libelle`);
CREATE INDEX `WDIDX_CalOpPeriodique_IDModeOperation` ON `CalOpPeriodique` (`IDModeOperation`);
CREATE INDEX `WDIDX_CalOpPeriodique_IDCategorie` ON `CalOpPeriodique` (`IDCategorie`);
CREATE INDEX `WDIDX_CalOpPeriodique_IDAffectation` ON `CalOpPeriodique` (`IDAffectation`);
CREATE INDEX `WDIDX_CalOpPeriodique_IDCompte` ON `CalOpPeriodique` (`IDCompte`);
CREATE INDEX `WDIDX_CalOpPeriodique_IDStatutOperation` ON `CalOpPeriodique` (`IDStatutOperation`);
CREATE INDEX `WDIDX_CalOpPeriodique_DateFin` ON `CalOpPeriodique` (`DateFin`);
CREATE INDEX `WDIDX_CalOpPeriodique_DateDernOpGen` ON `CalOpPeriodique` (`DateDernOpGen`);

-- Création de la table Categorie
CREATE TABLE `Categorie` (
    `IDCategorie` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(50) ,
    `IDTypeCategorie` BIGINT ,
    `IDPosteBudget` BIGINT );
CREATE INDEX `WDIDX_Categorie_Libelle` ON `Categorie` (`Libelle`);
CREATE INDEX `WDIDX_Categorie_IDTypeCategorie` ON `Categorie` (`IDTypeCategorie`);
CREATE INDEX `WDIDX_Categorie_IDPosteBudget` ON `Categorie` (`IDPosteBudget`);

-- Création de la table Commentaire
CREATE TABLE `Commentaire` (
    `IDCommentaire` BIGINT  UNIQUE  DEFAULT 0,
    `CommentaireTxt` VARCHAR(512) ,
    `IDOperation` BIGINT  UNIQUE );

-- Création de la table Compte
CREATE TABLE `Compte` (
    `IDCompte` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `ReportPointe` NUMERIC(24,6) DEFAULT 0,
    `ReportEngage` NUMERIC(24,6) DEFAULT 0,
    `ReportPrevu` NUMERIC(24,6) DEFAULT 0,
    `Libelle` VARCHAR(50) ,
    `IDTypeCompte` BIGINT ,
    `IDBanques` BIGINT ,
    `SoldeBanque` NUMERIC(24,6) DEFAULT 0,
    `SoldeReel` NUMERIC(24,6) DEFAULT 0,
    `SoldeFinal` NUMERIC(24,6) DEFAULT 0,
    `NomTitulaire` VARCHAR(50) ,
    `AdresseTitulaire` VARCHAR(250) ,
    `COBCodeBanque` VARCHAR(5) ,
    `COBCodeGuichet` VARCHAR(5) ,
    `COBNumCompte` VARCHAR(11) ,
    `COBClefRIB` VARCHAR(2) ,
    `COBIBAN` VARCHAR(35) ,
    `DateOuverture` DATE ,
    `DateCloture` DATE ,
    `AdresseAgenceBank` VARCHAR(250) ,
    `COBBIC` VARCHAR(11) ,
    `NumProchCheque` INTEGER DEFAULT 0,
    `CompteCloture` TINYINT DEFAULT 0,
    `Devise` VARCHAR(4) DEFAULT 'EUR');
CREATE INDEX `WDIDX_Compte_IDTypeCompte` ON `Compte` (`IDTypeCompte`);
CREATE INDEX `WDIDX_Compte_IDBanques` ON `Compte` (`IDBanques`);

-- Création de la table ModeOperation
CREATE TABLE `ModeOperation` (
    `IDModeOperation` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(50) );
CREATE INDEX `WDIDX_ModeOperation_Libelle` ON `ModeOperation` (`Libelle`);

-- Création de la table Operation
CREATE TABLE `Operation` (
    `IDOperation` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(100) ,
    `Date` DATE ,
    `Montant` NUMERIC(24,6) DEFAULT 0,
    `IDModeOperation` BIGINT ,
    `IDCategorie` BIGINT ,
    `IDAffectation` BIGINT ,
    `IDCompte` BIGINT ,
    `DatePointage` DATE ,
    `FitID` VARCHAR(50) ,
    `ReferencePaiement` VARCHAR(20) ,
    `NumRelevBanque` VARCHAR(20) ,
    `IDStatutOperation` BIGINT ,
    `IDOperationParent` BIGINT ,
    `SoldePointe` NUMERIC(24,6) DEFAULT 0,
    `EstParent` TINYINT DEFAULT 0,
    `GUIDCalOpPeriode` VARCHAR(40) );
CREATE INDEX `WDIDX_Operation_Libelle` ON `Operation` (`Libelle`);
CREATE INDEX `WDIDX_Operation_Date` ON `Operation` (`Date`);
CREATE INDEX `WDIDX_Operation_IDModeOperation` ON `Operation` (`IDModeOperation`);
CREATE INDEX `WDIDX_Operation_IDCategorie` ON `Operation` (`IDCategorie`);
CREATE INDEX `WDIDX_Operation_IDAffectation` ON `Operation` (`IDAffectation`);
CREATE INDEX `WDIDX_Operation_IDCompte` ON `Operation` (`IDCompte`);
CREATE INDEX `WDIDX_Operation_DatePointage` ON `Operation` (`DatePointage`);
CREATE INDEX `WDIDX_Operation_FitID` ON `Operation` (`FitID`);
CREATE INDEX `WDIDX_Operation_ReferencePaiement` ON `Operation` (`ReferencePaiement`);
CREATE INDEX `WDIDX_Operation_IDStatutOperation` ON `Operation` (`IDStatutOperation`);
CREATE INDEX `WDIDX_Operation_IDOperationParent` ON `Operation` (`IDOperationParent`);
CREATE INDEX `WDIDX_Operation_GUIDCalOpPeriode` ON `Operation` (`GUIDCalOpPeriode`);

-- Création de la table Parametres
CREATE TABLE `Parametres` (
    `IDParametres` INTEGER  UNIQUE  DEFAULT 0,
    `RunOnce` TINYINT DEFAULT 0,
    `InitValDefaut` TINYINT DEFAULT 0,
    `VerSoftMajeur` INTEGER DEFAULT 1,
    `VerSoftMineur` INTEGER DEFAULT 0,
    `VerSoftDebug` INTEGER DEFAULT 0,
    `VerDataBase` INTEGER DEFAULT 0,
    `UtiliseLangue` SMALLINT DEFAULT 5);

-- Création de la table ParamSecurite
CREATE TABLE `ParamSecurite` (
    `IDParametres` INTEGER  UNIQUE  DEFAULT 0,
    `Password` VARCHAR(1024) ,
    `DateCrea` DATE ,
    `HeureCrea` TIME ,
    `IndicePwd` VARCHAR(50) ,
    `DateDernierAcces` DATE ,
    `HeureDernierAcces` TIME );

-- Création de la table PosteBudget
CREATE TABLE `PosteBudget` (
    `IDPosteBudget` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(50) );
CREATE INDEX `WDIDX_PosteBudget_Libelle` ON `PosteBudget` (`Libelle`);

-- Création de la table StatutOperation
CREATE TABLE `StatutOperation` (
    `IDStatutOperation` BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    `Libelle` VARCHAR(50) );

-- Création de la table TypeCategorie
CREATE TABLE `TypeCategorie` (
    `IDTypeCategorie` BIGINT  PRIMARY KEY  NOT NULL ,
    `Libelle` VARCHAR(50) );
CREATE INDEX `WDIDX_TypeCategorie_Libelle` ON `TypeCategorie` (`Libelle`);

-- Création de la table TypeCompte
CREATE TABLE `TypeCompte` (
    `IDTypeCompte` BIGINT  PRIMARY KEY  NOT NULL ,
    `Libelle` VARCHAR(50) );
-- Contraintes d'intégrité
ALTER TABLE `Operation` ADD FOREIGN KEY (`IDModeOperation`) REFERENCES `ModeOperation` (`IDModeOperation`);
ALTER TABLE `Operation` ADD FOREIGN KEY (`IDCategorie`) REFERENCES `Categorie` (`IDCategorie`);
ALTER TABLE `Operation` ADD FOREIGN KEY (`IDAffectation`) REFERENCES `Affectation` (`IDAffectation`);
ALTER TABLE `Operation` ADD FOREIGN KEY (`IDCompte`) REFERENCES `Compte` (`IDCompte`) ON DELETE CASCADE;
ALTER TABLE `Compte` ADD FOREIGN KEY (`IDTypeCompte`) REFERENCES `TypeCompte` (`IDTypeCompte`);
ALTER TABLE `Operation` ADD FOREIGN KEY (`IDStatutOperation`) REFERENCES `StatutOperation` (`IDStatutOperation`);
ALTER TABLE `Compte` ADD FOREIGN KEY (`IDBanques`) REFERENCES `Banques` (`IDBanques`);
ALTER TABLE `Categorie` ADD FOREIGN KEY (`IDTypeCategorie`) REFERENCES `TypeCategorie` (`IDTypeCategorie`);
ALTER TABLE `Categorie` ADD FOREIGN KEY (`IDPosteBudget`) REFERENCES `PosteBudget` (`IDPosteBudget`);
ALTER TABLE `Budget` ADD FOREIGN KEY (`IDPosteBudget`) REFERENCES `PosteBudget` (`IDPosteBudget`) ON DELETE CASCADE;
ALTER TABLE `Commentaire` ADD FOREIGN KEY (`IDOperation`) REFERENCES `Operation` (`IDOperation`) ON DELETE CASCADE;
ALTER TABLE `Operation` ADD FOREIGN KEY (`GUIDCalOpPeriode`) REFERENCES `CalOpPeriodique` (`GUIDCalOpPeriode`);
