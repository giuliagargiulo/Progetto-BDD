
-- Trigger che imposta l'importo delle transazioni in uscita a negativo.

CREATE OR REPLACE FUNCTION smu.triggerTransazione() RETURNS TRIGGER AS
$$
    BEGIN
        IF NEW.Tipo = 'Uscita' THEN
            UPDATE smu.Transazione
            SET Importo = -(NEW.Importo)
            WHERE CRO = NEW.CRO;
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER modificaImportoTransazione
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerTransazione();



-- Trigger che aggiorna il saldo della carta e del conto dopo una transasione in entrata o uscita.

CREATE OR REPLACE FUNCTION smu.triggerSaldo() RETURNS TRIGGER AS
$$
    BEGIN
        IF NEW.Tipo = 'Uscita' THEN
            UPDATE smu.Carta
            SET Saldo = Saldo - NEW.Importo
            WHERE NumeroCarta = NEW.NumeroCarta;

            UPDATE smu.Conto
            SET Saldo = Saldo - NEW.Importo
            WHERE NumeroConto = (
                SELECT C.NumeroConto
                FROM (smu.Transazione AS T JOIN smu.Carta AS CA ON CA.NumeroCarta = T.NumeroCarta) JOIN smu.Conto AS C ON C.NumeroConto = CA.NumeroConto
                WHERE CA.NumeroCarta = NEW.NumeroCarta
                );
        ELSE
            UPDATE smu.Carta
                SET Saldo = Saldo + NEW.Importo
                WHERE NumeroCarta = NEW.NumeroCarta;

            UPDATE smu.Conto
            SET Saldo = Saldo + NEW.Importo
            WHERE NumeroConto = (
                SELECT C.NumeroConto
                FROM (smu.Transazione AS T JOIN smu.Carta AS CA ON CA.NumeroCarta = T.NumeroCarta) JOIN smu.Conto AS C ON C.NumeroConto = CA.NumeroConto
                WHERE CA.NumeroCarta = NEW.NumeroCarta
                );
        END IF;

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER modificaSaldo
    AFTER INSERT ON smu.Transazione
    FOR EACH ROW EXECUTE FUNCTION smu.triggerSaldo();
