-- Items that have gluten_free as 0
select * from superstore_db.items
where properties->"$.gluten_free"=0;

-- Items that don't have gluten_free property
select * from items
where isnull(properties -> "$.gluten_free");

-- all the items which has color blue
select * from items
where properties->"$.color"="blue";

-- Alternatively
select * from items
where JSON_EXTRACT(properties,"$.color") = "blue"
