DROP TABLE IF EXISTS employee

CREATE TABLE employee (
    empid		INT ,
    empname		VARCHAR(30) ,
    birth_date	DATE,
    phone		VARCHAR(15) NOT NULL ,
    country VARCHAR(30)  DEFAULT 'Australia'
)

-- It will help you to identify table attributes like column names, Data types and Constarints
sp_help employee

SELECT * FROM employee

INSERT INTO employee (empid,empname,birth_date,phone,country)
SELECT 1,'Srinivas','1984-04-28','9966444567','India'

INSERT INTO employee (empid,birth_date,phone,country)
SELECT 2,'1984-04-28',9966444567,'India'

INSERT INTO employee (empid,empname,birth_date,phone,country)
SELECT 2,'Sanjeev','1984-04-28',NULL,'India'

-- If you dont supplu the Country value the then default Value as per the table definition will be inserted
INSERT INTO employee (empid,empname,birth_date,phone)
SELECT 3,'Prakash','1988-01-05','9966112345'

SELECT * FROM employee



