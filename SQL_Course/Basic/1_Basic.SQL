
-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* 
In the job_postings_fact table get the columns job_id, job_title_short , job_location , and job_via columns. And order it in ascending order by job_location.
*/

-- SELECT
-- 	job_id,
-- 	job_title_short,
-- 	job_location,
-- 	job_via
-- FROM
-- 	job_postings_fact
-- ORDER BY
-- 	job_location;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* */

/* In the job_postings_fact table get the columns job_id, job_title_short , job_location , and job_via columns. And order it in descending order by job_title_short. */

-- SELECT
-- 	job_id,
-- 	job_title_short,
-- 	job_location,
-- 	job_via
-- FROM
-- 	job_postings_fact
-- ORDER BY
-- 	job_title_short DESC;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* Look at only the first 10 entries for a query in the job_postings_fact table that returns job_id, job_title_short, job_location, job_via columns. Order by the job_location in ascending order.
🔎 Hint:

To only get the first 10 entries use LIMIT.*/

-- SELECT
-- 	job_id,
-- 	job_title_short,
-- 	job_location,
-- 	job_via
-- FROM
-- 	job_postings_fact
-- ORDER BY
-- 	job_location
-- LIMIT 10;

-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/* Get the unique job locations in the job_postings_fact table. Return the results in alphabetical order.

🔎 Hint:

To get unique job locations use DISTINCT.
To get the results in alphabetical order use ORDER BY. */

-- SELECT DISTINCT
-- 	job_location
-- FROM
-- 	job_postings_fact
-- ORDER BY
-- 	job_location;


-- Problem 5 ------------------------------------------------------------------------------------------------------------------------------
/* In the job_postings_fact table get the columns job_id, job_title_short , job_location , job_via , and salary_year_avg columns. Order by job_id in ascending order. 
And only look at rows where job_title_short is ‘Data Engineer’. */

-- SELECT
-- 	job_id,
-- 	job_title_short,
-- 	job_location,
-- 	job_via,
-- 	salary_year_avg
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_title_short = 'Data Engineer'
-- ORDER BY
-- 	job_id;






