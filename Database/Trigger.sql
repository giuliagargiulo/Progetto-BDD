-- 1. Trigger che aggiorna il valore del saldo e del conto a seguito di una determinata transazione.

CREATE OR REPLACE FUNCTION smu.triggerTransazione() RETURNS TRIGGER AS
$$
BEGIN
    -- imposta l'importo delle transazioni in uscita a negativo.
    IF NEW.Tipo = 'Uscita' THEN
        UPDATE smu.Transazione
        SET Importo = -(NEW.Importo)
        WHERE IdTransazione = NEW.IdTransazione;
    END IF;

    --aggiorna il saldo della carta.
    UPDATE smu.Carta
    SET Saldo = Saldo + (SELECT T.Importo
                         FROM smu.Transazione AS T
                         WHERE T.IdTransazione = NEW.IdTransazione)
    WHERE NumeroCarta = NEW.NumeroCarta;


    --aggiorna il saldo del conto.
    UPDATE smu.ContoCorrente
    SET Saldo = Saldo + (SELECT T.Importo
                         FROM smu.Transazione AS T
                         WHERE T.IdTransazione = NEW.IdTransazione)
    WHERE NumeroConto = (SELECT Ca.NumeroConto
                         FROM smu.Carta AS Ca
                         WHERE Ca.NumeroCarta = NEW.NumeroCarta);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER ModificaImporto
    AFTER INSERT
    ON smu.Transazione
    FOR EACH ROW
EXECUTE FUNCTION smu.triggerTransazione();


---------------------------------------------------------------------------------------------------------------
-- 2. Trigger che aggiunge una transazione ad un portafoglio in base alle parole chiave, dopo l'inserimento di una nuova transazione.


CREATE OR REPLACE FUNCTION smu.triggerPortafoglio() RETURNS TRIGGER AS
$$
DECLARE
    parola  smu.ParoleChiave.ParolaChiave%TYPE;
    trovato INTEGER := 0;
    NumPortafoglio smu.Portafoglio.IdPortafoglio%TYPE;
BEGIN

    FOR parola IN (SELECT PC.ParolaChiave FROM smu.ParoleChiave AS PC)
        LOOP

            IF LOWER(NEW.Mittente) LIKE '%' || LOWER(parola) || '%' OR
               LOWER(NEW.Destinatario) LIKE '%' || LOWER(parola) || '%'
                OR LOWER(NEW.Causale) LIKE '%' || LOWER(parola) || '%' THEN

                SELECT CP.IdPortafoglio
                INTO NumPortafoglio
                FROM smu.CategorieInPortafogli AS CP JOIN smu.ParoleChiave AS PC ON CP.IdCategoria = PC.IdCategoria
                WHERE PC.ParolaChiave = parola;

                INSERT INTO smu.TransazioniInPortafogli(IdTransazione, IdPortafoglio) VALUES(NEW.IDTransazione,NumPortafoglio);
                trovato = 1;
            END IF;
            EXIT WHEN trovato = 1;
        END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER InserisciTransazioneInPortafoglio
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerPortafoglio();


--------------------------------------------------------------------------------------------------------------
-- 3. Trigger che prima dell'inserimento di una transazione controlli che:
-- se è di tipo 'Uscita' allora Mittente è NULL, se è di tipo 'Entrata' allora Destinatario è NULL.

CREATE OR REPLACE FUNCTION smu.triggerTipoTransazione() RETURNS TRIGGER AS
    $$
    BEGIN
        IF NEW.Tipo = 'Uscita' AND NEW.Mittente IS NOT NULL THEN
            RAISE EXCEPTION 'ERRORE: Mittente non nullo in una transazione in uscita';
        END IF;

        IF NEW.Tipo = 'Entrata' AND NEW.Destinatario IS NOT NULL THEN
            RAISE EXCEPTION 'ERRORE: Destinatario non nullo in una transazione in entrata';
        END IF;

        RETURN NEW;

    END;
    $$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ControlloTipoTransazione
    BEFORE INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerTipoTransazione();

-- INSERT PER TESTARE IL TRIGGER 3
--INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria)VALUES( 12345678910, 20.00, '2024-03-19', '09:45:00', 'Acquisto online', 'Entrata', NULL, 'E-commerce', '1234567890123456', NULL);
--INSERT INTO smu.Transazione(CRO, Importo, Data, Ora, Causale, Tipo, Mittente, Destinatario, NumeroCarta, NomeCategoria)VALUES( 46173636910, 50.00, '2024-01-29', '13:35:00', 'Acquisto online', 'Uscita', 'Amazon', NULL, '1234567890123456', NULL);



------------------------------------------------------------------------------------------------------------------------
-- 4. Trigger che prima dell'inserimento di una carta controlli che:
-- se il tipo è 'Debito' allora plafond è NULL, se il tipo è 'Credito' allora Plafond è NOT NULL.

CREATE OR REPLACE FUNCTION smu.triggerTipoCarta() RETURNS TRIGGER AS
$$
    BEGIN
        IF NEW.TipoCarta = 'Debito' AND NEW.Plafond IS NOT NULL THEN
            RAISE EXCEPTION 'ERRORE: Plafond non nullo in una carta di debito';
        END IF;

        IF NEW.TipoCarta = 'Credito' AND NEW.Plafond IS NULL THEN
            RAISE EXCEPTION 'ERRORE: Plafond nullo in una carta di credito';
        END IF;

        RETURN NEW;

    END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ControlloTipoCarta
    BEFORE INSERT ON smu.Carta
    FOR EACH ROW EXECUTE FUNCTION smu.triggerTipoCarta();

-- INSERT PER TESTARE IL TRIGGER 4

--INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5355284922617884', 'Poste Pay Evolution', 100, '2025-12-31', 13.00, 'Credito', NULL, 1);
--INSERT INTO smu.CARTA(NumeroCarta, Nome, CVV, Scadenza, Saldo, TipoCarta, Plafond, NumeroConto) VALUES('5334628274884783', 'Carta prepagata', 345, '2024-08-31', 500.00, 'Debito', 1000.00, 1);


----------------------------------------------------------------------------------------------------------------------
--5. Trigger che mi genera automaticamente il valore del CRO

CREATE OR REPLACE FUNCTION smu.triggerGeneraCro() RETURNS TRIGGER AS $$
DECLARE
    randomCro TEXT;
BEGIN
    -- Genera una stringa di 11 cifre casuali
    randomCro := LPAD((random() * 99999999999)::BIGINT::TEXT, 11, '0');
    -- Assegna la stringa di cifre casuali all'attributo CRO della nuova riga
    NEW.CRO := randomCro;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER GeneraCro
    BEFORE INSERT
    ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerGeneraCro();


----------------------------------------------------------------------------------------------------------------------
-- 6 Trigger che controlla che le date inserite non siano successive alla data corrente

CREATE OR REPLACE FUNCTION smu.DataTransazione() RETURNS TRIGGER AS
    $$
    BEGIN
        IF NEW.Data > CURRENT_DATE THEN
         RAISE EXCEPTION 'ERRORE: La data inserita non è corretta';
        END IF;
      RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER ControlloData
    BEFORE INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.DataTransazione();


----------------------------------------------------------------------------------------------------------------------
