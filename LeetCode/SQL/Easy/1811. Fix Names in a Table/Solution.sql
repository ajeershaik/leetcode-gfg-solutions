# Write your MySQL query statement below

select USER_ID,concat(upper(left(name,1)),
                LOWER(SUBSTR(NAME,2))) AS NAME FROM USERS;