# Write your MySQL query statement below
select * from(
select customer_id,sum(
    case when transaction_id is null then 1
    else 0
    end
) as count_no_trans from(
    select v.visit_id,v.customer_id,t.transaction_id from visits v left join transactions t 
    on v.visit_id = t.visit_id
)as t group by customer_id
)as t1 where count_no_trans>0;
