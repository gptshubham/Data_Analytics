-- Data Retrieval using Text Queries
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

-- Data Retrieval using Numeric Queries
/*
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
*/

-- Summary Analytics
/*
-- maximum imdb rating for bollywood movies (Highest IMDB Rating for a bollywood movies)
SELECT MAX(imdb_rating)
FROM movies
WHERE industry = "bollywood";

-- Highest Rated Bollywood Movie
SELECT *
FROM movies
WHERE industry="bollywood" ORDER BY imdb_rating DESC LIMIT 1;

SELECT *
FROM movies
WHERE industry="bollywood" ORDER BY imdb_rating DESC LIMIT 3;

-- minimum imdb rating for bollywood movies (Lowest IMDB Rating for a bollywood movies)
SELECT MIN(imdb_rating)
FROM movies
WHERE industry="bollywood";

-- Average rating of Marvel Movies
SELECT AVG(imdb_rating)
FROM movies
WHERE studio="marvel studios";

-- min, max and average imdb rating of marvel movies
SELECT MIN(imdb_rating) as min_rating,
	MAX(imdb_rating) as max_rating,
	ROUND(AVG(imdb_rating),1) as avg_rating
FROM movies
WHERE studio="marvel studios";

-- number of movies from different industries
SELECT 
	industry, COUNT(*) as count
FROM movies
GROUP BY industry;

-- number of movies from different studios
SELECT
	studio, COUNT(*) as count
FROM movies
GROUP BY studio
ORDER BY count DESC;

-- number of movies in differet industries with average imdb rating
SELECT 
	industry,
    COUNT(industry) as count,
    ROUND(AVG(imdb_rating),1) as avg_rating
FROM movies
GROUP BY industry;

-- number of movies produced by differet studios with their average imdb rating
SELECT
	studio,
    COUNT(studio) as count,
    ROUND(AVG(imdb_rating),1) as avg_rating
FROM movies
WHERE studio!=""
GROUP BY studio 
ORDER BY avg_rating DESC;

-- why do we have two rows for Universal Pictures ?
-- 'Universal Pictures'
-- 'Universal Pictures  '
-- Ans: it's because of the data error --> extra space in the end of 'Universal Pictures  '
-- we can simply clean it using the concepts that we have learnt in excel data cleaning --> Find and Replace

-- Summary Analytics Revision
*/

-- Having Clause
-- print all years where more than 2 movies were released
SELECT release_year, COUNT(*) as movies_count
FROM movies
GROUP BY release_year
HAVING movies_count > 2
ORDER BY movies_count DESC;

-- Calculated Columns
-- Actors' Age Column
SELECT *, YEAR(CURDATE()) - birth_year AS age
FROM actors;

-- Profit Column
SELECT * , revenue - budget as Profit
FROM financials;
-- Alternatively we can get profit column just after revenue column or anywhere we want for that matter
SELECT movie_id, budget, revenue, revenue - budget as profit , unit, currency
FROM financials;

-- currency conversion
SELECT 
	*,
    IF(currency='USD',budget * 84,budget) as budget_in_INR,
    IF(currency='USD',revenue * 84,revenue) as revenue_in_INR,
    IF(currency='USD',(revenue - budget) * 84,revenue - budget) as profit_in_INR
FROM financials;
    
-- unit conversion
-- checking no. of different units
SELECT distinct unit 
FROM financials;
-- since we have more than two units ==> CASE Statement
SELECT * ,
CASE
	WHEN unit='billions' THEN revenue*1000
    WHEN unit='Thousands' THEN revenue/1000
    ELSE revenue
END AS revenue_mln,
CASE
	WHEN unit='billions' THEN budget*1000
    WHEN unit='Thousands' THEN budget/1000
    ELSE budget
END AS budget_mln,
CASE
	WHEN unit='billions' THEN (revenue - budget)*1000
    WHEN unit='Thousands' THEN (revenue - budget)/1000
    ELSE revenue - budget
END AS profit_mln
FROM financials;