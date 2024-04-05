
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
INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Viaggi', 2500.00);
INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Spese Mensili', 3200.00);

--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Casa', 54323.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Auto', 2350.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Stipendio', 897.50);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Emergenze', 1500.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Investimenti', 10000.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Fondo Pensione', 80000.00);

--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Regali', 450.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Abbigliamento', 750.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Risparmi', 15000.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Hobby', 300.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Alimentari', 400.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Assicurazione', 1200.00);
--INSERT INTO smu.Portafoglio(NomePortafoglio, Saldo) VALUES('Casa Vacanze', 54323.00);

-- Categorie
INSERT INTO smu.Categoria(nome) VALUES( 'Cibo');
INSERT INTO smu.Categoria(nome) VALUES('Rimborsi');
INSERT INTO smu.Categoria(nome) VALUES('Casa');
INSERT INTO smu.Categoria(nome) VALUES('Auto');
INSERT INTO smu.Categoria(nome) VALUES('Acquisti');

INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES('Supermercato', 1);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES('Ristorante', 1);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES('Rimborso', 2);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES('Affitto',3);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES( 'Bollette', 3);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES( 'Carburante', 4);
INSERT INTO smu.ParoleChiave(Parolachiave, IdCategoria)VALUES( 'Acquisto online', 5);


-- Associazioni
INSERT INTO smu.AssociazioneCartaPortafoglio(IdPortafoglio, NumeroCarta)VALUES (1, '5355284927482884');
INSERT INTO smu.AssociazioneCartaPortafoglio(IdPortafoglio, NumeroCarta)VALUES (2, '5337589274884783');
--INSERT INTO smu.AssociazioneCartaPortafoglio(IdPortafoglio, NumeroCarta)VALUES (3, '1234567890123456');
--INSERT INTO smu.AssociazioneCartaPortafoglio(IdPortafoglio, NumeroCarta)VALUES (3, '5355284927482884');


--Programmazione
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Paghetta Armando', '15 giorni', '2024-03-27', '2024-03-27', 20.00, 'Armando figlio', '5355284927482884');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Affitto Mensile', '1 mese', '2024-04-05', '2025-04-05', 800.00, 'Proprietario', '5555666677778888');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Abbonamento Palestra', '1 anno', '2024-03-27', '2025-03-28', 40.00, 'Palestra XYZ', '9876543210987654');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Fornitura Gas', '3 mesi', '2024-04-15', '2025-04-15', 120.00, 'GasCo', '1515151665151515');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Pagamento Bolletta Elettrica', '6 mesi', '2024-04-02', '2024-12-02', 70.00, 'Fornitore Elettrico', '6666999988887777');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Rata Mutuo', '1 mese', '2024-04-10', '2024-12-10', 1000.00, 'Banca XYZ', '1234567890123456');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Assicurazione Auto Annuale', '1 anno', '2024-03-31', '2025-03-31', 600.00, 'Assicurazioni S.p.A.', '1234567890123456');
INSERT INTO  smu.SpeseProgrammate(Descrizione, Periodicita, DataScadenza, DataFineRinnovo, Importo, Destinatario, NumeroCarta) VALUES('Pagamento Affitto Garage', '6 mesi', '2024-04-20', '2024-10-20', 150.00, 'Proprietario Garage', '1414141414141414');


--Associazione Categorie e Portafoglio
INSERT INTO smu.CategorieInPortafogli(IdCategoria, IdPortafoglio) VALUES(1,1);
INSERT INTO smu.CategorieInPortafogli(IdCategoria, IdPortafoglio) VALUES(5,1);
INSERT INTO smu.CategorieInPortafogli(IdCategoria, IdPortafoglio) VALUES(2,2);
INSERT INTO smu.CategorieInPortafogli(IdCategoria, IdPortafoglio) VALUES(3,2);
INSERT INTO smu.CategorieInPortafogli(IdCategoria, IdPortafoglio) VALUES(4,2);

-- Transazioni
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(50.00, '2023-03-21', '13:21:30', 'Rimborso', 'Entrata', 'Rimborso Amazon', NULL, '5355284927482884');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(35.40, '2024-01-01', '15:25:36', 'Pagamento supermercato', 'Uscita', NULL,'Supermercato Deco', '5337589274884783');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Uscita', NULL, 'E-commerce', '1234567890123456');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(75.80, '2024-03-18', '17:30:45', 'Pagamento bollette', 'Uscita', NULL, 'Fornitore energia', '5355284927482884');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(42.30, '2024-03-17', '11:10:55', 'Pagamento affitto', 'Uscita', NULL, 'Proprietario immobile', '1234567890123456');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(65.25, '2024-03-16', '14:20:10', 'Carburante', 'Uscita', NULL, 'Stazione di servizio ESSO', '5337589274884783');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(30.50, '2024-03-15', '18:35:45', 'Ristorante', 'Uscita', NULL, 'Ristorante Buon Gusto', '9999000011112222');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(25.75, '2024-03-13', '09:55:20', 'Acquisto libri', 'Uscita', NULL, 'Libreria XYZ', '6666999988887777');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(55.20, '2024-03-12', '16:40:15', 'Pagamento bollo auto', 'Uscita', NULL, 'Ufficio Motorizzazione', '5355284927482884');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(70.60, '2024-03-10', '14:00:45', 'Acquisto vestiti', 'Uscita', NULL, 'Negozio di abbigliamento online', '1212121212121212');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(40.30, '2024-03-09', '17:45:30', 'Ricarica cellulare', 'Uscita', NULL, 'Operatore Telefonico ', '5337589274884783');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(85.75, '2024-03-08', '11:20:10', 'Pagamento tasse', 'Uscita', NULL, 'Agenzia delle Entrate', '5337589274884783');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(90.00, '2024-03-14', '12:15:30', 'Rimborso assicurazione', 'Entrata', 'Assicurazione Generali', NULL, '5555666677778888');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(45.00, '2024-01-15', '13:20:30', 'Stipendio', 'Entrata', 'Agenzia', NULL, '5355284927482884');
INSERT INTO smu.Transazione(Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta) VALUES(600.00, '2024-03-20', '10:15:30', 'Pensione', 'Entrata', 'INPS', NULL, '5555666677778888');
