# Write your MySQL query statement below


select employee_id from (
    select case 
    when emp is not null and sal is null then emp
    when emp is null and sal is not null then sal_emp
end as employee_id from(
    select e1.employee_id as emp,e1.name,s1.employee_id as sal_emp,s1.salary as sal from employees e1
    left join salaries s1 on e1.employee_id = s1.employee_id
    union
    select e1.employee_id as emp,e1.name,s1.employee_id as sal_emp,s1.salary from employees e1
    right join salaries s1 on e1.employee_id = s1.employee_id
)as t)as t1 where employee_id is not null order by employee_id;
