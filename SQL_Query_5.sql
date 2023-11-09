-- task no.5

SELECT
	gdp.*,
	pp.prices_increase,
	pp.payroll_increase
FROM
	(
	SELECT
		a.country,
		a.gdp,
		a.`year`,
		b.`year` + 1 AS prev_year,
		round((a.gdp-b.gdp)/ b.gdp * 100) AS GDP_growth_percent
	FROM
		(
		SELECT
			country,
			GDP,
			`year`
		FROM
			t_marek_lestina_project_sql_secondary_final tmlpssf
		WHERE
			country = 'czech republic' )
a
	JOIN (
		SELECT
			country,
			GDP,
			`year`
		FROM
			t_marek_lestina_project_sql_secondary_final tmlpssf
		WHERE
			country = 'czech republic' 
) b
ON
		a.`year` = b.`year` + 1
) gdp
JOIN (
	SELECT
		c.payroll_year,
		d.payroll_year + 1 AS year_prev,
		round((c.prumerny_ceny-d.prumerny_ceny)/ d.prumerny_ceny * 100) AS prices_increase,
		round((c.prumerny_mzdy-d.prumerny_mzdy)/ d.prumerny_mzdy * 100) AS payroll_increase
	FROM
		(
		SELECT
			payroll_year,
			round(avg(avg_wages)) AS prumerny_mzdy,
			round(avg(food_price)) AS prumerny_ceny
		FROM
			t_marek_lestina_project_sql_primary_final tmlpspf
		GROUP BY
			payroll_year
		ORDER BY
			payroll_year
) c
	JOIN (
		SELECT
			payroll_year,
			round(avg(avg_wages)) AS prumerny_mzdy,
			round(avg(food_price)) AS prumerny_ceny
		FROM
			t_marek_lestina_project_sql_primary_final tmlpspf
		GROUP BY
			payroll_year
		ORDER BY
			payroll_year
) d 
ON
		c.payroll_year = d.payroll_year + 1
	GROUP BY
		payroll_year
) pp
ON
	gdp.`year` = pp.payroll_year