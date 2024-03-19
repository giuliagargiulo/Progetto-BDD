DROP SCHEMA IF EXISTS smu CASCADE;
CREATE SCHEMA smu;

CREATE TABLE smu.Famiglia(
    IdGruppo SERIAL,
    NomeGruppo VARCHAR(32),

    CONSTRAINT PK_famiglia PRIMARY KEY (IdGruppo),
    CONSTRAINT CK_famiglia CHECK (NomeGruppo IS NOT NULL)
);

CREATE DOMAIN smu.TipoTelefono AS VARCHAR(13) CHECK (VALUE ~ '\+[0-9]{2}[0-9]{10}');
CREATE DOMAIN smu.TipoEmail AS VARCHAR(64) CHECK (VALUE ~ '[a-zA-Z0-9._%+\-]@[a-zA-Z0-9.-]\.[a-zA-Z]{2,4}');
CREATE DOMAIN smu.TipoPassword AS VARCHAR(32) CHECK (VALUE ~ '[a-zA-Z0-9! " # $ % & ( ) * + , - . / : ; < = > ? @ \[ \] \ ^ _` \{ | \} ~ ]{8,32}');


CREATE TABLE smu.Utente(
    Username VARCHAR(32),
    Nome VARCHAR(32),
    Cognome VARCHAR(32),
    Telefono smu.TipoTelefono,
    Email smu.TipoEmail,
    Password smu.TipoPassword,
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY(IdGruppo) REFERENCES smu.Famiglia(IdGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Email, Password)
);

CREATE DOMAIN smu.TipoIBAN AS VARCHAR(27) CHECK (VALUE ~ '[A-Z]{2}[0-9]{2}[A-Z]{1}[0-9]{5}[0-9]{5}[0-9A-Z]{5}');
CREATE DOMAIN smu.TipoBIC AS VARCHAR(11) CHECK (VALUE ~ '[A-Z]{4}[A-Z]{2}[0-9A-Z]{2}[0-9A-Z]{0,3}');

CREATE TABLE smu.ContoCorrente(
    NumeroConto VARCHAR(12),
    IBAN smu.TipoIBAN,
    Saldo FLOAT,
    NomeBanca VARCHAR(128),
    BIC VARCHAR(11),
    Username VARCHAR(32),

    CONSTRAINT PK_Conto PRIMARY KEY (NumeroConto),
    CONSTRAINT FK_Utente FOREIGN KEY(Username) REFERENCES smu.Utente(Username) ON DELETE CASCADE
);

CREATE DOMAIN smu.TipoNumeroCarta AS VARCHAR(16) CHECK(VALUE ~ '[0-9]{16}');
CREATE DOMAIN smu.TipoCVV AS VARCHAR(3) CHECK(VALUE ~ '[0-9]{3}');
CREATE TYPE smu.TipoCarta AS ENUM('Credito', 'Debito');

CREATE TABLE smu.Carta(
    NumeroCarta smu.TipoNumeroCarta,
    Nome VARCHAR(32),
    CVV smu.TipoCVV,
    Scadenza DATE, --NOT NULL,
    Saldo FLOAT,
    Plafond FLOAT,
    TipoCarta smu.TipoCarta , -- DA RIVEDERE
    NumeroConto VARCHAR(16),

    CONSTRAINT PK_Carta PRIMARY KEY (NumeroCarta),
    CONSTRAINT FK_Conto FOREIGN KEY (NumeroConto) REFERENCES smu.ContoCorrente(NumeroConto)
);


CREATE TABLE smu.SpeseProgrammate(
    IdSpesa SERIAL,
    Descrizione VARCHAR(64),
    Periodicita VARCHAR(16),
    DataScadenza DATE,
    Importo FLOAT,
    Destinatario VARCHAR(32),
    NumeroCarta smu.TipoNumeroCarta,

    CONSTRAINT PK_Spesa PRIMARY KEY (IdSpesa),
    CONSTRAINT FK_Carta FOREIGN KEY(NumeroCarta) REFERENCES smu.Carta(NumeroCarta) ON DELETE CASCADE
);


CREATE TABLE smu.Portafoglio(
    IdPortafoglio SERIAL,
    NomePortafoglio VARCHAR(32),
    Saldo FLOAT, --NOT NULL,

    CONSTRAINT PK_Portafoglio PRIMARY KEY (IdPortafoglio)
);

CREATE TABLE smu.Associazione(
    IdPortafoglio INTEGER,
    NumeroCarta VARCHAR(16),

    CONSTRAINT FK_Carta FOREIGN KEY(NumeroCarta) REFERENCES smu.Carta(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_Portafoglio FOREIGN KEY(IdPortafoglio) REFERENCES smu.Portafoglio(IdPortafoglio) ON DELETE CASCADE
);

CREATE TABLE smu.Categoria(
    Nome VARCHAR(32),
    ParolaChiave VARCHAR(32)
);

CREATE DOMAIN smu.TipoCRO AS VARCHAR(11) CHECK(VALUE ~ '[0-9]{11}');
CREATE TYPE smu.TipoTransazione AS ENUM('Entrata', 'Uscita');

CREATE TABLE smu.Transazione(
    CRO smu.TipoCRO,
    Importo FLOAT,
    Data DATE, --NOT NULL,
    Ora TIME,
    Causale VARCHAR(128),
    Tipo smu.TipoTransazione,
    Mittente VARCHAR(32),
    Destinatario VARCHAR(32),
    NumeroCarta VARCHAR(16),
    NomeCategoria VARCHAR(32),

    CONSTRAINT PK_TransazioneEntrata PRIMARY KEY (CRO),
    CONSTRAINT FK_CartaCredito FOREIGN KEY(NumeroCarta) REFERENCES smu.Carta(NumeroCarta) ON DELETE CASCADE

);
