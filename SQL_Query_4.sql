-- task no. 4
SELECT
	t.price_year,
	t2.price_year + 1  AS prev_year,
	round((t.avg_wages-t2.avg_wages)/ t2.avg_wages * 100) AS payroll_increase_percent,
	round((t.avg_price-t2.avg_price)/ t2.avg_price * 100) AS foodprice_increase_percent,
	CASE
		WHEN round((t.avg_wages-t2.avg_wages)/ t2.avg_wages * 100) > 0
		AND round((t.avg_price-t2.avg_price)/ t2.avg_price * 100)> 0 THEN (round(((t.avg_price-t2.avg_price)/ t2.avg_price * 100)-((t.avg_wages-t2.avg_wages)/ t2.avg_wages * 100)) > 10 ) = 1
	ELSE 0
	END AS Difference_percent_more_than_10
FROM (
	SELECT
		t.payroll_year,
		ROUND(AVG(t.avg_wages)) AS avg_wages,
		t.price_year,
		ROUND(AVG(t.food_price)) AS avg_price
	FROM t_marek_lestina_project_sql_primary_final t
	GROUP BY
		t.price_year
	ORDER BY
		t.price_year 
	) t
JOIN (
	SELECT
		t.payroll_year,
		ROUND(AVG(t.avg_wages)) AS avg_wages,
		t.price_year,
		ROUND(AVG(t.food_price)) AS avg_price
	FROM t_marek_lestina_project_sql_primary_final t
	GROUP BY
		t.price_year
	ORDER BY
		t.price_year
	) t2
		ON t.price_year = t2.price_year + 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       