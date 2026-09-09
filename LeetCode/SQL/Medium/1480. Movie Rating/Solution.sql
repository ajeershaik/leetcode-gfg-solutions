
select result as results from(select u.name as result from movierating mr left join users u on mr.user_id=u.user_id group by u.name 
order by count(u.name) desc,u.name asc limit 1)as t

union all

select title as results from(
    select title,sum(
    case WHEN dd >= '2020-02-01'AND dd < '2020-03-01' THEN rating
    ELSE 0
    end
    )over(partition by title)/sum(
    case WHEN dd >= '2020-02-01' AND dd < '2020-03-01' THEN 1
    ELSE 0
    end  
    ) over(partition by title) as rate_cnt from(
    select mr.movie_id,mr.rating as rating,mr.created_at as dd,m.title as title from movierating mr left join movies m on mr.movie_id = m.movie_id
    )as t order by rate_cnt desc,title asc
)as t1 limit 2;


