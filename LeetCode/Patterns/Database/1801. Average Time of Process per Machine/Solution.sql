select distinct machine_id,round(avg(tot_diff/2) over(partition by machine_id),3)as processing_time from(
    select machine_id,sum(end_time)over(partition by machine_id) - sum(start_time) over(partition by machine_id)as tot_diff
from(
select machine_id,process_id,round(sum(
    case when activity_type = 'start' then timestamp
    else 0
    end
),3)as start_time,round(sum(
    case when activity_type = 'end' then timestamp
    else 0
    end
),3)as end_time from activity group by machine_id,process_id
)as t
)as t1;