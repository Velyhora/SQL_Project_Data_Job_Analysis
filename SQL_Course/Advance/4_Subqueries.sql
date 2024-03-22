

-- Subqueries ----------------------------------------------------
-- Problem 1 -----------------------------------------------------

-- SELECT cd.skills
-- FROM skills_dim as cd
-- INNER JOIN (
--     SELECT skill_id
--     FROM skills_job_dim
--     GROUP BY skill_id
--     ORDER BY COUNT(job_id) DESC
--     LIMIT 5
-- ) AS top_skills ON cd.skill_id = top_skills.skill_id;


-- Problem 2 --- Subqueries ----------------------------------------------------

-- SELECT 
-- 	company_id,
--   name,
-- 	-- Categorize companies
--  CASE
--         WHEN company_id < 10 THEN 'Small'
--         WHEN company_id BETWEEN 10 and 50 THEN 'Medium'
--         WHEN company_id > 50 THEN 'Large'
--     END AS compaany_size

-- FROM 
-- -- Subquery to calculate number of job postings per company 
-- (
--   SELECT 
-- 		company_dim.company_id, 
-- 		company_dim.name, 
-- 		COUNT(job_postings_fact.job_id) as job_count
--   FROM 
-- 		company_dim
--   INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
--   GROUP BY 
-- 		company_dim.company_id, 
-- 		company_dim.name
-- ) AS company_job_count;

-- Problem 3 --- Subqueries ----------------------------------------------------

-- SELECT 
--     company_dim.name
-- FROM 
--     company_dim
-- INNER JOIN (
--     -- Subquery to calculate average salary per company
--     SELECT 
-- 			company_id, 
-- 			AVG(salary_year_avg) AS avg_salary
--     FROM job_postings_fact
--     GROUP BY company_id
--     ) AS company_salaries ON company_dim.company_id = company_salaries.company_id
-- -- Filter for companies with an average salary greater than the overall average
-- WHERE company_salaries.avg_salary > (
--     -- Subquery to calculate the overall average salary
--     SELECT AVG(salary_year_avg)
--     FROM job_postings_fact
-- );