
-- Famiglie
INSERT INTO smu.Famiglia(NomeGruppo)VALUES ('Famiglia Gargiulo');
INSERT INTO smu.Famiglia(NomeGruppo)VALUES ('Famiglia Gaetano');


-- Utenti
INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo)VALUES ('Giulia28', 'Giulia', 'Gargiulo', '+393662648291', 'giulia.gargiulo3@studenti.unina.it', 'Password1', 1);
INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo)VALUES ('MirGae', 'Miriam', 'Gaetano', '+393316581941', 'miriam.gaetano@studenti.unina.it', 'Password2', 2);


-- Conti Correnti
INSERT INTO smu.ContoCorrente(numeroconto,saldo) VALUES(1, 10000);


--Carte
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1000281829394444', 'Poste Pay Evolution', 100, '12-2025', 13.00, 'Credito', 14000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1234567890123456', 'Carta di Giulia', 345, '08-2024', 500.00, 'Credito', 1000.00, 2);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('9876543210987654', 'Visa', 789, '05-2023', 200.00, 'Credito', 500.00, 3);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('4444333322221111', 'Mastercard', 222, '11-2026', 1000.00, 'Credito', 2000.00, 4);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5555666677778888', 'Visa', 333, '07-2025', 700.00, 'Debito', NULL, 5);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('6666999988887777', 'Carta Oro', 444, '04-2024', 1500.00, 'Debito', NULL, 6);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1515151515151515', 'Carta Viaggio', 888, '06-2027', 250.00, 'Debito', NULL, 10);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1414141414141414', 'Carta Studenti', 777, '12-2023', 50.00, 'Credito', 200.00, 9);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1212121212121212', 'Carta di Debito', 555, '09-2023', 300.00, 'Debito', NULL, 7);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5555666677778888', 'Visa', 333, '07-2025', 700.00, 'Debito', NULL, 5);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('9876543210987654', 'Carta Lorenzo', 789, '05-2023', 200.00, 'Credito', 500.00, 3);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1234567890123456', 'Carta Fedelta', 345, '08-2024', 500.00, 'Credito', 1000.00, 2);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1515151515151515', 'Carta Conad', 888, '06/2027', 250.00, 'Debito', NULL, 10);


-- Portafogli
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(1, 'Casa', 54323.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(1, 'Casa Vacanze', 54323.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(2, 'Auto', 2350.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(3, 'Stipendio', 897.50);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(4, 'Emergenze', 1500.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(5, 'Investimenti', 10000.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(6, 'Spese Mensili', 3200.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(7, 'Fondo Pensione', 80000.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(8, 'Viaggi', 2500.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(9, 'Regali', 450.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(10, 'Abbigliamento', 750.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(11, 'Risparmi', 15000.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(12, 'Hobby', 300.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(13, 'Alimentari', 400.00);
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(14, 'Assicurazione', 1200.00);


-- Categorie
INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Supermercato');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Ristorante');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Rimborsi', 'Rimborso');


-- Transazioni
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(14728139340,50,'2023-03-21', '13:21:30', 'Rimborso', 'Entrata', 'Rimborso Amazon', NULL, '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(15738299391,35.40,'2024-01-01', '15:25:36', 'Pagamento supermercato', 'Uscita', NULL,'Supermercato Deco', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(12345678910, 20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Uscita', NULL, 'E-commerce', '1234567890123456', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(98765432109, 75.80, '2024-03-18', '17:30:45', 'Pagamento bollette', 'Uscita', NULL, 'Fornitore energia', '9876543210987654', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(24681012131, 42.30, '2024-03-17', '11:10:55', 'Pagamento affitto', 'Uscita', NULL, 'Proprietario immobile', '5355222233334444', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(13579111315, 65.25, '2024-03-16', '14:20:10', 'Carburante', 'Uscita', NULL, 'Stazione di servizio ESSO', '5535667677788684', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(36912151821, 30.50, '2024-03-15', '18:35:45', 'Ristorante', 'Uscita', NULL, 'Ristorante Buon Gusto', '9999000011112222', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(48121620241, 90.00, '2024-03-14', '12:15:30', 'Rimborso assicurazione', 'Entrata', 'Assicurazione Generali', NULL, '3333444455556666', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(10121416182, 25.75, '2024-03-13', '09:55:20', 'Acquisto libri', 'Uscita', NULL, 'Libreria XYZ', '7777888899990000', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(20242830360, 55.20, '2024-03-12', '16:40:15', 'Pagamento bollo auto', 'Uscita', NULL, 'Ufficio Motorizzazione', '123123456456789789', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(60657075805, 15.90, '2024-03-11', '10:25:05', 'Spesa mensile abbonamento streaming', 'Uscita', NULL, 'Piattaforma Streaming X', '9876543212345678', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(79818243805, 70.60, '2024-03-10', '14:00:45', 'Acquisto vestiti', 'Uscita', NULL, 'Negozio di abbigliamento Y', '1111000022223333', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(99110212225, 40.30, '2024-03-09', '17:45:30', 'Ricarica cellulare', 'Uscita', NULL, 'Operatore Telefonico Z', '4444555566667777', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(30313233345, 85.75, '2024-03-08', '11:20:10', 'Pagamento tasse', 'Uscita', NULL, 'Agenzia delle Entrate', '8888999911112222', NULL);


-- Associazioni
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (1, '10');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (2, '20');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES (3, '30');
INSERT INTO smu.Associazione(idportafoglio, numerocarta)VALUES(3, '40');