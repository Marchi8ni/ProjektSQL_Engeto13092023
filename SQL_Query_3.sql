-- task no.3

 SELECT
	a.food_category,
	a.food_name,
	a.food_price_2006,
	b.food_price_2018,
	round((b.food_price_2018-a.food_price_2006)/ a.food_price_2006 * 100, 2) AS Lowest_price_increase_percent
FROM
	(
	SELECT 
		Food_category,
		food_name,
		price_year, 
		food_price AS food_price_2006
	FROM t_marek_lestina_project_sql_primary_final tmlpspf
	WHERE price_year = '2006'
	GROUP BY
		Food_category,
		price_year
	ORDER BY
		Food_category 
 ) a
JOIN (
	SELECT
		Food_category,
		food_name,
		price_year,
		food_price AS food_price_2018
	FROM t_marek_lestina_project_sql_primary_final tmlpspf
	WHERE price_year = '2018'
	GROUP BY
		Food_category,
		price_year
	ORDER BY
		Food_category  
 ) b
ON a.food_category = b.food_category
ORDER BY 
	lowest_price_increase_percent ASC;