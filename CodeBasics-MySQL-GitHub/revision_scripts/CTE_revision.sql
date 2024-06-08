# get all actors between the age group of 70 and 85

-- using subquery
select name as actors_name, age from
	(select 
		*,
		(year(curdate()) - birth_year) as age
	from actors) as actors_age
where age between 70 and 85;

-- using CTE
with actors_age (actor_name, age) as (
		select 
			name,
			year(curdate()) - birth_year
		from actors
)
select actor_name, age 
from actors_age
where age between 70 and 85;


# get movies that produced 500% profit and their rating was less than
# the avg rating for all movies

with new_financials as(
		select 
			*,
			revenue-budget as profit,
			round(((revenue-budget)/budget) * 100,2) as profit_percent
		from financials
)
select movie_id, title, imdb_rating, profit_percent
from movies
join new_financials
using (movie_id)
where profit_percent >=500 and
	  imdb_rating < (select avg(imdb_rating) from movies);


# Select all Hollywood movies released after the year 2000 
# that made more than 500 million $ profit or more profit. 
# Note that all Hollywood movies have millions as a unit 
# hence you don't need to do the unit conversion. 
# Also, you can write this query without CTE as well 
# but you should try to write this using CTE only
with new_financials as
		(select 
			* ,
			(revenue - budget) as profit
		from financials
)
select movie_id, title, release_year, profit
from movies
join new_financials
using (movie_id)
where industry='hollywood' and profit >= 500 and release_year >= 2000

