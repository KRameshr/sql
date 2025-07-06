

---- Customer Table
 DROP TABLE IF EXISTS Customer
  CREATE TABLE  Customer  (     Customer_Id    Int,	 Customer_Name  varchar(50)   Not Null )

  INSERT INTO Customer Values 
  (1,'John Smith'),(2,'Jane Doe'),(3,'Bob Johnson'),(4,'Alice Brown'),(5,'Tom Wilson')

Select * from Customer

---------------------------------------------------------------------------------------

 --- Products Table
 DROP TABLE IF EXISTS Product
 CREATE TABLE Product
 (
   Product_Id               Int,
   Product_Name Varchar(50) Not Null,
   Product_Price            Int
 )

 INSERT INTO Product Values (1,'iphone',200000)
                           ,(2,'Motorala',15000)
						   ,(3,'Oppo',10000)
						   ,(4,'Samsung',150000)
						   ,(5,'Vivo',75000)
Select * from Customer
	Select * from Product

-----------------------------------------------------------------------------------

---Orders Table
DROP TABLE IF EXISTS Orders
  CREATE TABLE Orders
  (
     Order_Id             Int,
	 Customer_Id          Int,
	 Product_Id           Int,
	 Order_Date           Date
  )

  INSERT INTO Orders Values (1,1,2,'2022-01-01')
                           ,(2,1,4,'2022-01-02')
						   ,(3,2,1,'2022-01-02')
						   ,(4,4,3,'2022-01-03')
						   ,(5,4,3,'2022-01-03')
						   ,(6,5,2,'2023-03-04')
						   ,(7,5,4,'2023-05-05')


Select * from Customer
Select * from Product
Select * from Orders 


SELECT c.Customer_Name,P.Product_Name FROM Customer AS c
INNER JOIN Orders o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
WHERE Customer_Name='John Smith'







-----------------------------------------------------------------------------------------------------------

--Get a list of all orders along with the customer's name and the product name
SELECT o.*,c.Customer_Name,P.Product_Name 
FROM Orders o
INNER JOIN Customer c
ON o.Customer_Id=c.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id


-----------------------------------------------------------------------------------------------------------------------------

--Get a list of all customers and total number of orders they have placed, 
--even if they have not placed any orders

SELECT c.Customer_Name, COUNT(Order_Id) cnt_of_orders
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_Id=o.Customer_Id
GROUP BY c.Customer_Name
Order by 1 DESC

     


---------------------------------------------------------------------------------------------------------------------------------

--Find a customer who has paid highest amount for his orders

SELECT *
FROM Customer c
INNER JOIN Orders  o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id

SELECT c.Customer_Name,SUM(Product_Price) sum_of_Product
FROM Customer c
INNER JOIN Orders  o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP  BY c.Customer_Name


SELECT c.Customer_Name,SUM(Product_Price) sum_of_Product
FROM Customer c
INNER JOIN Orders  o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP  BY c.Customer_Name
ORDER BY sum_of_Product DESC

SELECT TOP 1 c.Customer_Name,SUM(Product_Price) sum_of_Product
FROM Customer c
INNER JOIN Orders  o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP  BY c.Customer_Name
ORDER BY sum_of_Product DESC

;with CTE_rank AS
(
SELECT c.Customer_Name,SUM(Product_Price) sum_of_Product
FROM Customer c
INNER JOIN Orders  o
ON c.Customer_Id=o.Customer_Id
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP  BY c.Customer_Name
)
, CTE_Final AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY sum_of_Product DESC) rn FROM CTE_rank
)

SELECT * FROM CTE_Final
WHERE rn=1


		

--------------------------------------------------------------------------------------------------------------

--Identify the most bought product by Customer

;WITH CTE_Products AS
(
SELECT  p.Product_Name, COUNT(*) cnt
FROM Orders o
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP BY p.Product_Name
)
, CTE_Rank_Final AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY cnt DESC) rn FROM CTE_Products
)

SELECT * FROM CTE_Rank_Final
WHERE rn=1



;WITH CTE_Products AS
(
SELECT  p.Product_Name, SUM(Product_Price) cnt
FROM Orders o
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP BY p.Product_Name
)
, CTE_Rank_Final AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY cnt DESC) rn FROM CTE_Products
)

SELECT * FROM CTE_Rank_Final
WHERE rn=1

SELECT * FROM
	(

		SELECT *,  DENSE_RANK() OVER(ORDER BY cnt DESC) rn
		FROM
		(
			SELECT  p.Product_Name, SUM(Product_Price) cnt
			FROM Orders o
			INNER JOIN Product p
			ON o.Product_Id=p.Product_Id
			GROUP BY p.Product_Name
		) a
	)b

WHERE rn=1
 
       

---------------------------------------------------------------------------------------------------------------

--Find year wise and month wise product sales

SELECT Year(Order_Date) Yr, MONTH(Order_Date) Mn, SUM(Product_Price) sum_Sales
FROM Orders o
INNER JOIN Product p
ON o.Product_Id=p.Product_Id
GROUP BY DATEPART(yy,Order_Date), DATEPART(MM,Order_Date)
                             
		
  ------------------------------------------------------------------------------------------------------------------------

  --Identify the product which was not sold so far
  SELECT p.Product_Name
  FROM Product p
  LEFT JOIN Orders o
  ON p.Product_Id=o.Product_Id
  WHERE o.Product_Id IS NULL
    
------------------------------------------------------------------------------------------------------------------------------

--Identify who hasn't placed any order so far
SELECT c.customer_name FROM customer cLEFT JOIN orders o 	ON c.customer_id=o.customer_idWHERE order_id IS NULL
  
            
Select * from Customer
Select * from Product
Select * from Orders 





























