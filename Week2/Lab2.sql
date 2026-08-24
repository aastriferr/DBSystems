--PART A
CREATE TABLE Animal_Types(
	type_id int PRIMARY KEY,
	species varchar(50),
	habitat varchar(75),
	diet varchar(50)
);
CREATE TABLE Animals(
	animal_id int PRIMARY KEY,
	animal_name varchar(50),
	species_id int,
	age int
);


--PART B
INSERT INTO Animal_Types(type_id, species, habitat, diet)
VALUES ('1001', 'Dolphin', 'Warm Ocean', 'Fish'), 
	('1002', 'Gray Whale', 'Temperate Ocean', 'Krill'),
	('1003', 'Blue Moon Jellyfish', 'Warm Ocean', 'Zooplankton');
INSERT INTO Animals(animal_id, animal_name, species_id, age)
VALUES ('674', 'Missy the Dolphin', '1001', '4'), 
	('992', 'Willy the Whale', '1002', '8'),
	('331', 'Pancake the Jellyfish', '1003', '97');


--PART C
--The broken code as well as the error listed below.
INSERT INTO Animal_Types(type_id, species, habitat, diet)
VALUES ('1001', 'Dolphin', 'Warm Ocean', 'Fish')
	('1002', 'Gray Whale', 'Temperate Ocean', 'Krill');

-- ERROR:  syntax error at or near "("
-- LINE 3:  ('1002', 'Gray Whale', 'Temperate Ocean', 'Krill');
--          ^ 
