# cross join items and variants tables of food_db database
select 
	concat(name,' - ',variant_name) item,
    (price + variant_price) as final_price
from items
cross join variants;

