--Part 1
CREATE DATABASE week5;


--Part 2
CREATE TABLE products(
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	product_name varchar(100),
	quantity integer
);

INSERT INTO products (product_name, quantity)
VALUES
	('IPhone 19', 27),
	('AirPods Pro Max Lite', 3),
	('IPhone Stand', 1900),
	('Apple Watch', 400);


--Part 3
ALTER TABLE products
ADD COLUMN description text,
ADD COLUMN price numeric(7,2),
ADD COLUMN rating real, 
ADD COLUMN last_updated timestamp with time zone,
ADD COLUMN in_stock boolean;

SELECT * FROM products;


--Part 4
UPDATE products --IPhone 19
SET description = 'Latest Gen IPhone',
    price = 946.99,
    rating = 2.4,
    last_updated = '2030-04-02 18:30:00-07',
    in_stock = FALSE
WHERE product_name = 'IPhone 19';

UPDATE products --airpods
SET description = 'Latest Gen AirPods',
    price = 399.99,
    rating = 3.9,
    last_updated = '2035-11-01 06:00:00-07',
    in_stock = TRUE
WHERE product_name = 'AirPods Pro Max Lite';

UPDATE products --IPhone stand
SET description = 'All-New Apple exclusive IPhone stand',
    price = 4777.57,
    rating = 0.5,
    last_updated = '2021-10-10 12:45:00-07',
    in_stock = TRUE
WHERE product_name = 'IPhone Stand';

UPDATE products --Apple watch
SET description = 'Latest generation Apple Watch',
    price = 150.99,
    rating = 4.7,
    last_updated = '2024-12-05 11:30:00-07',
    in_stock = FALSE
WHERE product_name = 'Apple Watch';


--Part 5
UPDATE products
SET price = 4669.8888
WHERE product_name = 'IPhone Stand';


--PART 6
--1
SELECT * FROM products;
--2
SELECT product_name, price, rating FROM products;
--3
SELECT product_name, price FROM products WHERE price > 400;
--4
SELECT product_name, quantity, in_stock FROM products WHERE in_stock=TRUE;
--5
SELECT product_name, quantity, in_stock, price FROM products ORDER BY price DESC;
