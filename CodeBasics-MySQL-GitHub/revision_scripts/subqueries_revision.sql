# 1. Subquery returning a Single Value 

# Ex1 : movie with maximum imdb rating

-- without subquery

-- we can just sort in descending order and print the first result
select *
from movies
order by imdb_rating desc
limit 1;

-- Alternatively, we can find the highest imdb rating first and then use it to find highest imdb rating movie

-- step 1 : highest imdb rating
select max(imdb_rating) from movies;

-- step 2 : highest imdb rating movie
select title, imdb_rating
from movies
where imdb_rating = 9.3;

-- with subquery : just combine the above two steps of alternative approach
select *
from movies
where imdb_rating = (select max(imdb_rating) from movies) ;
--                  |____________________________________| 
--                                    |⬇️|
--                                 Subquery


# 2. Subquery returning a List of Values

# min & max imdb rating movies in a single query

select *
from movies
where imdb_rating in (
	(select max(imdb_rating) from movies),
    (select min(imdb_rating) from movies)
    );


# 3. Subquery returning a Table

-- select all the actors with age between 70 and 85
select * 
from actors
where age >= 70 and age < 85;
-- the problem with the above query is that we don't have age column in actors table

-- we need to get a table that includes actors age as well
select * 
from (
	select 
		name,
		year(curdate()) - birth_year as age
	from actors
	) as actors_age
where age >= 70 and age < 85
order by age desc;