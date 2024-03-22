-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

We’re going to check that all skills that do not have a category assigned to it. 
Get all skills from the skills_dim table that don’t have a type (aka this type column is null). 
Return the skill_id and skills. */

-- 💡Solution:

-- SELECT 
-- 	skill_id, 
-- 	skills
-- FROM 
-- 	skills_dim
-- WHERE 
-- 	type IS NULL;
-- 📋 Result:

-- The results mean that all the skills listed in the skills_dim table have a type. In other words, the data is clean in this regard! 👍

-- Note: This can be useful for validating data.


-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Identify all job postings that have neither an annual average salary (salary_year_avg) nor an hourly average salary (salary_hour_avg) in the job_postings_fact table. 
Return the job_id, job_title, salary_year_avg, salary_hour_avg 
This can be useful to look at postings where there’s no compensation. Order by job_id in ascending order. */

-- 💡Solution:

-- SELECT 
-- 	job_id, 
-- 	job_title, 
-- 	salary_year_avg, 
-- 	salary_hour_avg
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	salary_year_avg IS NULL 
-- 	AND salary_hour_avg IS NULL
-- ORDER BY
-- 	job_id;



-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/*  */