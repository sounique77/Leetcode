# Write your MySQL query statement below
WITH CTE AS (
    SELECT u.name AS results
    FROM MovieRating m
    JOIN Users u ON u.user_id = m.user_id
    GROUP BY m.user_id, u.name
    ORDER BY COUNT(DISTINCT m.movie_id) DESC, u.name
    LIMIT 1
),
CTE2 AS (
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
    GROUP BY mr.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
)
SELECT results FROM CTE
UNION ALL
SELECT results FROM CTE2;

