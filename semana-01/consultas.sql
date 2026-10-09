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

-- =====================================================
-- Semana 1 - DB Fiddle, consultas inventadas
-- Fuente: Claude
-- =====================================================

-- Mostrá el cliente y el producto de todos los préstamos.
SELECT cliente, producto FROM prestamos;

-- Mostrá todas las columnas de todos los préstamos.
SELECT * FROM prestamos;

-- Cliente y monto de los préstamos de más de 1.000.000.
SELECT cliente, monto FROM prestamos
where monto > 1000000;

-- Todos los datos de los préstamos con id entre 4 y 8
SELECT * FROM prestamos
WHERE id BETWEEN 4 AND 8;

-- Cliente y situación de los préstamos cuya situación no sea 1
SELECT CLIENTE, SITUACION FROM prestamos
WHERE SITUACION != 1;

-- Cliente, monto y plazo de los préstamos de más de 1.000.000 y plazo de 36 meses o más
SELECT CLIENTE, MONTO, PLAZO_MESES FROM prestamos
WHERE MONTO > 1000000 AND PLAZO_MESES >= 36;

-- Todos los datos de los préstamos que no son de Buenos Aires
SELECT * FROM prestamos
WHERE provincia != "Buenos Aires";

-- Lista de productos sin repetir, en orden alfabético
SELECT DISTINCT producto FROM prestamos
ORDER BY producto ASC;

-- Los 3 préstamos de mayor monto (cliente y monto)
SELECT cliente,monto FROM prestamos
ORDER BY monto DESC
LIMIT 3;

-- Los préstamos de menor monto, salteando los 3 primeros y mostrando los 3 siguientes
SELECT cliente,monto FROM prestamos
ORDER BY monto ASC
LIMIT 3 OFFSET 3;

-- Cliente y monto de los préstamos personales de Córdoba, de mayor a menor monto.
SELECT cliente,monto FROM prestamos
WHERE provincia="Córdoba"
ORDER BY monto DESC;

-- Los 2 préstamos más antiguos (cliente y fecha)
SELECT cliente,fecha_otorgamiento FROM prestamos
ORDER BY fecha_otorgamiento ASC
LIMIT 2;

-- Cliente y tasa de los préstamos con situación 3 o peor, de mayor a menor tasa
SELECT cliente,tasa_anual FROM prestamos
WHERE situacion >= 3
ORDER BY tasa_anual DESC;

-- =====================================================
-- Semana 1 - SQLBolt, lecciones 6 a 8
-- Fuente: sqlbolt.com
-- =====================================================

-- LESSON 6 ASSIGNMENT 1 Find the domestic and international sales for each movie
SELECT title, Domestic_sales, International_sales FROM movies
INNER JOIN Boxoffice ON Id = Movie_id;

-- LESSON 6 ASSIGNMENT 2 Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, Domestic_sales, International_sales FROM movies
INNER JOIN Boxoffice ON Id = Movie_id
WHERE International_sales > Domestic_sales;

-- LESSON 6 ASSIGNMENT 3 List all the movies by their ratings in descending order
SELECT title, Domestic_sales, Rating FROM movies
INNER JOIN Boxoffice ON Id = Movie_id
ORDER BY Rating DESC;

-- LESSON 7 ASSIGNMENT 1 Find the list of all buildings that have employees
SELECT DISTINCT Building FROM employees
WHERE  Name != "NULL";

-- LESSON 7 ASSIGNMENT 2 Find the list of all buildings and their capacity
SELECT Building_name, Capacity FROM Buildings;

-- LESSON 7 ASSIGNMENT 3 List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT Building_name, Role FROM Buildings
LEFT JOIN Employees ON Building_name = Building;

-- LESSON 8 ASSIGNMENT 1 Find the name and role of all employees who have not been assigned to a building
SELECT Name, Role FROM employees
WHERE Building IS NULL;

-- LESSON 8 ASSIGNMENT 2 Find the names of the buildings that hold no employees
SELECT Building_name FROM Buildings
LEFT JOIN Employees ON Building_name=Building
WHERE Building IS NULL;

-- =====================================================
-- Semana 1 - DB Fiddle, consultas inventadas Part 2
-- Fuente: Claude
-- =====================================================

-- Mostrá el nombre del cliente, el producto y el monto de cada crédito. ¿Cuántas filas obtenés? (Obtengo 9)
SELECT cl.nombre, cr.producto, cr.monto
FROM creditos cr
INNER JOIN clientes cl ON cr.cliente_id = cl.id;

-- Lo mismo, solo para créditos de más de 1.000.000, de mayor a menor monto.
SELECT cl.nombre, cr.producto, cr.monto
FROM creditos cr
INNER JOIN clientes cl ON cr.cliente_id = cl.id
WHERE monto > 1000000
ORDER BY monto DESC;

-- Lo mismo, solo para clientes de Córdoba.
SELECT cl.nombre, cr.producto, cr.monto, cl.provincia
FROM creditos cr
INNER JOIN clientes cl ON cr.cliente_id = cl.id
WHERE monto > 1000000 AND cl.provincia = "Córdoba"
ORDER BY monto DESC;

