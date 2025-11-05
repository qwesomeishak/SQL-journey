USE HR_DB

-- 1. List all employees ordered by last name A → Z
SELECT * FROM Employee
ORDER BY Last_name ASC;

-- 2. List all employees ordered by date hired (most recent first)
SELECT * FROM Employee
ORDER BY Date_hired DESC;

-- 3. Show the TOP 3 highest paid staff (based on basic salary)
SELECT TOP 3 E.Emp_id, E.Frist_name, E.Last_name, P.Basic_salary 
FROM Employee E
JOIN Payroll P
ON E.Emp_id=P.Emp_id
ORDER BY P.Basic_salary DESC;

-- 4. List employees ordered by grade level (highest GL first),
-- and if same grade, sort by first name

SELECT Emp_id,Frist_name,Last_name, Grade_level
FROM Employee
ORDER BY Grade_level DESC, Frist_name ASC;

-- 5. Show all employees but sort by office name, then last name
SELECT  E.Emp_id,E.Frist_name,E.Last_name, O.Office_name
FROM Employee E
JOIN Offices O
ON E.Office_id=O.Office_id
ORDER BY O.Office_name ASC, Last_name ASC;
