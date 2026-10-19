CREATE TABLE products("Index" integer PRIMARY KEY, "Name" varchar(100), Description text, Brand text, Category varchar(75), price numeric(10,2), Currency varchar(5), 
Stock integer, EAN text, Color text, "Size" text, Availability text, Internal_ID integer);

--SQL functions are builtin operations that perform a specific task inside a query
--round(x,n)- round a number to n decimals
--CEIL(x)/FLOOR(x), round up/down(SELECT CEIL(2.1) -> 3)


--Text functions
--UPPER(x)/LOWER(x) converts all text to uppercase/lowercase
--LENGTH(x) returns character count

--date functions
--NOW() returns current timestamp
--CURRENT_DATE todays date(no parentheses)
--AGE() returns the difference of time between 2 dates (yyyy-mm-dd, yyyy-mm-dd)

--avg price by category
SELECT category, ROUND(AVG(price), 2) AS avgPrice FROM products GROUP BY category ORDER BY avgPrice DESC;--stacked/nested functions


--VIEWS
--View is a saved query(essentially a function)
CREATE VIEW product_summary AS --everything after this point is the query being saved
SELECT category, ROUND(AVG(price), 2) AS avgPrice, SUM(stock) as totalStock FROM products GROUP BY category ORDER BY avgPrice DESC;
--To Call view
SELECT * FROM product_summary;
--To update view
--REPLACE VIEW product_summary AS SELECT ...
--remove view
DROP VIEW product_summary;
