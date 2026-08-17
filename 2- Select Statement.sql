/*======================================================================
                         SQL SELECT STATEMENT
=======================================================================*/

/*
Definition:
-----------
The SELECT statement is the most frequently used SQL command.

It is used to retrieve (read/fetch/display) data from one or more
tables in a database.

Without SELECT, we cannot view the stored data.

Syntax:

SELECT column_name
FROM table_name;

OR

SELECT *
FROM table_name;
*/



# METHOD 1 : SELECT ALL COLUMNS


SELECT *
FROM employee_demographics;


# METHOD 2 : SELECT A SINGLE COLUMN

SELECT first_name
FROM employee_demographics;

# METHOD 3 : SELECT MULTIPLE COLUMNS
SELECT
    first_name,
    last_name
FROM employee_demographics;


# METHOD 4 : COLUMN ORDER

SELECT
    last_name,
    first_name,
    gender,
    age
FROM employee_demographics;



# METHOD 5 : USING CALCULATIONS

SELECT
    first_name,
    salary,
    salary + 1000 AS Increased_Salary
FROM employee_salary;


# METHOD 6 : MATHEMATICAL OPERATIONS (PEMDAS)

SELECT
    first_name,
    salary,
    (salary + 1000) * 10 AS Final_Value
FROM employee_salary;


# METHOD 7 : COLUMN ALIAS (AS)
SELECT
    first_name,
    salary AS Employee_Salary
FROM employee_salary;


# METHOD 8 : DISTINCT

SELECT dept_id
FROM employee_salary;

SELECT DISTINCT dept_id
FROM employee_salary;



# COMMONLY USED SELECT METHODS
-- Select everything
SELECT *
FROM employee_salary;

-- Select one column
SELECT salary
FROM employee_salary;

-- Select multiple columns
SELECT first_name,
       salary
FROM employee_salary;


-- Perform calculations
SELECT salary,
       salary + 500
FROM employee_salary;

-- Rename column
SELECT salary AS Monthly_Salary
FROM employee_salary;

-- Remove duplicates
SELECT DISTINCT dept_id
FROM employee_salary;


