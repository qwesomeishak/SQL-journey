-- 1. Get all employees in grade level GL8
SELECT Emp_id,Frist_name,Last_name,Grade_level 
FROM Employee
WHERE Grade_level='GL8';

-- 2. List all married staff working in Kaduna HQ
SELECT E.Emp_id,E.Frist_name,E.Last_name,E.Marital_status, O.Office_name
FROM Employee E
INNER JOIN Offices O
ON E.Office_id=O.Office_id
WHERE E.Marital_status='Married' AND O.Office_name='Kaduna HQ'
ORDER BY E.Emp_id ASC;

-- 3. Show employees hired between 2019 and 2021
SELECT Emp_id, Frist_name,Last_name,Date_hired
FROM Employee
WHERE Date_hired BETWEEN '2019-12-31' AND '2021-12-31';

-- 4. Show all staff who are in Finance OR ICT department
SELECT E.Emp_id,E.Frist_name,E.Last_name, D.dept_name
FROM Employee E
JOIN Department D
ON E.Dept_id=D.dept_id
JOIN Offices O
on E.Office_id=O.Office_id
WHERE D.dept_name IN ('Finance', 'ICT');

-- 5. Show employees whose basic salary is greater than 250,000
SELECT E.Emp_id,E.Frist_name,E.Last_name, P.Basic_salary
FROM Employee E
JOIN Payroll P
ON E.Emp_id=P.Emp_id
WHERE P.Basic_salary > '250000';
