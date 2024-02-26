DROP SCHEMA IF EXISTS p CASCADE;
CREATE SCHEMA p;

CREATE TABLE p.Libro
(
    ISBN        integer,
    Titolo      varchar(20),
    Editore     varchar(20),
    Anno        date,
    Descrizione varchar(128),
    CONSTRAINT PK_Libro PRIMARY KEY (ISBN)
);

CREATE TABLE p.Esemplare
(
    CodiceBarre integer,
    ISBN        integer,
    Collocazione varchar(20),
    Prestito     boolean,
    Consultazione boolean,
    CONSTRAINT PK_Esemplare PRIMARY KEY (CodiceBarre),
    CONSTRAINT FK_Esemplare FOREIGN KEY (ISBN) REFERENCES p.Libro(ISBN)
);

CREATE TABLE p.Utente
(
    CF varchar(16),
    CodProfilo integer,
    Nome varchar(20),
    Cognome varchar(20),
    DataN date,
    CONSTRAINT PK_Utente PRIMARY KEY (CF),
    CONSTRAINT FK_Utente FOREIGN KEY(CodProfilo) REFERENCES p.Profilo(CodProfilo)
);

CREATE TABLE p.Profilo(
    CodProfilo integer,
    MaxDurata integer,
    MaxPrestito integer,
    CONSTRAINT PK_Profilo PRIMARY KEY (CodProfilo)
);

CREATE TABLE p.Prestito(
    CodPrestito integer,
    CodiceBarre integer,
    Utente varchar(16),
    DataE date,
    DataS date,
    DataR date,
    DataSol date,
    CONSTRAINT PK_Prestito PRIMARY KEY (CodPrestito),
    CONSTRAINT FK_Esemplare FOREIGN KEY (CodiceBarre) REFERENCES p.Esemplare (CodiceBarre),
    CONSTRAINT FK_Utente FOREIGN KEY (Utente) REFERENCES p.Utente(CF)
);

CREATE TABLE p.Prenotazione
(
    CodPrenotazione integer,
    ISBN        integer,
    Utente      varchar(16),
    Data        date,
    CONSTRAINT PK_Prenotazione PRIMARY KEY (CodPrenotazione),
    CONSTRAINT FK_Utente FOREIGN KEY (Utente) REFERENCES p.Utente(CF)
);

