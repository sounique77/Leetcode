# Write your MySQL query statement below
SELECT e.employee_id, e.name, COUNT(r.employee_id) AS reports_count, ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
HAVING COUNT(r.employee_id) >= 1
ORDER BY e.employee_id;
