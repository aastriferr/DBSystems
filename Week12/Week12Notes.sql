--primary and foreign key usefulness
--tables must be connected somehow

--primary key/pk is a column or set of columns that uniquely identify a row in a table
--usually some form of id
--foreign key/fk is a column in one table that refers to a pk in another table
--fk is just pk in another table

--essentially a parent/child relationship, parent can have many children, but each child points to only one parent

--create the parent table (Customers)
CREATE TABLE customers(
	c_id serial PRIMARY KEY,--customers
	name text,
	email text,
	city text
);
--serial auto numbers each new record, PK ensures each id is unique and not null

--creating child table(orders)
CREATE TABLE orders(
	id serial PRIMARY KEY,
	customer_id int,
	product text,
	total numeric(10,2),
	FOREIGN KEY(customer_id) REFERENCES customers(c_id) --fk(child table column) references parentTable(pk column)
);


--customer id linked each order back to a customer
--the fk constraint prevents orphan records(no orders for non existent customers)

-- insert sample data
INSERT INTO customers("name", email, city)
VALUES 
	('Alice', 'alice@email.com', 'Boise'),
	('Brian', 'brian@email.com', 'Twin Falls'),
	('Carmen', 'carmen@email.com', 'Jerome');

INSERT INTO orders(customer_id, product, total)
VALUES
	(1, 'Laptop', 999.99),
	(1, 'Mouse', 25.50),
	(2, 'Headphones', 89.99),
	(3, 'Monitor', 199.99);

--each order customer_id points to an existing customer in customers.id
--viewing relationship with join

SELECT customers.name, customers.city, orders.product, orders.total
FROM orders JOIN customers --only rows matching customers will appear
ON orders.customer_id=customers.c_id;
--PK uniquely identifies rows
--FK links tables together
--many relationship types (1:1, 1:M, M:M) 1 to 1, 1 to many, many to many
