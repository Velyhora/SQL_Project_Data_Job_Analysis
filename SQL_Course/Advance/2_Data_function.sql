-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) for job postings using the job_postings_fact table that were posted after June 1, 2023. 
Group the results by job schedule type. Order by the job_schedule_type in descending order.

🔎 Hint:
Calculate average salaries by using the AVG function on both salary_year_avg and salary_hour_avg.
Filter postings with WHERE for dates after June 1, 2023,
Group the results with job_schedule_type.
Use job_schedule_type for ORDER BY. */

-- 💡Solution:

-- In the SELECT statement it gets job_schedule_type, average salary year AVG(salary_year_avg), and average hour year AVG(salary_hour_avg).
-- The WHERE clause filters jobs that were posted after June 1, 2023 (job_posted_date::date > ‘2023-06-01’.
-- GROUP BY the job_schedule_type to aggregate properly.
-- Use ORDER BY to order the results by job_schedule_type.
-- SELECT
--     job_schedule_type,
--     AVG(salary_year_avg) AS avg_yearly_salary,
--     AVG(salary_hour_avg) AS avg_hourly_salary
-- FROM
--     job_postings_fact
-- WHERE
--     job_posted_date::date > '2023-06-01'
-- GROUP BY
--     job_schedule_type
-- ORDER BY
-- 	job_schedule_type;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Count the number of job postings for each month in 2023, adjusting the job_posted_date to be in 'America/New_York' time zone before extracting the month. 
Assume the job_posted_date is stored in UTC. Group by and order by the month.

🔎 Hint:

Use the EXTRACT(MONTH FROM ...) function to get the month from job_posted_date and wihtin this EXTRACT convert it to the 'America/New_York' time zone using AT TIME ZONE 
(don’t forget to assume default is in ‘UTC’).
COUNT the number of job postings
GROUP BY the extracted month
ORDER BY the month. */

-- 💡Solution:

-- In the SELECT statement:
-- For month:
-- Adjusts job_posted_date from UTC to 'America/New_York' time zone using the AT TIME ZONE clause (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York').
-- It then extracts the month from job_posted_date using the EXTRACT(MONTH FROM ...) function.
-- Uses COUNT(*) to count the total number of job postings for each month.
-- GROUP BY the month (GROUP BY month).
-- ORDER BY month in ascending order (ORDER BY month).
-- SELECT
--     EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
--     COUNT(*) AS postings_count
-- FROM
--     job_postings_fact
-- GROUP BY
--     month
-- ORDER BY
--     month;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. 
Use date extraction to filter by quarter. And order by the job postings count from highest to lowest.

🔎 Hint:

Join job_postings_fact and company_dim on company_id to match jobs to companies.
Use the WHERE clause to filter for jobs with job_health_insurance column.
Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.
Group results by company_name.
Count the number of job postings per company with COUNT(job_id).
Use HAVING to include only companies with at least one job posting.
ORDER BY the job postings count in descending order to get highest → lowest. */

-- 💡Solution:

-- Select the company name (name) and count of job postings (COUNT(job_postings_fact.job_id) from the joined tables.
-- WHERE clause:
-- Includes health insurance: job_health_insurance is set to TRUE.
-- Extract the quarter from the job_posted_date and filter for the second quarter (value 2).
-- GROUP BY the company name (name) to get the count per company.
-- ORDER BY job postings count in descending order.
-- SELECT
--     company_dim.name AS company_name,
--     COUNT(job_postings_fact.job_id) AS job_postings_count
-- FROM
--     job_postings_fact
-- 	INNER JOIN
--     company_dim ON job_postings_fact.company_id = company_dim.company_id
-- WHERE
--     job_postings_fact.job_health_insurance = TRUE
--     AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 
-- GROUP BY
--     company_dim.name 
-- HAVING
--     COUNT(job_postings_fact.job_id) > 0
-- ORDER BY
-- 	job_postings_count DESC; 



