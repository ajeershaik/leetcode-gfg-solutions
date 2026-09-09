# Write your MySQL query statement below

select employee as Employee from(
    select e1.id,e1.name as employee,e1.salary as emp_sal,
    e2.name as manager,e2.salary as man_sal
    from employee e1 
    join employee e2
    on e1.managerId = e2.id
)as t where emp_sal > man_sal;