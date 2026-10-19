--1
SELECT UPPER(category), AVG(price) as avgPrice from products GROUP BY category;--makes all categories uppercase
SELECT ROUND(AVG(price)) as avgPrice, color from products GROUP BY color; --average price sorted by color
SELECT NOW(), category, SUM(stock) as stockTotal from products GROUP BY category; --creates a table with the current timestamp, category, and the total amount of stock per category

--2
CREATE VIEW HighPriceProducts AS 
SELECT UPPER("Name"), LOWER(description), price FROM products WHERE price > 200;

--3
SELECT * FROM HighPriceProducts;
