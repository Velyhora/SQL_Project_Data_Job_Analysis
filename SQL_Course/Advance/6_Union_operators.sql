-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Create a unified query that categorizes job postings into two groups: those with salary information (salary_year_avg or salary_hour_avg is not null) and those without it.
 Each job posting should be listed with its job_id, job_title, and an indicator of whether salary information is provided.

🔎 Hints:

Use UNION ALL to merge results from two separate queries.
For the first query, filter job postings where either salary field is not null to identify postings with salary information.
For the second query, filter for postings where both salary fields are null to identify postings without salary information.
Include a custom field to indicate the presence or absence of salary information in the output.
When categorizing data, you can create a custom label directly in your query using string literals, such as 'With Salary Info' or 'Without Salary Info'. 
These literals are manually inserted values that indicate specific characteristics of each record. 
An example of this is as a new column in the query that doesn’t have salary information put:
 'Without Salary Info' AS salary_info. As the last column in the SELECT statement. */

--  💡Solution:

-- First Query:
-- SELECT postings with job_id, and job_title and mark it with ‘With Salary Info’
-- FROM the job_postings_fact table
-- In the WHERE clause only get job postings that have either yearly or hourly salary information (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL).
-- Second Query:
-- SELECT postings with job_id, and job_title and mark it with ‘Without Salary Info’
-- FROM the job_postings_fact table
-- In the WHERE clause only get job postings that don’t have yearly or hourly salary information (salary_year_avg IS NULL AND salary_hour_avg IS NULL).
-- Combine these two sets of postings using UNION ALL to create a comprehensive list.
-- -- Select job postings with salary information
-- (
--     SELECT 
--         job_id, 
--         job_title, 
--         'With Salary Info' AS salary_info  -- Custom field indicating salary info presence
--     FROM 
--         job_postings_fact
--     WHERE 
--         salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL  
-- )
-- UNION ALL
--  -- Select job postings without salary information
-- (
--     SELECT 
--         job_id, 
--         job_title, 
--         'Without Salary Info' AS salary_info  -- Custom field indicating absence of salary info
--     FROM 
--         job_postings_fact
--     WHERE 
--         salary_year_avg IS NULL AND salary_hour_avg IS NULL 
-- )
-- ORDER BY 
-- 	salary_info DESC, 
-- 	job_id; 

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Retrieve the job id, job title short, job location, job via, skill and skill type for each job posting from the first quarter (January to March). 
Using a subquery to combine job postings from the first quarter (these tables were created in the Advanced Section - Practice Problem 6 [include timestamp of Youtube video]) 
Only include postings with an average yearly salary greater than $70,000.

🔎 Hints:

Use UNION ALL to combine job postings from January, February, and March into a single dataset.
Apply a LEFT JOIN to include skills information, allowing for job postings without associated skills to be included.
Filter the results to only include job postings with an average yearly salary above $70,000. */

-- 💡Solution:

-- Selects job_id, job_title_short, job_location, job_via, salary_year_avg from job_postings_q1 and skills and type from skills_dim.
-- Combines January, February, and March job postings in 2023 in a subquery (in FROM statement which uses a UNION ALL) and rename it as job_postings_q1.
-- The job_postings_q1 subquery is LEFT JOINed to the skills_to_jobs on the job_id.
-- skills_to_job table is LEFT JOINed to the skills table on skill_id.
-- In the WHERE clause we’re only getting salary_year_avg that are greater than $70,000.
-- ORDER BY the job_id
-- SELECT
--     job_postings_q1.job_id,
--     job_postings_q1.job_title_short,
--     job_postings_q1.job_location,
--     job_postings_q1.job_via,
--     job_postings_q1.salary_year_avg,
--     skills_dim.skills,
--     skills_dim.type
-- FROM
-- -- Get job postings from the first quarter of 2023
--     (
--         SELECT *
--         FROM january_jobs
--         UNION ALL
--         SELECT *
--         FROM february_jobs
-- 				UNION ALL
-- 				SELECT *
-- 				FROM march_jobs
--     ) as job_postings_q1
-- LEFT JOIN skills_job_dim ON job_postings_q1.job_id = skills_job_dim.job_id
-- LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
-- WHERE
--     job_postings_q1.salary_year_avg > 70000
-- ORDER BY
-- 	job_postings_q1.job_id;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Analyze the monthly demand for skills by counting the number of job postings for each skill in the first quarter (January to March), utilizing data from separate tables for each month. 
Ensure to include skills from all job postings across these months. The tables for the first quarter job postings were created in the Advanced Section - Practice Problem 6
 [include timestamp of Youtube video].

🔎 Hints:

Use UNION ALL to combine job postings from January, February, and March into a consolidated dataset.
Apply the EXTRACT function to obtain the year and month from job posting dates, even though the month will be implicitly known from the source table.
Group the combined results by skill to summarize the total postings for each skill across the first quarter.
Join with the skills dimension table to match skill IDs with skill names. */

/*
💡Solution:

Create a CTE named combined_job_postings to consolidate job postings from the first quarter:
Include job postings from january_jobs, february_jobs, and march_jobs using UNION ALL to ensure all data from these months are combined.
Select job_id and job_posted_date from each month's table, making sure that all postings are captured, including duplicates.
Create a second CTE called monthly_skill_demand to calculate the demand for skills month by month:
In the SELECT statement:
skills to get the skill
Use EXTRACT to pull out the year (EXTRACT(YEAR FROM combined_job_postings.job_posted_date)) and month (EXTRACT(MONTH FROM combined_job_postings.job_posted_date))
COUNT the number of job postings for each skill (COUNT(combined_job_postings.job_id))
Get data FROM the combined_job_postings CTE.
INNER JOIN the combined_job_postings with skills_job_dim on job_id to associate job postings with their required skills.
INNER JOIN the skills_dim on skill_id to get the names and types of the skills.
GROUP BY the skills, year, month
In main query:
Get the skills, year, month, and postings_count
FROM the monthly_skill_demand CTE
Use ORDER BY to sort the results first by skill name (skills), then year, and month
*/


-- CTE for combining job postings from January, February, and March
-- WITH combined_job_postings AS (
--   SELECT job_id, job_posted_date
--   FROM january_jobs
--   UNION ALL
--   SELECT job_id, job_posted_date
--   FROM february_jobs
--   UNION ALL
--   SELECT job_id, job_posted_date
--   FROM march_jobs
-- ),
-- -- CTE for calculating monthly skill demand based on the combined postings
-- monthly_skill_demand AS (
--   SELECT
--     skills_dim.skills,  
--     EXTRACT(YEAR FROM combined_job_postings.job_posted_date) AS year,  
--     EXTRACT(MONTH FROM combined_job_postings.job_posted_date) AS month,  
--     COUNT(combined_job_postings.job_id) AS postings_count 
--   FROM
--     combined_job_postings
-- 	  INNER JOIN skills_job_dim ON combined_job_postings.job_id = skills_job_dim.job_id  
-- 	  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
--   GROUP BY
--     skills_dim.skills, year, month
-- )
-- -- Main query to display the demand for each skill during the first quarter
-- SELECT
--   skills,  
--   year,  
--   month,  
--   postings_count 
-- FROM
--   monthly_skill_demand
-- ORDER BY
--   skills, year, month;  

-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/*  */