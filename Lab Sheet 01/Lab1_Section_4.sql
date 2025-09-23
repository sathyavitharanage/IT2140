-- (a) What is the total salary paid to employees of each age group?
SELECT age, SUM(salary) AS TotalSalary
FROM emp
GROUP BY age;

-- (b) Count the number of employees working in each department.
-- Rename the count as 'Number of Employees'.
SELECT did, COUNT(eid) AS NumberOfEmployees
FROM works
GROUP BY did;

-- (c) How many employees earn a salary greater than 50,000?
SELECT COUNT(*) AS EmployeesAbove50k
FROM emp
WHERE salary > 50000;

-- (d) List all employees who earn more than 50,000, sorted by salary in ascending order.
SELECT *
FROM emp
WHERE salary > 50000
ORDER BY salary ASC;
