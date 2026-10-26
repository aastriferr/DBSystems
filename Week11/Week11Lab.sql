--PartA
SELECT * FROM products;
SELECT COUNT(*) FROM products;
--How many records on the table? 100
--How does amount of records affect query performance? The more records a query has to sift through, the longer it takes


--PartB
--used stock instead of category
EXPLAIN ANALYZE SELECT "Name", stock FROM products WHERE stock>150;
--Did Postgre use a SeqScan? Yes
--How many records were returned? 3
--What was the execution time? 0.061 ms

--PartC
--instead of using category, I used stock
CREATE INDEX idx_stock ON products(stock);
EXPLAIN ANALYZE SELECT "Name", stock FROM products WHERE stock>150;
--Did PostgreSQL use an Index Scan, Bitmap Index Scan, or continue using a Seq Scan? SQL used a SeqScan
--Was the execution time faster or slower? Only slightly faster
--Why might PostgreSQL choose not to use an index even when one exists? Because SQL chooses the fastest route

--PartD
SET enable_seqscan=OFF;
EXPLAIN ANALYZE SELECT "Name", stock FROM products WHERE stock>150;
--Did disabling sequential scans change how PostgreSQL executed your query? Yes, it became a bitmap heap scan instead.
--Why might PostgreSQL normally prefer a sequential scan over an index scan? A sequential scan is quicker for smaller tables.
