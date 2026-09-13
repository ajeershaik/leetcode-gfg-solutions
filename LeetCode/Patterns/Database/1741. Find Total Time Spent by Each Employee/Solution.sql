# Write your MySQL query statement below

select event_day as 'day',emp_id,out_sum-in_sum as total_time from(
    select emp_id,event_day,in_time,out_time,
sum(in_time) over(partition by emp_id,event_day)as in_sum,
sum(out_time) over(partition by emp_id,event_day) as out_sum from employees
)as t group by emp_id,event_day;