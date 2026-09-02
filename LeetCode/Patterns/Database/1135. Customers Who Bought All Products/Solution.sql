# Write your MySQL query statement below

select customer_id from(
    select customer_id,count(*) as total_buys from customer group by customer_id) as t
where total_buys >= (select count(p.product_key) from product p);
