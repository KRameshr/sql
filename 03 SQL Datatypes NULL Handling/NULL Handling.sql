
--SELECT TOP DISTINCT ALIAS Name
-- TOP CLAUSE
SELECT TOP 3 * FROM EMP
SELECT TOP 10 PERCENT * FROM EMP

-- DISTINCT Clause
SELECT DISTINCT JOB FROM EMP
SELECT DISTINCT DEPTNO FROM EMP

-- Alias Name - "AS" Keyword is Optional 
SELECT  EMPNO AS Id, ENAME   Name FROM EMP

-- Schema creation
CREATE SCHEMA Intellipath

-- Schema with Table creation
CREATE TABLE Intellipath.Sales
( SaleId INT
, Tran_Date Date
, Tran_Amount NUMERIC (18,2)
)

-- dbo is a default schema and dbo stands for Database owner
SELECT * FROM [dbo].[Employee]
-- DBO --> SCHEMA

SELECT * FROM [Employee]


-- NULL : Absence of Data

IS NULL -- Used to filter the NULL Records
ISNULL  -- Used to replace the NULL Value
COALESCE -- Used to get the first not null value
NULLIF   -- Used to comare wether given two values are equal or not

-- Equal operaotor will work for Numbers, String and Date Data types
SELECT * FROM EMP WHERE DeptNo=10

-- Equal operaotor will not work for NULL
SELECT * FROM EMP WHERE COMM = NULL

-- To filter the NULL rows you should use "IS NULL"
SELECT * FROM EMP WHERE COMM IS NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL

-- "ISNULL" is used to replace the NULL values with your desired value
SELECT *, ISNULL(COMM,1000.00) AS Commission FROM EMP

-- If you perform any airthmetic operation with NULL value, result will be "NULL"
SELECT EMPNO,ENAME, SAL,COMM, SAL+COMM FROM EMP

-- If you wish to handle the above situation then you can write the query as below
SELECT EMPNO,ENAME, SAL,COMM, SAL+ISNULL(COMM,0) FROM EMP


SELECT ISNULL(NULL,'Sanjeev')
SELECT ISNULL('Hare','Sanjeev')

-- COALESCE
-- COALESCE will return the first NOT NULL Value of the given arguments

-- The below statement will drop the table if it exists in the database 
DROP TABLE IF EXISTS emp_contact

-- Create the sample table
CREATE TABLE emp_contact  (  
    id int,  
    firstname   VARCHAR(50) NOT NULL,  
    lastname    VARCHAR(50) NOT NULL,  
    relationship VARCHAR(60),  
    homenumber   BIGINT,  
    worknumber   BIGINT,  
    personalnumber   BIGINT 
  );  

  -- Insert the rows into the above created table
INSERT INTO emp_contact (id, firstname, lastname, relationship, homenumber, worknumber, personalnumber)  
VALUES (4, 'Nag', 'Ava', 'Self', NULL, 9922334455, NULL),  
(2, 'Paul', 'Ward', 'spouse', NULL, NULL, 9821322867),  
(3, 'Rose', 'Huges', 'Daughter', NULL, NULL, NULL)  ,
(4, 'Srinivas', 'Jagarlamudi', 'Self', NULL, 9966444567, 9966444567)  

SELECT * FROM emp_contact

-- Coalesce use case
SELECT *, COALESCE(homenumber,worknumber,personalnumber) Coalesce_Result
FROM emp_contact

-- String Concatenation example
SELECT firstname+' '+lastname AS fullname, relationship,  
  COALESCE(homenumber, worknumber, personalnumber, 0000000000000) AS phone  
FROM emp_contact  

-- Coalesce examples
SELECT COALESCE(NULL, NULL,'2022-10-09', NULL, NULL, '2022-09-10')

SELECT COALESCE('Srinivas', NULL,NULL, 'Neeraj', NULL, 'Shobit')

-- NULLIF examples
SELECT NULLIF(25,25) -- When NULL Values

SELECT NULLIF(25, 24) -- When doesn't match then it will return first argument
SELECT NULLIF(25, NULL)

SELECT NULLIF(NULL, 25)


SELECT *, NULLIF(worknumber, personalnumber) NULLIF_Result
FROM emp_contact
WHERE worknumber IS NOT NULL

-- IS NULL Example : different Use case explained
CREATE TABLE test
(id INT
,Name Char(6)
)
INSERT INTO test VALUES (1, 'Sriniv')
INSERT INTO test VALUES (1, 'Sanjeev')
SELECT * FROM test
SELECT *, ISNULL(Worknumber,99999999) FROM  emp_contact

-- Using SELECT FROM WHERE GROUP BY HAVING and ORDER BY in Single Statement
SELECT Deptno, COUNT(*) AS Cnt_of_Emp, SUM(Sal) AS Dept_wise_Sal
FROM Emp    
WHERE Deptno IN (10,20, 30)
GROUP BY Deptno
HAVING SUM(Sal) > 10000
ORDER BY Dept_wise_Sal desc
