-- INNER JOIN
SELECT 
	m.movie_id, title, budget, revenue, currency, unit
FROM movies m
JOIN financials f
ON m.movie_id=f.movie_id;

-- LEFT JOIN
SELECT 
	m.movie_id, title, budget, revenue, currency, unit
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id;

-- RIGHT JOIN
SELECT 
	f.movie_id, title, budget, revenue, currency, unit
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id;

-- FULL JOIN
SELECT 
	m.movie_id, title, budget, revenue, currency, unit
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id
UNION
SELECT 
	f.movie_id, title, budget, revenue, currency, unit
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id;

-- USING clause

-- Inner Join
SELECT 
	movie_id, title, budget, revenue, currency, unit
FROM movies 
JOIN financials
-- ON m.movie_id=f.movie_id;
USING (movie_id);

-- Left Join
SELECT
	movie_id, title, budget, revenue, currency, unit
FROM movies
LEFT JOIN financials
USING (movie_id);
-- similarly we can do Right Join and Full Join also with USING clause

