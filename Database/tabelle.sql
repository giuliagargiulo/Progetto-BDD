DROP SCHEMA IF EXISTS a CASCADE;
CREATE SCHEMA a;

--CREAZIONE TABELLE

CREATE TABLE a.FAMIGLIA(
    NomeGruppo varchar(32),
    CodiceGruppo SERIAL,

    CONSTRAINT PK_famiglia PRIMARY KEY (CodiceGruppo),
    CONSTRAINT CK_famiglia CHECK (NomeGruppo IS NOT NULL)
);

CREATE TABLE a.UTENTE(
    Username varchar(32),
    Nome varchar(32),
    Cognome varchar(32),
    CodF varchar(16),
    Telefono INTEGER,
    Email varchar(64),
    Password varchar(32),
    CodiceGruppo INTEGER,

    CONSTRAINT PK_Utente PRIMARY KEY (CodF),
    CONSTRAINT FK_Famiglia FOREIGN KEY(CodiceGruppo) REFERENCES a.FAMIGLIA(CodiceGruppo) ON DELETE CASCADE,
    CONSTRAINT UK_Utente UNIQUE (Username)
);

CREATE TABLE a.CARTA_DEBITO (
    id_Carta serial,
    nome_carta varchar(32),
    Scadenza date NOT NULL,
    SaldoCarta float,
    cf_utente varchar(16),
    --IBAN varchar(27),

    CONSTRAINT PK_CARTA_DEBITO PRIMARY KEY (id_Carta),
    CONSTRAINT FK_UTENTE FOREIGN KEY(cf_utente) REFERENCES a.UTENTE(CodF) ON DELETE CASCADE
    --CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE

);

CREATE TABLE a.CARTA_CREDITO (
    id_carta serial,
    Nome_Carta varchar(32),
    Scdenza date NOT NULL,
    plafond float,
    cf_utente varchar(16),
    --IBAN varchar(27),

    CONSTRAINT PK_CARTA_CREDTO PRIMARY KEY (id_carta),
    CONSTRAINT FK_UTENTE FOREIGN KEY(cf_utente) REFERENCES a.UTENTE(CodF) ON DELETE CASCADE
    --CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE
);

CREATE TABLE a.SPESE_PROGRAMMATE (
    id_Spesa SERIAL,
    Descrizione varchar(64),
    Periodicita varchar(16),
    DataScdenza date,
    CartaDebito INTEGER,
    CartaCredito INTEGER,
    --IBAN varchar(27),

     CONSTRAINT PK_SPESA PRIMARY KEY (id_Spesa),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_CREDITO(id_carta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_DEBITO(id_Carta) ON DELETE CASCADE
    --CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE
);


CREATE TABLE a.PORTAFOGLIO(
    id_Portafoglio serial,
    nome_portafoglio varchar(32),
    saldo float NOT NULL,

    CONSTRAINT PK_PORTAFOGLIO PRIMARY KEY (id_Portafoglio)
);

CREATE TABLE a.TRANSAZIONE_ENTRATA(
    CodTransazione serial,
    Importo float,
    DataTransazione date NOT NULL,
    Categoria varchar(16) NOT NULL,
    CartaDebito INTEGER,
    CartaCredito INTEGER,
    id_portafoglio INTEGER,

     CONSTRAINT PK_TRANSAZIONE_ENTRATA PRIMARY KEY (CodTransazione),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_CREDITO(id_carta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_DEBITO(id_Carta) ON DELETE CASCADE,
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(id_portafoglio) REFERENCES a.PORTAFOGLIO(id_portafoglio) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)

);

CREATE TABLE a.TRANSAZIONE_USCITA(
    CodTransazione serial,
    Importo float NOT NULL,
    DataTransazione date NOT NULL,
    Categoria varchar(16) NOT NULL,
    CartaDebito INTEGER,
    CartaCredito INTEGER,
    id_portafoglio INTEGER,

    CONSTRAINT PK_TRANSAZIONE_USCITA PRIMARY KEY (CodTransazione),
    CONSTRAINT FK_PORTAFOGLIO FOREIGN KEY(id_portafoglio) REFERENCES a.PORTAFOGLIO(id_portafoglio) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_CREDITO(id_carta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_DEBITO(id_Carta) ON DELETE CASCADE,
    CONSTRAINT Importo CHECK(Importo>0)
);

--CREATE TABLE a.CONTO(
    --IBAN varchar(27),
    --SaldoConto float,
    --CodF varchar(16),

    --CONSTRAINT PK_Conto PRIMARY KEY (IBAN),
    --CONSTRAINT FK_Utente FOREIGN KEY(CodF) REFERENCES a.UTENTE(CodF) ON DELETE CASCADE
--);

