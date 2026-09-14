--generated always as identity makes the column auto generate
--PRIMARY KEY makes sure each entry is distinct and different

--char(n) stores a fixed length character value
--text stores variable length without requiring a max length
--numeric stores exact decimal values (6,2) where 6 is the # of digits and 2 is digits after decimal, using extra decimals outside of the 2 digits will round the digits, designed for exact decimal values
--real: stores approx. floating point number, floating point types area approximate, so very precise values may not be stored accurately(4.78956013579053 will most likely cut off the decimal at 6 places)
--double precision: is a floating point type but it supports more precision than real, both real and double precision are approximate data types
--timestamp stores both date and time
--time stores only a time of day without the date 'HH:MM:SS
--interval stores an amount of time rather than a specific date or time
--boolean, stores value of either true or false(not 0 or 1)

--add column
ALTER TABLE games
ADD COLUMN game_code char(5)

--add one data into column
UPDATE games
SET game_code = 'ER001'
WHERE title = 'Elden Ring'

ALTER TABLE games
ADD COLUMN price numeric(6,2);
UPDATE games
SET price = 59.99
WHERE title = 'Elden Ring'

--timestamp no timezone
ALTER TABLE games
ADD COLUMN last_played timestamp;
UPDATE games
SET last_played = '2026-09-01 14:30:00' --YYYY-MM-DD HH:MM:SS
WHERE title = 'Elden Ring'

--timestamp with timezone
ALTER TABLE games
ADD COLUMN created_at timestamp WITH time zone;
UPDATE games
SET created_at = '2026-09-10 14:30:00-07' --YYYY-MM-DD HH:MM:SS-TZ
WHERE title = 'Elden Ring'
--now() is a Postgre SQL function that returns the current date and time

ALTER TABLE games
ADD COLUMN session_length interval;
UPDATE games
SET session_length = '2 hours 30 minutes' --other valid examples are 2 hours, 7 days, 2 months 1 hour 15 minutes, etc
WHERE title = 'Elden Ring'

