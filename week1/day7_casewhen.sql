--1. Categorise employees into salary bands
--Rule example:
--90,000+ → High
--70,000–89,999 → Medium
--below 70,000 → Low

SELECT Emp_id,Frist_name,Last_name, Salary,
CASE
WHEN salary >= 90000 THEN 'HIGH'
WHEN Salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END AS Salary_grouping
FROM Employee
ORDER BY Salary_grouping ASC;

--2️ Replace NULL department names with text
SELECT E.Emp_id, E.Frist_name,E.Last_name,
COALESCE (D.dept_name, 'NOT ASSIGNED') AS dept_name
FROM Employee E
LEFT JOIN Department D
ON E.Dept_id=D.dept_id;

--3️ Create an “employment status” based on hire date.
--Hired within last 2 years → Active
--Hired more than 2 years ago → Long-Term

SELECT Emp_id, Frist_name,Last_name,Date_hired,
CASE
WHEN DATEDIFF (year, Date_hired, GETDATE())<= 2 THEN 'ACTIVE'
ELSE 'NOT ACTIVE'
END AS Empl_status
FROM Employee;

--4 Use CASE inside a GROUP BY, Show number of employees per salary band:

SELECT
CASE
WHEN salary >= 90000 THEN 'HIGH'
WHEN salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END AS salary_group,
COUNT (*) AS Emp_count
FROM Employee
GROUP BY
CASE
WHEN salary >= 90000 THEN 'HIGH'
WHEN salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END

--Extra Practice
--1. Label employees as "Above Average" / "Below Average" based on overall salary average

SELECT Emp_id,Frist_name,Last_name, Salary,
CASE
WHEN Salary >= (SELECT AVG(Salary) From Employee) THEN 'Above Average'
ELSE 'Below Average'
END AS Emp_avg_salary
FROM Employee
ORDER BY Emp_avg_salary ASC;

SELECT * FROM Employee
ORDER BY Grade_level ASC


--2 Show only emplyees with the same Grade Level
SELECT E1.Last_name, E1.Grade_level 
FROM
Employee E1, Employee E2
WHERE E1.Grade_level = E2.Grade_level 
AND E1.Emp_id <> E2.Emp_id
ORDER BY Grade_level ASC

--3. Show only employees in the "High" salary band
SELECT Emp_id, Frist_name, Last_name , Salary,
CASE
WHEN Salary >= 90000 THEN 'HIGH'
WHEN Salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END AS Salary_band
FROM Employee
WHERE 
CASE
WHEN Salary >= 90000 THEN 'HIGH'
WHEN Salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END= 'HIGH';

SELECT Emp_id, Frist_name, Last_name , Salary
FROM Employee
Where Salary>='90000'

--4. Create a column tax_rate:
--High → 21%
--Medium → 15%
--Low → 9%

ALTER TABLE Employee
ADD Tax_rate DECIMAL (10,2)

ALTER TABLE Employee
ALTER COLUMN Tax_rate NVARCHAR (50)

SELECT * FROM Employee

UPDATE Employee SET Tax_rate = '21%' WHERE Salary >= 90000
UPDATE Employee SET Tax_rate = '15%' WHERE Salary BETWEEN 70000 AND 89999
UPDATE Employee SET Tax_rate = '9%' WHERE Salary <= 70000

SELECT Emp_id,Frist_name,Last_name, Salary,
CASE
WHEN Salary >= 90000 THEN '21%'
WHEN Salary BETWEEN 70000 AND 89999 THEN '15%'
ELSE '9%' 
END AS Tax_rate
FROM Employee

--4. Create column eligibility:
--If salary > 80,000 → "Eligible for Bonus"
--Else → "Not Eligible"

SELECT Emp_id, Frist_name, Last_name, Salary,
CASE
WHEN Salary >= 80000 THEN 'Eligible for Bonus'
ELSE 'Not Eligible'
END AS Eligibility
FROM Employee;

--Create a CASE that handles unknown salary values (NULL) and labels them "Missing Salary"
SELECT Emp_id,Frist_name, Last_name,Salary,
CASE
WHEN Salary=NULL THEN 'Missing Salary'
WHEN Salary >= 90000 THEN 'HIGH'
WHEN Salary BETWEEN 70000 AND 89999 THEN 'MEDIUM'
ELSE 'LOW'
END AS Salary_bnad
FROM Employee;
