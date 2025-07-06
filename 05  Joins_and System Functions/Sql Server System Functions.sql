-- Numeric functions
-- ROUND
SELECT ROUND(850.556,2)
SELECT ROUND(850.555,2)
SELECT ROUND(850.554,2)

-- CEILING
SELECT CEILING(850.556)
SELECT CEILING(850.001)

-- FLOOR
SELECT FLOOR(850.556)
SELECT FLOOR(850.999)

-- ABS
SELECT ABS(-123.221)
SELECT ABS(-123)

-- SQR
SELECT SQUARE(11)

--SQRT
SELECT SQRT(16)

-- POWER
SELECT POWER (2,3)

--------------------------------------------------
-- String Functions

SELECT LEFT('Srinivas',3)
SELECT RIGHT('Srinivas',4)

SELECT '    Srinivas   '
SELECT RTRIM('    Srinivas   ')
SELECT LTRIM('    Srinivas   ')
SELECT LTRIM(RTRIM('    Srinivas   '))

SELECT UPPER('Srinivas')
SELECT LOWER('SriNIVAS')

SELECT REVERSE ('Srinivas')
SELECT REPLACE('Srinivas','S','Z')

SELECT LEN ('Srinivas')

SELECT EMPNO, ENAME, LEN(ENAME) len_ename, UPPER (ENAME) u_name, Lower(Ename) l_name FROM EMP
Order by len_ename Desc

S	R	I	N	I	V	A	S
1	2	3	4	5	6	7	8
SELECT CHARINDEX( 'v','Srinivas')
SELECT CHARINDEX( 'z','Srinivas')
SELECT CHARINDEX( 'INI','Srinivas')

SELECT CHARINDEX( 's','Srinivas',2)
SELECT CHARINDEX('i','Srinivas')
SELECT CHARINDEX( 'i','Srinivas', CHARINDEX('i','Srinivas')+1)
SELECT CHARINDEX('.','srinivas.jagarlamudi@gmail.com',CHARINDEX('.','srinivas.jagarlamudi@gmail.com' )+1)

SELECT SUBSTRING ('Srinivas',1,3)

SELECT SUBSTRING ('srinivas.jagarlamudi@gmail.com', 10,11)
SELECT SUBSTRING ('Sanjeev.sharma@gmail.com', CHARINDEX('.','Sanjeev.sharma@gmail.com')+1 
,CHARINDEX('@','Sanjeev.sharma@gmail.com') )

SELECT SUBSTRING ('Sai.Chandraghiri@gmail.com' -- String
, CHARINDEX('.','Sai.Chandraghiri@gmail.com')+1 -- Starting Position
,CHARINDEX('@','Sai.Chandraghiri@gmail.com') - CHARINDEX('.','Sai.Chandraghiri@gmail.com')-1 ) -- End Position

DECLARE @Email VARCHAR(50)
SET @Email ='Neraj.Koranga@yahoo.com'
SELECT SUBSTRING (@Email, CHARINDEX('.',@Email)+1 
,CHARINDEX('@',@Email) -CHARINDEX('.',@Email) -1)

-- Explanation:
Sai.Chandraghiri@gmail.com

Starting Position : 3+1 = 4
End Position	  : 17 -4-1 =13

Sanjeev.sharma@gmail.com

Starting Position : 8+1 = 9
End Position	  : 15 -8-1 =6

---------------------------------------------------------------------
---------------------------------------------------------------------

-- Date functions
 -- Getdate() function returns the current system date time
SELECT GETDATE()

-- The Following functions will retrieve the Year, Month and Day from the Given Date
SELECT YEAR (GETDATE())
SELECT MONTH (GETDATE())
SELECT DAY (GETDATE())

-- IT returns Integer Value
-- DATEPART returns any part of the Date time like Year, Month, Day, Week Number, Hour, Minites, Seconds and Nano Seconds
SELECT DATEPART(YY,Getdate())	-- Year
SELECT DATEPART(mm,Getdate())	-- Month	
SELECT DATEPART(wk,Getdate())	-- Week Number in a claendar Year
SELECT DATEPART(dd,Getdate())	-- Day
SELECT DATEPART(hh,Getdate())	-- Hour
SELECT DATEPART(mi,Getdate())	-- Minutes
SELECT DATEPART(ss,Getdate())	-- Seconds
SELECT DATEPART(ns,Getdate())	-- Nano Seconds

-- It returns String Value
--SQL Server accepts the following format of the date YYYY-MM-DD HH:MM:SS NS
SELECT DATENAME(WEEKDAY,'2022-10-02')
SELECT DATENAME(mm,GETDATE())


-- It reurns Date Value
SELECT DATEADD(dd,-365,GETDATE())
SELECT DATEADD(dd,365,GETDATE())
SELECT DATEADD(mm,-1,GETDATE())
SELECT DATEADD(mm,1,GETDATE())

-- It returns Integer
SELECT DATEDIFF(YY, '1984-04-28', GETDATE()) AS DateDiff;
SELECT DATEDIFF(mm, '1984-04-28', GETDATE()) AS DateDiff;
SELECT DATEDIFF(wk, '1984-04-28', GETDATE()) AS DateDiff;
SELECT DATEDIFF(DD, '1984-04-28', GETDATE()) AS DateDiff;

-- Applying the Date function on a given table
SELECT *, DATEDIFF(YY,HIREDATE, GETDATE()) AS Exp_In_Yrs 
FROM EMP
Order by 9 Desc
---------------------------------------------------------------------
---------------------------------------------------------------------
-- CONVERT Function
-- Convert function is used to convert the data type of the column in the Selct statement
CREATE TABLE emp1
( id INT , hireDate VARCHAR(20))

INSERT INTO emp1
SELECT 1, '10-10-2022' UNION 
SELECT 1, '11-01-2021' UNION 
SELECT 1, '26-10-2020'  

SELECT *, CONVERT(DATE,hireDate, 105)  FROM emp1

---------------------------------------------------------------------
---------------------------------------------------------------------