# Write your MySQL query statement below
/*select distinct p.product_id,
if(t.np>=0,t.np,10)as price
 from products p left join 
    (select product_id,new_price,change_date,max(new_price) as np from products
    where datediff('2019-08-16',change_date)>=0 group by product_id) as t
on p.product_id = t.product_id;
