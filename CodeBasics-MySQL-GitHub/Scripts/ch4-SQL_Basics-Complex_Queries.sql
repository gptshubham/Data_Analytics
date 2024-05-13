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

