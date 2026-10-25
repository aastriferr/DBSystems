CREATE DATABASE Week10;

CREATE TABLE products("Index" integer PRIMARY KEY, "Name" varchar(100), Description text, Brand text, Category varchar(75), price numeric(10,2), Currency varchar(5), 
Stock integer, EAN text, Color text, "Size" text, Availability text, Internal_ID integer);

--imported products100.csv

--part2
SELECT category, CEIL(AVG(price)) AS rounded_price 
FROM products
GROUP BY category;

SELECT category, MAX(price) AS maxPrice, MIN(price) as minPrice
FROM products
GROUP BY category;

SELECT category, FLOOR(AVG(price)) as RDPrice
FROM products
GROUP BY category;

SELECT UPPER(category), ROUND(AVG(price), 2) as avgPrice
FROM products
GROUP BY category;

--part 3
CREATE VIEW category_overview AS
SELECT category, ROUND(AVG(price), 2) AS avgPrice, SUM(stock) as totalStock 
FROM products 
GROUP BY category 
HAVING ROUND(AVG(price), 2) > 50
ORDER BY avgPrice DESC;

--part 4
SELECT * FROM category_overview;