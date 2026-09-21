--PART A
CREATE TABLE product(index_id integer PRIMARY KEY, 
  product_name varchar(100), 
  description text, 
  brand varchar(100),
  category varchar(100),
  price numeric(10,2), 
  currency varchar(3),
  stock integer,
  ean DOUBLE PRECISION,
  color varchar(30),
  product_size text,
  availability varchar(30),
  internal_id integer);

--IMPORTED THROUGH GUI
SELECT * FROM product;


--PART 2
--Multiply price and stock for inventory value per product
SELECT product_name, price, stock, price*stock as inventory_value FROM product LIMIT 10;
--average price of all products
SELECT AVG(price) FROM product;
--min max for price
SELECT MIN(price), MAX(price) FROM product;
--count how many total products are in dataset
SELECT COUNT(*) FROM product;
