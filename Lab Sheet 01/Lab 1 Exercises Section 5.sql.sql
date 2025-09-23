-- (a) Display the department IDs where the number of employees is less than 3.
SELECT did, COUNT(eid) AS NumberOfEmployees
FROM works
GROUP BY did
HAVING COUNT(eid) < 3;

-- (b) List each manager and the number of departments they manage.
-- Show only managers who manage more than 1 department. Sort by the number of departments ascending.
SELECT e.eid, e.ename, COUNT(d.did) AS NumberOfDepartments
FROM dept d
JOIN emp e ON d.managerId = e.eid
GROUP BY e.eid, e.ename
HAVING COUNT(d.did) > 1
ORDER BY NumberOfDepartments ASC;

-- (c) Show each age group and the average salary of employees in that group.
-- Display only age groups where the average salary is greater than 40,000.
SELECT age, AVG(salary) AS AvgSalary
FROM emp
GROUP BY age
HAVING AVG(salary) > 40000;

-- (d) Find the number of work assignments per employee.
-- Display employees with more than 2 assignments.
SELECT e.eid, e.ename, COUNT(w.did) AS NumAssignments
FROM emp e
JOIN works w ON e.eid = w.eid
GROUP BY e.eid, e.ename
HAVING COUNT(w.did) > 2;

-- (e) List departments with a total budget greater than 1,000,000.
SELECT did, budget
FROM dept
WHERE budget > 1000000;