-- Mostrá todos los clientes con su producto y monto, incluso los que no tienen créditos. Ordená por nombre.
SELECT cl.nombre, cr.producto, cr.monto
FROM clientes cl
LEFT JOIN creditos cr ON cl.id = cr.cliente_id
ORDER BY cl.nombre ASC;

--Sin escribir consulta: comparando con el ejercicio 1a, ¿cuántas filas más aparecen y qué valor tienen producto y monto en ellas? 
--aparecen 3 filas más (12 contra 9): Joaquín Suárez, Julieta Ramos y Sofía Herrera, con producto y monto en NULL.

-- Ahora mostrá todos los créditos con el nombre de su cliente, incluso el que no tiene cliente asignado.
SELECT monto, nombre, producto
FROM creditos cr
LEFT JOIN clientes cl ON cl.id = cr.cliente_id
ORDER BY cr.monto ASC;

-- Nombre de los clientes sin email cargado.
SELECT nombre FROM clientes
WHERE email IS NULL;

-- Nombre de los clientes que no tienen ningún crédito.
SELECT cl.nombre, cr.monto FROM clientes  cl
LEFT JOIN creditos cr ON cl.id = cr.cliente_id
WHERE cr.id IS NULL;

--Nombre, producto y monto de los créditos activos (sin fecha de cancelación).
SELECT cl.nombre, cr.producto, cr.monto FROM creditos cr
LEFT JOIN clientes  cl ON cr.cliente_id  = cl.id
WHERE cr.fecha_cancelacion IS NULL;

-- Todos los datos del crédito sin cliente asignado
SELECT * FROM creditos cr
LEFT JOIN clientes  cl ON cr.cliente_id  = cl.id
WHERE cl.nombre IS NULL;

-- Los 3 créditos activos de mayor monto, de clientes con email cargado: nombre, provincia, producto y monto.
SELECT cl.nombre, cl.provincia, cr.producto, cr.monto FROM creditos cr
LEFT JOIN clientes  cl ON cr.cliente_id  = cl.id
WHERE cr.fecha_cancelacion IS NULL AND cl.email IS NOT NULL
ORDER BY cr.monto DESC
LIMIT 3;

-- Provincias distintas, en orden alfabético, de clientes con algún crédito en situación 3 o peor.
SELECT DISTINCT cl.provincia, cr.situacion FROM creditos cr
LEFT JOIN clientes  cl ON cr.cliente_id  = cl.id
WHERE cr.situacion >= 3
ORDER BY cr.situacion ASC;

-- Clientes que no tienen créditos y no tienen email (no podemos contactarlos ni ofrecerles nada).
SELECT DISTINCT cl.nombre, cl.email, cr.monto FROM clientes cl
LEFT JOIN creditos cr ON cr.cliente_id  = cl.id
WHERE cl.email IS NULL AND cr.monto IS NULL;

-- =====================================================
-- Semana 1 - SQLBolt, lecciones 9 a 12
-- Fuente: sqlbolt.com
-- =====================================================

-- LESSON 9 ASSIGNMENT 1 List all movies and their combined sales in millions of dollars
SELECT Title, (Domestic_sales+International_sales)/1000000 AS Combined_sales
FROM Boxoffice
JOIN Movies WHERE Id = Movie_id
ORDER BY Combined_sales DESC;

-- LESSON 9 ASSIGNMENT 2 List all movies and their ratings in percent
SELECT Title, Rating*10 AS Rating_percentage
FROM Boxoffice
JOIN Movies WHERE Id = Movie_id
ORDER BY Rating DESC;

-- LESSON 9 ASSIGNMENT 3 List all movies that were released on even number years
SELECT title, year
FROM movies
WHERE year % 2 = 0;

-- LESSON 10 ASSIGNMENT 1 Find the longest time that an employee has been at the studio
SELECT Name, MAX (Years_employed) AS Years_employed
FROM employees;

-- LESSON 10 ASSIGNMENT 2 For each role, find the average number of years employed by employees in that role
SELECT Role, AVG (Years_employed) AS Years_employed
FROM employees
GROUP BY Role;

-- LESSON 10 ASSIGNMENT 3 Find the total number of employee years worked in each building
SELECT Building, SUM (Years_employed) AS Years_employed
FROM employees
GROUP BY Building;

-- =====================================================
-- Semana 1 - DB Fiddle, consultas inventadas Part 3
-- Fuente: Claude
-- =====================================================

-- 1.a) Para los créditos Prendarios, mostrá id, producto, monto y la cuota mensual aproximada (monto dividido plazo en meses) con el alias cuota_aprox. Quedate con las 3 cuotas más altas.
SELECT id, producto, monto, monto * 1.0 / plazo_meses AS cuota_aprox
FROM cartera
WHERE producto='prendario'
ORDER BY cuota_aprox DESC
LIMIT 3

