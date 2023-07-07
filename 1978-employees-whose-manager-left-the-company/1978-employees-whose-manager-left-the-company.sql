# Write your MySQL query statement below
SELECT e.employee_id
FROM Employees e

WHERE e.salary < 30000 AND manager_id not in (SELECT employee_id FROM employees) 
ORDER BY e.employee_id
