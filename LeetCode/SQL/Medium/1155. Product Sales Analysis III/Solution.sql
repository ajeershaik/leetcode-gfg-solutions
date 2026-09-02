# Write your MySQL query statement below

select product_id,year as first_year,quantity,price from(
    select product_id,year,quantity,price,row_number() over(
    partition by product_id order by year
    ) as rn from sales
)as t where rn = 1;