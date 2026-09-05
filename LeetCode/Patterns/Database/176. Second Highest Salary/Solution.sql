# Write your MySQL query statement below

select max(if(rn=2,salary,null)) as SecondHighestSalary from(
    select salary, row_number() over(order by id) as rn from employee
)as t where rn = 2;