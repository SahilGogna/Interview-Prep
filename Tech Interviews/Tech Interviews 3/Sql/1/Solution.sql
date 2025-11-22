--- Q1: Delete duplicate data --- 

-- Solution 1:
delete from cars
where model_id not in (select min(model_id)
					  from cars
					  group by model_name, brand);


-- Solution 2:
delete from cars
where ctid in ( select max(ctid)
                from cars
                group by model_name, brand
                having count(1) > 1);

-- Solution 3:
delete from cars
where model_id in (select model_id
                  from (select *
                       , row_number() over(partition by model_name, brand order by model_id) as rn
                       from cars) x
                  where x.rn > 1);


--- **************************************************************************************** ---               


--- Q2: Display highest and lowest salary --- 

-- Solution:
select * 
, max(salary) over(partition by dept order by salary desc) as highest_sal
, min(salary) over(partition by dept order by salary desc
                  range between unbounded preceding and unbounded following) as lowest_sal
from employee;


--- **************************************************************************************** ---               


--- Q3 : Find actual distance --- 

-- Solution:
select *
, cumulative_distance - lag(cumulative_distance, 1, 0) over(partition by cars order by days) as distance_travelled
from car_travels;


--- **************************************************************************************** ---               
