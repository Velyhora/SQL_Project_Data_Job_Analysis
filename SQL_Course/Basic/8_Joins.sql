/* Join Intro
Goes over: 

LEFT JOIN
INNER JOIN
⚠️Notes:

LEFT JOIN AND INNER JOIN will be the primary focus for these problems (over RIGHT JOIN and OUTER JOIN) as they are most commonly used in real-world scenarios.
If you prefer you can alias the table names (e.g. rename job_postings_fact to j), 
typically it’s good to alias names that are too long or complicated to read. 
In the rest of the queries tables are not aliased to keep it clear which tables are used. */ 


-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Retrieve a list of job titles (job_title from the job_posting_fact table) with their corresponding company names (name from the company_dim table). 
Also, get the job_id, job_location, and job_posted_date. Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). 
Order by the job posted date in descending order.

🔎 Hint:

Use INNER JOIN to link job_postings_fact with company_dim on company_id to combine job and company data.
Look at job_title_short to use in the WHERE clause.
Use job_posted_date for ORDER BY. Think through how you want it ordered.
Most recent → least recent (descending order)
Least recent → most recent (ascending order) */

-- 💡Solution:

-- The SELECT statement returns: job_id, job_title, name (from the company_dim table), job_location, and job_posted_date from the job_postings_fact table.
-- Uses an INNER JOIN to link the job_postings_fact table with the company_dim table.
-- The WHERE clause filters the job postings to only include those where the job_title_short equals 'Data Scientist'.
-- ORDER BY sorts the results by job_posted_date in descending order.
-- SELECT 
--     job_postings_fact.job_id,
--     job_postings_fact.job_title, 
--     company_dim.name,
--     job_postings_fact.job_location,
--     job_postings_fact.job_posted_date
-- FROM 
--     job_postings_fact 
-- INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
-- WHERE 
--     job_postings_fact.job_title_short = 'Data Scientist'
-- ORDER BY    
--     job_postings_fact.job_posted_date DESC;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

Fetch all job postings, including their job_id, job_title and the names of the skills required (skills); even if no skills are listed for a job. 
Ensure that the job is located in ‘New York’ and offers health insurance. Use the job_postings_fact, skills_job_dim, and skills_dim tables. Order by job_id in descending order.

🔎 Hint:
Think about what JOIN you want to use for “even if no skills are listed for a job”.
You’ll need to JOIN 2 tables to the job_postings_fact table. skills_job_dim to match the skills with the job and then skills_dim to get the skill name.
In the WHERE clause look at job_location to filter specific job locations and job_health_insurance to see if the company offers health insurance.  */

-- The SELECT statement returns: job_id and job_title from job_postings_fact. And skills from the skills_dim table.
-- Get data FROM the job_postings_fact table.
-- LEFT JOIN is used to include all jobs, connecting job_postings_fact with skills_job_dim and skills_dim even if there are no skills associated (this ensures jobs without skills are not excluded).
-- The skills_dim table is joined to get the readable skill names rather than just IDs.
-- The WHERE clause filters results for jobs only in 'New York' and where job_health_insurance is TRUE.
-- Results are ordered by job_id in descending order, showing the highest job ID first.
-- SELECT 
-- 	job_postings_fact.job_id,
-- 	job_postings_fact.job_title, 
-- 	skills_dim.skills
-- FROM 
-- 	job_postings_fact
-- 	LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
-- 	LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
-- WHERE 
-- 	job_postings_fact.job_location = 'New York' 
-- 	AND job_postings_fact.job_health_insurance = TRUE
-- ORDER BY job_postings_fact.job_id DESC;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Identify the top skills required for jobs that offer remote work and have an average yearly salary above $100,000. Return the skill name (skills)
 and the number of job postings that mention each skill, ordered by the number of job postings in descending order.

🔎 Hint:
Use INNER JOIN to connect job_postings_fact with skills_job_dim and skills_dim to relate job postings to skills.
In the WHERE clause use the job_work_from_home and salary_year_avg columns to filter for these two conditions (”offer remote work and have an average yearly salary above $100,000”).
Group results by skill name using GROUP BY.
Sort the results by the count of job postings in descending order with ORDER BY. */

-- 💡Solution:

-- In the SELECT statement:
-- it gets skill names skills from the skills_dim table.
-- counts the number of job postings associated with each skill from the job_postings_fact table.
-- An INNER JOIN is used twice: first, to connect job postings with their skills, and second, to get the skill names.
-- The WHERE clause filters jobs that are remote (job_work_from_home = TRUE) and have a yearly salary over $100,000 (salary_year_avg > 100000).
-- GROUP BY skill name to aggregate the counts properly.
-- Use ORDER BY to order the results by the number of job postings in descending order.
-- SELECT 
--     skills_dim.skills,
--     COUNT(job_postings_fact.job_id) AS num_job_postings
-- FROM 
--     job_postings_fact
-- 	INNER JOIN 
-- 	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
-- 	INNER JOIN 
-- 	    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
-- WHERE 
--     job_postings_fact.job_work_from_home = TRUE -- Remote work 
--     AND job_postings_fact.salary_year_avg > 100000
-- GROUP BY 
--     skills_dim.skills
-- ORDER BY 
    num_job_postings DESC;

-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/*  */