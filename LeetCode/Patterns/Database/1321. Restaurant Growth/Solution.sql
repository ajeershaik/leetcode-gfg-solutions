
select visited_on,amount,round(amount/7,2)as average_amount from(
    select visited_on,sum(amt) over(order by visited_on rows between 6 preceding and current row)as amount,row_number() over() as rn from(
    select visited_on,sum(amount) as amt from customer group by visited_on
)as t
)as t2 where rn>=7;