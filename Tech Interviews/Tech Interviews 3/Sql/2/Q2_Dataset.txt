--- Q5 : Ungroup the given input data --- 

drop table travel_items;
create table travel_items
(
	id              int,
	item_name       varchar(50),
	total_count     int
);
insert into travel_items values (1, 'Water Bottle', 2);
insert into travel_items values (2, 'Tent', 1);
insert into travel_items values (3, 'Apple', 4);
