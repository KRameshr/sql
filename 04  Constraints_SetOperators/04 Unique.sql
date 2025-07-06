DROP TABLE IF EXISTS persons

CREATE TABLE persons (
    p_id		INT NOT NULL ,
    p_name		VARCHAR(30) NOT NULL,
    birth_date	DATE,
    phone		VARCHAR(10) UNIQUE
)
-- It will help you to identify table attributes like column names, Data types and Constarints
sp_help persons

SELECT * FROM persons

INSERT INTO persons (p_id,p_name,birth_date,phone)
VALUES (1,'Srinivas','1999-04-28','9988776655')

-- Unique Constarint will not allow any duplicate values. Hence the below statement will fail.
INSERT INTO persons (p_id,p_name,birth_date,phone)
VALUES (2,'Afreen','1999-04-28','9988776655')

-- Unique Constarint will not allow any duplicate values. Hence the below statement will fail.
INSERT INTO persons (p_id,p_name,birth_date,phone)
VALUES (3,'Ravi','1998-06-18','9988776655')



INSERT INTO persons (p_id,p_name,birth_date,phone)
VALUES (3,'Ravi','1998-06-18',NULL)


INSERT INTO persons (p_id,p_name,birth_date,phone)
VALUES (4,'Sanjeev','1998-06-18',NULL)