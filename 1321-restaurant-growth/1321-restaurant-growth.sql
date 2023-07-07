# Write your MySQL query statement below
WITH CTE AS (SELECT
        visited_on, 
        SUM(amount) OVER (ORDER BY visited_on range between INTERVAL '6' DAY preceding and current row) as amount,
        dense_rank() OVER (ORDER BY visited_on) as row_rank
    FROM Customer)

SELECT visited_on, min(amount) as amount, ROUND(min(amount)/7, 2) as average_amount
FROM CTE
WHERE row_rank > 6
GROUP BY visited_on
ORDER BY visited_on;

