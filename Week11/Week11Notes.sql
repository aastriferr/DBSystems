--index is a table of contents for a database
--helps sql find rows faster without scanning the entire table


--CREATE INDEX indexName ON table(column)
CREATE INDEX idx_category ON products(category);
--builds an index on the selected category column and SQL will use it automatically when it decides its faster than a full scan

--use explain and analyze before and after creating index to see if your index is helping
--if Seq Scan, SQL is scanning entire table, if index scan, its using the index to locate matches faster
EXPLAIN ANALYZE SELECT * FROM products WHERE category='Skincare';

SET enable_seqscan=OFF; --turn off seq scan
--sql automatically chooses the fastest route, so if it finds a whole scan faster than an index scan, it will use it instead

--small tables dont benefit from indexes
--When the entire table fits into memory its faster for sql to read all rows directly than to perform multiple index lookups
--indexes have lookup overhead(each index lookup adds extra work
--postgre has to look for the index then retrieve the rows, then piece them back together
--indexes are more useful for tables that have hundreds or thousands of rows
