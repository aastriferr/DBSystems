
--PART A
CREATE DATABASE PracticeMathDB;

--For the absolute LIFE of me, I could not get
--any form of zip file to extract correctly. I tried 
--probably about 10 times? So I found a file on github
--that seemed about right. I included the CSV so you could 
--see the type of data I'm working with.
CREATE TABLE customers(custIndex integer PRIMARY KEY,
	custId varchar(20),
	fName varchar(30),
	lName varchar(50),
	company varchar(100),
	city varchar(50), 
	country varchar(75),
	phone1 varchar(40),
	phone2 varchar(40),
	email varchar(40), 
	subDate date,
	website varchar(75));


--I had no good numeric or int columns to perform operations on,
--so I added these 2 columns
ALTER TABLE customers
ADD COLUMN subPrice numeric(7,2),
ADD COLUMN timesSubbed integer;
--Did this so there were no null values
UPDATE customers
	SET subPrice = 500.00,
	timesSubbed = 1
WHERE email LIKE '%@%';
--And then ran these so there were varying values
UPDATE customers
	SET subPrice = 700.00
WHERE email LIKE '%.com';
UPDATE customers
	SET timesSubbed = 5
WHERE email LIKE '%.org';
UPDATE customers
	SET subPrice = 300
WHERE email LIKE '%.net';
UPDATE customers
	SET timesSubbed = 50
WHERE email LIKE '%.info';
UPDATE customers
	SET subPrice = 200
WHERE phone1 LIKE '%x%';
UPDATE customers
	SET timesSubbed = 3
WHERE phone2 LIKE '%x%';
-- Yeah, it kind of sucks, but i was able to do it in
-- like 5 minutes instead of manual entering 200 values.
-- I did include my version of the table(exported from pgAdmin) 
-- with all of the inserted and edited values so you can 
-- see it as well.



--total subscripton/inventory value
SELECT SUM(subPrice*timesSubbed) AS total_subscription_value FROM customers;
--avg price per times subbed/category(i tried country but it was too distinct)
SELECT avg(subPrice), timesSubbed FROM customers GROUP BY timesSubbed;
--prices above 500
SELECT subPrice, fName, lName FROM customers WHERE subPrice > 500;
--how many names are in the table
SELECT COUNT(fName) FROM customers;
--order customers by price cheapest to most expensive
SELECT fName, lName, subPrice FROM customers ORDER BY subPrice;



--PART B
--It seems JOIN is the keyword that makes large-scale databases able to function. Up until now, we've only had singular tables, 
--which are great, but when it comes to large scale, ultimately ineffective. Mulitple tables are both more readable and
--allow for more specific information per table, which is really good. I noticed that querying multiple tables seems to use
--a OOP syntax, or at least something similar, which makes it very easy to understand. It's much like querying 
--one table but just zoomed out a layer, because now you have to denote which table's column 
--you're targeting instead of the program already knowing what table because there was only one.

--It's kind of specific, but I'm curious as to why adding multiple tables to a query doesnt just use commas in the 
--FROM section of a query statement. So far, the syntax for addressing multiple rows as well as editing multiple rows has been
--fairly consistent, just separated by a comma. I guess it's because you can specify different types of JOIN easier that way?

--This is overall a massive chapter and there's a lot more that I don't grasp I'll understand it a lot more by doing it
--next week.


