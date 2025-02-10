CREATE TABLE t_petr_hlisnikovsky_project_sql_secondary_final AS
SELECT
    e.country AS nazev_statu,
    ROUND((e.GDP), 0) AS HDP,
    e.YEAR AS rok
FROM 
    economies AS e 
LEFT JOIN 
    countries AS c ON e.country = c.country
WHERE 
    c.continent = 'Europe'
    AND e.GDP IS NOT NULL;