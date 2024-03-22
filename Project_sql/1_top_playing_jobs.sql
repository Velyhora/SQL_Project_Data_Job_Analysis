/*
Question : What are the top-paying data analist jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotly.
- Focuses on job postings with specified salaries (remove nulls).
Why? Highlight the top-paying opportunies for Data Analysts, offering insights into empty
*/

SELECT 
job_id,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
name as company_name

FROM job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id


WHERE job_title_short = 'Data Analyst'
and job_location = 'Anywhere'
and salary_year_avg is not NULL
ORDER BY salary_year_avg DESC
LIMIT 10 


