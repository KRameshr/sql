CREATE TABLE Grades
(
Names VARCHAR(1),
Grade INT
)
GO
-- insert data
INSERT INTO Grades VALUES ('A',100)
INSERT INTO Grades VALUES ('B',90)
INSERT INTO Grades VALUES ('C',80)
INSERT INTO Grades VALUES ('D',70)
INSERT INTO Grades VALUES ('E',70)
INSERT INTO Grades VALUES ('F',60)
GO


SELECT * FROM Grades

SELECT Names, Grade,ROW_NUMBER () OVER (ORDER BY Grade DESC) as ROW_NUMBER FROM Grades
SELECT Names, Grade,RANK	   () OVER (ORDER BY Grade DESC) as ROW_NUMBER FROM Grades
SELECT Names, Grade,DENSE_RANK () OVER (ORDER BY Grade DESC) as ROW_NUMBER FROM Grades

SELECT Names, Grade,
       ROW_NUMBER () OVER (ORDER BY Grade DESC) as ROW_NUMBER,
       RANK		  () OVER (ORDER BY Grade DESC) as RANK,
       DENSE_RANK () OVER (ORDER BY Grade DESC) as DENSE_RANK
	   FROM Grades

------------------------------------------------------------------------------------------

CREATE TABLE OrderRanking
   (
   OrderID INT NOT NULL,
   CustomerID INT,
   OrderTotal decimal(15,2)
   )
   
INSERT OrderRanking (OrderID,CustomerID, OrderTotal)
SELECT 1, 1, 1000 UNION 
SELECT 2, 1, 500  UNION 
SELECT 3, 1, 650  UNION 
SELECT 4, 1, 3000 UNION 
SELECT 5, 2, 1000 UNION 
SELECT 6, 2, 2000 UNION 
SELECT 7, 2, 500  UNION 
SELECT 8, 2, 500  UNION 
SELECT 9, 3, 500 


-- ROW_NUMBER
SELECT  *,
        ROW_NUMBER() OVER (ORDER BY OrderTotal DESC) AS RN,
		ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderTotal DESC) AS RNP
FROM    OrderRanking

-- RANK
SELECT  *,
        RANK() OVER (ORDER BY OrderTotal DESC) AS R,
		RANK() OVER (PARTITION BY CustomerID ORDER BY OrderTotal DESC) AS RP
FROM    OrderRanking

--DENSE RANK
SELECT  *,
        DENSE_RANK() OVER (ORDER BY OrderTotal DESC) AS DR,
        DENSE_RANK() OVER (PARTITION BY CustomerID ORDER BY OrderTotal DESC) AS DRP
FROM    OrderRanking
