
SELECT *
  FROM Sales.Customer c
 WHERE EXISTS
       (	SELECT SalesOrderId
			FROM Sales.SalesOrderHeader
			WHERE CustomerId = c.CustomerId 
			AND SubTotal > 150000
		)


SELECT *
FROM Sales.Customer c
WHERE NOT EXISTS
		(	SELECT SalesOrderId
			FROM Sales.SalesOrderHeader
			WHERE CustomerId = c.CustomerId 
		)

SELECT * FROM Sales.SalesOrderHeader
WHERE CustomerID=1