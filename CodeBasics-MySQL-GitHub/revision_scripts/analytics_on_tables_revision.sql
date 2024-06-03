select
	movie_id, title, budget, revenue, currency, unit,
    (revenue - budget) as profit
from movies
join financials
using (movie_id);

# now standardise units in the above query
select
	movie_id, title, currency,
    # calculated column budget_mln
    case
		when unit='thousand' then round(budget/1000,2)
        when unit='billions' then round(budget*1000,2)
        else round(budget,2)
    end as budget_mln,
    # calculated column revenue_mln
    case
		when unit='thousand' then round(revenue/1000,2)
        when unit='billions' then round(revenue*1000,2)
        else round(revenue,2)
    end as revenue_mln,
    # calculated column profit_mln
	case
		when unit='thousand' then round(revenue/1000 - budget/1000,2)
        when unit='billions' then round(revenue*1000 - budget*1000,2)
        else round(revenue - budget,2)
    end as profit_mln
from movies
join financials
using (movie_id)
order by profit_mln desc;