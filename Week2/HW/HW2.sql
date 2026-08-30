--PART A
CREATE DATABASE PracticeDB;

CREATE TABLE DataTypes(
	Table_Num numeric PRIMARY KEY,
	Type_Name varchar(75),
	Description varchar(75),
	Example varchar(50),
	Rating numeric
);

INSERT INTO DataTypes(Table_Num, Type_Name, Description, Example, Rating)
VALUES ('1', 'Integer', 'Whole Numbers', '1,200','7'), 
	('2', 'String', 'A string of most characters', 'a, hello, hi!', '10'),
	('3', 'Boolean', 'True or False', 'True and False OR 0 and 1', '7'),
	('4', 'Float', 'Any number, including decimals', '10.2, 15, 25.0', '10');


INSERT INTO DataTypes(Table_Num, Type_Name, Description, Example, Rating)
VALUES ('5' 'Char' 'One Character' 'a, x, z' '8');
--ERROR:  syntax error at or near "'Char'"
--LINE 3: VALUES ('5' 'Char' 'One Character' 'a, x, z' '8');
--                    ^ 




--PART B
--I noticed the ORDER_BY sorter. I was wondering if there 
--were any more specific ways to sort instead of just pulling
--from certain tables, and order_by was exactly what I was thinking of.
--I also noticed the more specific wildcards, which surprised me, and I 
--think that's great specifically for databases.

--I don't really have any questions, I really need to get used to the formatting,
--because its a lot of programming concepts mashed together in a different format.
--If I had to ask a question, one thing I would ask(which I'm sure that the answer is 'yes') is:
--   Is there a way to customize the formatting of the return query in sql, or is that left
--   more front end coding?