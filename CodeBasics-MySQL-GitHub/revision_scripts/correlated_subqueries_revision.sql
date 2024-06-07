# select the actor id, actor name, and the total number of movies they acted in .

-- we can simply join actors and movies_actor tables to get the required output
explain analyze
select 
	a.actor_id,
	name,
    count(movie_id) as movie_count
from movie_actor ma
join actors a
on ma.actor_id=a.actor_id
group by a.actor_id
order by movie_count desc;

-- Alternatively, using Co-Related Subqueries
explain analyze
select 
	actor_id, name,
    (select count(movie_id) from movie_actor 
    where actor_id=actors.actor_id) as movies_count
from actors
order by movies_count desc;

# 1. Select all the movies with minimum and maximum release_year. Note that there
#    can be more than one movie in min and a max year hence output rows can be more than 2

select title, release_year from movies
where release_year in (
	(select min(release_year) from movies),
	(select max(release_year) from movies))
order by release_year desc;

# 2. Select all the rows from the movies table whose imdb_rating is higher than the average rating
select * from movies where imdb_rating > (
	select avg(imdb_rating) from movies);