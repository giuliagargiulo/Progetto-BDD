DROP SCHEMA IF EXISTS smu CASCADE;
CREATE SCHEMA smu;

--tabella Famiglia
CREATE TABLE smu.Famiglia(
    IdGruppo    SERIAL,
    NomeGruppo  VARCHAR(32)  NOT NULL,

    CONSTRAINT PK_famiglia PRIMARY KEY (IdGruppo)
);


--Tabella Utente
CREATE TABLE smu.Utente(
    Username VARCHAR(32),
    Nome     VARCHAR(32)  NOT NULL,
    Cognome  VARCHAR(32)  NOT NULL,
    Telefono VARCHAR(13)  NOT NULL,
    Email    VARCHAR(128) NOT NULL,
    Password VARCHAR(32)  NOT NULL,
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY (IdGruppo) REFERENCES smu.Famiglia (IdGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Email, Password),
    CONSTRAINT CK_Telefono CHECK (Telefono ~ '\+[0-9]{2}[0-9]{10}'),
    CONSTRAINT CK_Email CHECK (Email ~ '[a-zA-Z0-9._%+\-]@[a-zA-Z0-9.-]\d*.*[A-Za-z]{2,4}'),
    CONSTRAINT CK_Password CHECK (Password ~ '[a-zA-Z0-9! " # $ % & ( ) * + , - . / : ; < = > ? @ \[ \] \ ^ _` \{ | \} ~ ]{8,32}')
);


--Tabella Conto Corrente
CREATE TABLE smu.ContoCorrente(
    NumeroConto VARCHAR(12),
    IBAN        VARCHAR(27)  NOT NULL,
    Saldo       FLOAT        NOT NULL,
    NomeBanca   VARCHAR(128) NOT NULL,
    BIC         VARCHAR(11)  NOT NULL,
    Username    VARCHAR(32),

    CONSTRAINT PK_Conto PRIMARY KEY (NumeroConto),
    CONSTRAINT FK_Utente FOREIGN KEY (Username) REFERENCES smu.Utente (Username) ON DELETE CASCADE,
    CONSTRAINT CK_IBAN CHECK (IBAN ~ '[A-Z]{2}[0-9]{2}[A-Z]{1}[0-9]{5}[0-9]{5}[0-9A-Z]{5}'),
    CONSTRAINT CK_BIC CHECK (BIC ~ '[A-Z]{4}[A-Z]{2}[0-9A-Z]{2}[0-9A-Z]{0,3}')
);


--Tabella Carta
CREATE TABLE smu.Carta(
    NumeroCarta VARCHAR(16),
    Nome        VARCHAR(32),
    CVV         VARCHAR(3) NOT NULL,
    Scadenza    DATE       NOT NULL,
    Saldo       FLOAT,
    TipoCarta   VARCHAR(7) NOT NULL,
    Plafond     FLOAT,
    NumeroConto VARCHAR(12),

    CONSTRAINT PK_Carta PRIMARY KEY (NumeroCarta),
    CONSTRAINT FK_Conto FOREIGN KEY (NumeroConto) REFERENCES smu.ContoCorrente (NumeroConto),
    CONSTRAINT CK_NumeroCarta CHECK (NumeroCarta ~ '[0-9]{16}'),
    CONSTRAINT CK_CVV CHECK (CVV ~ '[0-9]{3}'),
    CONSTRAINT CK_TipoCarta CHECK (TipoCarta IN ('Credito', 'Debito'))
);


--Tabella Spese Programmate
CREATE TABLE smu.SpeseProgrammate(
    IdSpesa         SERIAL,
    Descrizione     VARCHAR(64),
    Periodicita     VARCHAR(9) NOT NULL,
    DataScadenza    DATE       NOT NULL,
    DataFineRinnovo DATE,
    Importo         FLOAT      NOT NULL,
    Destinatario    VARCHAR(32),
    NumeroCarta     VARCHAR(16), --controllare se giusto siccome è stato tolto il tipo,

    CONSTRAINT PK_Spesa PRIMARY KEY (IdSpesa),
    CONSTRAINT FK_Carta FOREIGN KEY (NumeroCarta) REFERENCES smu.Carta (NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT CK_SpeseProgrammate_Periodicita CHECK (Periodicita IN
                                                      ('7 giorni', '15 giorni', '1 mese', '3 mesi', '6 mesi', '1 anno'))
);


--Tabella Transazione
CREATE TABLE smu.Transazione(
    IdTransazione SERIAL,
    CRO           VARCHAR(16),
    Importo       FLOAT NOT NULL,
    Data          DATE  NOT NULL,
    Ora           TIME  NOT NULL,
    Causale       VARCHAR(128),
    Tipo          VARCHAR(7),
    Mittente      VARCHAR(32),
    Destinatario  VARCHAR(32),
    NumeroCarta   VARCHAR(16),

    CONSTRAINT PK_Transazione PRIMARY KEY (IdTransazione),
    CONSTRAINT FK_Carta FOREIGN KEY (NumeroCarta) REFERENCES smu.Carta (NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT CK_Transazione_CRO CHECK (CRO ~ '[0-9]{11,16}'),
    CONSTRAINT CK_Transazione_Tipo CHECK (Tipo IN ('Entrata', 'Uscita')),
    CONSTRAINT CK_Data CHECK (data <= CURRENT_DATE)
);


--Tabella Portafoglio
CREATE TABLE smu.Portafoglio(
    IdPortafoglio   SERIAL,
    NomePortafoglio VARCHAR(32) NOT NULL,
    Saldo           FLOAT       NOT NULL,

    CONSTRAINT PK_Portafoglio PRIMARY KEY (IdPortafoglio)
);


CREATE TABLE smu.Categoria(
    IdCategoria SERIAL,
    Nome VARCHAR(32) UNIQUE,

    CONSTRAINT PK_Categoria PRIMARY KEY (IdCategoria)
);

CREATE TABLE smu.ParoleChiave(
    ParolaChiave VARCHAR(32),
    IdCategoria INTEGER,

    CONSTRAINT FK_Categoria FOREIGN KEY(IdCategoria) REFERENCES smu.Categoria(IdCategoria) ON DELETE CASCADE
);

--tabella ponte tra Portafoglio e Carta  *a*
CREATE TABLE smu.AssociazioneCartaPortafoglio(
    IdPortafoglio INTEGER,
    NumeroCarta   VARCHAR(16),

    CONSTRAINT FK_Carta FOREIGN KEY (NumeroCarta) REFERENCES smu.Carta (NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_Portafoglio FOREIGN KEY (IdPortafoglio) REFERENCES smu.Portafoglio (IdPortafoglio) ON DELETE CASCADE
);


--tabella ponte tra Portafoglio e Transazione  *a*
CREATE TABLE smu.TransazioniInPortafogli(
    IdTransazione INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT FK_Transazione FOREIGN KEY (IdTransazione) REFERENCES smu.Transazione (IdTransazione) ON DELETE CASCADE,
    CONSTRAINT FK_Portafoglio FOREIGN KEY (IdPortafoglio) REFERENCES smu.Portafoglio (IdPortafoglio) ON DELETE CASCADE
);


--tabella ponte tra Portafoglio e Categoria  *a*
CREATE TABLE smu.CategorieInPortafogli(
    IdCategoria INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT FK_Categoria FOREIGN KEY (IdCategoria) REFERENCES smu.Categoria (IdCategoria) ON DELETE CASCADE,
    CONSTRAINT FK_Portafoglio FOREIGN KEY (IdPortafoglio) REFERENCES smu.Portafoglio (IdPortafoglio) ON DELETE CASCADE
);



