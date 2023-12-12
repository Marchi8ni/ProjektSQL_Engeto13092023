-- task no.2
SELECT
	payroll_year ,
	CASE 
		WHEN food_category IN ('111301', '114201') THEN ROUND((avg_wages/food_price))
		ELSE 0
	END AS food_measured_quantity,
	price_unit, 
	food_name,
	Food_category 
FROM t_marek_lestina_project_sql_primary_final tmlpspf
WHERE payroll_year IN ('2006','2018')
	AND Food_category IN ('111301', '114201')
GROUP BY payroll_year, Food_category
ORDER BY Food_category;  