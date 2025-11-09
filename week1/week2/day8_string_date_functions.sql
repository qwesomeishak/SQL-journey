-- 1. Uppercase employee names
SELECT UPPER (Frist_name) AS Upper_first, UPPER (Last_name) AS Upper_last 
FROM employee;

-- 2. Lowercase department names
SELECT LOWER(dept_name) AS lower_dept
FROM Department;

-- 3. Combine first and last name neatly
SELECT CONCAT(Frist_name,' ',Last_name) AS Full_name
FROM Employee;

-- 4. Get first 3 letters of each employee name
SELECT LEFT (Frist_name, 3) AS Short_nmae
FROM Employee;

-- 5. Replace spaces with underscores
SELECT REPLACE(dept_name,'','_') AS Dept_Clean
FROM Department;

--Step 2 — Date Functions

-- 1. Current system date
SELECT GETDATE() AS today;

-- 2. Employee hire year
SELECT Emp_id,Frist_name, datename (year,Date_hired) AS hire_year
FROM Employee;

-- 3. Employee’s month of hire
SELECT Emp_id,Frist_name, datename (MONTH,Date_hired) AS hire_year
FROM Employee;

-- 4. Calculate number of years of service
SELECT Emp_id,Frist_name,
	DATEDIFF(year,Date_hired,Getdate())  AS No_of_service_year
FROM Employee;

-- 5. Add 30 days to hire date (e.g. probation end)
SELECT Emp_id,Frist_name,
DATEADD (DAY,30,Date_hired) AS probation_end
FROM Employee;

/*What is the employee’s full name (in uppercase)?
- What is the hire date formatted as DD‑MMM‑YYYY?
- How many years has the employee been with the company?
- Is the employee Senior (5+ years) or Junior?*/

SELECT CONCAT (UPPER(Frist_name),' ', UPPER(Last_name)),
FORMAT(Date_hired,'dd-MMM-yyyy') AS Formatted_hire_date,
DATEDIFF(YYYY,Date_hired,GETDATE()) AS year_of_service,
CASE
WHEN DATEDIFF(YYYY,Date_hired,GETDATE())>= 5 THEN 'SERIOR STAFF'
ELSE 'JUNIOR STAFF'
END AS Emp_Level
FROM Employee
WHERE CASE
WHEN DATEDIFF(YYYY,Date_hired,GETDATE())>= 5 THEN 'SERIOR STAFF'
ELSE 'JUNIOR STAFF'
END ='JUNIOR STAFF'

--1 Show only employees who joined in 2023.
SELECT  Emp_id, Frist_name,
YEAR(Date_hired) AS Year_join
FROM Employee
WHERE YEAR(Date_hired)=2023;

--2.Display the first 5 letters of each department name.
SELECT dept_id, LEFT(dept_name, 5) AS Short_dept_name
FROM Department

--3. Add a column showing if an employee’s name starts with “A” (Yes/No).
SELECT 
Emp_id, Frist_name,
LEFT (Frist_name,1) AS Initial_name,
CASE
WHEN LEFT (Frist_name,1)= 'A' THEN 'YES'
ELSE 'NO'
END AS name_initial_gro
FROM Employee
WHERE CASE
WHEN LEFT (Frist_name,1)= 'A' THEN 'YES'
ELSE 'NO'
END='YES';

--4. Calculate the employee’s next anniversary date
SELECT Emp_id,Frist_name,Date_hired,
DATEADD(YEAR,1,Date_hired) AS anniversary_date
FROM Employee;

SELECT Emp_id,Frist_name,Date_hired,
CASE
WHEN DATEFROMPARTS(YEAR(GETDATE()),MONTH(Date_hired),DAY(Date_hired))< GETDATE()
THEN DATEADD(YEAR,1,DATEFROMPARTS(YEAR(GETDATE()),MONTH(Date_hired), DAY(date_hired)))
ELSE DATEFROMPARTS(YEAR(GETDATE()),MONTH(Date_hired),DAY(date_hired))
END AS NEXt_anversy
FROM Employee;

--5.Create a single formatted sentence like: "John Doe joined on 12-Jan-2022 and has been with us for 3 years."
SELECT CONCAT 
(Frist_name,' ',last_name,' ', 'joined on', FORMAT(Date_hired,'dd-MMM-yyyy'), ' ','and has bee with us for',' ',
DATEDIFF(year,Date_hired,GETDATE()), 'years'
) AS emp_summary
FROM Employee;
