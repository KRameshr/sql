-- CASE STATEMENT
DROP TABLE IF EXISTS Students
CREATE TABLE Students (ID INT,	NAME VARCHAR(50),	SCORE INT)
INSERT INTO Students
		SELECT 1,	'Simisola'	,60 UNION	SELECT 2,	'Ivan'		,80 UNION	
		SELECT 3,	'Metodija'	,52 UNION	SELECT 4,	'Callum'	,98 UNION	
		SELECT 5,	'Leia'		,84 UNION	SELECT 6,	'Ursula'	,69 UNION	
		SELECT 7,	'Katelyn'	,51 UNION	SELECT 8,	'Ramazan'	,78 UNION	
		SELECT 9,	'Corona'	,87 UNION	SELECT 10,	'Alise'		,57

SELECT * FROM Students

SELECT *,
  CASE
    WHEN score >= 90 THEN 'A'
    WHEN score >= 85 THEN 'B+'
    WHEN score >= 80 THEN 'B'
    WHEN score >= 75 THEN 'C+'
    WHEN score >= 70 THEN 'C'
    WHEN score >= 60 THEN 'D+'
    WHEN score >= 55 THEN 'D'
    ELSE 'F'
  END AS grade
FROM students;
----------------------------------------------------
--CASE Example II
SELECT * FROM EMP

SELECT *, 
CASE WHEN COMM IS NOT NULL THEN 'Bonus-Yes' 
ELSE 'Bonus-No' END as bonus_Status 
FROM Emp
----------------------------------------------------
-- IIF
SELECT IIF(5000<1000, 'YES', 'NO')

SELECT IIF(5000<1000, 1, 2)

DECLARE @Person Varchar(100) = 'Raj'
SELECT IIF(@Person in('Raj', 'Mohan'),'Likes Apple','Likes Orange')

DECLARE @Person Varchar(100) = 'Neeraj'
SELECT IIF(@Person in('Raj', 'Mohan'),'Likes Apple','Likes Orange')

----------------------------------------------------

-- Commit
BEGIN TRAN
	UPDATE EMp SET    ENAME = 'Srinivas'  WHERE EMPNO=7934 
	SELECT * FROM EMp WHERE EMPNO=7934 
COMMIT TRAN  
SELECT * FROM EMp WHERE EMPNO=7934
-- Rollback
BEGIN TRAN
	UPDATE EMp SET    ENAME = 'Donald'  WHERE EMPNO=7934 
	SELECT * FROM EMp WHERE EMPNO=7934 
ROLLBACK TRAN 
 
SELECT * FROM EMp WHERE EMPNO=7934


-- TRy Catch Block
BEGIN TRY
		BEGIN TRAN
		 INSERT INTO EMP (EMPNO,ENAME) VALUES (2345,'Srinivas')
		 UPDATE EMp SET DEPTNO = 10  WHERE EMPNO=7934 
		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK TRAN
		 SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
END CATCH



BEGIN TRY
		BEGIN TRAN
			 INSERT INTO EMP (EMPNO,ENAME) VALUES (789,'Srinivas')
			 UPDATE EMp SET DEPTNO = 20  WHERE EMPNO=7934 
			 SELECT 1/0
		COMMIT TRAN
END TRY
BEGIN CATCH
		 ROLLBACK TRAN
		 SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH


SELECT * FROM EmP WHERE EMPNO=789
SELECT * FROM EmP WHERE EMPNO=7934



--------------------------------------


SELECT * FROM Product

BEGIN TRY
	BEGIN TRAN
		INSERT INTO Product (Pid,Pname) VALUES(500,'Nokia')
		UPDATE Product SET Price =10000 WHERE Pid=400
		DELETE FROM Product WHERE Pid=300
		SELECT 1/0
	COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE () AS ErrorMessage;

END CATCH


		INSERT INTO Product (Pid,Pname) VALUES(500,'Nokia')
		UPDATE Product SET Price =10000 WHERE Pid=400
		DELETE FROM Product WHERE Pid=300
		SELECT 1/0








