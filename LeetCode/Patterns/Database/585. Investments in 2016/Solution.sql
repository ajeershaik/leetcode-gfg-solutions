

select sum(tiv_2016) as tiv_2016 from(
    select pid,tiv_2015,tiv_2016,lat,lon from insurance group by lat,lon having count(*)<=1
) as t group by tiv_2015;