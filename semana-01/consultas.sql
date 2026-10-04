-- =====================================================
-- Semana 1 - SQLBolt, lecciones 1 a 5
-- Fuente: sqlbolt.com
-- =====================================================
-- LESSON 1 ASSIGNMENT 1: Find the title of each film
SELECT TITLE FROM movies;

-- LESSON 1 ASSIGNMENT 2: Find the director of each film
SELECT DIRECTOR FROM movies;

-- LESSON 1 ASSIGNMENT 3: Find the title and director of each film
SELECT TITLE, DIRECTOR FROM movies;

-- LESSON 1 ASSIGNMENT 4: Find the title and year of each film
SELECT TITLE, YEAR FROM movies;

-- LESSON 1 ASSIGNMENT 5: Find all the information about each film
SELECT * FROM movies;

-- LESSON 2 ASSIGNMENT 1: Find the movie with a row id of 6
SELECT * FROM movies WHERE ID = 6;

-- LESSON 2 ASSIGNMENT 2: Find the movies released between 2000 and 2010
SELECT * FROM movies WHERE YEAR BETWEEN 2000 AND 2010;

-- LESSON 2 ASSIGNMENT 3: Find the movies not released between 2000 and 2010
SELECT * FROM movies WHERE YEAR NOT BETWEEN 2000 AND 2010;

-- LESSON 2 ASSIGNMENT 4: Find the first 5 Pixar movies and their release year
SELECT * FROM movies WHERE Id <= 5;

-- LESSON 3 ASSIGNMENT 1: Find all the Toy Story movies
SELECT * FROM movies WHERE Title LIKE "%Toy Story%";

-- LESSON 3 ASSIGNMENT 2: Find all the movies directed by John Lasseter
SELECT Title FROM movies WHERE Director = "John Lasseter";

-- LESSON 3 ASSIGNMENT 3: Find all the movies (and director) not directed by John Lasseter
SELECT Title, Director FROM movies WHERE Director != "John Lasseter";

-- LESSON 3 ASSIGNMENT 4: Find all the WALL-* movies
SELECT Title FROM movies WHERE Title LIKE "%WALL-_";

-- LESSON 4 ASSIGNMENT 1: List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT DIRECTOR FROM movies ORDER BY DIRECTOR ASC;

-- LESSON 4 ASSIGNMENT 2: List the last four Pixar movies released (most recent first)
SELECT Title FROM movies ORDER BY year DESC LIMIT 4;

-- LESSON 4 ASSIGNMENT 3: List the first five Pixar movies sorted alphabetically
SELECT Title, year FROM movies ORDER BY title ASC LIMIT 5;

-- LESSON 4 ASSIGNMENT 4: List the next five Pixar movies sorted alphabetically
SELECT Title, year FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;

-- LESSON 5 ASSIGNMENT 1: List all the Canadian cities and their populations
SELECT * FROM north_american_cities WHERE Country = "Canada";

-- LESSON 5 ASSIGNMENT 2: Order all the cities in the United States by latitude, north to south
SELECT * FROM north_american_cities WHERE Country = "United States" ORDER BY Latitude DESC;

-- LESSON 5 ASSIGNMENT 3: List all the cities west of Chicago, ordered from west to east
SELECT * FROM north_american_cities WHERE Longitude < -87.629798 ORDER BY Longitude ASC;

-- LESSON 5 ASSIGNMENT 4: List the two largest cities in Mexico (by population)
SELECT * FROM north_american_cities WHERE Country = "Mexico" ORDER BY Population DESC LIMIT 2;

-- LESSON 5 ASSIGNMENT 5: List the third and fourth largest cities in the United States
SELECT * FROM north_american_cities WHERE Country = "United States" ORDER BY Population DESC LIMIT 2 OFFSET 2;
