/*=
                    SQL SUBQUERIES
=*/

/*
Definition
----------
A Subquery (Nested Query) is a query written inside
another SQL query.

The inner query executes first.

The result of the inner query is passed to the outer query.

Syntax

SELECT column_name
FROM table_name
WHERE column_name
(
    SELECT column_name
    FROM table_name
);
*/


/*==
Method 1 : Simple Subquery
(Find employees in Department 1)
=*/

SELECT *
FROM employee_salary
WHERE dept_id =
(
    SELECT department_id
    FROM parks_departments
    WHERE department_name = 'Parks and Recreation'
);



/*=
Method 2 : Subquery using IN
=*/

SELECT *
FROM employee_salary
WHERE dept_id IN
(
    SELECT department_id
    FROM parks_departments
);



/*=
Method 3 : Subquery with AVG()
(Employees earning above average salary)
=*/

SELECT
first_name,
salary
FROM employee_salary
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee_salary
);



/*=
Method 4 : Subquery with MAX()
=*/

SELECT *
FROM employee_salary
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee_salary
);



/*=
Method 5 : Subquery with MIN()
=*/

SELECT *
FROM employee_salary
WHERE salary =
(
    SELECT MIN(salary)
    FROM employee_salary
);



/*=========================================================
Method 6 : Subquery with COUNT()
=========================================================*/

SELECT *
FROM employee_salary
WHERE dept_id =
(
    SELECT dept_id
    FROM employee_salary
    GROUP BY dept_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);



/*=========================================================
Method 7 : Subquery in SELECT Clause
=========================================================*/

SELECT

first_name,

salary,

(
SELECT AVG(salary)
FROM employee_salary
) AS Average_Salary

FROM employee_salary;



/*=========================================================
Method 8 : Subquery in FROM Clause
=========================================================*/

SELECT *

FROM

(
SELECT
employee_id,
first_name,
salary
FROM employee_salary
WHERE salary > 50000
) AS High_Salary;



/*=========================================================
Method 9 : Correlated Subquery
=========================================================*/

SELECT

first_name,

salary,

dept_id

FROM employee_salary e1

WHERE salary >

(
SELECT AVG(salary)
FROM employee_salary e2
WHERE e1.dept_id = e2.dept_id
);



/*=========================================================
Method 10 : EXISTS
=========================================================*/

SELECT *

FROM employee_demographics dem

WHERE EXISTS

(
SELECT *
FROM employee_salary sal
WHERE dem.employee_id = sal.employee_id
);



/*=========================================================
Method 11 : NOT EXISTS
=========================================================*/

SELECT *

FROM employee_demographics dem

WHERE NOT EXISTS

(
SELECT *
FROM employee_salary sal
WHERE dem.employee_id = sal.employee_id
);



/*=========================================================
Method 12 : Subquery with ANY
=========================================================*/

SELECT *

FROM employee_salary

WHERE salary > ANY

(
SELECT salary
FROM employee_salary
WHERE dept_id = 6
);



/*=========================================================
Method 13 : Subquery with ALL
=========================================================*/

SELECT *

FROM employee_salary

WHERE salary > ALL

(
SELECT salary
FROM employee_salary
WHERE dept_id = 6
);



/*=========================================================
Method 14 : Nested Subquery
=========================================================*/

SELECT *

FROM employee_salary

WHERE dept_id =

(
SELECT department_id
FROM parks_departments
WHERE department_name =

(
SELECT department_name
FROM parks_departments
WHERE department_id = 1
)
);



/*=========================================================
Method 15 : UPDATE using Subquery
=========================================================*/

UPDATE employee_salary

SET salary = salary + 5000

WHERE dept_id =

(
SELECT department_id
FROM parks_departments
WHERE department_name = 'Finance'
);