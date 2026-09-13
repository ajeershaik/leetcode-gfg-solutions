# Write your MySQL query statement below

select employee_id,coalesce(sal,0) as bonus
from(
        select e.employee_id,e.salary,t.salary as sal from employees e left join(
        select employee_id,name,salary from employees where employee_id%2 = 1 and name not like 'm%'
    )as t on e.employee_id = t.employee_id
)as t1 order by employee_id;