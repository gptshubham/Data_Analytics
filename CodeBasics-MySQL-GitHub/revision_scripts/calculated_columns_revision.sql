# age column
select 
	*,
    (year(curdate()) - birth_year) as age
from actors;

# profit column
select 
	movie_id, budget, revenue,
	revenue - budget as profit,
    unit, currency
from financials;

# revenue_inr column
select 
	*,
    if(currency='USD', revenue * 80, revenue) as revenue_inr
from financials;

# revenue_mln column
-- select distinct unit from financials;
select 
	*,
	case
		when unit='billion' then revenue * 1000
        when unit='thousand' then revenue / 1000
        else revenue
    end as revenue_mln
from financials;

# profit_percentage column
select 
	*,
    revenue - budget as profit,
    round(((revenue - budget) / budget) * 100, 2) as profit_pct
from financials;
