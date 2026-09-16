# Write your MySQL query statement below

select * from(
    select query_name,round(avg(qual) over(partition by query_name),2) as quality,
round(poor*100/count(query_name) over(partition by query_name),2) as poor_query_percentage
from(
        select query_name,result,position,rating,rating/position as qual,sum(
        case when rating <3 then 1
        else 0
        end
    ) over(partition by query_name) as poor from queries
)as t
)as t2 group by query_name;