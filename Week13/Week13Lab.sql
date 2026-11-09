--Part 2 Query
SELECT g.title, p.publisher_name, g.price
FROM games g
INNER JOIN publishers p
ON g.publisher_id = p.id
ORDER BY title;
--Indie adventure does not appear because it's publisher ID is null

--Part 3 Query
SELECT g.title, p.publisher_name, g.price
FROM games g
LEFT JOIN publishers p
ON g.publisher_id = p.id
ORDER BY price DESC;
--8 games appear here, while the first query only returned 7.

--Part 4 query
SELECT g.title, SUM(s.quantity) AS copies_sold, COUNT(s.id) AS total_sales
FROM games g
INNER JOIN sales s
    ON g.id = s.game_id
GROUP BY g.id, g.title
ORDER BY copies_sold DESC;
-- Street fighter and MK8 Deluxe are tied at 8 copies sold.

--Part 5 Query
SELECT p.publisher_name, COUNT(g.id) AS game_count, ROUND(AVG(g.price), 2) AS avg_price
FROM publishers p
INNER JOIN games g
    ON p.id = g.publisher_id
GROUP BY p.id, p.publisher_name
ORDER BY avg_price DESC;
--EA and Nintendo are tied at 59.99.



--Part 6 Reflection
--Which tables in your database have relationships?
--Most if not all of them are going to have some form of relationship with at least one other table.
--What information could you retrieve by combining those tables?
--Combining information allows you to retrieve information like summary or average info, as well as info in one table grouped by a category from another table.
--It lets you look at your data in many different ways.
--Could you use COUNT(), SUM(), or AVG() to generate a meaningful report?
--Yes. Things like average are good for summaries, sum is good for stocks, count can be good to see how many of one thing are in a table, such as how many reports were made by one employee ID.
