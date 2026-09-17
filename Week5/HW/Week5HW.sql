--PART 1
CREATE DATABASE Week5;

CREATE TABLE employees (
	empID integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	firstName varchar(50),
	middleInitial varchar(1),
	LastName varchar(75),
	hireDate date
);

INSERT INTO employees (firstName, middleInitial, LastName, hireDate)
VALUES
    ('Jerrie', 'H', 'Manson', '2000-02-13'),
    ('Wendie', 'M', 'Baker', '2013-05-25'),
    ('Brenduh', 'A', 'Patterson', '2025-12-01'),
	('Nathun', 'E', 'Richter', '2010-09-17'),
    ('Cristofur', 'T', 'Delancey', '2019-08-30');
--PART 2
ALTER TABLE employees
ADD COLUMN salary numeric(6,2),
ADD COLUMN lastClockIn timestamp,
ADD COLUMN PTO real,
ADD COLUMN currentEmployee boolean;

--PART 3
UPDATE employees
SET salary = 9000.00,
	lastClockIn = '2026-09-17 08:30:00',
	PTO = '140.9',
	currentEmployee = TRUE
WHERE empID = 1;

UPDATE employees
SET salary = 8500.00,
	lastClockIn = '2026-09-17 10:00:00',
	PTO = '80.0',
	currentEmployee = TRUE
WHERE empID = 2;

UPDATE employees
SET salary = 90.00,
	lastClockIn = '2026-01-20 09:00:00',
	PTO = '0.0',
	currentEmployee = FALSE
WHERE empID = 3;

UPDATE employees
SET salary = 1000.00,
	lastClockIn = '2026-04-03 12:00:00',
	PTO = '120.0',
	currentEmployee = FALSE
WHERE empID = 4;

UPDATE employees
SET salary = 80.00,
	lastClockIn = '2026-09-17 8:45:00',
	PTO = '600.0',
	currentEmployee = TRUE
WHERE empID = 5;

--PART 4
ALTER TABLE employees
RENAME COLUMN lastClockIn TO lastClockOut;

--PART 5
-- General select statement
SELECT * FROM employees;

-- specific column select
SELECT firstName, lastName, salary, currentEmployee FROM employees;

--select specific column where PTO is 100 or more
SELECT empID, lastName, PTO FROM employees WHERE PTO >= 100.0;

--select specific column ordered by hire date ascending
SELECT empID, lastName, hireDate, lastClockOut FROM employees ORDER BY hireDate ASC;

--same as above, but only list current employees
SELECT currentEmployee, lastName, hireDate, lastClockOut FROM employees WHERE currentEmployee = TRUE ORDER BY hireDate ASC;

--PART 6
--The CSV file actually answers one of the questions I had, which was
--how SQL data is saved/transported/exported, because creating a table every single time
--you need it is really annoying, as well as mass inserting/editing a table at the skills
-- we had until know.
--The math functions are also very good, because I had some ideas for 'readable display' that would involve
--some form of math, for example using some form of 'ClockIn' and 'ClockOut' Timestamp that automatically subtracts
--one from the other to create an 'hours worked' interval that autofills its own data.

--The operators for square and cube root are so odd. Why are they |/ and ||/? The symbol '||' specifically
--makes me think of the OR operator in Java. I suppost it makes sense given that
--there's no form of 'import math' or anything like that, but since 'sqrt' seems to already exist in SQL/Postgre SQL,
--why wouldn't they just make 'cubrt' or something like that? The only reason
-- I can see is that some programs don't support writing 'sqrt'.



--REFLECTION
-- Which new data type did you find the most useful?
-- I actually see timestamp as the most useful. I really like tracking access and clock in times
-- and stuff like that, because logs are really useful and I feel theyre perfect for databases.

-- Why did you choose the data types you used?
-- I chose the data types to try to emulate what real-life databases might use to store employee records,
-- or whatever made the most sense.

-- What is the difference between ALTER TABLE and UPDATE?
-- ALTER TABLE changes the table, UPDATE changes the table's data.