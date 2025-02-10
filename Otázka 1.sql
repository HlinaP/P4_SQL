# Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

-- Vývoj mezd ve sledovaném časovém období za jednotlivá průmyslová odvětví

SELECT
    odvetvi,
    rok_mzdy AS rok,
    prumerna_rocni_mzda AS prumerna_mzda,
    prumerna_rocni_mzda - LAG(prumerna_rocni_mzda) OVER (PARTITION BY odvetvi ORDER BY rok_mzdy) AS mezirocni_zmena
FROM 
    t_petr_hlisnikovsky_project_sql_primary_final
WHERE 
    odvetvi IS NOT NULL
ORDER BY 
    odvetvi, 
    rok;


-- Roky kdy došlo k meziročnímu poklesu mezd v jednotlivých průmyslových odvětích 

WITH mzdy AS (
    SELECT
        odvetvi,
        rok_mzdy AS rok,
        prumerna_rocni_mzda AS prumerna_mzda,
        prumerna_rocni_mzda - LAG(prumerna_rocni_mzda) OVER (PARTITION BY odvetvi ORDER BY rok_mzdy) AS mezirocni_zmena
    FROM 
        t_petr_hlisnikovsky_project_sql_primary_final
)
SELECT 
    * 
FROM 
    mzdy
WHERE 
    mezirocni_zmena < 0
ORDER BY 
    odvetvi, 
    rok;
