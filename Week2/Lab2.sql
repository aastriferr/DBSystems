CREATE TABLE TeacherInfo (
	teacher_id bigserial PRIMARY KEY, 
	first_name varchar(25),
	last_name varchar(50),
	hire_date date,
	salary numeric
);


INSERT INTO teacherinfo(first_name, last_name, hire_date, salary)
VALUES ('Sebastian', 'Talamantes', '2025-08-01', 00000), ('V', 'R', '2029-09-02', 40);
