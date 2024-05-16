/*
# 1. Subquery that returns a Single Value
-- movie with highest imdb rating
-- Option 1 : ORDER BY , LIMIT
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 1;

-- Option 2 : Subqueries
-- Part 1
SELECT * FROM movies
WHERE imdb_rating=9.3;
-- Part 2
SELECT MAX(imdb_rating) from movies;
-- Final Query
SELECT * FROM movies
WHERE imdb_rating=(SELECT MAX(imdb_rating) from movies);

-- Movie with Lowest imdb rating
select * from movies 
where imdb_rating=(select min(imdb_rating) from movies);

# 2.  Subquery that returns a List of Values
-- movies with minimum and maximum imdb ratings
select * from movies 
where imdb_rating in (
	(select max(imdb_rating) from movies), 
    (select min(imdb_rating) from movies));
    
# 3. Subquery that returns a Table
-- all the actors with age between 70 and 85 (70<age<85)

-- Option 1 : Having clause
select 
	name,
	year(curdate())-birth_year as age 
from actors 
having age > 70 and age < 85;

-- using Subquery
select * from
(select 
	name,
	year(curdate())-birth_year as age 
from actors) as actors_age
where age > 70 and age < 85;

# ANY and All Operations

-- Example 1 : actors who acted in any of these movies (101, 110, 121)

-- Option 1 : using inner joins and IN --> a bit leangthy but this is what I came up with first
select name from
(select
	name,
    group_concat(m.movie_id) movies_id
from actors a
join movie_actor ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id
group by name) as actor_movie_id
where movies_id in (101,110,121);

-- Option 2 : using IN --> preferred when compared with option 1
select * from actors where actor_id in (
select actor_id from movie_actor where movie_id in (101,110,121));

-- Option 3 using ANY
select * from actors where actor_id = ANY(
select actor_id from movie_actor where movie_id in (101,110,121));

-- Example 2 : all movies with rating greater than *any* of the marvel movies rating

-- Option 1 : using least imdb_rating for any marvel movie as subquery
-- first I queried the least imdb_rating for any marvel movie and then I used it as subquery to find 
-- the list of movies that have greater imdb_rating
select * from movies where imdb_rating > (
select min(imdb_rating)
from movies
where studio="marvel studios");

-- Option 2 : using ANY
select * from movies where imdb_rating > ANY (
select imdb_rating from movies where studio = "marvel studios");

-- Option 3 : using SOME
select * from movies where imdb_rating > SOME (
select imdb_rating from movies where studio = "marvel studios");

-- Example 3 : all movies with rating greater than *all* of the marvel movies rating

-- option 1 : using max imdb_rating for any marvel movie as subquery
select * from movies where imdb_rating > (
select max(imdb_rating) from movies where studio = 'marvel studios');

-- option 2 : using ALL
select * from movies where imdb_rating > ALL(
select imdb_rating from movies where studio = 'marvel studios')

*/

/*
# Co-related Subquery
-- Example 4 : select the actor id , actor name and the total number of movies they acted in 

-- Option 1 : using left join (actors and movie_actor tables) and group by 
select 
	a.actor_id as actor_id, name, count(*) as movie_count
from actors a
left join movie_actor ma on ma.actor_id=a.actor_id
group by actor_id
order by movie_count desc;

-- Option 2 : using Co-related Subquery
select 
	actor_id,
    name,
    (select count(*) from movie_actor
     where actor_id=actors.actor_id) as movie_count
from actors
order by movie_count desc;

# EXPLAIN ANALYZE
explain analyze
select 
	a.actor_id as actor_id, name, count(*) as movie_count
from actors a
join movie_actor ma on ma.actor_id=a.actor_id
group by actor_id
order by movie_count desc;

explain analyze 
select 
	actor_id,
    name,
    (select count(*) from movie_actor
     where actor_id=actors.actor_id) as movie_count
from actors
order by movie_count desc;
*/

# Common Table Expression (CTE)

-- CTE Exampel 1 : get all actors with age between 70 and 85

-- Option 1 : using subquery
select actor, age 
from 
	(select 
		name as actor,
		year(curdate()) - birth_year as age
	from actors) as actor_age
where age > 70 and age < 85;

-- Option 2 : using Common Table Expression (CTE)

with actor_age as (
	select 
		name as actor,
		year(curdate()) - birth_year as age
	from actors
)
select actor , age 
from actor_age
where age > 70 and age < 85;

-- Alternatively , we can also do it as follows

with actor_age(actor,age) as (
	select 
		name,
		year(curdate()) - birth_year
	from actors
)
select actor , age 
from actor_age
where age > 70 and age < 85;

-- CTE Example 2 : movies that produced 500% or more profit and their rating was less than avg rating for all movies
-- Option 1A : using CTE
with 
movies_financials as (
	select 
		m.movie_id as movie_id, title, imdb_rating, budget, revenue, unit, currency
	from movies m
	join financials f
	on m.movie_id=f.movie_id
),
less_than_avg_imdb_rating_movies as (
	select * from movies where imdb_rating < (
	select avg(imdb_rating) from movies)
)
select * from movies_financials
join less_than_avg_imdb_rating_movies
on movies_financials.movie_id=less_than_avg_imdb_rating_movies.movie_id
where revenue >= (budget * 6);

-- let's summarize what I've done in CTE Example 2 
-- 1. created a CTE joining movies and financial tables. 
-- 2. created another CTE for movies with imdb_rating lower than average imdb rating
-- 3. joined the two CTEs using inner join so we have only those movies which has lower than avg imdb rating
-- 4. queried for movies with 500% or more profit , giving us the ultimate table i,e;
-- 5. table showing movies with imdb rating less than average imdb rating and 500% or more profit

-- Alternatively, we can also do it as follows (compact version) -- preferred version
with less_than_avg_imdb_rating_movies as (
	select * from movies where imdb_rating < (
	select avg(imdb_rating) from movies)
)
select 
	f.movie_id, title, m.imdb_rating,
	round((revenue-budget)*100/budget,2) as profit_pct
 from financials f
join less_than_avg_imdb_rating_movies m
on f.movie_id=m.movie_id
where revenue >= (budget * 6);

-- Alternatively , we can also get the required results using subqueries 
-- However CTE is preferred compared to subqueries as CTE is more mopact and concise