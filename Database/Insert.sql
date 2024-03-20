
-- Famiglie
INSERT INTO smu.Famiglia(NomeGruppo) VALUES('Famiglia Gargiulo');
INSERT INTO smu.Famiglia(NomeGruppo) VALUES('Famiglia Gaetano');


-- Utenti
INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo) VALUES('Giulia28', 'Giulia', 'Gargiulo', '+393662648291', 'giulia.gargiulo3@studenti.unina.it', 'Password1', 1);
INSERT INTO smu.Utente(Username, Nome, Cognome, Telefono, Email, Password, IdGruppo) VALUES('MirGae', 'Miriam', 'Gaetano', '+393316581941', 'miriam.gaetano@studenti.unina.it', 'Password2', 2);


-- Conti Correnti da fare
INSERT INTO smu.ContoCorrente(NumeroConto,Saldo) VALUES(1, 10000);


--Carte
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5355284927482884', 'Poste Pay Evolution', 100, '2025-12-31', 13.00, 'Credito', 14000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5337589274884783', 'Carta di Giulia', 345, '2024-08-31', 500.00, 'Credito', 1000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1234567890123456', 'Visa', 789, '2023-05-31', 200.00, 'Credito', 500.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('9999000011112222', 'Mastercard', 222, '2026-11-30', 1000.00, 'Credito', 2000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5555666677778888', 'Visa', 333, '2025-07-31', 700.00, 'Debito', NULL, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('6666999988887777', 'Carta Oro', 444, '2024-04-30', 1500.00, 'Debito', NULL, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1515151515151515', 'Carta Viaggio', 888, '2027-06-30', 250.00, 'Debito', NULL, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1414141414141414', 'Carta Studenti', 777, '2023-12-31', 50.00, 'Credito', 200.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1212121212121212', 'Carta di Debito', 555, '2023-09-30', 300.00, 'Debito', NULL, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5555666677448888', 'Visa', 333, '2025-07-31', 700.00, 'Debito', NULL, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('9876543210987654', 'Carta Lorenzo', 789, '2023-05-31', 200.00, 'Credito', 500.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1234567890443456', 'Carta Fedelta', 345, '2024-08-31', 500.00, 'Credito', 1000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1515151665151515', 'Carta Conad', 888, '2027-06-30', 250.00, 'Debito', NULL, 1);


-- Portafogli
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(1, 'Casa', 54323.00);
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
INSERT INTO smu.Portafoglio(IdPortafoglio, NomePortafoglio, Saldo) VALUES(15, 'Casa Vacanze', 54323.00);

-- Categorie
INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Supermercato');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Ristorante');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Rimborsi', 'Rimborso');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Casa', 'Affitto');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Casa', 'Energia');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Auto', 'Carburante');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Acquisti', 'Online');



-- Transazioni
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(14728139340,50,'2023-03-21', '13:21:30', 'Rimborso', 'Entrata', 'Rimborso Amazon', NULL, '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(15738299391,35.40,'2024-01-01', '15:25:36', 'Pagamento supermercato', 'Uscita', NULL,'Supermercato Deco', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(12345678910, 20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Uscita', NULL, 'E-commerce', '1234567890123456', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(98765432109, 75.80, '2024-03-18', '17:30:45', 'Pagamento bollette', 'Uscita', NULL, 'Fornitore energia', '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(24681012131, 42.30, '2024-03-17', '11:10:55', 'Pagamento affitto', 'Uscita', NULL, 'Proprietario immobile', '1234567890123456', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(13579111315, 65.25, '2024-03-16', '14:20:10', 'Carburante', 'Uscita', NULL, 'Stazione di servizio ESSO', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(36912151821, 30.50, '2024-03-15', '18:35:45', 'Ristorante', 'Uscita', NULL, 'Ristorante Buon Gusto', '9999000011112222', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(10121416182, 25.75, '2024-03-13', '09:55:20', 'Acquisto libri', 'Uscita', NULL, 'Libreria XYZ', '6666999988887777', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(20242830360, 55.20, '2024-03-12', '16:40:15', 'Pagamento bollo auto', 'Uscita', NULL, 'Ufficio Motorizzazione', '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(79818243805, 70.60, '2024-03-10', '14:00:45', 'Acquisto vestiti', 'Uscita', NULL, 'Negozio di abbigliamento online', '1212121212121212', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(99110212225, 40.30, '2024-03-09', '17:45:30', 'Ricarica cellulare', 'Uscita', NULL, 'Operatore Telefonico ', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(30313233345, 85.75, '2024-03-08', '11:20:10', 'Pagamento tasse', 'Uscita', NULL, 'Agenzia delle Entrate', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(48121620241, 90.00, '2024-03-14', '12:15:30', 'Rimborso assicurazione', 'Entrata', 'Assicurazione Generali', NULL, '5555666677778888', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(48132819381, 45.00, '2024-01-15', '13:20:30', 'Stipendio', 'Entrata', 'Agenzia', NULL, '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(27121273241, 600.00, '2024-06-30', '10:15:30', 'Pensione', 'Entrata', 'INPS', NULL, '5555666677778888', NULL);
INSERT INTO smu.Transazione(cro, importo, data, ora, causale, tipo, mittente, destinatario, numerocarta, nomecategoria) VALUES(12345678910, 20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Entrata', 'Ecommerce', 'E-commerce', '1234567890123456', NULL);

-- Associazioni
INSERT INTO smu.Associazione(IdPortafoglio, NumeroCarta)VALUES (1, '5355284927482884');
INSERT INTO smu.Associazione(IdPortafoglio, NumeroCarta)VALUES (2, '5337589274884783');
INSERT INTO smu.Associazione(IdPortafoglio, NumeroCarta)VALUES (3, '1234567890123456');
INSERT INTO smu.Associazione(IdPortafoglio, NumeroCarta)VALUES (3, '5355284927482884');


--Programmazione
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(1, 'Paghetta Armando', '15 giorni mese', '2024-03-21 15:30:00', '2028-07-30', 20.00, 'Armando figlio', '5355284927482884');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(2, 'Affitto Mensile', '1 mese', '2024-04-05 12:00:00', '2025-04-05', 800.00, 'Proprietario', '5555666677778888');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(3, 'Abbonamento Palestra', '12 mesi', '2024-03-28 18:00:00', '2025-03-28', 40.00, 'Palestra XYZ', '9876543210987654');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(4, 'Fornitura Gas', '3 mesi', '2024-04-15 10:00:00', '2025-04-15', 120.00, 'GasCo', '1515151665151515');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(5, 'Pagamento Bolletta Elettrica', '6 mesi', '2024-04-02 08:00:00', '2024-12-02', 70.00, 'Fornitore Elettrico', '6666999988887777');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(6, 'Rata Mutuo', '1 mese', '2024-04-10 14:30:00', '2024-12-10', 1000.00, 'Banca XYZ', '1234567890123456');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(7, 'Assicurazione Auto Annuale', '12 mesi', '2024-03-31 09:00:00', '2025-03-31', 600.00, 'Assicurazioni S.p.A.', '1234567890123456');
INSERT INTO  smu.SpeseProgrammate(IdSpesa, Descrizione, Periodicita, DataScadenza, DataFineProgrammazione, Importo, Destinatario, NumeroCarta) VALUES(8, 'Pagamento Affitto Garage', '6 mesi', '2024-04-20 11:00:00', '2024-10-20', 150.00, 'Proprietario Garage', '1414141414141414');


