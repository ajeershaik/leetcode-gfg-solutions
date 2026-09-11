# Write your MySQL query statement below

select project_id,round(avg(expe),2) as average_years from(
    select p.project_id,p.employee_id,e.name,e.experience_years as expe from project p left join employee e on p.employee_id = e.employee_id
)as t group by project_id;