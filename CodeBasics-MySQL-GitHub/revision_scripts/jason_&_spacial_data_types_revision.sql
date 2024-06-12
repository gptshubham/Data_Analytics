# JSON Data Type

SELECT * FROM superstore_db.items;

# generate a report of all the items which are gluten free
SELECT * FROM items
where properties -> "$.gluten_free"=1;

SELECT * FROM items
where properties -> "$.gluten_free"=0;

# generate a report of all the items that do not have gluten_free property
select * from items
where isnull(properties -> "$.gluten_free");

# generate report of all the items that has coloue blue
select * from items
where properties -> "$.color"="blue";

-- Alternatively --> using JSON_EXTRACT()
select * from items
where json_extract(properties,"$.color") = "blue";


# Special Data Types

select 
	*,
    ST_AsText(location)
from sakila.address;

