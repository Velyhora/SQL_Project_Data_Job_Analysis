-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/* Create a table named data_science_jobs that will hold information about job postings. 
Include the following columns: job_id (integer and primary key), job_title (text), company_name (text), and post_date (date). */

-- 💡Solution:

-- CREATE TABLE data_science_jobs (
--     job_id INT PRIMARY KEY,
--     job_title TEXT,
--     company_name TEXT,
--     post_date DATE
-- );


-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/* Insert three job postings into the data_science_jobs table. Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date. */

-- 💡Solution:

-- This is just an example but you can write anything here as long as the data is in the correct format.

-- INSERT INTO data_science_jobs (job_id, job_title, company_name, post_date)
-- VALUES
-- (1, 'Data Scientist', 'Tech Innovations', '2023-01-01'),
-- (2, 'Machine Learning Engineer', 'Data Driven Co', '2023-01-15'),
-- (3, 'AI Specialist', 'Future Tech', '2023-02-01');


-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Alter the data_science_jobs table to add a new Boolean column (uses True or False values) named remote. */

-- 💡Solution:

-- ALTER TABLE data_science_jobs 
-- ADD COLUMN remote BOOLEAN;


-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Rename the post_date column to posted_on from the data_science_job table. */

-- 💡Solution:

-- ALTER TABLE data_science_jobs 
-- RENAME COLUMN post_date TO posted_on;
-- 📋 Result:

-- The post_date column has been renamed to posted_on.

-- Problem 5 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Modify the remote column so that it defaults to FALSE in the data_science_job table .

🔎 Hint:
Use SET DEFAULT command. */

-- 💡Solution:

-- ALTER TABLE data_science_jobs 
-- ALTER COLUMN remote SET DEFAULT FALSE;
-- 📋 Result:

-- This will not display any results and it won’t change the existing rows but if you insert a new row like this:

-- -- Note: We won't be inserting anything into remote due to how the default value works
-- INSERT INTO data_science_jobs (job_id, job_title, company_name, posted_on)
-- VALUES
-- (4, 'Data Scientist', 'Google', '2023-02-05');
-- Then look at the table again you’ll see the default value for the remote column is FALSE because we did not specify a value for the remote column.

-- Problem 6 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Drop the company_name column from the data_science_jobs table. */

-- 💡Solution:

-- ALTER TABLE data_science_jobs 
-- DROP COLUMN company_name;
-- 📋 Result:

-- If you look in your table list the data_science_jobs table the company_name column should be gone.

-- Problem 7 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Update the job posting with the job_id = 2 . Update the remote column for this job posting to TRUE in data_science_jobs.

🔎 Hint:

Use SET to specify the column that needs to be updated and the new value for that column. */

-- 💡Solution:

-- UPDATE data_science_jobs 
-- SET remote = TRUE WHERE job_id = 2;
-- 📋 Result:

-- Now if you look at the data_science_jobs table the job with job_id = 2 now has remote set to TRUE instead of NULL.

-- Problem 8 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

Drop the data_science_jobs table. */

-- 💡Solution:

-- DROP TABLE data_science_jobs;
-- 📋 Result:

-- There’s no direct result but if you look back in your tables list the data_science_jobs table has been deleted.

-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/*  */