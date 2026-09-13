# Write your MySQL query statement below
select * from(
    select product_id,'store1' as store,case when store1 is not null then store1 end as price from products
union all
select product_id,'store2' as store,case when store2 is not null then store2 end as price from products
union all
select product_id,'store3' as store,case when store1 is not null then store3 end as price from products
order by product_id
)as t where price is not null order by product_id;