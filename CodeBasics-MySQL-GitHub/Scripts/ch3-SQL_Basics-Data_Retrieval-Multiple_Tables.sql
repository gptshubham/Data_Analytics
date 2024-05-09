-- SQL Joins
/*
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
*/

-- Cross Joins
/*
SELECT * FROM food_db.items;
SELECT * FROM food_db.variants;

SELECT *
FROM food_db.items
CROSS JOIN food_db.variants;

SELECT COUNT(*)
FROM food_db.items
CROSS JOIN food_db.variants;

SELECT
	food_db.items.name,
    food_db.variants.variant_name,
    (food_db.items.price + food_db.variants.variant_price) as price
FROM food_db.items
CROSS JOIN food_db.variants
ORDER BY food_db.variants.variant_name DESC;

SELECT
	*,
    concat(name," - ",variant_name) as full_name,
    (food_db.items.price + food_db.variants.variant_price) as final_price
FROM food_db.items
CROSS JOIN food_db.variants;

SELECT
    concat(name," - ",variant_name) as item,
    (food_db.items.price + food_db.variants.variant_price) as price
FROM food_db.items
CROSS JOIN food_db.variants;
*/

-- Analytics on Tables

SELECT 
	m.movie_id,
    title,
    budget,
    revenue,
    currency,
    unit,
    (revenue - budget) as profit
FROM movies m
JOIN financials f
ON m.movie_id=f.movie_id;

-- above table for bollywood movies only (movies with larger profit comes first)
SELECT 
	m.movie_id, title, budget, revenue, currency, unit,
    CASE
		WHEN unit="thousands" THEN ROUND((revenue-budget)/1000)
        WHEN unit="billions" THEN ROUND((revenue-budget)*1000)
        ELSE ROUND((revenue-budget))
    END as profit_mln
FROM movies m
JOIN financials f
ON m.movie_id=f.movie_id
WHERE industry="bollywood"
ORDER BY profit_mln DESC;
