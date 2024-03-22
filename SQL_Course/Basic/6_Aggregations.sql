-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:
In the job_postings_fact table count the total number of job postings that offer health insurance.

🔎 Hint:

Use the job_health_insurance column to determine if a job posting offers health insurance (TRUE means it does offer health insurance). */

-- SELECT 
-- 	COUNT(*) AS jobs_with_health_insurance
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	job_health_insurance = TRUE;


-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the job_postings_fact table count the number of job postings available for each country. Return job_country and the job count. 
Order by job_country in ascending order.

🔎 Hint:
Use the job_country column to group the job postings, and count the number of job postings (job_id) within each country group. */

-- 💡Solution:

-- SELECT 
-- 	job_country, 
-- 	COUNT(*) AS job_count
-- FROM 
-- 	job_postings_fact
-- GROUP BY 
-- 	job_country
-- ORDER BY
-- 	job_country;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the job_postings_fact table calculate the total sum of the average yearly salary (salary_year_avg) 
for all job postings that are marked as fully remote and divide it by the total count of salary_year_avg. 
To get the total average yearly salary for fully remote jobs. Ensure to only include job postings where a yearly salary is specified (salary_year_avg IS NOT NULL).

🔎 Hint:
To find jobs that are fully remote look at the values in job_work_from_home column.
Only include job postings where a yearly salary is specified (WHERE salary_year_avg IS NOT NULL).
NOTE: If you’re following along in the video we’ll cover IS NOT NULL here shortly */

-- 💡Solution:

-- SELECT 
-- 	SUM(salary_year_avg) / COUNT(salary_year_avg) AS total_yearly_salary_remote
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	job_work_from_home = TRUE
-- 	AND salary_year_avg IS NOT NULL;

-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

In the job_postings_fact table find the minimum and maximum yearly salaries (salary_year_avg) 
offered for job postings in locations that include ‘San Francisco’ in the location title. 
The query should return two columns: one for the minimum yearly salary and one for the maximum yearly salary, considering only job postings 
that specify a yearly salary (salary_year_avg IS NOT NULL).

🔎 Hint:

To be more accurate use LIKE when searching for the location. In case locations aren’t in a specific format like `San Francisco, CA'.

NOTE: If you’re following along in the video we’ll cover IS NOT NULL here shortly.  */

-- If you use the condition AND job_location = 'San Francisco, CA'. The results will be slightly different.

-- SELECT 
-- 	MIN(salary_year_avg) AS min_yearly_salary, 
--   MAX(salary_year_avg) AS max_yearly_salary
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	salary_year_avg IS NOT NULL
-- 	AND job_location LIKE '%San Francisco%'; 

-- Problem 5 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the job_postings_fact table determine the average yearly salaries (salary_year_avg) for ‘Data Scientist’ job postings. 
Your query should return one columns for the average yearly salary. Only include jobs that have a yearly salary (salary_year_avg IS NOT NULL).

🔎 Hint:

Only include job postings where a yearly salary is specified (WHERE salary_year_avg IS NOT NULL).
NOTE: If you’re following along in the video we’ll cover IS NOT NULL here shortly */

-- 💡Solution:

-- SELECT 
-- 	AVG(salary_year_avg) AS avg_yearly_salary
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	salary_year_avg IS NOT NULL
-- 	AND job_title ='Data Scientist'; 

-- Problem 6 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

Using the job_postings_fact table find the average, minimum, and maximum salary range for each job_title_short. 
Only include job titles with more than 5 postings and group data by job_title_short . Order by job_title_short in ascending order.

🔎 Hint:
To get jobs with more than 5 postings this requires filtering on an aggregate function since you need to count job postings, use HAVING.
  */
💡Solution:

-- Use AVG, MIN, and MAX on salary_year_avg.
-- In HAVING use COUNT(job_id) > 5 to only include job titles with more than 5 postings.
-- Group by job_title_short.
-- SELECT 
--   job_title_short,
--   AVG(salary_year_avg) AS avg_salary,
--   MIN(salary_year_avg) AS lowest_avg_salary_offered, 
--   MAX(salary_year_avg) AS highest_avg_salary_offered 
-- FROM 
--   job_postings_fact
-- GROUP BY 
--   job_title_short
-- HAVING 
--   COUNT(job_id) > 5
-- ORDER BY
-- 	job_title_short;


-- Problem 7 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the job_postings_fact table list countries along with their average yearly salary (salary_year_avg) for job postings, 
where the average yearly salary exceeds $100,000. Group the results by job_country. Only get job postings where there is an average yearly salary included (salary_year_avg IS NOT NULL).

🔎 Hint:
To get jobs that have a greater average yearly salary of $100,000, this requires filtering on an aggregate function since you need to count job postings, use HAVING. */

-- 💡Solution:

-- Use AVG on salary_year_avg.
-- In HAVING use AVG(salary_year_avg) > 100000 to only include job titles with an average yearly salary greater than $100,000.
-- Group by job_country.
-- SELECT 
-- 	job_country, 
-- 	AVG(salary_year_avg) AS average_salary
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	salary_year_avg IS NOT NULL
-- GROUP BY 
-- 	job_country
-- HAVING 
-- 	AVG(salary_year_avg) > 100000;

-- Problem 8 ------------------------------------------------------------------------------------------------------------------------------
/*  ❓Question:

In the job_postings_fact table count the number of job postings for each location (job_location) that do NOT offer remote work. 
Display the location and the count of non-remote job postings, and order the results by the count in descending order. 
Show locations where the average salary for non-remote jobs is above $70,000.

🔎 Hint:

To get jobs that have a greater average yearly salary of $70,000, this requires filtering on an aggregate function since you need to count job postings, use HAVING.

To look at the remote jobs look at the job_work_from_home column.

NOTE: If you try to filter out remote work jobs using job_location, you’ll find that Anywhere appears twice, this is due to this column needing to be cleaned up. 
(I.e., one value has an extra trailing space). So it won’t return the correct results.*/

-- 💡Solution:

-- Selects job_location and counts job_id as not_remote_job_count.
-- Filters for job_work_from_home = false.
-- Groups by job_location.
-- Applies HAVING AVG(salary_year_avg) > 70000 to include only locations with average yearly salary above $70,000.
-- Orders by not_remote_job_count in descending order.
-- SELECT 
--   job_location,
--   COUNT(job_id) AS not_remote_job_count
-- FROM 
--   job_postings_fact
-- WHERE 
--   job_work_from_home = false
-- GROUP BY 
--   job_location
-- HAVING 
--   AVG(salary_year_avg) > 70000 
-- ORDER BY 
--   not_remote_job_count DESC;


-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/*  */