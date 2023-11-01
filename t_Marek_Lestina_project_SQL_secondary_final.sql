/*
 * SECONDARY TABULKA projekt -- dodatečná data o dalších evropských státech
 * */
CREATE TABLE IF NOT EXISTS t_Marek_Lestina_project_SQL_secondary_final
SELECT
c.country,
c.population,
e.`year`,
e.GDP ,
e.gini 
FROM countries c
JOIN economies e
ON e.country = c.country 
WHERE 
c.continent = 'Europe'
AND  e.`year` BETWEEN 2006 and 2018
ORDER BY e.`year` ASC; 
