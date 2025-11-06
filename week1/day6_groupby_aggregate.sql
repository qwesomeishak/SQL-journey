--1. Count how many employees per department
SELECT E.Dept_id, D.dept_name, COUNT (*) AS Dept_Count
FROM Employee E
FULL JOIN Department D 
ON E.Dept_id=D.dept_id
GROUP BY E.Dept_id, D.dept_name;

--2. Show total salary paid per department
SELECT E.Dept_id, D.dept_name, SUM (Salary) AS salary_depart
FROM Employee E
FULL JOIN Department D 
ON E.Dept_id=D.dept_id
GROUP BY E.Dept_id, D.dept_name
ORDER BY salary_depart ASC;

-- 3. Show average salary per department (rounded to 2 decimals)
SELECT E.Dept_id, D.dept_name, ROUND(AVG(Salary),2) AS Avg_salary
FROM Employee E
FULL JOIN Department D 
ON E.Dept_id=D.dept_id
GROUP BY E.Dept_id, D.dept_name
ORDER BY Avg_salary ASC;

--4. Show only departments with more than 2 employees (HAVING)
SELECT E.Dept_id, D.dept_name, COUNT (*) AS total_employee
FROM Employee E
FULL JOIN Department D
ON E.dept_id=D.dept_id
GROUP BY E.Dept_id, D.dept_name
HAVING COUNT (*) > 2;

--Display department name + total salary + number of employees.
SELECT D.dept_name,
SUM(Salary) AS Total_salary,
COUNT (E.Emp_id) AS Total_Staff
FROM Employee E
LEFT JOIN Department D
ON E.Dept_id=D.dept_id
GROUP BY D.dept_name
ORDER BY Total_Staff;
