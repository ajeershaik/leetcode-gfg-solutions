# Write your MySQL query statement belo
select person_name from(
    select person_name,weight,turn,total,row_number() over(order by total desc) as rn from(
    select  person_name,weight,turn,sum(weight) over(order by turn rows between unbounded preceding and
    current row) as total from queue order by turn
)as t where total<=1000 limit 1
)as t2;