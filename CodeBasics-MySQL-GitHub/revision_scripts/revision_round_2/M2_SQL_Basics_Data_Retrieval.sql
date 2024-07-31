# SELECT Query
SELECT * FROM movies;

SELECT * FROM financials;

SELECT * FROM actors;

SELECT * FROM languages;

SELECT * FROM movie_actor;

# Text Queries

-- movie, indutry
SELECT title, industry FROM movies;

-- movies form bollywood
SELECT * FROM movies WHERE industry="Bollywood";

-- bollywood movies count
SELECT COUNT(*) FROM movies WHERE industry = "Bollywood";

-- hollywood movies count
SELECT COUNT(*) FROM movies WHERE industry = "hollywood";

-- unique movie industries
SELECT DISTINCT industry FROM movies;

-- all thor movies released
SELECT * FROM movies WHERE title LIKE "%Thor%";

-- all captain america movies
SELECT * FROM movies WHERE title LIKE "%america%";

-- all movies without studio
SELECT * FROM movies WHERE studio = "";

-- for all Marvel Studios movies with titles and release year.
SELECT title, release_year FROM movies WHERE studio LIKE "%marvel%";

-- all movies that have Avenger in their name.
SELECT * FROM movies WHERE title LIKE "%avenger%";

-- the year when the movie "The Godfather" was released.
SELECT release_year FROM movies WHERE title = "The Godfather";

-- all distinct movie studios in the Bollywood industry.
SELECT DISTINCT studio FROM movies WHERE industry = "Bollywood";

# Numeric Queries

-- movies with imdb rating greater than 9
SELECT * FROM movies WHERE imdb_rating > 9;

-- movies with imdb rating of 9 or above
SELECT * FROM movies WHERE imdb_rating >=9;

-- movies with imdb rating between 6 and 8
SELECT * FROM movies WHERE imdb_rating BETWEEN 6 AND 8;  # better query
-- alternatively
SELECT * FROM movies WHERE imdb_rating >= 6 AND imdb_rating <= 8;

-- movies that were released in the year 2022, 2019 and 2018
SELECT * FROM movies WHERE release_year in (2022,2019,2018);  # better query
-- alternatively
SELECT * FROM movies WHERE release_year = 2022 OR release_year = 2019 OR release_year = 2018;

-- movies by Zee Studios and Marvel Studios
SELECT * FROM movies WHERE studio in ("Zee Studios","Marvel Studios");

-- movies with no imdb rating record
SELECT * FROM movies WHERE imdb_rating IS NULL;

-- movies with a valid imdb rating value
SELECT * FROM movies WHERE imdb_rating IS NOT NULL;

-- imdb rating of all the bollywood movies
SELECT title, imdb_rating FROM movies WHERE industry="bollywood";

-- highest rated bollywood movie
SELECT * 
FROM movies 
WHERE industry = "bollywood" 
ORDER BY imdb_rating DESC
LIMIT 1;

-- top 5 highest rated hollywood movies
SELECT * 
FROM movies 
WHERE industry = "hollywood" 
ORDER BY imdb_rating DESC
LIMIT 5;

-- top 5 highest rated bollywood movies starting from 2nd highest rating
SELECT *
FROM movies
WHERE industry = "bollywood"
ORDER BY imdb_rating DESC
LIMIT 5
OFFSET 1;

-- movies in the order of their release year (latest first)
SELECT * 
FROM movies
ORDER BY release_year DESC;

-- movies released after 2020
SELECT * 
FROM movies
WHERE release_year >= 2020;

-- movies released after the year 2020 that have more than 8 rating
SELECT * 
FROM movies 
WHERE release_year >= 2020 AND imdb_rating > 8;

-- THOR movies sorted by their release year
SELECT * 
FROM movies
WHERE title LIKE "%thor%"
ORDER BY release_year DESC;

-- all movies that are not from Marvel Studios
SELECT * 
FROM movies 
WHERE studio NOT IN ("Marvel Studios");

# Summary Analytics

-- max imdb rating for bollywood movies
SELECT 
	MAX(imdb_rating) "Max Rating Bollywood"
FROM movies 
WHERE industry = "bollywood";

-- min imdb rating for Bollywood movies
SELECT 
	MIN(imdb_rating) "Min Rating Bollywood"
FROM movies 
WHERE industry = "bollywood";

-- min, max and average imdb rating of Marvel movies
SELECT 
	MAX(imdb_rating) "Marvel Max Rating",
	ROUND(AVG(imdb_rating),1) "Marvel Avg Rating",
    MIN(imdb_rating) "Marvel Min Rating"
FROM movies
WHERE studio LIKE "%marvel%";

-- no. of movies industry-wise
SELECT 
	industry, 
    COUNT(*) as Count
FROM movies
GROUP BY industry
ORDER BY Count DESC;

-- no. of movies studio-wise
SELECT 
	studio,
    COUNT(*) as Count
FROM movies
GROUP BY studio
ORDER BY Count DESC;

-- industry, movies count, average industry rating sorted by average rating highest first
SELECT 
	industry, 
    COUNT(*) as count,
    ROUND(AVG(imdb_rating),1) as avg_rating
FROM movies
GROUP BY industry
ORDER BY avg_rating DESC;

-- studio, movies count, average studio rating sorted by average rating highest first
SELECT 
	studio, 
    COUNT(*) as count,
    ROUND(AVG(imdb_rating),1) as avg_rating
FROM movies
WHERE studio != ""
GROUP BY studio
ORDER BY avg_rating DESC;

