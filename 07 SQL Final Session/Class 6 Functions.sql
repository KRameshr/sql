
CREATE FUNCTION fn_get_firstday_of_the_month 
(
	@date DATE
)
RETURNS DATE
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Local_Date DATE

	-- Add the T-SQL statements to compute the return value here
	SELECT @Local_Date = DATEADD(dd,-DAY(@date)+1, @date)

	-- Return the result of the function
	RETURN @Local_Date

END
GO

SELECT dbo.fn_get_firstday_of_the_month ('2022-10-23')

----------------------------------------------------------------


CREATE FUNCTION [dbo].[fn_get_lastday_of_the_month]   
(  
 @date DATE  
)  
RETURNS DATE  
AS  
BEGIN  
 -- Declare the return variable here  
 DECLARE @Local_Date DATE  
  
 -- Add the T-SQL statements to compute the return value here  
 SELECT @Local_Date = DATEADD(dd,-DAY(DATEADD(mm,1,@date)), DATEADD(mm,1,@date)) 
  
 -- Return the result of the function  
 RETURN @Local_Date  
  
END  


SELECT dbo.fn_get_lastday_of_the_month ('2022-10-23')