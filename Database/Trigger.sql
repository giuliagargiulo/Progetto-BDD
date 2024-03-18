
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
        SET Saldo = Saldo + (
            SELECT T.Importo
                FROM smu.Transazione AS T
                WHERE T.CRO = NEW.CRO
            )
        WHERE NumeroCarta = NEW.NumeroCarta;


        --aggiorna il saldo del conto.
        UPDATE smu.ContoCorrente
        SET Saldo = Saldo + (
             SELECT T.Importo
                FROM smu.Transazione AS T
                WHERE  T.CRO = NEW.CRO
             )
        WHERE NumeroConto = (
             SELECT Ca.NumeroConto
                 FROM smu.Carta AS Ca
                 WHERE Ca.NumeroCarta = NEW.NumeroCarta
            );

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER modificaImportoTransazione
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerTransazione();

