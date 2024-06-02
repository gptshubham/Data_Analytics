# joining two tables --> inner join by default
SELECT
    m.movie_id, title, revenue, budget, unit, currency
FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id;

# joining two tables --> left join
SELECT
    m.movie_id, title, revenue, budget, unit, currency
FROM movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id;

# joining two tables --> right join
SELECT
    f.movie_id, title, revenue, budget, unit, currency
FROM movies m
RIGHT JOIN financials f
ON m.movie_id = f.movie_id;

# joining two tables --> full join ==> union of left join and right join
SELECT
    m.movie_id, title, revenue, budget, unit, currency
FROM movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id

UNION

SELECT
    f.movie_id, title, revenue, budget, unit, currency
FROM movies m
RIGHT JOIN financials f
ON m.movie_id = f.movie_id;

# using clause --> when both the tables have common column names.
-- inner join
SELECT
    movie_id, title, revenue, budget, unit, currency
FROM movies
JOIN financials
USING (movie_id);

-- left join
SELECT
    movie_id, title, revenue, budget, unit, currency
FROM movies
LEFT JOIN financials
USING (movie_id);

-- right join
SELECT
    movie_id, title, revenue, budget, unit, currency
FROM movies
RIGHT JOIN financials
using (movie_id);

# movies with their language names
select 
	title, name
from movies
join languages
using (language_id);

# Telugu movie names
select title, name
from movies
join languages
using (language_id)
where name='Telugu';

# show the language and number of movies in that language
select name, count(*) as movie_count
from movies
join languages
using (language_id)
group by name 
order by movie_count desc;

