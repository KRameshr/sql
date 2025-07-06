DROP TABLE IF EXISTS  employees

CREATE TABLE EMPLOYEES
 (
    emp_id		INT NOT NULL ,
    emp_name	VARCHAR(55) NOT NULL,
    hire_date	DATE  NULL,
	phone		VARCHAR(15) NOT NULL ,
    country		VARCHAR(30) DEFAULT 'Australia',
    salary		INT  CHECK (salary >= 30000 AND salary <= 100000),

)

SELECT * FROM employees

-- It will help you to identify table attributes like column names, Data types and Constarints
sp_help employees

INSERT INTO employees 
SELECT 1,'Srinivas','1984-04-28','9966444567','India',75000

INSERT INTO employees (emp_id,emp_name,hire_date,phone,salary)
SELECT 2,'Siri','1988-01-05','9966112345',45000


INSERT INTO employees (emp_id,emp_name,hire_date,phone,salary)
SELECT 3,'null','1988-01-05','9966112345',45000

-- Validating NOT NULL Constarint -- NULL in single quotes will treated as String. Hence it will be inserted
INSERT INTO employees (emp_id,emp_name,hire_date,phone,salary)
SELECT 4,'null',NULL,'9966112345',45000

-- The below statement will fail as Salary voilating check constarint (Salary is less than 29999)
INSERT INTO employees 
SELECT 1,'Srinivas','1984-04-28','9966444567','India',29999

-- The below statement will fail as Salary voilating check constarint (Salary is grater than 100000)
INSERT INTO employees 
SELECT 4,'Srinivas','1984-04-28','9966444567','India',100001

-- The below statement will be inserted successfully  as Salary is meeting the check constarint.
INSERT INTO employees 
SELECT 4,'Srinivas','1984-04-28','9966444567','India',100000


SELECT * FROM employees

