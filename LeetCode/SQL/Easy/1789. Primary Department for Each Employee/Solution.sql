# Write your MySQL query statement below

select * from (
    select employee_id,
case when dept_cnt = 1 then department_id
    when dept_cnt > 1 and primary_flag = 'y' then department_id
    else 0
end as department_id from(
    select employee_id,department_id,primary_flag,count(employee_id) over(partition by employee_id)as dept_cnt
from employee
)as t
)as t1 where department_id != 0;