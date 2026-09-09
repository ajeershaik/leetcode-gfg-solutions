SELECT user_name AS results
FROM (
    SELECT
        u.name AS user_name,
        COUNT(*) AS cnt
    FROM MovieRating mr
    JOIN Users u
        ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY cnt DESC, user_name ASC
    LIMIT 1
) AS t

UNION ALL

SELECT title AS results
FROM (
    SELECT
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
      AND mr.created_at < '2020-03-01'
    GROUP BY m.title
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
) AS t;