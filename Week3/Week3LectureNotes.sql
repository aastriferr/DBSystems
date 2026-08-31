--Select statement is used to retrieve data from a table
--the asterisk is 'select all', select all columns from the table
SELECT * FROM teachers;


--SELECT = what data we want?
--FROM = where's data from?
--WHERE = what rows we want?
--ORDER BY = how do we sort results?

--display certain columns from table
SELECT first_name, school FROM teachers;


--by default postgre sql sorts in ascending order
--ASC for ascending order(1,2,3,4 or a,b,c,d or oldest to newest dates)
--DESC for descending order(4,3,2,1 or z,y,x,w or newest to oldest)
SELECT salary, first_name FROM teachers ORDER BY salary DESC;
SELECT last_name, first_name FROM teachers ORDER BY last_name ASC;


--order by multiple categories
--SELECT last_name, school, hire_date FROM teachers ORDER BY school ASC, hire_date DESC;


--Can find unique values by using DISTINCT after SELECT
--removes repeated values, makes data retrival look neater
--SELECT DISTINCT school FROM teachers;


--WHERE allows us to retrieve only rows that meet a certain condition
SELECT first_name, last_name, school FROM teachers WHERE school ='Myers Middle School';


--Comparison operators
-- = equal to
-- <>, != not equal to
-- > greater than
-- < less than
-- >= greater than equal to
-- <= less than equal to
-- BETWEEN with a range, AND between entries
-- IN match one of several values

SELECT first_name, hire_date FROM teachers WHERE hire_date < '2010-01-01'; --date is yyyy-mm-dd

--teachers who make from 40-60k
SELECT first_name, last_name, salary from teachers where salary BETWEEN 40000 AND 60000;


--if unsure what text to use, use LIKE
SELECT first_name FROM teachers WHERE first_name LIKE 'Sam%'; 
--% is a wildcard, any number of characters can appear
--LIKE is case sensitive ILIKE is not case sensitive(ILIKE is postgre specific)

-- _ matches exactly one character
SELECT first_name FROM teachers WHERE first_name LIKE '_anet';    --useful for dates

--AND functions as &&
SELECT * FROM teachers WHERE school = 'Myers Middle School' AND salary < 40000;

--OR functions as ||
SELECT * FROM teachers WHERE last_name = 'Cole' OR last_name='Bush';


--parentheses used when combining AND and OR
SELECT * FROM teachers WHERE school = 'F.D. Roosevelt HS' AND(salary<38000 OR salary>40000);
