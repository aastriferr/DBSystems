--STEPS TO IMPORT CSV
CREATE DATABASE week6;
--download csv, table rows should be named same as CSV column names and approximate data types
CREATE TABLE products_raw(id integer PRIMARY KEY, product_name varchar(20), brand varchar(20), category text, price numeric(10,2), stock integer);

--two different import ways
--THE HARD WAY
COPY products_raw FROM 'C:\Users\1010552.CSITECH\Downloads\products_raw.csv' DELIMITER ',' CSV HEADER;
--may break because pgAdmin doesn't have admin privileges on the computer
--THE EASY WAY
--right-click table, choose import, choose correct file, make sure encoding is UTF-8 and under options make sure header switch is flicked and delimiter is correct
--delimiter simply defines the separator

SELECT * FROM products_raw LIMIT 5; --LIMIT puts a constraint on how rows appear, LIMIT to 5 rows for example


--MATH TIME
SELECT price, stock, price*stock AS inventory_value FROM products_raw LIMIT 5;

SELECT price+5 AS Price_Increased FROM products_raw LIMIT 5;
--Built in functions that postgre has:
SELECT SUM(price*stock) as total_inventory_value FROM products_raw;--You use asterisk because its more of a wildcard rather than a operator (ig?)
SELECT AVG(price) as Average_Price from products_raw; --average of all values in a column
SELECT MIN(price), MAX(price) FROM products_raw;--Select the minimum and maximum priced item
SELECT COUNT(*) FROM products_raw; --Counts every product in a dataset

SELECT * FROM products_raw WHERE price > 500;
SELECT category, SUM(stock) FROM products_raw GROUP BY category HAVING SUM(stock)>50;--categories with total stock greater than 50
