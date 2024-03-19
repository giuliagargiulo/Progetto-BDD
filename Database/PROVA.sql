INSERT INTO smu.ContoCorrente(numeroconto,saldo) VALUES(1, 10000);

--Carte
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5355284927482884', 'Poste Pay Evolution', 100, '01-12-2025', 13.00, 'Credito', 14000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5337589274884783', 'Carta di Giulia', 345, '01-08-2024', 500.00, 'Credito', 1000.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('1234567890123456', 'Visa', 789, '01-05-2023', 200.00, 'Credito', 500.00, 1);
INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('9999000011112222', 'Mastercard', 222, '01-11-2026', 1000.00, 'Credito', 2000.00, 1);


INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Supermercato');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES( 'Cibo', 'Ristorante');
INSERT INTO smu.Categoria(nome, parolachiave) VALUES('Rimborsi', 'Rimborso');


-- Transazioni
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(14728139340,50,'2023-03-21', '13:21:30', 'Rimborso', 'Entrata', 'Rimborso Amazon', NULL, '5355284927482884', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(15738299391,35.40,'2024-01-01', '15:25:36', 'Pagamento supermercato', 'Uscita', NULL,'Supermercato Deco', '5337589274884783', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(12345678910, 20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Uscita', NULL, 'E-commerce', '1234567890123456', NULL);
INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria) VALUES(36912151821, 30.50, '2024-03-15', '18:35:45', 'Ristorante', 'Uscita', NULL, 'Ristorante Buon Gusto', '9999000011112222', NULL);
