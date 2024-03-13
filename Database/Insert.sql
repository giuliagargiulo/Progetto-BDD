
INSERT INTO smu.Famiglia(NomeGruppo)VALUES ('Famiglia Gargiulo');
INSERT INTO smu.Famiglia(NomeGruppo)VALUES ('Famiglia Gaetano');

INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo)VALUES ('Giulia28', 'Giulia', 'Gargiulo', '3662648291', 'giulia.gargiulo3@studenti.unina.it', 'Password1', 1);
INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo)VALUES ('MirGae', 'Miriam', 'Gaetano', '3316581941', 'miriam.gaetano@studenti.unina.it', 'Password2', 2);


INSERT INTO smu.Conto(numeroconto,saldo) VALUES(1, 10000);

INSERT INTO smu.CARTA(numerocarta,saldo, numeroconto)VALUES ('10', 100, 1);
INSERT INTO smu.CARTA(numerocarta,saldo)VALUES ('20', 1003);
INSERT INTO smu.CARTA(numerocarta,saldo)VALUES ('30', 10032);
INSERT INTO smu.CARTA(numerocarta,saldo, numeroconto)VALUES ('40', 1324, 1);
INSERT INTO smu.CARTA(numerocarta,saldo)VALUES ('50', 1421);
INSERT INTO smu.CARTA(numerocarta,saldo)VALUES ('60', 5230);

INSERT INTO smu.Portafoglio(idportafoglio) VALUES(1);
INSERT INTO smu.Portafoglio(idportafoglio)VALUES(2);
INSERT INTO smu.Portafoglio(idportafoglio) VALUES(3);



INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(1,10,'10', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(2,200,'10', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(3,45,'10', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(4,5,'20', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(5,200,'20', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(6,45,'20', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(7,10,'30', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(8,200,'30', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(9,45,'30', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(10,10,'30', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(11,200,'30', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(12,45,'40', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(13,10,'40', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(14,200,'40', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(15,45,'40', 'Entrata');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(16,10,'40', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo) VALUES(17,200,'40', 'Uscita');
INSERT INTO smu.Transazione(cro, importo, numerocarta, Tipo)VALUES (18, 45, '40', 'Entrata');


INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (1, '10');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (2, '20');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (3, '30');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES(3, '40');