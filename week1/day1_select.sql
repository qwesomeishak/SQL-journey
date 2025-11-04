-- 1. Show all employees

SELECT * FROM Employee;

-- 2. Show only first name, last name, and office_id

SELECT Frist_name,Last_name,Office_id FROM Employee;

-- 3. Show distinct marital statuses

SELECT DISTINCT Marital_status FROM Employee;

-- 4. List all employees hired after 2019

SELECT Frist_name,Last_name,Date_hired
FROM Employee
WHERE Date_hired > '2019-12-31';

-- 5. Show all female staff from the HR department

SELECT E.Frist_name,E.Last_name, D.dept_name
FROM Employee E
JOIN Department D
ON E.Dept_id=D.dept_id
WHERE E.Gender= 'F' AND D.dept_name='Human Resources';
