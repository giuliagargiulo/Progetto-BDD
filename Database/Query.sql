-- Calcolare il saldo dei portafogli

SELECT A.IdPortafoglio, SUM(T.Importo) AS SaldoPortafoglio
FROM smu.Associazione AS A JOIN smu.Transazione AS T
    ON A.NumeroCarta = T.NumeroCarta
GROUP BY (A.idPortafoglio)

