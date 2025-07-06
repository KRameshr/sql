
--VIEW
-- Simple View to limit the columns from the table
CREATE VIEW vw_Emp 
AS
SELECT EmpNo,ENAME, JOB,MGR,DEPTNO 
FROM EMP

-- Execute View
SELECT * FROM vw_Emp 
-------------------------------------------
-- Simple View to limit the columns and rows from the table
CREATE VIEW vw_Emp_Dept_10
AS
SELECT EmpNo,ENAME, JOB,MGR,DEPTNO 
FROM EMP
WHERE DeptNo=10

-- Execute View
SELECT * FROM vw_Emp_Dept_10 

-------------------------------------------
-- Complex view 
CREATE View vw_Emp_Dept
AS
SELECT EmpNo,ENAME, JOB,MGR,DNAME,LOC 
FROM EMP e
JOIN Dept d ON e.DEPTNO = d.DEPTNO

-- Execute View
SELECT * FROM vw_Emp_Dept 