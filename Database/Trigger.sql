-- 1. Trigger che imposta a negativo il valore di una transazione in uscita ed aggiorna il valore del saldo della carta e del conto a seguito di una transazione.

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
-- 2. Trigger che aggiunge una transazione ad una categoria in base alle parole chiave, dopo l'inserimento di una nuova transazione.
--Questa funzione cerca di categorizzare automaticamente la nuova transazione basandosi sulle parole chiave definite nella tabella smu.Categoria.
-- Se non viene trovata alcuna corrispondenza, la transazione viene assegnata alla categoria "Altro".

CREATE OR REPLACE FUNCTION smu.triggerCategorizzaTransazione() RETURNS TRIGGER AS
$$
DECLARE
    nome_categoria smu.Categoria.NomeCategoria%TYPE;    --variabile per iterare sul nome categoria
    ArrayParoleChiavi TEXT[];            -- Array di testo per memorizzare le parole chiave di una categoria
    parola TEXT;                    -- Variabile per memorizzare temporaneamente ogni parola chiave
    matched BOOLEAN := FALSE;       -- Variabile booleana per indicare se è stata trovata una corrispondenza, inizializzata a false
BEGIN

    FOR nome_categoria IN
        SELECT NomeCategoria
        FROM smu.Categoria
    LOOP
        --la funzione string_to_array mi crea una stringa di valori a partire da una stringa di parole separate da virgole
        --successivamente memorizzo tale array in ArrayParoleChiavi
        SELECT string_to_array(ParoleChiavi, ',') INTO ArrayParoleChiavi
            FROM smu.Categoria
            WHERE NomeCategoria = nome_categoria;

        --memorizzo nella variabile parola l'elemento dell'array ParoleChiave
        FOREACH parola IN ARRAY ArrayParoleChiavi
        LOOP
            -- Verifica se la causale contiene la parola chiave
            IF NEW.Causale ILIKE '%' || parola || '%' THEN
                NEW.NomeCategoria := nome_categoria;
                matched := TRUE;
                EXIT;  -- Esce dal loop delle parole chiave una volta trovata una corrispondenza
            END IF;
        END LOOP;

        -- Se è stata trovata una corrispondenza interrompe il ciclo delle categorie
        IF matched THEN
            EXIT;
        END IF;

    END LOOP;

    -- Se nessuna categoria è stata trovata, assegno la transazione alla categoria "Altro"
    IF NOT matched THEN
       NEW.NomeCategoria := 'Altro';
    END IF;

    --aggiorno il nomecategoria della transazione
    UPDATE smu.Transazione
    SET NomeCategoria = NEW.NomeCategoria
    WHERE IdTransazione = NEW.IdTransazione;

    RETURN NEW;  -- Restituisce la nuova riga con il campo NomeCategoria aggiornato
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER InserisciCategoriaInTransazione
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerCategorizzaTransazione();


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
$$ LANGUAGE plpgsql;

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
