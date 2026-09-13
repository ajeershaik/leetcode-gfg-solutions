SELECT user_id, time_stamp AS last_stamp
FROM (
    SELECT
        user_id,
        time_stamp,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY time_stamp DESC
        ) AS rn
    FROM Logins
    WHERE time_stamp >= '2020-01-01'
      AND time_stamp < '2021-01-01'
) t
WHERE rn = 1;