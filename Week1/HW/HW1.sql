--PART A
select current_timestamp;

select current_database();

select version();

/*I Don't believe this is correct, and I do not
understand the block below. But After researching,
this is the only one that worked. */
DO $$ 
DECLARE 
    my_var TEXT := 'SQL';
BEGIN 
    RAISE NOTICE 'Hello, %!', my_var; 
END $$;


--PART B
/*
1)creating database: 
CREATE DATABASE databasename;
2)creating tables:
CREATE TABLE tablename (
    col2 bigserial,
    col3 varchar(25),
    col4 date,
    col5 numeric
);
bigserial-data type that auto increments starting from 1
varchar()-data type of text that should not exceed 
the length of the number within the parenthesees

3)Semicolons are important because they function as periods,
where they basically signal the end of a line or statement.
Unlike Python, where your indentation is what signals a line end,
Languages like Java or SQL need the semicolon in order to 
process correctly.

4)In my opinion, I'm most likely to use bigserial and date. 
Bigserial is nice, as it essentially creates easy lists. Date I 
can see being really important if, for example, your database logs
who accesses it. You can just grab the time and save it into a database
that's accessible if needed.



*/