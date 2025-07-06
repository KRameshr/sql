--Local temporary tables (#) are visible only to the connection that creates it.
--They are automatically deleted when the connection is closed.

CREATE TABLE #LocalTemp (  UserID int,  Name varchar(50),   Address varchar(150) )

INSERT INTO #LocalTemp VALUES ( 1, 'Srinivas','Hyderabad');

Select * from #LocalTemp
--------------------------------------------------------------------------
-- Global Temporary Tables (##) are visible to everyone.
-- They are deleted when all connections that have referenced them have closed.
CREATE TABLE ##students_Details ( Id INT ,Name VARCHAR(100) )

INSERT INTO ##students_Details
SELECT 1, 'Neeraj'
UNION SELECT 2, 'Afreen'

SELECT * FROM ##students_Details
----------------------------------------------------
--Copy the data from one table to another table

SELECT * INTO Sanjeev  FROM ##students_Details

SELECT * FROM Sanjeev


--CTE -- Commom Table Expression
-- Inserting Duplicate records into table
INSERT INTO Sanjeev
SELECT 1, 'Neeraj'
UNION SELECT 2, 'Afreen'

-- Usage of CTE
;WITH Neeraj AS
(SELECT * FROM Sanjeev )

SELECT * FROM Sanjeev

-- Usage of CTE to remove duplicates
;WITH Remove_Duplicates AS
(
SELECT *, ROW_NUMBER() OVER(PARTITION BY Id, Name ORDER BY Id) AS rn 
FROM Sanjeev
)

DELETE FROM Remove_Duplicates WHERE rn>1





