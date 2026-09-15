# Write your MySQL query statement below

select name,tot_amt as balance from(
    select u.account,u.name,t.trans_id,t.amount,sum(t.amount) over(partition by t.account)as tot_amt
from users u left join transactions t
on u.account = t.account
)as t where tot_amt>10000 group by account;