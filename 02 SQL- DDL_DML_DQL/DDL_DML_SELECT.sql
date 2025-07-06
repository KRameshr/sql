-- Create Database
CREATE DATABASE IITM2022

-- Use Database
USE IITM2022
------------------------------------------------------
-- DDL Commands --> CREATE, ALTER, DROP, RENAME
------------------------------------------------------
-- 1. CREATE
CREATE TABLE Employee
(
id			INT
,Name		VARCHAR(100)
,Sal		NUMERIC(18,2)
,deptid		INT
)

SELECT * FROM Employee

-- 2. ALTER
ALTER TABLE Employee ADD Location VARCHAR(50) 

ALTER TABLE Employee ALTER COLUMN Sal INT

ALTER TABLE Employee DROP COLUMN deptid

-------------------------------------------
--1. CREATE
CREATE TABLE Product
(
Pid INT
,PName VARCHAR(100)
,QTY INT
,Price DECIMAL(18,2)
)

SELECT * FROM Product

-- 2. ALTER
alter TABLE Product ADD STOREID INT

ALTER TABLE Product DROP COLUMN Price

alter TABLE Product ADD lOcationId INT, Familyid INT

-------------------------------------------
-- 3. DROP : It will remove the object from database permanently
DROP TABLE Product
DROP TABLE Employee

-- After Dropping the table if you execute the below select statement you will get an error, saying Invalid Object
SELECT * FROM Product

-------------------------------------------
-- 4. Rename: We can rename the table name and column name of the table
-- sp_rename is a inbuilt system stored procedure
-- Rename the table
EXEC sp_rename 'Employee', 'tbl_Employee'
-- Rename the Column name
EXEC sp_rename 'tbl_Employee.Name', 'EmpName'

-------------------------------------------

--DML : Insert , Update, Delete, Truncate
DROP TABLE EMP
-- Create a table
CREATE TABLE EMP
(EMPNO		INT ,
ENAME		VARCHAR(100),
JOB			VARCHAR(9),
MGR			INT,
HIREDATE	DATETIME,
SAL			NUMERIC(7, 2),
COMM		NUMERIC(7, 2),
DEPTNO		INT)

