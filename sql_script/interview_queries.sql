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

--How do you identify duplicate records and their count?
Select count(*), id,name,salary from employee group by id,name,salary 
Having count(*)>1;
