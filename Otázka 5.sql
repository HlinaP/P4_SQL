WITH mzdy AS (
    SELECT
        rok_mzdy AS rok,
        prumerna_rocni_mzda AS prumerna_mzda,
        ROUND((prumerna_rocni_mzda - LAG(prumerna_rocni_mzda) OVER (ORDER BY rok_mzdy)) / 
            LAG(prumerna_rocni_mzda) OVER (ORDER BY rok_mzdy) * 100, 2) AS vyvoj_mezd
    FROM 
        t_petr_hlisnikovsky_project_sql_primary_final
    WHERE 
        typ_dat = 'mzdy'
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
        ROUND((prumerna_cena - LAG(prumerna_cena) OVER (ORDER BY rok)) / 
            LAG(prumerna_cena) OVER (ORDER BY rok) * 100, 2) AS vyvoj_cen_potravin
    FROM 
        prumerne_ceny
),
vyvoj_hdp AS (
    SELECT
        nazev_statu,
        rok,
        hdp,
        ROUND((hdp - LAG(hdp) OVER (PARTITION BY nazev_statu ORDER BY rok)) /
            LAG(hdp) OVER (ORDER BY rok) * 100, 2) AS vyvoj_hdp
    FROM 
        t_petr_hlisnikovsky_project_sql_secondary_final
    WHERE 
        nazev_statu = 'Czech republic'
)
SELECT
    m.rok,
    hdp.vyvoj_hdp,
    m.vyvoj_mezd,
    vcp.vyvoj_cen_potravin
FROM 
    mzdy AS m
JOIN 
    vyvoj_cen_potravin AS vcp ON m.rok = vcp.rok
JOIN 
    vyvoj_hdp AS hdp ON m.rok = hdp.rok
WHERE 
    vyvoj_cen_potravin IS NOT NULL
ORDER BY 
    m.rok;
	
	
	
	