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
