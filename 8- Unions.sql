/*=
                        SQL UNION
=*/

/*
Definition
----------
The UNION operator is used to combine the result of
two or more SELECT statements into a single result.

Rules
-----
1. Each SELECT must have the same number of columns.
2. Corresponding columns must have compatible data types.
3. Column names are taken from the first SELECT statement.
4. UNION removes duplicate rows.
5. UNION ALL keeps duplicate rows.

Syntax

SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
*/



# Method 1 : Display Employee Names


SELECT first_name
FROM employee_demographics;

SELECT first_name
FROM employee_salary;



#Method 2 : UNION
# (Removes Duplicate Records)


SELECT first_name
FROM employee_demographics
UNION
SELECT first_name
FROM employee_salary;




#Method 3 : UNION ALL
#(Keeps Duplicate Records)


SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary;




# Method 4 : UNION Multiple Columns


SELECT
first_name,
last_name
FROM employee_demographics
UNION
SELECT
first_name,
last_name
FROM employee_salary;




# Method 5 : UNION with ORDER BY


SELECT first_name
FROM employee_demographics
UNION
SELECT first_name
FROM employee_salary
ORDER BY first_name;




# Method 6 : UNION ALL with ORDER BY


SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary
ORDER BY first_name;




# Method 7 : UNION Different Tables


SELECT
employee_id,
first_name
FROM employee_demographics
UNION
SELECT
department_id,
department_name
FROM parks_departments;




# Method 8 : UNION with WHERE


SELECT
first_name,
last_name
FROM employee_demographics
WHERE gender = 'Male'
UNION
SELECT
first_name,
last_name
FROM employee_salary
WHERE salary > 70000;




# Method 9 : UNION ALL with WHERE


SELECT
first_name,
last_name
FROM employee_demographics
WHERE age > 35
UNION ALL
SELECT
first_name,
last_name
FROM employee_salary
WHERE dept_id = 1;




# Method 10 : UNION with Alias


SELECT
first_name AS Name
FROM employee_demographics
UNION
SELECT
last_name
FROM employee_demographics;




# Method 11 : UNION Three SELECT Statements


SELECT first_name
FROM employee_demographics
UNION
SELECT first_name
FROM employee_salary
UNION
SELECT department_name
FROM parks_departments;




# Method 12 : UNION with Aggregate Functions


SELECT
'Total Employees' AS Details,
COUNT(*) AS Total
FROM employee_demographics
UNION
SELECT
'Salary Records',
COUNT(*)
FROM employee_salary;




#3 Method 13 : UNION with Literal Values


SELECT
'Employee Table' AS Source,
COUNT(*) AS Total
FROM employee_demographics
UNION
SELECT
'Salary Table',
COUNT(*)
FROM employee_salary;




# Method 14 : UNION ALL with Salary


SELECT
first_name,
salary
FROM employee_salary
WHERE salary > 70000
UNION ALL
SELECT
first_name,
salary
FROM employee_salary
WHERE salary < 50000;




# Method 15 Difference Between UNION and UNION ALL

-- UNION
-- Removes duplicate rows

SELECT first_name
FROM employee_demographics
UNION
SELECT first_name
FROM employee_salary;



-- UNION ALL
-- Keeps duplicate rows

SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary;