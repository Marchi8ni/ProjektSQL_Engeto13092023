-- Tvorba tabulky
-- part ONE - PAYROLL

CREATE TABLE IF NOT EXISTS t_marek_lestina_primary_part1 AS
SELECT
cp.payroll_year,
round(avg(cp.value)) AS avg_wages,
cpib.name AS industry_name, 
cp.industry_branch_code
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cpib.code = cp.industry_branch_code 
WHERE cp.value IS NOT NULL
AND cp.value_type_code = 5958
AND cp.industry_branch_code IS NOT NULL 
GROUP BY cp.industry_branch_code, cp.payroll_year
ORDER BY cp.payroll_year ASC; 

-- Part 2 - PRICE
CREATE TABLE IF NOT EXISTS t_marek_lestina_primary_part2 AS
SELECT
ROUND(AVG(cp.value)) AS food_price,
cp.category_code AS Food_category,
YEAR(cp.date_from) AS price_year,
cpc.name AS food_name,
cpc.price_value,
cpc.price_unit 
FROM czechia_price cp
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = cp.category_code 
GROUP BY cp.category_code, price_year  
ORDER BY cp.date_from ASC;


-- tabulka PRIMARY
CREATE TABLE IF NOT EXISTS t_Marek_Lestina_project_SQL_primary_final
SELECT *
FROM t_marek_lestina_primary_part1 tmlpp
JOIN t_marek_lestina_primary_part2 tmlpp2 
	ON tmlpp2.price_year = tmlpp.payroll_year; 
