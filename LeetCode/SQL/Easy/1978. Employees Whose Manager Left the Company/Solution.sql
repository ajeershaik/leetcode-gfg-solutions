# Write your MySQL query statement below

select employee_id from
(select e.employee_id,e.salary,m.manager_id from employees e
natural join employees m  where salary <30000
)as t where manager_id not in (
    select employee_id from employees
);
