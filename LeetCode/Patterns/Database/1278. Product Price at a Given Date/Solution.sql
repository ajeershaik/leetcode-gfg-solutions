# Write your MySQL query statement below

select distinct p.product_id,
    if(t.new_price>=0,t.new_price,10) as price 
from products p
left join (
select  distinct product_id,
    new_price,
    change_date,
    row_number() 
        over(partition by product_id 
        order by change_date desc) 
    as rn from products
where datediff('2019-08-16',change_date)>=0) as t 
on p.product_id = t.product_id and rn=1;

