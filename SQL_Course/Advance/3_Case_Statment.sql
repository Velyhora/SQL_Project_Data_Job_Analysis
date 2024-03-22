-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

From the job_postings_fact table, categorize the salaries from job postings that are data analyst jobs and who have a yearly salary information. 
Put salary into 3 different categories:

If the salary_year_avg is greater than $100,000 then return ‘high salary’.
If the salary_year_avg is between $60,000 and $99,000 return ‘Standard salary’.
If the salary_year_avg is below $60,000 return ‘Low salary’.
Also order from the highest to lowest salaries.

🔎 Hint:

In SELECT retrieve these columns: job_id, job_title, salary_year_avg, and a new column for the salary category.
CASE Statement: use to categorize salary_year_avg into 'High salary', 'Standard salary', or 'Low salary'.
If the salary is over $100,000, it's a High salary.
For salaries between $60,000 and $99,000, assign Standard salary.
Any salary below $60,000 should be marked as Low salary.
FROM the job_postings_fact table.
WHERE statement
Exclude records without a specified salary_year_avg.
Focus on job_title_short that exactly matches 'Data Analyst'.
use ORDER BY to sort by salary_year_avg in descending order to start with the highest salaries first. */

-- 💡Solution:

-- In SELECT return: job_id, job_title, salary_year_avg, and
-- Categorize the salary (salary_year_avg) on whether it’s high, standard or low using CASE statement:
-- WHEN - High is when it’s > $$100,000
-- WHEN - Standard when it’s between $60,000 and $99,000
-- WHEN - Low when it’s < $60,000
-- ORDER BY the salary_year_avg in descending order (highest salary to lowest).
-- In WHERE clause filter by jobs that include a salary (salary_year_avg IS NOT NULL) and data analyst roles (and job_title_short = 'Data Analyst')and job_title_short = 'Data Analyst'
-- SELECT
--   job_id,
--   job_title,
--   salary_year_avg,
--   CASE 
--     WHEN salary_year_avg > 100000 THEN 'High salary'
-- 		WHEN salary_year_avg BETWEEN 60000 and 99000 THEN 'Standard salary'
--     WHEN salary_year_avg < 60000 THEN 'Low salary'
--   END AS salary_category
-- FROM 
-- 	job_postings_fact
-- WHERE
--     salary_year_avg IS NOT NULL
--     and job_title_short = 'Data Analyst'
-- ORDER BY
--     salary_year_avg DESC;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* 
❓Question:

Count the number of unique companies that offer work from home (WFH) versus those requiring work to be on-site. Use the job_postings_fact table to count and 
compare the distinct companies based on their WFH policy (job_work_from_home).

🔎 Hint:

Use COUNT with DISTINCT to find unique values.
CASE WHEN statements to separate companies based on their WFH policy.
The data will be from the job_postings_fact table. */

-- 💡Solution:

-- In SELECT use COUNT(DISTINCT ...) to calculate the unique companies.
-- CASE WHEN to check the job_work_from_home flag.
-- Count as WFH if job_work_from_home is TRUE.
-- Count as non-WFH if job_work_from_home is FALSE.
-- The data is coming FROM the job_postings_fact table.
-- SELECT 
--     COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
--     COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
-- FROM job_postings_fact;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Write a query that lists all job postings with their job_id, salary_year_avg, and two additional columns using CASE WHEN statements called: experience_level and remote_option. 
Use the job_postings_fact table.

For experience_level, categorize jobs based on keywords found in their titles (job_title) as 'Senior', 'Lead/Manager', 'Junior/Entry', or 'Not Specified'. Assume that certain keywords in job titles (like "Senior", "Manager", "Lead", "Junior", or "Entry") can indicate the level of experience required. 
ILIKE should be used in place of LIKE for this.
NOTE: Use ILIKE in place of how you would normally use LIKE ; ILIKE is a command in SQL, specifically used in PostgreSQL.
 It performs a case-insensitive search, similar to the LIKE command but without sensitivity to case.
For remote_option, specify whether a job offers a remote option as either 'Yes' or 'No', based on job_work_from_home column.
🔎 Hint:

Use CASE WHEN to categorize data based on conditions.
Look for specific words that indicate job levels, like "Senior", "Manager", "Lead", "Junior", or "Entry". Use ILIKE to ensure the search for keywords is not case-sensitive.
For the remote work option based on job_work_from_home column and look at the boolean value in this column. */

-- 💡Solution:

-- In the SELECT return:
-- job_id
-- salary_year_avg
-- CASE statement to categorize the job based on experience level from job_title:
-- CASE - Assign 'Senior' if job_title contains "Senior" (job_title ILIKE '%Senior%' THEN 'Senior')
-- CASE - Assign 'Lead/Manager' if job_title contains "Manager" or "Lead" (job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager')
-- CASE - Assign 'Junior/Entry' if job_title contains "Junior" or "Entry" (job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry')
-- ELSE - Assign 'Not Specified' if none of the above keywords are found.
-- CASE statement to flag whether the job offers a remote work option:
-- Assign 'Yes' if job_work_from_home is TRUE.
-- Assign 'No' if job_work_from_home is FALSE.
-- Get the data FROM the job_postings_fact
-- In the WHERE clause make sure salary_year_avg is not null.
-- ORDER BY the job_id
-- SELECT 
--   job_id,
--   salary_year_avg,
--   CASE
--       WHEN job_title ILIKE '%Senior%' THEN 'Senior'
--       WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager'
--       WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
--       ELSE 'Not Specified'
--   END AS experience_level,
--   CASE
--       WHEN job_work_from_home THEN 'Yes'
--       ELSE 'No' 
--   END AS remote_option
-- FROM 
--   job_postings_fact
-- WHERE 
--   salary_year_avg IS NOT NULL 
-- ORDER BY 
--   job_id;


-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/*  */
