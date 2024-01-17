DROP SCHEMA IF EXISTS a CASCADE;
CREATE SCHEMA a;

--creazione tabelle

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

CREATE TABLE a.CONTO(
    IBAN varchar(27),
    SaldoConto float,
    CodF varchar(16),

    CONSTRAINT PK_Conto PRIMARY KEY (IBAN),
    CONSTRAINT FK_Utente FOREIGN KEY(CodF) REFERENCES a.UTENTE(CodF) ON DELETE CASCADE
);

CREATE TABLE a.SPESE_PROGRAMMATE (
    Descrizione varchar(64),
    Periodicita varchar(16),
    DataScdenza date,
    IBAN varchar(27),

    CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE
);

CREATE TABLE a.CARTA_DEBITO (
    NumeroCarta INTEGER,
    Scadenza date,
    PIN SMALLINT,
    CVV SMALLINT,
    SaldoCarta float,
    IBAN varchar(27),

    CONSTRAINT PK_CARTA_DEBITO PRIMARY KEY (NumeroCarta),
    CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE

);

CREATE TABLE a.CARTA_CREDITO (
    NumeroCarta INTEGER,
    Scdenza date,
    PIN SMALLINT,
    CVV SMALLINT,
    plafond float,
    IBAN varchar(27),

    CONSTRAINT PK_CARTA_CREDTO PRIMARY KEY (NumeroCarta),
    CONSTRAINT FK_Conto FOREIGN KEY(IBAN) REFERENCES a.CONTO(IBAN) ON DELETE CASCADE
);

CREATE TABLE a.TRANSAZIONE_ENTRATA(
    CRO varchar(11),
    Importo float,
    DataTransazione date NOT NULL,
    Casuale varchar(64),
    Mittente varchar(128) NOT NULL,
    Categoria varchar(16) NOT NULL,
    CartaDebito INTEGER,
    CartaCredito INTEGER,

    CONSTRAINT PK_TRANSAZIONE_ENTRATA PRIMARY KEY (CRO),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_CREDITO(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_DEBITO(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT importo CHECK(Importo>0)

);

CREATE TABLE a.TRANSAZIONE_USCITA(
    CRO varchar(11),
    Importo float NOT NULL,
    DataTransazione date NOT NULL,
    Casuale varchar(64),
    Beneficiario varchar(128) NOT NULL,
    IBAN_destinatario varchar(27) NOT NULL,
    Categoria varchar(16) NOT NULL,
    CartaDebito INTEGER,
    CartaCredito INTEGER,

    CONSTRAINT PK_TRANSAZIONE_USCITA PRIMARY KEY (CRO),
    CONSTRAINT FK_CARTA_CREDITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_CREDITO(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT FK_CARTA_DEBITO FOREIGN KEY(CartaCredito) REFERENCES a.CARTA_DEBITO(NumeroCarta) ON DELETE CASCADE,
    CONSTRAINT importo CHECK(Importo>0)

);