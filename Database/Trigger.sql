-- Trigger che aggiorna il valore del saldo e del conto a seguito di una determinata transazione.

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


CREATE OR REPLACE TRIGGER modificaImportoTransazione
    AFTER INSERT
    ON smu.Transazione
    FOR EACH ROW
EXECUTE FUNCTION smu.triggerTransazione();


-- Trigger che aggiunge la categoria ad una transazione in base alla presenza di determinate parole chiave.

CREATE OR REPLACE FUNCTION smu.triggerCategoria() RETURNS TRIGGER AS
$$
DECLARE
    parola  smu.Categoria.ParolaChiave%TYPE;
    trovato INTEGER := 0;
BEGIN

    FOR parola IN (SELECT C.ParolaChiave FROM smu.Categoria AS C)
        LOOP
                IF LOWER(NEW.Mittente) LIKE '%' || LOWER(parola) || '%' OR LOWER(NEW.Destinatario) LIKE '%' || LOWER(parola) || '%'
                    OR LOWER(NEW.Causale) LIKE '%' || LOWER(parola) || '%' OR LOWER(NEW.Causale) LIKE '%' || LOWER(parola) || '%' THEN
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

CREATE OR REPLACE TRIGGER modificaCategoriaTransazione
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerCategoria();
