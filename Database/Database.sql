DROP SCHEMA IF EXISTS a CASCADE;
CREATE SCHEMA a;

--CREAZIONE TABELLE

CREATE TABLE a.FAMIGLIA(
    IdGruppo SERIAL,
    NomeGruppo varchar(32),

    CONSTRAINT PK_famiglia PRIMARY KEY (IdGruppo),
    CONSTRAINT CK_famiglia CHECK (NomeGruppo IS NOT NULL)
);

CREATE TABLE a.UTENTE(
    Username varchar(32),
    Nome varchar(32),
    Cognome varchar(32),
    Telefono varchar(10),
    Email varchar(64),
    Password varchar(32),
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY(IdGruppo) REFERENCES a.FAMIGLIA(IdGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Email, Password)
);

CREATE TABLE a.CONTO(
    NumeroConto varchar(16),
    IBAN varchar(16),
    BIC varchar(6),
    Saldo float,
    NomeBanca varchar(32),
    Username varchar(32),

    CONSTRAINT PK_CONTO PRIMARY KEY (NumeroConto),
    CONSTRAINT FK_UTENTE FOREIGN KEY(Username) REFERENCES a.UTENTE(Username) ON DELETE CASCADE
);

CREATE TABLE a.CARTA(
    NumeroCarta varchar(16),
    NomeCarta varchar(32),
    Scadenza date, --NOT NULL,
    Saldo float,
    Plafond float,
    TipoCarta BOOLEAN,
    NumeroConto varchar(16),

    CONSTRAINT PK_CARTA PRIMARY KEY (NumeroCarta),
    CONSTRAINT FK_CONTO FOREIGN KEY (NumeroConto) REFERENCES a.CONTO(NumeroConto)
);



CREATE TABLE a.SPESE_PROGRAMMATE(
    IdSpesa SERIAL,
    Descrizione varchar(64),
    Periodicita varchar(16),
    DataScadenza date,
    Importo integer,
    IBAN_Destinatario varchar(16),
    NumeroCarta varchar(16),

    CONSTRAINT PK_SPESA PRIMARY KEY (IdSpesa),
    CONSTRAINT FK_CARTA FOREIGN KEY(NumeroCarta) REFERENCES a.CARTA(NumeroCarta) ON DELETE CASCADE
);


CREATE TABLE a.PORTAFOGLIO(
    IdPortafoglio serial,
    NomePortafoglio varchar(32),
    Saldo float, --NOT NULL,

    CONSTRAINT PK_PORTAFOGLIO PRIMARY KEY (IdPortafoglio)
);

CREATE TABLE a.ASSOCIAZIONE (
    IdPortafoglio integer,
    NumeroCarta varchar(16),

    CONSTRAINT FK_CARTA FOREIGN KEY(NumeroCarta) REFERENCES a.CARTA(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(IdPortafoglio) REFERENCES a.PORTAFOGLIO(IdPortafoglio) ON DELETE CASCADE
);

CREATE TABLE a.TRANSAZIONE(
    CRO INTEGER,
    Importo float,
    DataTransazione date, --NOT NULL,
    Ora time,
    Causale varchar(50),
    Categoria varchar(16), -- NOT NULL,
    TipoTransazione BOOLEAN,
    Mittente varchar(32),
    IBAN_destinatario varchar(16),
    NumeroCarta varchar(16),


    CONSTRAINT PK_TRANSAZIONE_ENTRATA PRIMARY KEY (CRO),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(NumeroCarta) REFERENCES a.CARTA(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)

);