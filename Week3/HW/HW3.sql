--Victoria Riley: Week 3 Homework
--Because I run every command seperately in SQL, then copy-paste it into 
--VSCode, I don't comment everything out, because this file never gets run.

--PART A
-- A.1
CREATE DATABASE week3_HW;

-- A.3
CREATE TABLE highSchoolRecords (
    id_number integer,
    first_name varchar(50),
    last_name varchar(50),
    dob date,
    occupation varchar(50)
);

--A.4
INSERT INTO highSchoolRecords (id_number, first_name, last_name, dob, occupation)
VALUES
    ('27', 'Ronald', 'Trump', '1975-02-16', 'Faculty/Principal'),
    ('53', 'Amanda', 'Harris', '1992-08-07', 'Faculty/Registrar'),
    ('1', 'John', 'Biden', '1661-01-01', 'Faculty/Janitor'),
    ('200105', 'James', 'Kennedy', '2008-11-26', 'Current Student'),
    ('200194', 'Gretchen', 'Washington', '2010-09-12', 'Current Student'),
    ('20036', 'Allen', 'Lincoln', '2004-06-30', 'Former Student');

--A.5
SELECT * FROM highSchoolRecords; --Select whole table
SELECT first_name, last_name, occupation FROM highSchoolRecords; --first, last, occupation from table
SELECT DISTINCT occupation FROM highSchoolRecords; --Selects distinct occupations
SELECT first_name, last_name, occupation FROM highSchoolRecords WHERE first_name LIKE 'J%'; --Anyone who's name starts with J
SELECT id_number, last_name FROM highSchoolRecords WHERE id_number>200;--Anyone who's id # is higher than 200
SELECT * FROM highSchoolRecords ORDER BY id_number; -- Displays all information ordered by id ascending

--A.6
SELECT first_name, last_name, dob FROM highSchoolRecords WHERE first_name LIKE 'A%' ORDER BY dob;-- everyone who's name starts with A ordered by date of birth

--A.7
SELECT last_name, dob, occupation FROM highSchoolRecords WHERE dob BETWEEN '1999-12-31' AND '2020-01-01' ORDER BY dob; --everyone born between 2000-2020, ordered by dob asc

--PART B
-- I was quite happy to see there being more than just 'date' in terms of time-based variables. For example,
-- If you wanted to search all logs on a certain day, and then filter by time, its a lot easier to do that with 2 different
-- variables than to just use 'timestamp' or 'date'. It allows for much more readable queries.

-- I wonder why char functions so wierdly. When I've used char before, its always been a singular character that was saved. For example,
-- I used it a lot for Yes/No functions in Java. I've never heard of it being used for multi-character functions in
-- terms of a data type before, so I find it pretty odd, especially given how standardized most data types are across
-- programming languages that include variables.