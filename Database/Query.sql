-- Calcolare il saldo dei portafogli

SELECT A.IdPortafoglio, SUM(T.Importo) AS SaldoPortafoglio
FROM a.Associazione AS A JOIN a.Transazione AS T
    ON A.NumeroCarta = T.NumeroCarta
GROUP BY (A.idPortafoglio)

