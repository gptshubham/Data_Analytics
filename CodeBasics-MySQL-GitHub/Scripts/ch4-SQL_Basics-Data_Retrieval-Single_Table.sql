/* 
SELECT * FROM moviesdb.movies;
SELECT * FROM movies;

SELECT title, industry FROM movies;
SELECT title, release_year FROM movies;
SELECT title, imdb_rating FROM movies;

-- WHERE keyword
SELECT * FROM movies WHERE industry = "bollywood";
SELECT title, release_year, imdb_rating, industry FROM movies WHERE industry = "bollywood";

-- COUNT()
SELECT COUNT(*) FROM movies WHERE industry = "bollywood";
SELECT COUNT(*) FROM movies WHERE industry = "hollywood";

-- distinct keyword
SELECT distinct industry FROM movies;
SELECT COUNT(distinct industry) FROM movies;
SELECT distinct language_id FROM movies;
SELECT COUNT(distinct language_id) FROM movies;

-- % wildcard
SELECT * FROM movies WHERE title LIKE "%thor%";
SELECT * FROM movies WHERE title LIKE "thor%";
SELECT * FROM movies WHERE title LIKE "%america%";

-- empty string
SELECT * FROM movies WHERE studio = "";
*/
-- Numeric Query : >, >=, < , <= 
-- Movies where imdb rating is greater than 9
SELECT * FROM movies WHERE imdb_rating > 9;
-- Movies where imdb rating is 9 or above
SELECT * FROM movies WHERE imdb_rating >= 9;
-- Movies where imdb rating is between 6 and 8
SELECT * FROM movies WHERE imdb_rating >= 6 and imdb_rating <= 8;
SELECT * FROM movies WHERE 6 <= imdb_rating <= 8; -- Doesn't Work
SELECT * FROM movies WHERE imdb_rating BETWEEN 6 AND 8;
-- Movies released in years 2022, 2018, or 2019
SELECT * 
FROM movies
WHERE release_year=2022 OR release_year=2019 OR release_year=2018;

-- Alternatively
SELECT *
FROM movies
WHERE release_year IN (2022,2019,2018);

-- Movies from Zee Studio or Marvel Studios
SELECT *
FROM movies
WHERE studio IN ("zee studios","Marvel Studios");

-- Movies with imdb_rating as null
SELECT *
FROM movies
WHERE imdb_rating IS NULL;

-- Movies with imdb_rating
SELECT *
FROM movies
WHERE imdb_rating IS NOT NULL;

-- Ascending Order
SELECT *
FROM movies
ORDER BY release_year;

SELECT *
FROM movies
ORDER BY imdb_rating;

-- Descending Order
SELECT *
FROM movies
ORDER BY release_year DESC;

SELECT *
FROM movies
ORDER BY imdb_rating DESC;

-- LIMIT
-- First 5 highest rated movies
SELECT *
FROM movies
ORDER BY imdb_rating DESC LIMIT 5;

-- 6th to 10th Highest Rated Movies
SELECT *
FROM movies
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 5;