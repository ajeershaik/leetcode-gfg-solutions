# Write your MySQL query statement below

/*select dd as 'Day',Cancellation_Rate as 'Cancellation Rate' from (
    select dd,client_role,client_ban,driver_ban,driver_role,status,
    round(sum(
        case when status != "completed" then 1
        else 0
        end 
    ) over(partition by dd)/count(dd) over(partition by dd),2)as Cancellation_Rate
    from(
        select t1.id,t1.client_id,t1.driver_id,t1.status as status,t1.request_at as dd,
        u1.banned as client_ban,u1.role as client_role,
        u2.banned as driver_ban,u2.role as driver_role
        from trips t1 left join 
        users u1 on t1.client_id = u1.users_id
        left join users u2 
        on t1.driver_id = u2.users_id
    )as tab where client_ban = "no" and driver_ban = "no" 
)as tab2 group by dd;*