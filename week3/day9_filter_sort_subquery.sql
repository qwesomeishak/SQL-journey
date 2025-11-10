-- 1. Sort employees by salary (high to low)
SELECT Emp_id,Frist_name,Last_name,Salary
FROM Employee
ORDER BY Salary DESC;

-- 2. Sort by department then salary
SELECT Emp_id,Frist_name,Last_name,D.dept_name, Salary
FROM Employee E
LEFT JOIN Department D
ON E.Dept_id=D.dept_id
ORDER BY D.dept_name ASC, Salary DESC;

-- 3. Employees earning between 70,000 and 90,000
SELECT Emp_id,Frist_name,Last_name,Salary
FROM Employee
WHERE Salary BETWEEN 70000 AND 90000;

-- 4. Employees from a specific department (2,3)
SELECT Emp_id,Frist_name,Last_name,Salary,Dept_id
FROM Employee
WHERE Dept_id IN (2,3);

-- 5. Names starting with “A”
SELECT Emp_id,Frist_name
FROM Employee
WHERE Frist_name LIKE 'A%';

EXEC sp_spaceused 'Employee';

--6: Salary above average
SELECT Emp_id,Frist_name, Last_name,Salary
FROM Employee
WHERE Salary > (SELECT AVG(salary) From Employee);

--7: Departments with more than 3 employees
SELECT COUNT (dept_id) AS dept_id
FROM Employee
GROUP BY Dept_id
HAVING COUNT (dept_id) >3;

SELECT dept_id, dept_name 
FROM Department
WHERE dept_id IN 
(SELECT dept_id
FROM Employee
GROUP BY dept_id
HAVING COUNT(*)> 3
);

--8: Highest-paid employee(s)
SELECT Emp_id,Frist_name,Last_name, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

--9 Employees earning above their department’s average

SELECT E.Emp_id,E.Frist_name,E.Last_name, E.Salary, E.Dept_id
FROM Employee E
WHERE E.Salary > (
SELECT AVG(salary) 
FROM Employee
WHERE dept_id = E.dept_id
);

--1. Show employees who earn more than the company’s average salary.
SELECT Emp_id,Frist_name,Last_name,Salary 
FROM Employee
WHERE Salary > 
(
SELECT AVG(Salary) FROM Employee 
);


--2. List departments that have at least one employee earning above 90,000.

SELECT E.Emp_id,E.Frist_name,E.Last_name,E.Salary, D.dept_name
FROM Employee E
LEFT JOIN Department D
ON E.Dept_id=D.dept_id
WHERE E.Salary > 90000;

SELECT dept_id,dept_name 
FROM Department
WHERE dept_id IN ( SELECT DISTINCT dept_id FROM Employee
WHERE Salary>90000)

--3 Display all employees who earn less than their department’s average salary.
SELECT E.Emp_id,E.Frist_name,E.Last_name,E.Salary
FROM Employee E
WHERE E.Salary < (SELECT AVG(Salary) FROM Employee
WHERE Dept_id=E.Dept_id
);

--4.Find the second highest salary in the company.

SELECT TOP 1 Salary, Frist_name,Last_name
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee
)
ORDER BY  Salary DESC;

--5 List all employees whose department name contains “Admin” (case-insensitive).
SELECT Frist_name,Last_name, Dept_id 
FROM Employee
WHERE Dept_id IN (SELECT dept_id
FROM Department
WHERE dept_name LIKE '%ICT%'
);

--Find employees whose salary is above the average salary within their own department.

SELECT Frist_name, Last_name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) 
FROM Employee
WHERE Dept_id=Dept_id
)

--List all departments that have no employees assigned to them.

SELECT dept_id,dept_name 
FROM Department
WHERE dept_id NOT IN (SELECT DISTINCT Dept_id 
FROM Employee
WHERE Dept_id IS NOT NULL
)

--Find employees whose salary is higher than the maximum salary in the Sales department.
SELECT Frist_name,Last_name,Salary
FROM Employee
WHERE Salary>(SELECT MAX(Salary) 
FROM Employee E
INNER join Department D
ON D.dept_id=E.Dept_id
WHERE D.dept_name='ICT')
