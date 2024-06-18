# update statement
update moviesdb.movies set release_year = 2040 
where (movie_id = (select * from movies where title like "inception"));

update moviesdb.movies 
set studio = "Warner Bros. Pictures"
where title like "%inception%";

-- However instead of running the above query, It's recommended to run the following queries
-- to get a general idea of what we are changing, and to avoid a potential damage

-- fetching the primary keys of the target rows
SELECT movie_id FROM movies where title like "%inception%";
-- updating the target rows using the primary keys fetched
update moviesdb.movies 
set studio = "Warner Bros. Pictures"
where movie_id in (112, 145, 146, 147);


# Delete Statement
delete from moviesdb.movies 
where movie_id = 147;

-- however to be on safe side or to avoid unintended damage use these queries instead of the above delete statement

-- fetching the primary keys of the target rows
select * from movies where title like "%inception%";
-- deleting the target rows using their primary keys as fetched
delete from moviesdb.movies 
where movie_id in (145, 146);

-- now deleting bahubali 3, 4 & 5

-- fetching the primary keys of the target rows
select * from movies where title like "%bahubali%";
-- deleting the target rows
delete from moviesdb.movies
where movie_id in (141, 142, 144);

-- checking the effect of the above query
select * from movies