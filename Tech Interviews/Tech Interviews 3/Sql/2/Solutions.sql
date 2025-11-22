--- Q1 : Convert the given input to expected output --- 

-- Solution:
with cte as
    (select *
    , row_number() over() as rn
    from src_dest_distance)
select t1.source, t1.destination, t1.distance
from cte t1
join cte t2
        on t1.rn < t2.rn
        and t1.source = t2.destination
        and t1.destination = t2.source;


--- **************************************************************************************** ---               


--- Q2 : Ungroup the given input data --- 

-- Solution:
with recursive cte as
    (select id, item_name, total_count, 1 as level
    from travel_items
    union all
    select cte.id, cte.item_name, cte.total_count - 1, level+1 as level
    from cte
    join travel_items t on t.item_name = cte.item_name and t.id = cte.id
    where cte.total_count > 1
    )
select id, item_name
from cte
order by 1;


--- **************************************************************************************** ---               


--- Q3 : IPL Matches --- 

-- Solution for 1: Each team plays with every other team JUST ONCE.
WITH matches AS
    (SELECT row_number() over(order by team_name) AS id, t.*
     FROM teams t)
SELECT team.team_name AS team, opponent.team_name AS opponent
FROM matches team
JOIN matches opponent ON team.id < opponent.id
ORDER BY team;

-- Solution for 2: Each team plays with every other team TWICE.
WITH matches AS
    (SELECT row_number() over(order by team_name) AS id, t.*
     FROM teams t)
SELECT team.team_name AS team, opponent.team_name AS opponent
FROM matches team
JOIN matches opponent ON team.id <> opponent.id
ORDER BY team;