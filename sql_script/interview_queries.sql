-- Databricks notebook source
--How do you find the 2nd highest salary in SQL?
WITH cte AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT *
FROM cte
WHERE rn = 2;

-- COMMAND ----------

--How do you find the 3rd highest salary using window functions?
WITH cte AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT *
FROM cte
WHERE rn = 3;

-- COMMAND ----------

--How do you identify duplicate records and their count?
Select count(*), id,name,salary from employee group by id,name,salary 
Having count(*)>1;

-- COMMAND ----------

---5)	How do you find employees who earn more than their manager or joined before their manager?
SELECT 
    e.emp_id,
    e.name,
    e.salary AS emp_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;


-- COMMAND ----------


