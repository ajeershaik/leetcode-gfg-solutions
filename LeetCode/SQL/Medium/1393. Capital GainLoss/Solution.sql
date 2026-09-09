# Write your MySQL query statement below
with t1 as(
select stock_name,operation,price,sum(
    case when operation='Buy' then price
    else 0
    end
) over(partition by stock_name)as buy_sum,
sum(
    case when operation='Sell' then price
    else 0
    end
) over(partition by stock_name)as sell_sum
from stocks)
select stock_name,sell_sum-buy_sum as capital_gain_loss
from t1 group by stock_name;