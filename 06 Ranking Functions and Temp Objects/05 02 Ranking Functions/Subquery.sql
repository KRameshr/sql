SELECT SalesOrderID,CustomerID,SalesOrderNumber,SubTotal,OrderDate,* FROM   Sales.SalesOrderHeader WHERE CustomerID = 11001;

SELECT * FROM Sales.SalesOrderDetail WHERE SalesOrderID IN (43767, 51493, 72773) Order by SalesOrderID



SELECT * FROM Sales.SalesOrderDetail
    WHERE SalesOrderID IN ( SELECT SalesOrderID FROM   Sales.SalesOrderHeader WHERE CustomerID = 11001)


SELECT
  SalesOrderID,
  SalesOrderNumber,
    OrderDate,
  SubTotal,
  (SELECT SUM(LineTotal)
  FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = s.SalesOrderID) SubTotal,
  (
    SELECT SUM(OrderQty)
    FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = s.SalesOrderID
  ) AS TotalQuantity
FROM
  Sales.SalesOrderHeader s
WHERE CustomerID = 11001

