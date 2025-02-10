CREATE or replace TABLE t_petr_hlisnikovsky_project_sql_primary_final AS
SELECT	
    'mzdy' AS typ_dat,
    CASE
        WHEN cpib.name IS NULL THEN 'Republikový průměr'
        ELSE cpib.name
    END AS odvetvi,	
    ROUND(AVG(cp.value), 2) AS prumerna_rocni_mzda,
    cpu.name AS jednotka_mzdy,
    cpvt.name AS typ_mzdy,
    cp.payroll_year AS rok_mzdy,
    NULL AS nazev_potraviny,
    NULL AS prumerna_cena,
    NULL AS mnozstvi,
    NULL AS jednotka_potraviny,
    NULL AS rok_potraviny
FROM 
    czechia_payroll AS cp
LEFT JOIN 
    czechia_payroll_industry_branch AS cpib	ON cp.industry_branch_code = cpib.code 
LEFT JOIN
    czechia_payroll_unit AS cpu ON cp.unit_code = cpu.code
LEFT JOIN
    czechia_payroll_value_type AS cpvt ON cp.value_type_code = cpvt.code
WHERE 
    cp.value_type_code = 5958
    AND cp.calculation_code = 200
GROUP BY 
    cpib.name, 
    cp.payroll_year
UNION ALL
SELECT 
    'potraviny' AS typ_dat,
    NULL AS odvetvi,
    NULL AS prumerna_rocni_mzda,
    NULL AS jednotka_mzdy,
    NULL AS typ_mzdy,
    NULL AS rok_mzdy,
    cpc.name AS nazev_potraviny,
    ROUND(AVG(cppr.value), 2) AS prumerna_cena,
    cpc.price_value AS mnozstvi,
    cpc.price_unit AS jednotka_potraviny,
    YEAR(cppr.date_to) AS rok_potraviny
FROM 
    czechia_price AS cppr 
LEFT JOIN 
    czechia_price_category AS cpc ON cppr.category_code = cpc.code
LEFT JOIN 
    czechia_region AS cr ON cppr.region_code = cr.code
WHERE 
    region_code IS NULL -- Průměr ČR
GROUP BY
    cpc.name,	
    YEAR(cppr.date_to)
