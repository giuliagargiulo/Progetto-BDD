-- 1. Trigger che aggiorna il valore del saldo e del conto a seguito di una determinata transazione.

CREATE OR REPLACE FUNCTION smu.triggerTransazione() RETURNS TRIGGER AS
$$
BEGIN
    -- imposta l'importo delle transazioni in uscita a negativo.
    IF NEW.Tipo = 'Uscita' THEN
        UPDATE smu.Transazione
        SET Importo = -(NEW.Importo)
        WHERE CRO = NEW.CRO;
    END IF;

    --aggiorna il saldo della carta.
    UPDATE smu.Carta
    SET Saldo = Saldo + (SELECT T.Importo
                         FROM smu.Transazione AS T
                         WHERE T.CRO = NEW.CRO)
    WHERE NumeroCarta = NEW.NumeroCarta;


    --aggiorna il saldo del conto.
    UPDATE smu.ContoCorrente
    SET Saldo = Saldo + (SELECT T.Importo
                         FROM smu.Transazione AS T
                         WHERE T.CRO = NEW.CRO)
    WHERE NumeroConto = (SELECT Ca.NumeroConto
                         FROM smu.Carta AS Ca
                         WHERE Ca.NumeroCarta = NEW.NumeroCarta);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER ModificaImportoTransazione
    AFTER INSERT
    ON smu.Transazione
    FOR EACH ROW
EXECUTE FUNCTION smu.triggerTransazione();


---------------------------------------------------------------------------------------------------------------
-- 2. Trigger che aggiunge la categoria ad una transazione in base alla presenza di determinate parole chiave.

CREATE OR REPLACE FUNCTION smu.triggerCategoria() RETURNS TRIGGER AS
$$
DECLARE
    parola  smu.Categoria.ParolaChiave%TYPE;
    trovato INTEGER := 0;
BEGIN

    FOR parola IN (SELECT C.ParolaChiave FROM smu.Categoria AS C)
        LOOP
            IF LOWER(NEW.Mittente) LIKE '%' || LOWER(parola) || '%' OR
               LOWER(NEW.Destinatario) LIKE '%' || LOWER(parola) || '%'
                OR LOWER(NEW.Causale) LIKE '%' || LOWER(parola) || '%' THEN
                trovato = 1;
                UPDATE smu.Transazione
                SET NomeCategoria = (SELECT C.Nome
                                     FROM smu.Categoria AS C
                                     WHERE C.ParolaChiave = parola)
                WHERE CRO = NEW.CRO;
            END IF;

            IF trovato = 0 THEN
                UPDATE smu.Transazione
                SET NomeCategoria = 'Altro'
                WHERE CRO = NEW.CRO;
            END IF;
            EXIT WHEN trovato = 1;
        END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ModificaCategoriaTransazione
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerCategoria();


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
--5. Trigger che gestisce le spese programmate
--la data di scadenza si intende il momento in cui deve essere effettuato il pagamento e per la prima volta dopo l'inserimento questo dato non deve essere uguale a NULL

CREATE OR REPLACE FUNCTION smu.SpesaProgrammata() RETURNS AS
$$
    BEGIN
        INSERT INTO smu.Transazione VALUES(14728139341, Importo, CURRENT_DATE, CURRENT_TIME, Descrizione, 'Uscita', NULL, Destinatario, NumeroCarta, NULL)
        SELECT S.Importo, S.Descrizione, s.Destinatario, S.NumeroCarta
        FROM smu.SpeseProgrammate AS S
        WHERE S.DataScadenza = CURRENT_DATE;
    END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER EsecuzioneSpesaProgrammata
    AFTER INSERT ON smu.SpeseProgrammate
    FOR EACH ROW EXECUTE FUNCTION smu.SpesaProgrammata();




