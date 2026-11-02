--consumers
CREATE TABLE consumers(
	PK_custID serial PRIMARY KEY,
	email text,
	monthlySubscriber boolean
);

--addresses
CREATE TABLE addresses(
	FK_custID integer,
	streetAddress text,
	city varchar(100),
	stateCode varchar(2),
	zipCode integer,
	FOREIGN KEY(FK_custID) REFERENCES consumers(PK_custID)
);



--insert into consumers
INSERT INTO consumers(email, monthlySubscriber)
VALUES
	('terra@email.com', true),
	('sebastian@email.com', false),
	('chris@email.com', false),
	('mckenna@email.com', false),
	('richard@email.com', true);

--insert into addresses
--THESE ARE NOT INTENTIONALLY REAL PEOPLES ADDRESSES OR NAMES
--I zoomed into random cities across the US and picked a random house
INSERT INTO addresses(streetAddress, city, stateCode, zipCode)
VALUES
	('184S Western Ave', 'Los Angeles', 'CA', 90004),--184S Western Avenue, Los Angeles CA 90004
	('5444 E 41st St', 'Indanapolis', 'IN', 46226),--5444 E 41st St, Indianapolis IN 46226
	('1526 Fellowship Dr', 'Lancaster', 'PA', 17601), --1526 Fellowship Dr, Lancaster PA 17601
	('5353 Cedar Park Dr', 'Jackson', 'MS', 39206), --5353 Cedar Park Dr, Jackson MS 39206
	('14906 Lafayette Plaza', 'Omaha', 'NE', 68154); --14906 Lafayette Plaza, Omaha NE 68154


--select join query
SELECT consumers.PK_custID, consumers.email, addresses.city, addresses.stateCode, addresses.zipCode
FROM consumers JOIN addresses
ON addresses.FK_custID=consumers.PK_custID;




--reflection query
--What type of relationship did you create (one-to-one or one-to-many)?
--one to one, because each consumer only has one address(in the current setup

--What would happen if you deleted a department that still has employees?
--SQL will block your attempt to prevent the creation of orphaned records, which helps keep data
--in line and secure.

--Why is a foreign key important for data integrity?
--Without foreign keys, data has the potential to become loose ends, or orphaned, but foreign keys ensure
--that the correct data is tied to the correct table and row, and that no piece of data gets orphaned in the process.

