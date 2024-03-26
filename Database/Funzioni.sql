
CREATE OR REPLACE PROCEDURE smu.SpesaProgrammata() AS
$$
    DECLARE
    destinatarioS smu.speseprogrammate.destinatario%TYPE;
    descrizioneS smu.speseprogrammate.descrizione%TYPE;
    numerocartaS smu.speseprogrammate.numerocarta%TYPE;
    intervalloS smu.TipoPeriodico;
    importoS FLOAT := 0;
    cursore REFCURSOR;

    BEGIN

        OPEN cursore FOR (SELECT S.Importo, S.Descrizione, s.Destinatario, S.NumeroCarta, S.Periodicita
                          FROM smu.SpeseProgrammate AS S
                          WHERE S.DataScadenza = CURRENT_DATE);

        FETCH cursore INTO importoS, descrizioneS, destinatarioS, numerocartaS, intervalloS;
        LOOP
            -- Inserimento della transazione
            INSERT INTO smu.Transazione(importo, data, ora, causale, tipo, mittente, destinatario, numerocarta,
                                        nomecategoria)
            VALUES (importoS, CURRENT_DATE, CURRENT_TIME, descrizioneS, 'Uscita', NULL, destinatarioS, numerocartaS, NULL);

            --Aggiornamento della data di scadenza del prossimo pagamento programmato
            UPDATE smu.SpeseProgrammate
            SET DataScadenza = DataScadenza + CASE
                                                  WHEN intervalloS = '7 giorni' THEN INTERVAL '7 days'
                                                  WHEN intervalloS = '15 giorni' THEN INTERVAL '15 days'
                                                  WHEN intervalloS = '1 mese' THEN INTERVAL '1 month'
                                                  WHEN intervalloS = '3 mesi' THEN INTERVAL '3 months'
                                                  WHEN intervalloS = '6 mesi' THEN INTERVAL '6 months'
                                                  WHEN intervalloS = '1 anno' THEN INTERVAL '1 year'
                                                  ELSE INTERVAL '1 day' -- In caso di intervallo non valido, aggiungo un giorno
                END;
            EXIT WHEN NOT FOUND;
        END LOOP;
        CLOSE cursore;
    END;
$$ LANGUAGE plpgsql;


CALL smu.SpesaProgrammata();