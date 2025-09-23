-- (a) How many employees are in the organization?
SELECT COUNT(*) AS TotalEmployees
FROM emp;

-- (b) What is the total salary paid to all employees?
SELECT SUM(salary) AS TotalSalary
FROM emp;

-- (c) What is the highest salary and the lowest salary among all employees?
SELECT MAX(salary) AS HighestSalary, MIN(salary) AS LowestSalary
FROM emp;

-- (d) What is the average salary of employees?
SELECT AVG(salary) AS AverageSalary
FROM emp;

-- (e) How many employees are aged below 30?
SELECT COUNT(*) AS EmployeesBelow30
FROM emp
WHERE age < 30;

-- (f) What is the total number of departments?
SELECT COUNT(*) AS TotalDepartments
FROM dept;

-- (g) What is the maximum and minimum department budget?
SELECT MAX(budget) AS MaxBudget, MIN(budget) AS MinBudget
FROM dept;

-- (h) What is the total percentage of work assigned across all employees?
SELECT SUM(pct_time) AS TotalPctTime
FROM works;

-- (i) What is the average work time (pct time) per employee?
SELECT eid, AVG(pct_time) AS AvgPctTime
FROM works
GROUP BY eid;
