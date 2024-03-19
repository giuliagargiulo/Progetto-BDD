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


-- Trigger che aggiorna la categoria di una transazione.

CREATE OR REPLACE FUNCTION smu.triggerCategoria() RETURNS TRIGGER AS
$$
DECLARE
    parola smu.Categoria.ParolaChiave%TYPE;
BEGIN

    FOR parola IN (SELECT C.ParolaChiave FROM smu.Categoria AS C)
        LOOP

            IF NEW.Mittente IS NOT NULL AND NEW.Mittente LIKE '%' || parola || '%' THEN
                UPDATE smu.Transazione
                SET NomeCategoria = (SELECT C.Nome
                                     FROM smu.Categoria AS C
                                     WHERE C.ParolaChiave = parola)
                WHERE CRO = NEW.CRO;

            ELSE
                IF NEW.Destinatario IS NOT NULL AND NEW.Destinatario LIKE '%' || parola || '%' THEN
                    UPDATE smu.Transazione
                    SET NomeCategoria = (SELECT C.Nome
                                         FROM smu.Categoria AS C
                                         WHERE C.ParolaChiave = parola)
                    WHERE CRO = NEW.CRO;
                    
                END IF;
            END IF;

        END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER modificaCategoriaTransazione
    AFTER INSERT
    ON smu.Transazione
    FOR EACH ROW
EXECUTE FUNCTION smu.triggerCategoria();



CREATE OR REPLACE FUNCTION smu.triggerCategoria2() RETURNS TRIGGER AS
$$
BEGIN
    UPDATE smu.Transazione
    SET NomeCategoria = 'Altro'
    WHERE CRO = NEW.CRO;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER categoriaAltro
    AFTER UPDATE
    ON smu.Transazione
    FOR EACH ROW
    WHEN (NEW.NomeCategoria IS NULL)
EXECUTE FUNCTION smu.triggerCategoria2();