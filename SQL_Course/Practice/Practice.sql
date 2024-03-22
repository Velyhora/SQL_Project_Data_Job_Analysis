WITH avg_salaries AS (

SELECT
job_country,
AVG (salary_year_avg) as avg_salary

FROM job_postings_fact

where salary_year_avg is not null

GROUP BY job_country

)

SELECT 
  -- Gets basic job info

job_postings.job_id,
  job_postings.job_title,
  companies.name AS company_name,
  job_postings.salary_year_avg AS salary_rate,
-- categorizes the salary as above or below average the average salary for the country
CASE
    WHEN job_postings.salary_year_avg > avg_salaries.avg_salary
    THEN 'Above Average'
    ELSE 'Below Average'
  END AS salary_category,
  -- gets the month and year of the job posting date
  EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month

From FROM
  job_postings_fact as job_postings


INNER JOIN
  company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
  avg_salaries ON job_postings.job_country = avg_salaries.job_country

ORDER BY
    -- Sorts it by the most recent job postings
    posting_month desc





-- INNER JOIN company_dim ON avg_salaries.company_id = company_dim.company_id


-- WITH title_diversity AS (
--     SELECT
--         company_id,
--         COUNT(DISTINCT job_title) AS unique_titles  
--     FROM job_postings_fact
--     GROUP BY company_id  
-- )
-- -- Get company name and count of how many unique titles each company has
-- SELECT
--     company_dim.name,  
--     title_diversity.unique_titles  
-- FROM title_diversity
-- 	INNER JOIN company_dim ON title_diversity.company_id = company_dim.company_id  
-- ORDER BY 
-- 	unique_titles DESC  
-- LIMIT 10; 

-- With company_job_count AS (

-- SELECT 
--     company_id,
--     Count(*) as total_jobs

-- From job_postings_fact

-- GROUP BY company_id

-- )
-- SELECT company_dim.name as company_name,
-- company_job_count.total_jobs

-- FROM company_dim
-- LEFT JOIN company_job_count on company_dim.company_id = company_job_count.company_id

-- ORDER BY total_jobs DESC;

-- Define a CTE named title_diversity to calculate unique job titles per company



