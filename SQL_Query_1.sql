-- Dotaz č. 1 - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? 

SELECT
payroll_year, 
avg_wages,
industry_branch_code,
industry_name 
FROM t_marek_lestina_project_sql_primary_final tmlpspf
WHERE payroll_year IN (2006, 2018)
GROUP BY industry_branch_code, payroll_year  