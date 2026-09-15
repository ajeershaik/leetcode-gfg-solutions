# Write your MySQL query statement below

select sell_date,org_cnt as num_sold,group_concat(product order by product separator ',') as products from(
    select sell_date,num_sold,product,count(sell_date) over(partition by sell_date)as org_cnt from(
        select distinct sell_date,num_sold,product from(
    select sell_date,count(sell_date) over(partition by sell_date)as num_sold,product from activities
    )as t
)as t1
)as t2 group by sell_date;
