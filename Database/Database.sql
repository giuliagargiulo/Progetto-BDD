DROP SCHEMA IF EXISTS smu CASCADE;
CREATE SCHEMA smu;

--CREAZIONE TABELLE

CREATE TABLE smu.Famiglia(
    IdGruppo SERIAL,
    NomeGruppo VARCHAR(128),

    CONSTRAINT PK_famiglia PRIMARY KEY (IdGruppo),
    CONSTRAINT CK_famiglia CHECK (NomeGruppo IS NOT NULL)
);

CREATE TABLE smu.Utente(
    Username VARCHAR(32),
    Nome VARCHAR(32),
    Cognome VARCHAR(32),
    Telefono VARCHAR(10),
    Email VARCHAR(64),
    Password VARCHAR(32),
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY(IdGruppo) REFERENCES smu.Famiglia(IdGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Email, Password)
);

CREATE TABLE smu.ContoCorrente(
    NumeroConto VARCHAR(16),
    IBAN VARCHAR(16),
    Saldo FLOAT,
    NomeBanca VARCHAR(128),
    BIC VARCHAR(6),
    Username VARCHAR(32),

    CONSTRAINT PK_Conto PRIMARY KEY (NumeroConto),
    CONSTRAINT FK_Utente FOREIGN KEY(Username) REFERENCES smu.Utente(Username) ON DELETE CASCADE
);

CREATE TABLE smu.Carta(
    NumeroCarta VARCHAR(16),
    Nome VARCHAR(32),
    Scadenza DATE, --NOT NULL,
    Saldo FLOAT,
    Plafond FLOAT,
    TipoCarta BOOLEAN, -- DA RIVEDERE
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
    Destinatario VARCHAR(255),
    NumeroCarta VARCHAR(16),

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
    ParolaChiave VARCHAR(32),

    CONSTRAINT PK_Categoria PRIMARY KEY(Nome)
);

CREATE TABLE smu.Transazione(
    CRO INTEGER,
    Importo FLOAT,
    Data DATE, --NOT NULL,
    Ora TIME,
    Causale VARCHAR(128),
    Tipo VARCHAR(10),
    Mittente VARCHAR(32),
    Destinatario VARCHAR(255),
    NumeroCarta VARCHAR(16),
    NomeCategoria VARCHAR(32),

    CONSTRAINT PK_TransazioneEntrata PRIMARY KEY (CRO),
    CONSTRAINT FK_CartaCredito FOREIGN KEY(NumeroCarta) REFERENCES smu.Carta(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_Categoria FOREIGN KEY (NomeCategoria)REFERENCES smu.Categoria(Nome) ON DELETE CASCADE

);