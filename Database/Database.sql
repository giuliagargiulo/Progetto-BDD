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
    Telefono INTEGER,
    Email varchar(64),
    Password varchar(32),
    IdGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (Username),
    CONSTRAINT FK_Famiglia FOREIGN KEY(IdGruppo) REFERENCES a.FAMIGLIA(IdGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Username)
);

CREATE TABLE a.CARTA_DEBITO(
    IdCarta serial,
    NomeCarta varchar(32),
    Scadenza date NOT NULL,
    Saldo float,
    Username varchar(16),

    CONSTRAINT PK_CARTA_DEBITO PRIMARY KEY (IdCarta),
    CONSTRAINT FK_UTENTE FOREIGN KEY(Username) REFERENCES a.UTENTE(Username) ON DELETE CASCADE

);

CREATE TABLE a.CARTA_CREDITO (
    IdCarta serial,
    NomeCarta varchar(32),
    Scadenza date NOT NULL,
    Username varchar(32),

    CONSTRAINT PK_CARTA_CREDTO PRIMARY KEY (IdCarta),
    CONSTRAINT FK_UTENTE FOREIGN KEY(Username) REFERENCES a.UTENTE(Username) ON DELETE CASCADE
);

CREATE TABLE a.SPESE_PROGRAMMATE(
    IdSpesa SERIAL,
    Descrizione varchar(64),
    Periodicita varchar(16),
    Scadenza date,
    Importo integer,
    IdCDebito INTEGER,
    IdCCredito INTEGER,

    CONSTRAINT PK_SPESA PRIMARY KEY (IdSpesa),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(IdCCredito) REFERENCES a.CARTA_CREDITO(IdCarta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(IdCDebito) REFERENCES a.CARTA_DEBITO(IdCarta) ON DELETE CASCADE

);


CREATE TABLE a.PORTAFOGLIO(
    IdPortafoglio serial,
    NomePortafoglio varchar(32),
    Saldo float NOT NULL,

    CONSTRAINT PK_PORTAFOGLIO PRIMARY KEY (IdPortafoglio)
);

CREATE TABLE a.TRANSAZIONE_ENTRATA(
    IdTransazione serial,
    Importo float,
    Data date NOT NULL,
    Categoria varchar(16) NOT NULL,
    IdCDebito INTEGER,
    IdCCredito INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT PK_TRANSAZIONE_ENTRATA PRIMARY KEY (IdTransazione),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(IdCCredito) REFERENCES a.CARTA_CREDITO(IdCarta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(IdCDebito) REFERENCES a.CARTA_DEBITO(IdCarta) ON DELETE CASCADE,
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(IdPortafoglio) REFERENCES a.PORTAFOGLIO(IdPortafoglio) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)

);

CREATE TABLE a.TRANSAZIONE_USCITA(
    IdTransazione serial,
    Importo float NOT NULL,
    Data date NOT NULL,
    Categoria varchar(16) NOT NULL,
    IdCDebito INTEGER,
    IdCCredito INTEGER,
    IdPortafoglio INTEGER,

    CONSTRAINT PK_TRANSAZIONE_USCITA PRIMARY KEY (IdTransazione),
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(IdPortafoglio) REFERENCES a.PORTAFOGLIO(IdPortafoglio) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(IdCCredito) REFERENCES a.CARTA_CREDITO(IdCarta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(IdCDebito) REFERENCES a.CARTA_DEBITO(IdCarta) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)
);



