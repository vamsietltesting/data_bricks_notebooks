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
