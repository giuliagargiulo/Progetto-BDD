-- Calcolare il saldo dei portafogli

SELECT A.IdPortafoglio, SUM(T.Importo) AS SaldoPortafoglio
FROM smu.Associazione AS A JOIN smu.Transazione AS T
    ON A.NumeroCarta = T.NumeroCarta
GROUP BY (A.idPortafoglio);

-----------------------------------------------------------------------------------------------------------------------
--Mi ritorna tutte le spese programmate da fare oggi

INSERT INTO smu.Transazione VALUES(14728139341, Importo, CURRENT_DATE, CURRENT_TIME, Descrizione, 'Uscita', NULL, Destinatario, NumeroCarta, NULL)
SELECT S.Importo, S.Descrizione, S.Destinatario, S.NumeroCarta
    FROM smu.SpeseProgrammate AS S
    WHERE S.DataScadenza = CURRENT_DATE;





