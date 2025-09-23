/* Assumed tables:
   Employees(eid, ename, salary)
   Departments(did, dname, budget)
   WorksIn(eid, did, pct_time)  -- one row per employee–department assignment
*/

/* (a) How many employees are working in each department? (dept ID + count)
   – LEFT JOIN so departments with zero employees show as 0
*/
SELECT
  d.did,
  COALESCE(COUNT(DISTINCT w.eid), 0) AS emp_count
FROM Departments d
LEFT JOIN WorksIn w ON w.did = d.did
GROUP BY d.did
ORDER BY d.did;

/* (b) How many employees are working in each department? (dept name + count) */
SELECT
  d.dname,
  COALESCE(COUNT(DISTINCT w.eid), 0) AS emp_count
FROM Departments d
LEFT JOIN WorksIn w ON w.did = d.did
GROUP BY d.dname
ORDER BY d.dname;

/* (c) Departments with more than 2 employees – IDs only */
SELECT
  d.did
FROM Departments d
LEFT JOIN WorksIn w ON w.did = d.did
GROUP BY d.did
HAVING COUNT(DISTINCT w.eid) > 2
ORDER BY d.did;

/* (d) Departments with more than 2 employees – name + count, ascending by count */
SELECT
  d.dname,
  COUNT(DISTINCT w.eid) AS emp_count
FROM Departments d
LEFT JOIN WorksIn w ON w.did = d.did
GROUP BY d.dname
HAVING COUNT(DISTINCT w.eid) > 2
ORDER BY emp_count ASC, d.dname;
