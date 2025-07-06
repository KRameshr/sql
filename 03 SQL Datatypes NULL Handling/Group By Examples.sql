 CREATE TABLE employee_groupby
  (
      id INT,
      name VARCHAR(50) NOT NULL,
      gender VARCHAR(50) NOT NULL,
      salary INT NOT NULL,
      department VARCHAR(50) NOT NULL
   )


INSERT INTO employee_groupby
  VALUES
  (1, 'David'	, 'Male'	, 5000	, 'Sales'		),
  (2, 'Jim'		, 'Female'	, 6000	, 'HR	'		),
  (3, 'Kate'	, 'Female'	, 7500	, 'IT'			),
  (4, 'Will'	, 'Male'	, 6500	, 'Marketing'	),
  (5, 'Shane'	, 'Female'	, 5500	, 'Finance'		),
  (6, 'Shed'	, 'Male'	, 8000	, 'Sales'		),
  (7, 'Vik'		, 'Male'	, 7200	, 'HR'			),
  (8, 'Vince'	, 'Female'	, 6600	, 'IT'			),
  (9, 'Jane'	, 'Female'	, 5400	, 'Marketing'	),
  (10, 'Laura'	, 'Female'	, 6300	, 'Finance'		),
  (11, 'Mac'	, 'Male'	, 5700	, 'Sales'		),
  (12, 'Pat'	, 'Male'	, 7000	, 'HR'			),
  (13, 'Julie'	, 'Female'	, 7100	, 'IT'			),
  (14, 'Elice'	, 'Female'	, 6800	, 'Marketing'	),
  (15, 'Wayne'	, 'Male'	, 5000	, 'Finance'		)

  SELECT * FROM employee_groupby ORDER BY department,Gender
--------------------------------------------------------
-- Group By
 SELECT department, sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY department

   SELECT Gender, sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY Gender

   SELECT department, Gender,sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY department,Gender

--------------------------------------------------------
-- ROllup

    SELECT Department,
  sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY ROLLUP (department)


    SELECT CASE WHEN department IS NULL THEN  'All Departments' ELSE Department END AS Department,
  sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY ROLLUP (department)

  if (1=1)
  begin
    SELECT
	CASE WHEN gender IS NULL THEN 'All Genders' ELSE Gender END AS Gender,
  CASE WHEN department IS NULL THEN 'All Departments' ELSE department END AS Department,
  
  sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY ROLLUP ( gender, dEPARTMENT)

  end

  else 
  print 'aMIT'

--------------------------------------------------------
  -- Cube

  SELECT
  CASE WHEN department IS NULL THEN 'All Departments' ELSE department END AS Department,
  CASE WHEN gender IS NULL THEN 'All Genders' ELSE Gender END AS Gender,
  sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY CUBE (department, gender)

--------------------------------------------------------

-- having

SELECT * FROM employee_groupby
WHERE department='Sales'



 SELECT department, sum(salary) as Salary_Sum
 INTO emp_dept_sal
  FROM employee_groupby
  GROUP BY department
  --HAVING SUM(Salary)>20000

  SELECT * FROM emp_dept_sal

 SELECT department, sum(salary) as Salary_Sum
  FROM employee_groupby
  GROUP BY department
  HAVING SUM(Salary)>20000


   SELECT department, MIN(name), MAX(Name) as Salary_Sum
  FROM employee_groupby
  GROUP BY department
  HAVING MIN(name) LIKE 'L%'

  --------------------------------------------------------

  --Order By

 SELECT * FROM employee_groupby ORDER BY salary, Gender  DESC

--OFFSET
SELECT *
FROM employee_groupby
ORDER BY salary 
OFFSET 5 rows

-- FETCH 
SELECT *
FROM employee_groupby
ORDER BY salary ASC
OFFSET 11 rows
FETCH  NEXT 20 ROWS ONLY;

----------------------------------------------------



