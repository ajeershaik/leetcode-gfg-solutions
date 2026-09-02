# Write your MySQL query statement below

/*select sum(
    if(order_date  = customer_pref_delivery_date,1,0)
)as totaL_imm,count(order_date) as total_orders from delivery;*/

select round(sum(
    case 
        when order_date = customer_pref_delivery_date then 1
        else 0
    end
)*100/count(customer_id),2) as immediate_percentage from(
    select customer_id,order_date,customer_pref_delivery_date from(
    select customer_id,order_date,customer_pref_delivery_date,
    row_number() over(partition by customer_id order by order_date) as rn
    from delivery) as t
    where rn = 1
)as t1;