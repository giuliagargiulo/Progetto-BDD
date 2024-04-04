
CREATE OR REPLACE PROCEDURE smu.SpesaProgrammata() AS
$$
    DECLARE
    destinatarioS smu.speseprogrammate.destinatario%TYPE;
    descrizioneS smu.speseprogrammate.descrizione%TYPE;
    numerocartaS smu.speseprogrammate.numerocarta%TYPE;
    intervalloS smu.TipoPeriodico;
    IdSpesaS smu.speseprogrammate.idspesa%TYPE;
    FineRinnovo smu.SpeseProgrammate.DataFineRinnovo%TYPE;
    importoS FLOAT := 0;
    cursore REFCURSOR;

    BEGIN

        OPEN cursore FOR (SELECT S.Importo, S.Descrizione, s.Destinatario, S.NumeroCarta, S.Periodicita, S.IdSpesa, S.DataFineRinnovo
                          FROM smu.SpeseProgrammate AS S
                          WHERE S.DataScadenza = CURRENT_DATE);

        LOOP
            FETCH cursore INTO importoS, descrizioneS, destinatarioS, numerocartaS, intervalloS, IdSpesaS, FineRinnovo;
            EXIT WHEN NOT FOUND;

            -- Inserimento della transazione
            INSERT INTO smu.Transazione(importo, data, ora, causale, tipo, mittente, destinatario, numerocarta,
                                        nomecategoria)
            VALUES (importoS, CURRENT_DATE, CURRENT_TIME, descrizioneS, 'Uscita', NULL, destinatarioS, numerocartaS, NULL);


            -- Se la data di fine rinnovo è uguale alla CURRENT_DATE, allora elimino la spesa programmata.
            IF FineRinnovo = CURRENT_DATE THEN
                DELETE FROM smu.SpeseProgrammate
                WHERE IdSpesa = IdSpesaS;
            END IF;


            --Aggiornamento della data di scadenza del prossimo pagamento programmato
            UPDATE smu.SpeseProgrammate
            SET DataScadenza = DataScadenza + (CASE
                                                  WHEN intervalloS = '7 giorni' THEN INTERVAL '7 days'
                                                  WHEN intervalloS = '15 giorni' THEN INTERVAL '15 days'
                                                  WHEN intervalloS = '1 mese' THEN INTERVAL '1 month'
                                                  WHEN intervalloS = '3 mesi' THEN INTERVAL '3 months'
                                                  WHEN intervalloS = '6 mesi' THEN INTERVAL '6 months'
                                                  WHEN intervalloS = '1 anno' THEN INTERVAL '1 year'
            END)
            WHERE IdSpesa = IdSpesaS;

        END LOOP;
        CLOSE cursore;
    END;
$$ LANGUAGE plpgsql;

CALL smu.SpesaProgrammata();
