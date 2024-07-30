# SELECT Query
SELECT * FROM movies;

SELECT * FROM financials;

SELECT * FROM actors;

SELECT * FROM languages;

SELECT * FROM movie_actor;

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