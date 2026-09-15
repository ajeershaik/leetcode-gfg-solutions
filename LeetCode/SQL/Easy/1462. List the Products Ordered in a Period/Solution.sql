select product_name,unit from(
    
select p.product_name,sum(o.unit) as unit from products p 
left join orders o on p.product_id = o.product_id 
where date_format(order_date,'%Y-%m') = '2020-02' group by p.product_name 

)as t where unit>=100;