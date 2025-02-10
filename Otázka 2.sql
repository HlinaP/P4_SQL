# Otázka č. 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT
    php.rok_mzdy AS rok,
    php.prumerna_rocni_mzda AS prumerna_mzda,
    php2.nazev_potraviny AS potravina,
    php2.prumerna_cena,
    ROUND((php.prumerna_rocni_mzda / php2.prumerna_cena), 2) AS kupni_sila,
    php2.jednotka_potraviny AS jednotka
FROM 
    t_petr_hlisnikovsky_project_sql_primary_final AS php
JOIN
    t_petr_hlisnikovsky_project_sql_primary_final AS php2 
    ON php.rok_mzdy = php2.rok_potraviny
WHERE 
    php.odvetvi = 'Republikový průměr'
    AND (
        php.rok_mzdy = (SELECT MIN(rok_potraviny) FROM t_petr_hlisnikovsky_project_sql_primary_final)
        OR 
        php.rok_mzdy = (SELECT MAX(rok_potraviny) FROM t_petr_hlisnikovsky_project_sql_primary_final)
    )
    AND php2.nazev_potraviny IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
ORDER BY 
    php2.nazev_potraviny,
    php.rok_mzdy;
