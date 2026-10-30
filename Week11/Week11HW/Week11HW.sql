--setup
CREATE DATABASE week11;

CREATE TABLE products_big(index_id integer,
	pName varchar(150),
	pDesc text,
	brand varchar(100),
	category varchar(75),
	price numeric(6,2),
	currency varchar(5),
	stock integer,
	ean bigint,
	color varchar(50),
	pSize varchar(50),
	availability varchar(50),
	intID integer);

--table data imported successfully

SELECT COUNT(*) FROM products_big; --retruned 100000
SELECT * FROM products_big LIMIT 5; --all columns look fine as they should


EXPLAIN ANALYZE SELECT * FROM products_big WHERE category = 'Skincare';
--6 step plan that executed in 4.77 ms

--create index
CREATE INDEX idx_category ON products_big(category);


EXPLAIN ANALYZE SELECT * FROM products_big WHERE category = 'Skincare';
--ran again with scan
--used the index, executed in .95 ms, so way faster




--a compound index seems to be an index that includes multiple columns
CREATE INDEX idx_big_cat_price ON products_big(pName, category, price);

EXPLAIN ANALYZE SELECT * FROM products_big WHERE category = 'Skincare';
--i reanalyzed it, and it took about 1 ms, but it used idx_category and not the other one




--REFLECTION
--What changed between the “no index” and “with index” plans?
--The index scan is a lot faster when it comes to bigger tables.

--When did PostgreSQL choose an index?
--It chose an index over the full scan when it was available, and
--chose the category index over the compound index and I assume that's
--because the category index had exactly what was needed while the 
--compound index had unnecessary categories that didn't relate to the 
--query.

--How did the larger table size affect the optimizer compared to your smaller tables?
--For larger tables, the optimizer will often choose to use any index
--over a full scan because it's more optimized and way quicker,
--but for smaller tables it may opt for a full scan because the 
--index scan may by slower than just reviewing all columns.