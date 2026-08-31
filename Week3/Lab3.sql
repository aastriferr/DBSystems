--PART 1
CREATE DATABASE week3_select;

--PART 2
CREATE TABLE games (
    id integer GENERATED ALWAYS AS IDENTITY, --Auto assigns integer, no need to assign it yourself in insert
    title varchar(100),
    genre varchar(50),
    platform varchar(50),
    release_year integer,
    rating numeric(3,1)
);

--PART 3
INSERT INTO games (title, genre, platform, release_year, rating)
VALUES
    ('Elden Ring', 'RPG', 'PC', 2022, 9.5),
    ('Rocket League', 'Sports', 'PC', 2015, 8.5),
    ('Super Smash Bros. Ultimate', 'Fighting', 'Switch', 2018, 9.0),
    ('Minecraft', 'Sandbox', 'PC', 2011, 9.2),
    ('Mario Kart 8 Deluxe', 'Racing', 'Switch', 2017, 8.8),
    ('Marvel Rivals', 'Shooter', 'PC', 2024, 8.0),
    ('Stardew Valley', 'Simulation', 'PC', 2016, 9.1),
    ('The Legend of Zelda: Tears of the Kingdom', 'Adventure', 'Switch', 2023, 9.4);

SELECT * FROM games;

--PART 4, TASK 1
SELECT * FROM games;
--PART 4, TASK 2
SELECT title, platform, rating FROM games;
--PART 4, TASK 3
SELECT genre, title, release_year FROM games;


--PART 5, TASK 4
SELECT title, rating FROM games ORDER BY rating DESC;
--PART 5, TASK 5
SELECT title, release_year FROM games ORDER BY release_year ASC;
--PART 5, TASK 6
SELECT platform, title, rating FROM games ORDER BY platform ASC, rating DESC;


--PART 6, TASK 7
SELECT DISTINCT platform FROM games ORDER BY platform ASC;
--PART 6, TASK 8
SELECT DISTINCT platform, genre FROM games;


--PART 7, TASK 9
SELECT title, platform, release_year FROM games WHERE platform='Switch';
--PART 7, TASK 10
SELECT title, genre, rating FROM games WHERE rating>=9.0 ORDER BY rating DESC;
--PART 7, TASK 11
SELECT title, release_year FROM games WHERE release_year < 2020 ORDER BY release_year DESC;
--PART 7, TASK 12
SELECT title, rating FROM games WHERE rating BETWEEN 8.5 AND 9.2 ORDER BY rating DESC;


--PART 8, TASK 13
SELECT title, genre FROM games WHERE title LIKE 'M%';
--PART 8, TASK 14
SELECT title FROM games WHERE title ILIKE '%the%';
--PART 8, TASK 15
SELECT title, genre FROM games WHERE genre ILIKE '%i%';


--PART 9, TASK 16
SELECT title, platform, rating FROM games WHERE platform='PC' AND rating>9.0;
--PART 9, TASK 17
SELECT title, genre FROM games WHERE genre='RPG' OR genre='Fighting';
--PART 9, TASK 18
SELECT title, platform, release_year FROM games WHERE platform='PC' AND (release_year < 2017 OR release_year > 2022);


--PART 10, TASK 19
SELECT title, genre, platform, rating FROM games WHERE rating>=8.8 ORDER BY Platform ASC, rating DESC;
--PART 11, TASK 20
--select switch titles where rating is above/equal to 9, ordered by rating
SELECT title, platform, rating FROM games WHERE platform = 'Switch' AND rating>=9.0 ORDER BY rating DESC;