-- 1.b) Para los créditos de Mendoza, mostrá id, provincia y el monto expresado en miles, con el alias monto_miles.
SELECT id, provincia, monto / 1000.0 AS monto_miles
FROM cartera
WHERE provincia = 'Mendoza';

-- 1.c) Mostrá id, producto y el interés anual estimado (monto por tasa anual dividido 100) con el alias interes_anual. Quedate con los 5 mayores.
SELECT id, producto, monto * tasa_anual / 100 AS interes_anual
FROM cartera
ORDER BY interes_anual DESC
LIMIT 5;

-- 2.a) En una sola consulta: cantidad de créditos, monto total, monto promedio, monto mínimo y monto máximo, cada uno con su alias.
SELECT COUNT(*) AS cantidad, SUM(monto) AS monto_total, AVG(monto) AS monto_promedio,
       MIN(monto) AS monto_minimo, MAX(monto) AS monto_maximo
FROM cartera;

-- 2.b) Mostrá la cantidad total de créditos y, al lado, cuántos tienen fecha de cancelación. ¿Cuántos están activos?
SELECT COUNT(*) AS total_creditos, COUNT(fecha_cancelacion) AS cancelados
FROM cartera;

-- 2.c) Monto total y tasa promedio de los créditos Personales activos.
SELECT SUM(monto) AS monto_total, AVG(tasa_anual) AS tasa_promedio
FROM cartera
WHERE producto = 'Personal' AND fecha_cancelacion IS NULL;

-- 3.a) Por producto: cantidad de créditos, monto total y tasa promedio, ordenado por monto total de mayor a menor.
SELECT producto, COUNT(*) AS cantidad, SUM(monto) AS monto_total, AVG(tasa_anual) AS tasa_promedio
FROM cartera
GROUP BY producto
ORDER BY monto_total DESC;

-- 3.b) Por provincia: cantidad de créditos irregulares (situación 3 o más). Ordená por cantidad descendente y, si empatan, por provincia.
SELECT provincia, COUNT(*) AS irregulares
FROM cartera
WHERE situacion >= 3
GROUP BY provincia
ORDER BY irregulares DESC, provincia ASC;

-- 3.c) Productos con más de 5 créditos.
SELECT producto, COUNT(*) AS cantidad
FROM cartera
GROUP BY producto
HAVING COUNT(*) > 5;

-- 3.d) Combinaciones de provincia y producto con monto promedio superior a 40.000.000, de mayor a menor
SELECT provincia, producto, AVG(monto) AS monto_promedio
FROM cartera
GROUP BY provincia, producto
HAVING monto_promedio > 40000000
ORDER BY monto_promedio ASC;

-- 4.a) Considerando solo los créditos activos, mostrá las 2 provincias con mayor monto total, siempre que ese total supere los 50.000.000.
SELECT provincia, SUM(monto) AS monto_total
FROM cartera
WHERE fecha_cancelacion IS NULL
GROUP BY provincia
HAVING monto_total > 50000000
ORDER BY monto_total DESC
LIMIT 2;

-- 4.b) Considerando solo los créditos en situación 1, mostrá por producto la cantidad y la tasa máxima, ordenado por tasa máxima descendente.
SELECT producto, COUNT(*) AS cantidad, SUM(monto) AS monto_total, MAX(tasa_anual) AS tasa_maxima
FROM cartera
WHERE situacion = 1
GROUP BY producto
ORDER BY tasa_maxima DESC;

-- 4.c) SELECT producto, AVG(tasa_anual) FROM cartera WHERE AVG(tasa_anual) > 70 GROUP BY producto;
-- Esta consulta da error. Explicá por qué y corregila para que muestre los productos con tasa promedio mayor a 70:
-- Respuesta: WHERE se ejecuta antes de agrupar, cuando todavía no existen los promedios por producto
SELECT producto, AVG(tasa_anual)
FROM cartera
GROUP BY producto
HAVING AVG(tasa_anual)>70;

-- =====================================================
-- Semana 1 - SQLBolt, lecciones 13 a 18
-- Fuente: sqlbolt.com
-- =====================================================

-- 13.1 Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies
Values(4, 'Toy Story 4', 'John Lasseter', 2026, 98);

-- 13.2 Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO boxoffice
Values(4, 8.7, 340000000, 270000000);

-- 14.1 The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE Movies
SET Director='John Lasseter'
WHERE id=2

-- 14.2 The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE Movies
SET Year=1999
WHERE id=3

-- 14.3 Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE Movies
SET Title='Toy Story 3', Director='Lee Unkrich'
WHERE id=11

--15.1 This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM movies
WHERE Year<2005;

-- 15.2 Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM Movies
WHERE Director='Andrew Stanton';

-- 16.1 Create a new table named Database with the following columns:
-- Name A string (text) describing the name of the database
-- Version A number (floating point) of the latest version of this database
-- Download_count An integer count of the number of times this database was downloaded
-- This table has no constraints.
CREATE TABLE Database (
id INTEGER PRIMARY KEY,
Name TEXT,
Version FLOAT,
Download_count INTEGER);

