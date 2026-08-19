/*=
                        SQL JOINS
=*/

/*
Definition
----------
A JOIN is used to combine data from two or more tables
using a common column.

In our database, the common column is:

employee_id

Types of Joins

1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. SELF JOIN
5. Multiple Table JOIN
*/


/*=
Method 1 : Display Employee Demographics Table
=*/

SELECT *
FROM employee_demographics;


/*=
Method 2 : Display Employee Salary Table
==*/

SELECT *
FROM employee_salary;

/*==
Method 3 : INNER JOIN
(Return only matching records)
===*/

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id =
employee_salary.employee_id;

## Method 4 : INNER JOIN using Alias (Best Practice)

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;




# Method 5 : Select Required Columns


SELECT
dem.employee_id,
dem.first_name,
dem.last_name,
sal.occupation,
sal.salary
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;




# Method 6 : LEFT JOIN
#(Return all rows from Left Table)


SELECT *
FROM employee_salary sal
LEFT JOIN employee_demographics dem
ON sal.employee_id = dem.employee_id;


# Method 7 : RIGHT JOIN
#(Return all rows from Right Table)

SELECT *
FROM employee_salary sal
RIGHT JOIN employee_demographics dem
ON sal.employee_id = dem.employee_id;




# Method  : Find Employees without Demographic Data

SELECT *
FROM employee_salary sal
LEFT JOIN employee_demographics dem
ON sal.employee_id = dem.employee_id
WHERE dem.employee_id IS NULL;


# Method 9 : Find Employees without Salary Data

SELECT *
FROM employee_demographics dem
LEFT JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
WHERE sal.employee_id IS NULL;




#3 Method 10 : SELF JOIN
#(Join a table with itself)

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id = emp2.employee_id;


# Method 11 : SELF JOIN (Secret Santa Example)


SELECT
emp1.employee_id AS santa_id,
emp1.first_name AS santa_name,
emp2.employee_id AS employee_id,
emp2.first_name AS employee_name
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1 = emp2.employee_id;



# Method 12 : INNER JOIN Three Tables

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments dept
ON sal.dept_id = dept.department_id;


# Method 13 : LEFT JOIN Three Tables

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments dept
ON sal.dept_id = dept.department_id;


# Method 14 : Display Required Columns from Three Tables

SELECT
dem.employee_id,
dem.first_name,
dem.last_name,
sal.occupation,
sal.salary,
dept.department_name
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments dept
ON sal.dept_id = dept.department_id;




# Method 15 : Employees Working in Finance Department

SELECT
dem.first_name,
dem.last_name,
dept.department_name
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
WHERE dept.department_name = 'Finance';


# Method 16 : Employees with Salary Greater than 70000

SELECT
dem.first_name,
dem.last_name,
sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
WHERE sal.salary > 70000;


# Method 17 : Department-wise Employee Count

SELECT
dept.department_name,
COUNT(*) AS total_employee
FROM employee_salary sal
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
GROUP BY dept.department_name;

# Method 18 : Department-wise Average Salary

SELECT
dept.department_name,
AVG(sal.salary) AS average_salary
FROM employee_salary sal
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
GROUP BY dept.department_name;


# Method 19 : Highest Salary in Each Department

SELECT
dept.department_name,
MAX(sal.salary) AS highest_salary
FROM employee_salary sal
JOIN parks_departments dept
ON sal.dept_id = dept.department_id
GROUP BY dept.department_name;


# Method 20 : Order Joined Result

SELECT
dem.first_name,
sal.salary,
dept.department_name
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments dept
ON sal.dept_id = dept.department_id
ORDER BY sal.salary DESC;