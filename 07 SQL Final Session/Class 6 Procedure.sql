CREATE PROCEDURE usp_emp
( @deptno INT)
AS
BEGIN
		SELECT * FROM EMP WHERE DEPTNO=@deptno
END


EXEC usp_emp 20

EXEC usp_emp 90



-- DATE FUNCTIONS Explanation

DATEPART -- Will ectract portion of the date (Day, month, Year, Hour, Minute, Second and Nano Second)
DATENAME -- Will give us Dayname (S, M,T) or Month Name (Jan, Feb)
DATEADD --  It will add or Subtract the Days/ MM/Years/  Minute, Second and Nano Second to the given date
DATEDIFF -- Will Find the Difference between 2 dates either Days/ MM/Years/  Minute, Second and Nano Second

DD -- Day
MM -- Month
YY -- Year
HH -- Hour
MI -- Minutes
SS -- Seconds
NS -- Nano Seconds
WK -- Week Number