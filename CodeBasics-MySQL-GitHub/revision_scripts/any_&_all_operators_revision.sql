# select actors who acted in any of these movies (101, 110, 121)
-- using join and in operator
select a.actor_id, name, birth_year
from actors a
join movie_actor ma
on a.actor_id=ma.actor_id
join movies m
on ma.movie_id=m.movie_id
where m.movie_id in (101,110,121);

-- using subquery and in operator
select * from actors where actor_id in (
	select actor_id from movie_actor where movie_id in (101,110,121));

-- using subquery and any operator
select * from actors where actor_id = any(
	select actor_id from movie_actor where movie_id in (101,110,121));
    
# select all movies with rating greater than any of the marvel movies rating
-- suing subquery and any operator
select * from movies where imdb_rating > any(
	select imdb_rating from movies where studio = 'marvel studios');

-- alternatively , using subquery and min operator
select * from movies where imdb_rating > (
	select min(imdb_rating) from movies where studio='marvel studios');

-- alternatively, using subquery and some operator
select * from movies where imdb_rating > some(
	select imdb_rating from movies where studio = 'marvel studios');

# select all movies with rating greater than all of the marvel movies
select * from movies where imdb_rating > all(
	select imdb_rating from movies where studio='marvel studios');

-- alternatively, using subquery and max operator
select * from movies where imdb_rating > (
	select max(imdb_rating) from movies where studio='marvel studios');

