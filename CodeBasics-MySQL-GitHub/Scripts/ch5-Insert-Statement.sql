# Inserting a record into database by Manually Writing the Query
INSERT INTO moviesdb.movies
VALUES 	(141, "Bahubali 3", "Bollywood", 2030, 9.0, "Arka Media Works", 2);


# Inserting a record with incomplete info
INSERT INTO moviesdb.movies
(title, industry, release_year) -- included in case we don't have info about all the columns and we are skipping a few
VALUES 	("Bahubali 4", "Bollywood", 2030);


# Inserting a record with incomplete info
INSERT INTO moviesdb.movies
VALUES 	(DEFAULT, "Bahubali 5", "Bollywood", 2030, NULL, NULL, 2);


# Insering multiple records
INSERT INTO moviesdb.movies
	(title, industry, language_id)
VALUES
	("Inception 2", "Hollywood", 5),
    ("Inception 3", "Hollywood", 5),
    ("Inception 4", "Hollywood", 5);


SELECT * FROM moviesdb.movies;

