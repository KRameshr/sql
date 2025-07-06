DROP TABLE IF EXISTS EmpA
CREATE TABLE EmpA (ID INT,Emp_nameName VARCHAR(50),Gender VARCHAR(10),Department VARCHAR(50))
INSERT INTO EmpA VALUES(1, 'Sanjeev', 'Male','IT'),(2, 'Priyanka', 'Female','IT')
,(3, 'Preety', 'Female','HR'),(3, 'Preety', 'Female','HR')
SELECT * FROM EmpA
-----------------
DROP TABLE IF EXISTS EmpB
CREATE TABLE EmpB (ID INT,Name VARCHAR(50),Gender VARCHAR(10),Department VARCHAR(50))
INSERT INTO EmpB VALUES (2, 'Priyanka', 'Female','IT'),(3, 'Preety', 'Female','HR'),(4, 'Anurag', 'Male','IT')
SELECT * FROM EmpB

SELECT * FROM EMPA
SELECT * FROM EMPB

SELECT * FROM EMPA
UNION
SELECT * FROM EMPB
-- 1,2,3,4

SELECT * FROM EMPA
UNION ALL
SELECT * FROM EMPB
-- 1,2,3,3,2,3,4
SELECT * FROM EMPA
EXCEPT
SELECT * FROM EMPB

SELECT * FROM EMPA
INTERSECT
SELECT * FROM EMPB

-- Number of columns should match
-- Order of the columns should match
-- Datatypes of Columns Should Match


SELECT ID,Emp_nameName,Gender,Department FROM EMPA
UNION
SELECT Name,Gender,Department, ID FROM EMPB


