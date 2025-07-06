SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%EMail%'


SELECT *, SUBSTRING(EmailAddress,1,CHARINDEX('@',EmailAddress)-1)
FROM Person.EmailAddress


ken0	-- Ken	
terri0	-- terri
diane1	-- diane
Purnoday -- Purnoday