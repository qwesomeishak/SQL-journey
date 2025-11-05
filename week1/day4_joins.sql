-- 1. Show employee full name + department name
SELECT E.Emp_id, E.Frist_name,E.Last_name, D.dept_name 
FROM Employee E
INNER JOIN Department D
ON E.Dept_id=D.dept_id
ORDER BY D.dept_name ASC;

-- 2. Show employee full name + office name + location
SELECT E.Emp_id, E.Frist_name,E.Last_name, O.Office_name, O.[Location] 
FROM Employee E
INNER JOIN Offices O
ON E.Office_id=O.Office_id
ORDER BY O.Office_name ASC, O.[Location] ASC;


-- 3. Show employee full name + basic salary (only those with payroll record)
SELECT e.Frist_name, e.last_name, p.basic_salary
FROM Employee E
INNER JOIN Payroll P 
ON E.Emp_id = P.Emp_id;

-- 4. Show ALL employees even if they have no payroll record (use LEFT JOIN)
SELECT E.Emp_id, e.Frist_name, e.last_name, p.basic_salary
FROM Employee E
LEFT JOIN payroll p 
ON e.emp_id = p.emp_id;

-- 5. Show payroll details even if an employee record is missing (use RIGHT JOIN)
SELECT E.Emp_id, E.Frist_name,E.Last_name, P.Basic_salary, P.Housing_allowance,P.Month_paid,P.Tax,P.Transport_allowance
FROM Employee E
RIGHT JOIN Payroll P
ON E.Emp_id=P.Emp_id;
