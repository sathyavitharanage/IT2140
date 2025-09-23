-- (a) Retrieve all information of all employees.
SELECT * FROM emp;

-- (b) Display the names and salaries of employees who earn more than 50,000.
SELECT ename, salary
FROM emp
WHERE salary > 50000;

-- (c) Find employees whose names start with the letter 'A'.
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- (d) List the names and ages of employees younger than 30.
SELECT ename, age
FROM emp
WHERE age < 30;

-- (e) Find the employees whose salary is between 20,000 and 60,000.
SELECT *
FROM emp
WHERE salary BETWEEN 20000 AND 60000;

-- (f) Show employee names whose names contain the letter 'a'.
SELECT ename
FROM emp
WHERE ename LIKE '%a%';

-- (g) Display the employee ID and name of those who are either aged 24 or 28.
SELECT eid, ename
FROM emp
WHERE age IN (24, 28);

-- (h) Select employees whose age is not between 25 and 35.
SELECT *
FROM emp
WHERE age NOT BETWEEN 25 AND 35;

-- (i) List all employees whose salary is not null.
SELECT *
FROM emp
WHERE salary IS NOT NULL;
