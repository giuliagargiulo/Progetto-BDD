DROP SCHEMA IF EXISTS smu CASCADE;
CREATE SCHEMA a;

--CREAZIONE TABELLE

CREATE TABLE smu.FAMIGLIA(
    IdGruppo SERIAL,
    NomeGruppo varchar(32),

    CONSTRAINT PK_famiglia PRIMARY KEY (IdGruppo),
    CONSTRAINT CK_famiglia CHECK (NomeGruppo IS NOT NULL)
);

CREATE TABLE smu.UTENTE(
    Username varchar(32),
    Nome varchar(32),
    Cognome varchar(32),
    Telefono varchar(10),
    Email varchar(64),
    Password varchar(32),
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY(IdGruppo) REFERENCES smu.FAMIGLIA(IdGruppo) ON DELETE CASCADE
);

CREATE TABLE smu.CARTA(
    IdCarta serial,
    NomeCarta varchar(32),
    Saldo float,
    Username varchar(16),

    CONSTRAINT PK_CARTA PRIMARY KEY (IdCarta),
    CONSTRAINT FK_UTENTE FOREIGN KEY(Username) REFERENCES smu.UTENTE(Username) ON DELETE CASCADE
);

CREATE TABLE smu.SPESE_PROGRAMMATE(
    IdSpesa SERIAL,
    Descrizione varchar(64),
    Periodicita varchar(16),
    Scadenza date,
    DataFineRinnovo date,
    Importo INTEGER,
    IdCarta INTEGER,

    CONSTRAINT PK_SPESA PRIMARY KEY (IdSpesa),
    CONSTRAINT FK_CARTA FOREIGN KEY(IdCarta) REFERENCES smu.CARTA(IdCarta) ON DELETE CASCADE
    -- l'importo può essere negativo??
);

CREATE TABLE smu.PORTAFOGLIO(
    IdPortafoglio SERIAL,
    NomePortafoglio varchar(32) NOT NULL,
    Saldo float NOT NULL,

    CONSTRAINT PK_PORTAFOGLIO PRIMARY KEY (IdPortafoglio)
);

CREATE TABLE smu.TRANSAZIONE_ENTRATA(
    IdTransazione SERIAL,
    Importo float,
    Data date NOT NULL,
    Categoria varchar(16) NOT NULL,
    IdCarta INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT PK_TRANSAZIONE_ENTRATA PRIMARY KEY (IdTransazione),
    CONSTRAINT FK_CARTA FOREIGN KEY(IdCarta) REFERENCES smu.CARTA(IdCarta) ON DELETE CASCADE,
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(IdPortafoglio) REFERENCES smu.PORTAFOGLIO(IdPortafoglio) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)

);

CREATE TABLE smu.TRANSAZIONE_USCITA(
    IdTransazione SERIAL,
    Importo float NOT NULL,
    Data date NOT NULL,
    Categoria varchar(16) NOT NULL,
    IdCarta INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT PK_TRANSAZIONE_USCITA PRIMARY KEY (IdTransazione),
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(IdPortafoglio) REFERENCES smu.PORTAFOGLIO(IdPortafoglio) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA FOREIGN KEY(IdCarta) REFERENCES smu.CARTA(IdCarta) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)
);


