# Otázka č. 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH mezirocni_zmena AS (
    SELECT
        nazev_potraviny,
        ROUND(
            (prumerna_cena - LAG(prumerna_cena) OVER (PARTITION BY nazev_potraviny ORDER BY rok_potraviny)) / 
            LAG(prumerna_cena) OVER (PARTITION BY nazev_potraviny ORDER BY rok_potraviny) * 100, 2
        ) AS mezirocni_zmena
    FROM 
        t_petr_hlisnikovsky_project_sql_primary_final
    WHERE 
        typ_dat = 'potraviny'
)
SELECT
    nazev_potraviny,
    ROUND(AVG(mezirocni_zmena), 2) AS prumerna_zmena
FROM 
    mezirocni_zmena
GROUP BY 
    nazev_potraviny
ORDER BY 
    prumerna_zmena;

