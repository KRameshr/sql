--Not Null:

-- Drop Table If exists syntax
DROP TABLE IF EXISTS Students

-- Cerate the table
CREATE TABLE Students( 
StudentID int NOT NULL, 
StudentName varchar(255) , 
Age int, 
City varchar(255) );

-- Rtrieve the table definition
SELECT * FROM Students

-- Insert the data into table -- Type 1
INSERT INTO Students (StudentID ,StudentName , Age, City ) 
VALUES  (1, 'Ramesh', 20, 'Hyderabad')

-- Insert the data into table -- Type 2
INSERT INTO Students  (StudentID ,StudentName , Age) 
VALUES  (2, 'Ganesh', 21)

-- Insert the data into table -- Type 3
INSERT INTO Students  
VALUES  (3, 'Anisha', 20, 'Delhi')

sp_help Students

-- Insert the data into table -- Type 4
INSERT INTO Students  
SELECT 4, 'Sarith', NULL, 'Mumbai'

-- Retrieve the data
SELECT * FROM students

-- Ty to insert the NULL Value
INSERT INTO Students (StudentName , Age, City ) 
VALUES  ( 'Ramesh', 20, 'Hyderabad')