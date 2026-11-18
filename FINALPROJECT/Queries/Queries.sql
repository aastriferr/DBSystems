--QUERY 1
--Select all entries from products that have a PID that starts with a W
--which are products either used to produce or serve food
SELECT * FROM "Products" WHERE "PID" ILIKE 'W%';



--QUERY 2
--Select PID, Product, and Price from Products, and StoreStock from Stock, 
--and multiply price and storestock for inventory price
--join the tables on PID
SELECT p."PID", p."Product", p."Price", s."StoreStock", (p."Price" * s."StoreStock") AS "InventoryPrice"
FROM "Products" p JOIN "Stock" s
ON p."PID" = s."PID";



--QUERY 3
--Selecting all from the ordertracking table
--but only selecting the ones that havent arrived yet
--for those entries, i set the date arrived to 01-01-0001
--which i figured was a good enough 'null' value for dates
--and it was something it actually accepted
SELECT  * FROM "OrderTracking" WHERE "Arrived" = FALSE;



--QUERY 4
--select EID and fname as employeename from employees
--and complaints, descriptions, writeups, and actionstaken from standing
--joining employees and standing on EID
--and only showing employees that have one or more complaints
SELECT  e."EID", e."FName" AS "EmployeeName", s."Complaints", s."Description", s."WriteUps", s."ActionsTaken"
FROM "Standing" s JOIN "Employees" e
ON s."EID"=e."EID"
WHERE s."Complaints" > 0;



--QUERY 5
--The "Master Order Table"
-- Select OID from orders, FName from employees as orderer,
--EID from employees, product from products, pid from products,
--price from products as priceperitem, amount from orders as amount purchased,
--amount and price multiplied as total price
--and stockbefore from orders and stock after from orders
--employees is joined on EID, Products is joined on PID
SELECT  o."OID", e."FName" AS "Orderer", e."EID", 
	p."Product", p."PID", p."Price" AS "PricePerItem", 
	o."Amount" AS "AmountPurchased", (o."Amount" * p."Price") AS "TotalPrice",
	o."StockBefore", o."StockAfter"
FROM "Orders" o 
JOIN "Employees" e
	ON o."EID" = e."EID"
JOIN "Products" p
	ON o."PID" = p."PID";