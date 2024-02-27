
INSERT INTO a.Famiglia(NomeGruppo) VALUES('Famiglia Gargiulo');
INSERT INTO a.Famiglia(NomeGruppo) VALUES('Famiglia Gaetano');

INSERT INTO a.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo) VALUES ('Giulia28','Giulia','Gargiulo','3662648291', 'giulia.gargiulo3@studenti.unina.it','Password1', 1);
INSERT INTO a.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo) VALUES ('MirGae','Miriam', 'Gaetano', '3316581941','miriam.gaetano@studenti.unina.it','Password2', 2);





INSERT INTO a.Spese_Programmate(descrizione, periodicita, scadenza,importo, idcdebito, idccredito) VALUES('Bollette','Bimestrale','30-03-2024',100, 1, NULL);
INSERT INTO a.Spese_Programmate(descrizione, periodicita, scadenza,importo, idcdebito, idccredito) VALUES('Netflix', 'Mensile', '30-03-2024',10, NULL, 1);
INSERT INTO a.Spese_Programmate(descrizione, periodicita, scadenza,importo, idcdebito, idccredito) VALUES('Mutuo','Annuale','01-01-2025', 2, 2500, NULL);
INSERT INTO a.Spese_Programmate(descrizione, periodicita, scadenza,importo, idcdebito, idccredito) VALUES('Rata Auto', 'Mensile', '30-05-2024',300, NULL, 5);



