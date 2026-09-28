-- Create a table that stores information about video games
CREATE TABLE games (
    -- Automatically generates a unique ID for each game
    game_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Stores the name of the game
    title varchar(100) NOT NULL,

    -- Stores the genre of the game
    genre varchar(50),

    -- Stores the price with 2 decimal places
    price numeric(6,2)
);


-- Add three games to the games table
INSERT INTO games (title, genre, price)
VALUES
    ('Elden Ring', 'RPG', 59.99),
    ('Minecraft', 'Sandbox', 29.99),
    ('Helldivers 2', 'Shooter', 39.99);
-- Create a second table that stores game reviews
CREATE TABLE reviews (
    -- Automatically generates a unique ID for each review
    review_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Connects each review to a game in the games table
    game_id integer REFERENCES games(game_id),
    --REFERENCES tablename(columnName)
    --foreign key is just a primary key from another table

  
    -- Stores the review score
    score integer
);
-- Add reviews and connect them to games using game_id
INSERT INTO reviews (game_id, score)
VALUES
    (1, 10), -- Elden Ring
    (2, 9),  -- Minecraft
    (1, 8);  -- Elden Ring



--These 2 tables are connected by game_id
--Primary Key uniquely identifies row/identifies the record
--A foreign key references a row in another table/connects to that record

--INNER JOIN = rows that have a match in both tables
--select the game title from games and the score from review, use games as primary table 'from', connect reviews to games table with inner join, match the rows whith the same id using ON
SELECT games.title, reviews.score FROM games INNER JOIN reviews ON games.game_id = reviews.game_id; --tablename.columnname

--LEFT JOIN keeps everything from the left table
--select game titles and its review score again
SELECT games.title. reviews.score FROM games LEFT JOIN reviews ON games.game_id = reviews.game_id; -- games is the left table due to the from statement
--HELLDIVERS appreas because of LEFT JOIN, and left join keeps everything from the left table + matches from the right

--NULL tells us that there were no matching review
--table aliases allow us to shorten table names
--g is now games, r is reviews
--select the title and review score
SELECT g.title, r.score FROM games AS g INNER JOIN reviews AS R, ON g.game_id=r.game_id WHERE r.score>=9; --as is used for aliasing, see games with score higher than nine

--JOIN just allows us to use our skills across multiple tables





--REVIEW
CREATE TABLE students(student_id integer PRIMARY KEY, student_name varchar(100), major text);
INSERT INTO students(student_id, student_name, major)
VALUES(401265, "Sebastian Talamantes", "Networking"),
(401265, "Sebastian Talamantes", "Networking")

--queries
Select * from students;
SELECT student_name, major from students;
SELECT student_name, major from students WHERE major="Networking";
SELECT student_name, major from students WHERE major="Networking" AND student_id=401265;

--FUNCTIONS(count, sum, avg, min, max)
SELECT COUNT(*) FROM students;
SELECT AVG(tuition_cost) FROM students;
SELECT MAX(tuition_cost) FROM students;

--updating/alter tables
UPDATE students
SET major="Cyber" WHERE student_id=102;
--update changes existing data
ALTER TABLE students
ADD COLUMN tuition_cost numeric(10,2)
--alter table changes table itself

--NULL means missing or unknown value
--NOT NULL requires a value and NOT NULL after the data type
student_name varchar(100) NOT NULL

--SELECT FROM WHERE GROUP BY ORDER BY


--MIDTERM
--2 parts, 30pt quiz multiple choice, part b is working in sql


