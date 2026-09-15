# Write your MySQL query statement below
select name,travelled_distance from(
    select name,travelled_distance, row_number() over(partition by travelled_distance order by name) as rn from(
    select name,sum(coalesce(distance,0)) as travelled_distance from(
    select u.id,u.name,r.distance from
users u left join rides r
on u.id = r.user_id
)as t group by id order by travelled_distance desc
)as t1 order by travelled_distance desc
)as t2;