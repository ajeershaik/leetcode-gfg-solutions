# Write your MySQL query statement below
select emp_rep as employee_id,man_name as name,count(emp_rep) as reports_count,ceil(avg(emp_age)) as average_age
from(
    select e.employee_id as emp_id,e.name as emp_name,e.reports_to as emp_rep,
e.age as emp_age,m.name as man_name,m.reports_to as man_rep,m.age as man_age
from employees e join employees m on e.reports_to = m.employee_id
)as t group by emp_rep order by emp_rep;