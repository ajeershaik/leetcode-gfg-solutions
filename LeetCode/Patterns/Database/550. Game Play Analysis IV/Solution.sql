# Write your MySQL query statement below

select round(sum(
    case when diff=1 then 1
    else 0
    end
)/count(*),2) as fraction from(
    select player_id,if(total_games>=2,datediff(
    max(if(rn=2,event_date,null)),
    max(if(rn=1,event_date,null))
    ),null)as diff
from(
    select player_id,event_date,count(*) over(partition by player_id) as total_games,
        row_number() over(partition by player_id order by event_date) as rn from activity
    )as t group by player_id
)as t1;
