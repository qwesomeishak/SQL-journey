-- Task 1
--Show a list of all employees and their departments, even if:
--an employee has no department assigned
--a department has no employees.

SELECT E.Emp_id, E.Frist_name, E.Last_name, D.dept_name
FROM Employee E
FULL JOIN Department D
ON E.Dept_id=D.dept_id;

/*Task 2
Return a single column list of all employee first_names and all department names.
Use UNION first (removes duplicates)
Then UNION ALL (keeps duplicates)*/

SELECT Frist_name AS Name 
FROM Employee
UNION
SELECT dept_name FROM Department;

SELECT Frist_name AS Name 
FROM Employee
UNION ALL
SELECT dept_name FROM Department;


/*Handling NULLs with COALESCE
Task 3
Show all employees with their department name. If department is NULL, show "Not Assigned".*/

SELECT Emp_id, Frist_name,Last_name,
COALESCE (D.dept_name, 'NOT ASSIGNED') AS dept_name
FROM Employee E
LEFT JOIN Department D
ON
E.Dept_id=D.dept_id

--Task 4 List employees who do not belong to any department.
SELECT * FROM Employee
WHERE Dept_id IS NUll;

-- Task 5, Return all employees + departments, but show text instead of NULLs:

SELECT 
COALESCE (E.Emp_id, 'No employee') AS Emp_Id,
COALESCE (E.Frist_name, 'No employee') AS Emp_Name,
COALESCE (D.dept_name, 'Show') AS Dep_Name
FROM Employee E 
FULL JOIN Department D 
ON E.Dept_id=D.dept_id;
