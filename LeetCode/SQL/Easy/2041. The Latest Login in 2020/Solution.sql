
select user_id,time_stamp as last_stamp from(
    select  user_id,time_stamp,row_number() over(partition by user_id order by time_stamp desc)as rn
 from logins where date_format(time_stamp,'%Y') = '2020'
)as t where rn =1;