select count(*) from movies where industry="bollywood";


select max(imdb_rating) as max_rating
from movies
where industry="bollywood";


select min(imdb_rating) as min_rating
from movies
where industry="bollywood";


select round(avg(imdb_rating),1) as avg_rating
from movies
where studio="marvel studios";


select 
	min(imdb_rating) as min_rating,
	max(imdb_rating) as max_rating,
    round(avg(imdb_rating),1) as avg_rating
from movies
where studio="marvel studios";


select 
	industry, count(*) as No_of_movies
from movies
group by industry;


select 
	studio, 
    count(*) as No_of_movies,
    round(avg(imdb_rating),1) as avg_rating
from movies
where studio != ''
group by studio
order by avg_rating desc;


select
	release_year,
    count(release_year) as No_of_movies
from movies
where release_year between 2015 and 2022
group by release_year
order by release_year;


select 
	max(release_year) as max_year,
    min(release_year) as min_year
from movies;


select
	release_year,
    count(*) as No_of_movies
from movies 
group by release_year
order by release_year desc;

select 
	release_year,
    count(*) as movies_count
from movies
group by release_year
having movies_count >= 2
order by movies_count desc;

# from --> where --> group by
# from --> where --> group by --> having --> order by