-- Insert the data into table
INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, '17-DEC-1980', 800, NULL, 20)
INSERT INTO EMP VALUES
(7499, 'ALLEN', 'SALESMAN', 7698, '20-FEB-1981', 1600, 300, 30)
INSERT INTO EMP VALUES
(7521, 'WARD', 'SALESMAN', 7698, '22-FEB-1981', 1250, 500, 30)
INSERT INTO EMP VALUES
(7566, 'JONES', 'MANAGER', 7839, '2-APR-1981', 2975, NULL, 20)
INSERT INTO EMP VALUES
(7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-1981', 1250, 1400, 30)
INSERT INTO EMP VALUES
(7698, 'BLAKE', 'MANAGER', 7839, '1-MAY-1981', 2850, NULL, 30)
INSERT INTO EMP VALUES
(7782, 'CLARK', 'MANAGER', 7839, '9-JUN-1981', 2450, NULL, 10)
INSERT INTO EMP VALUES
(7788, 'SCOTT', 'ANALYST', 7566, '09-DEC-1982', 3000, NULL, 20)
INSERT INTO EMP VALUES
(7839, 'KING', 'PRESIDENT', NULL, '17-NOV-1981', 5000, NULL, 10)
INSERT INTO EMP VALUES
(7844, 'TURNER', 'SALESMAN', 7698, '8-SEP-1981', 1500, 0, 30)
INSERT INTO EMP VALUES
(7876, 'ADAMS', 'CLERK', 7788, '12-JAN-1983', 1100, NULL, 20)
INSERT INTO EMP VALUES
(7900, 'JAMES', 'CLERK', 7698, '3-DEC-1981', 950, NULL, 30)
INSERT INTO EMP VALUES
(7902, 'FORD', 'ANALYST', 7566, '3-DEC-1981', 3000, NULL, 20)
INSERT INTO EMP VALUES
(7934, 'MILLER', 'CLERK', 7782, '23-JAN-1982', 1300, NULL, 10)
INSERT INTO EMP VALUES
(7935, 'Srinivas', 'Manager', 7782, '1986-04-01', 1300, NULL, 10)

-- Retrieve the data from data from table
SELECT * FROM EMP WHERE EMPNO=7566
-------------------------------------------
--UPDATE 

UPDATE EMP SET COMM=2000 WHERE JOB='CLERK'

UPDATE EMP SET SAL = SAL+1000 WHERE DEPTNO=10

UPDATE EMP SET ENAME = 'J SRINIVAS' WHERE EMPNO =7935

UPDATE EMP SET JOB='CEO' WHERE JOB='PRESIDENT'

-- With out where condition, Update statement will be applied on all records of table
UPDATE EMP SET COMM=2000

-------------------------------------------
-- DELETE
SELECT * FROM EMP

DELETE FROM EMP WHERE EMPNO =7935

DELETE FROM EMP WHERE JOB='CLERK'

DELETE FROM EMP WHERE DEPTNO =10

DELETE FROM EMP WHERE DEPTNO =20 AND SAL >=3000

-- TRUNCATE

TRUNCATE TABLE EMP

---------------------------
--SELECT : It will retrieve the date from any given table

SELECT * FROM EMP

-- WHERE Condition: It will filter the rows from the table
-- Drop the EMP table and Execute the Create and Insert scripts again
-- Comparision Operators : =, >, < , >=, <=, <>
SELECT * FROM EMP WHERE EMPNO = 7935
SELECT * FROM EMP WHERE SAL>2500
SELECT * FROM EMP WHERE SAL<2500
SELECT * FROM EMP WHERE HIREDATE >='1981-10-01'
SELECT * FROM EMP WHERE HIREDATE <='1981-10-01'
SELECT * FROM EMP WHERE JOB <>'SALESMAN'
SELECT * FROM EMP WHERE JOB !='SALESMAN'

-- Bitwise Operators : AND , OR
SELECT * FROM EMP WHERE JOB ='SALESMAN' AND COMM >1000
SELECT * FROM EMP WHERE JOB ='SALESMAN' OR JOB ='CLERK'

--Logical Operators : IN , BETWEEN, LIKE, NOT 
-- IN 
SELECT * FROM EMP WHERE JOB IN ('SALESMAN' , 'CLERK')
SELECT * FROM EMP WHERE JOB NOT IN ('SALESMAN' , 'CLERK')

-- BETWEEN
SELECT * FROM EMP WHERE SAL BETWEEN 1000 AND 2000
SELECT * FROM EMP WHERE EMPNO BETWEEN 7500 AND 7800

-- LIKE String Filter
SELECT * FROM EMP WHERE ENAME LIKE 'S%'
SELECT * FROM EMP WHERE ENAME LIKE '%N'
SELECT * FROM EMP WHERE ENAME LIKE '%Allen%'
SELECT * FROM EMP WHERE ENAME LIKE '_A%'

-- NULL Filteration
SELECT * FROM EMP WHERE COMM IS NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL


---------------------------------------------------
-- Group BY

SELECT JOB
, COUNT(*) AS count_of_EMp
, SUM(SAL) AS Sum_Sal
, AVG(SAL) AS Avg_Sal
, MIN(SAL) AS Min_Sal
, MAX(SAL) AS Max_Sal
FROM EMP
GROUP BY JOB

-- It will throw an error
SELECT *
FROM EMP
GROUP BY JOB

---------------------------------------------
-- HAVING

SELECT JOB
, COUNT(*) count_OfEMp
, SUM(SAL) SUm_Sal
, AVG(SAL) Avg_Sal
, MIN(SAL)Min_Sal
, MAX(SAL) Rithvik
FROM EMP
GROUP BY JOB
HAVING  COUNT(*)>3


SELECT JOB
, COUNT(*) count_OfEMp
, SUM(SAL) SUm_Sal
, AVG(SAL) Avg_Sal
, MIN(SAL)Min_Sal
, MAX(SAL) Rithvik
FROM EMP
GROUP BY JOB
HAVING  SUM(SAL)>5000

-------------------------------------------
--ORDER BY : We can sort the result set either in Ascending or Descending B

SELECT * FROM EMP ORDER BY SAL ASC
SELECT * FROM EMP ORDER BY SAL DESC




