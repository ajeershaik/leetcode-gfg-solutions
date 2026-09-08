# Write your MySQL query statement below

# Write your MySQL query statement below

select Department,Employee,Salary from( 
    select e.id,e.name as Employee,e.salary as Salary,e.departmentId,d.name as Department,dense_rank()
    over(partition by d.name order by e.salary desc)as rn from 
    employee e left join department d
    on e.departmentId = d.id
) as t where rn <=3;