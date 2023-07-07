# Write your MySQL query statement below
SELECT DISTINCT e.employee_id, COALESCE(p.department_id, e.department_id) AS department_id
FROM Employee e
LEFT JOIN (
    SELECT employee_id, department_id
    FROM Employee
    WHERE primary_flag = 'Y'
) p ON e.employee_id = p.employee_id

