# Write your MySQL query statement below

select (select distinct salary  
from employee order by salary desc limit 1 offset 1)as SecondHighestSalary;

/*select max(if(rn=2,salary,null)) as SecondHighestSalary from(
    select salary, dense_rank() over(order by id) as rn from employee
)as t where rn = 2;*/