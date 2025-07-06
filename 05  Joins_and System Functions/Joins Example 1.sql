
DROP TABLE IF EXISTS  Customers
CREATE TABLE Customers
( Cust_id INT PRIMARY KEY , Cust_name VARCHAR(50)
, City VARCHAR(20) , Zipcode INT )

INSERT INTO Customers VALUES 
(1	,'Srinivas',	'Hyderabad',	500072),(9,	'Sita',	'Chennai',	600071)

SELECT * FROM Customers

DROP TABLE IF EXISTS Orders
CREATE TABLE Orders (
Order_id INT PRIMARY KEY
,	Order_Date DATE
,	Sales_Amount NUMERIC(18,2)
,	Cust_id INT,  FOREIGN KEY (Cust_id) REFERENCES Customers (Cust_id))
INSERT INTO Orders VALUES 
(1001,	'2022-10-15',	1000,	1),(1002	,'2022-10-16',	2000,	1)
,(1003	,'2022-10-17',	3000,	1),(1004	,'2022-10-17',	1500,	NULL)

SELECT * FROM Orders

SELECT * FROM Customers c
INNER JOIN Orders o ON c.Cust_id =o.Cust_id

SELECT * FROM Customers c
LEFT JOIN Orders o ON c.Cust_id =o.Cust_id

SELECT * FROM Customers c
RIGHT JOIN Orders o ON c.Cust_id =o.Cust_id

SELECT * FROM Customers c
FULL OUTER JOIN Orders o ON c.Cust_id =o.Cust_id

SELECT * FROM Customers c
CROSS JOIN Orders o


