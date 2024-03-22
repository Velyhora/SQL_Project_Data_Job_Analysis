/*
Question : What are the top skills for the top-paying data analist jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these role
Why?It provides a detailed look at which hiht -paying jobs demand certain skills,
helping job seekers undrs witch skills to develop that align with top salaries
*/

With top_payning_jobs AS(

SELECT 
job_id,
job_title,
salary_year_avg,

name as company_name

FROM job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id


WHERE job_title_short = 'Data Analyst'
and job_location = 'Anywhere'
and salary_year_avg is not NULL
ORDER BY salary_year_avg DESC
LIMIT 10 
)

SELECT 
top_payning_jobs.*,
skills

FROM top_payning_jobs
INNER JOIN skills_job_dim ON top_payning_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC