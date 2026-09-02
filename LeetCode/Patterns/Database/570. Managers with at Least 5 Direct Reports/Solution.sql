# Write your MySQL query statement below

select e.name from employee e inner join  
(select managerId,count(id) as total from employee group by managerId) as t
on e.id = t.managerId where total>=5;