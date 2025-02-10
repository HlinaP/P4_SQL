WITH mzdy AS (
    SELECT
        rok_mzdy AS rok,
        prumerna_rocni_mzda AS prumerna_mzda,
        ROUND(
            (prumerna_rocni_mzda - LAG(prumerna_rocni_mzda) OVER (ORDER BY rok_mzdy)) / 
            LAG(prumerna_rocni_mzda) OVER (ORDER BY rok_mzdy) * 100, 2
        ) AS vyvoj_mezd
    FROM 
        t_petr_hlisnikovsky_project_sql_primary_final
    WHERE typ_dat = 'mzdy'
        AND odvetvi = 'Republikový průměr'
),
prumerne_ceny AS (
    SELECT
        rok_potraviny AS rok,
        ROUND(AVG(prumerna_cena), 2) AS prumerna_cena
    FROM 
        t_petr_hlisnikovsky_project_sql_primary_final
    WHERE 
        typ_dat = 'potraviny'
    GROUP BY 
        rok_potraviny
),
vyvoj_cen_potravin AS (
    SELECT
        rok,
        prumerna_cena,
        ROUND(
            (prumerna_cena - LAG(prumerna_cena) OVER (ORDER BY rok)) / 
            LAG(prumerna_cena) OVER (ORDER BY rok) * 100, 2
        ) AS vyvoj_cen_potravin
    FROM 
        prumerne_ceny
)
SELECT
    m.rok,
    m.prumerna_mzda,
    m.vyvoj_mezd,
    vcp.prumerna_cena,
    vcp.vyvoj_cen_potravin,
    ROUND((vcp.vyvoj_cen_potravin - m.vyvoj_mezd), 2) AS rozdil_vyvoje,
    CASE
        WHEN (vcp.vyvoj_cen_potravin - m.vyvoj_mezd) > 10 THEN 'ANO'
        ELSE 'NE'
    END AS vyznamny_rozdil	
FROM 
    vyvoj_cen_potravin AS vcp
LEFT JOIN 
    mzdy AS m ON vcp.rok = m.rok
WHERE 
    vcp.vyvoj_cen_potravin IS NOT NULL
ORDER BY 
    vcp.rok;

		