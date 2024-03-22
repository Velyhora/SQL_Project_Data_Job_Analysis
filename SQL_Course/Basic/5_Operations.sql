-- Problem 1 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

In the invoices_fact table add the hours_spent to the hours_rate and rename this new column to added_value. 
Order by activity_id in ascending order.  */

-- 💡Solution:

-- SELECT 
--   activity_id,
--   hours_spent + hours_rate AS added_value
-- FROM 
--   invoices_fact 
-- ORDER BY
-- 	activity_id;

-- Problem 2 ------------------------------------------------------------------------------------------------------------------------------
/*❓Question:

In the invoices_fact table divide the hours_spent by the hours_rate and rename this column to efficiency_ratio. 
Return the activity_id as well. Order by activity_id in ascending order.  */

-- 💡Solution:

-- SELECT 
--   activity_id,
--   hours_spent / hours_rate AS efficiency_ratio
-- FROM 
--   invoices_fact 
-- ORDER BY
-- 	activity_id;

-- Problem 3 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the invoices_fact tables subtract the hours_rate from the hours_spent and rename this new column to estimate_budget. 
Return the activity_id column as well. Order by activity_id in ascending order */

-- 💡Solution:

-- Use any column name. In this case it’s been renamed to estimate_budget.
-- SELECT 
--   activity_id,
--   hours_spent - hours_rate AS estimate_budget
-- FROM 
--   invoices_fact
-- ORDER BY
-- 	activity_id;

-- Problem 4 ------------------------------------------------------------------------------------------------------------------------------
/* ❓Question:

In the invoices_fact table multiply the hours_spent by hours_rate and then add a fixed fee of $10. 
Rename this new column to adjusted_cost. Also return the activity_id. Order by activity_id in ascending order. */

-- 💡Solution:

-- SELECT 
--   activity_id,
--   (hours_spent * hours_rate) + 10 AS adjusted_cost
-- FROM 
--   invoices_fact 
-- ORDER BY
-- 	activity_id;

-- Problem 16 ------------------------------------------------------------------------------------------------------------------------------
/*  */