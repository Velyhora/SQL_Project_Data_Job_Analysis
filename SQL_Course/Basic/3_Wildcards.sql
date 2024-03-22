-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* In the company_dim table find all company names that include ‘Tech’ immediately followed by any single character. 
Return the name column and return in ascending order by the company name. */

-- 💡Solution:

-- SELECT 
-- 	name
-- FROM 
-- 	company_dim
-- WHERE 
-- 	name LIKE '%Tech_'
-- ORDER BY
-- 	name;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

Find all job postings in the job_postings_fact where the job_title includes "Engineer" in it with ONLY one character followed after the term. Get the job_id , job_title, 
and job_posted_date. Order by job_id in ascending order. */

-- 💡Solution:

-- SELECT 
-- 	job_id, 
-- 	job_title,
-- 	job_posted_date
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	job_title LIKE '%Engineer_'
-- ORDER BY
-- 	job_id;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

Identify job postings in the job_postings_fact table where the job_title contains the pattern "a_a" anywhere in the title. 
Return the job_id and job_title columns. Order by job_id in ascending order.

Note “a_a” is just a random pattern and can be modified to any patter you wish.  */

-- 💡Solution:

-- This pattern means any character, followed by 'a', another character, and then 'a' again.

-- SELECT 
-- 	job_id, 
-- 	job_title
-- FROM 
-- 	job_postings_fact
-- WHERE 
-- 	job_title LIKE '%a_a%'
-- ORDER BY
-- 	job_id;


-- Problem 16 ------------------------------------------------------------------------------------------------------------------------------
/*  */



