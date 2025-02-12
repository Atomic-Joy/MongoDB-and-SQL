CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Ankit', 'Sharma', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Ritika', 'Mehta', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Pranav', 'Rao', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Siddharth', 'Patel', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Ishaan', 'Malhotra', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Rohit', 'Gupta', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Aditya', 'Bansal', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Tanya', 'Kapoor', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 		(001, 'Manager', '2016-02-20 00:00:00'),
 		(002, 'Executive', '2016-06-11 00:00:00'),
 		(008, 'Executive', '2016-06-11 00:00:00'),
 		(005, 'Manager', '2016-06-11 00:00:00'),
 		(004, 'Asst. Manager', '2016-06-11 00:00:00'),
 		(007, 'Executive', '2016-06-11 00:00:00'),
 		(006, 'Lead', '2016-06-11 00:00:00'),
 		(003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM Worker WHERE SALARY not between 100000 AND 200000;

SELECT first_Name FROM Worker WHERE worker_id IN (2,4,6);

SELECT * FROM worker WHERE salary BETWEEN 200000 AND 400000
AND worker_id IN(1,2,3,4,5);
DESC worker;

SELECT min(salary) FROM worker WHERE department='HR';

SELECT DISTINCT (department) FROM worker;

/* alias-help you to give some temp name for a column */

SELECT worker_id AS emp_id FROM worker;

SELECT worker_id FROM worker
UNION ALL
SELECT first_name FROM worker;

SELECT department,worker_id FROM worker WHERE salary=100000
UNION 
SELECT department,worker_id FROM worker WHERE salary=200000
ORDER BY worker_id;

SELECT worker_id,first_name,department,
CASE
	WHEN salary>100000 THEN 'Rich People'
	WHEN salary<100000 && salary>=100000 THEN 'Middle class People'
	ELSE 'POOR'
END
AS People_stage_wise FROM worker;
