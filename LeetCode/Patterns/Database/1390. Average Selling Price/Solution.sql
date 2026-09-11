# Write your MySQL query statement belo

select product_id,coalesce(round(sum(total_price)/sum(units),2),0)as 
    average_price from(
    select p.product_id as product_id,p.start_date,p.end_date,p.price,u.purchase_date,u.units,
    p.price*u.units as total_price from prices p 
    left join unitssold u on p.product_id = u.product_id and date_format(p.end_date,'%m') = date_format(u.purchase_date,'%m')
)as t group by product_id;
