-- ###   Group By  ###
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

# Method 1 : Display All Records
SELECT *
FROM employee_demographics;

-- when you use group by  you have to have the same columns you're grouping on in the group by statement
# Your notes are good, but they contain:

#Some table/column names that don't match your database.




# 1. Display all columns


SELECT *
FROM employee_demographics;


# 2. Display a single column


SELECT first_name
FROM employee_demographics;


# 3. Display multiple columns

SELECT
    first_name,
    last_name
FROM employee_demographics;


# 4. Column order can be changed

SELECT
    last_name,
    first_name,
    gender,
    age
FROM employee_demographics;


# 5. Perform calculations in SELECT
SELECT
    first_name,
    last_name,
    salary,
    salary + 100 AS New_Salary
FROM employee_salary;

/*---------------------------------------------------------
6. PEMDAS (Order of Operations)
Parentheses
Exponent
Multiplication
Division
Addition
Subtraction
---------------------------------------------------------*/

SELECT
    first_name,
    last_name,
    salary,
    (salary + 100) * 10 AS Calculated_Value
FROM employee_salary;


# 7. DISTINCT
# Returns only unique values.


SELECT dept_id
FROM employee_salary;

SELECT DISTINCT dept_id
FROM employee_salary;


SELECT
first_name,
salary,
salary+100
FROM employee_salary;


# Instead of displaying
#salary+100
# give it a better name:

SELECT
first_name,
salary,
salary + 100 AS Incremented_Salary
FROM employee_salary;

#output:

#first_name	salary	Incremented_Salary
#Leslie	75000	75100
#DISTINCT Example

#Without DISTINCT
SELECT dept_id
FROM employee_salary;


# With DISTINCT

SELECT DISTINCT dept_id
FROM employee_salary;
# Duplicates are removed.

SELECT *
FROM employee_demographics;

# 3. What is DISTINCT?
#DISTINCT returns only unique values by removing duplicate records from the selected column(s).
#Example:
#SELECT DISTINCT dept_id
#4. What is an Alias (AS)?
#An alias gives a temporary name to a column in the output.

#Example:
SELECT salary + 100 AS Incremented_Salary
FROM employee_salary;

#5. Does SQL follow mathematical precedence?
#Yes. SQL follows PEMDAS/BODMAS, so multiplication and division are evaluated before addition and subtraction unless parentheses are used.
#Corrections from your original script
#Original	Correct

SELECT department_id FROM employee_salary;	SELECT dept_id FROM employee_salary;

#This version is cleaner, matches your database schema, and is suitable for study notes or interview preparation.
#add statement sentences in thire as per above to understand each step code , make add more improvment, add method
#Absolutely. Since you're learning SQL for Data Science and interviews, your notes should read like a textbook: 
#                concept → syntax → explanation → example → output → interview point → real-world use.
#Below is an improved version of your SELECT Statement notes.



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


/*
SQL can perform calculations while displaying data.

Operators:

+
-
*
/
%

Example:
*/

SELECT
    first_name,
    salary,
    salary + 1000 AS Increased_Salary
FROM employee_salary;



# METHOD 6 : MATHEMATICAL OPERATIONS (PEMDAS)


/*
SQL follows mathematical precedence.

PEMDAS

P = Parentheses
E = Exponents
M = Multiplication
D = Division
A = Addition
S = Subtraction

Example:
*/

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

# Improvements over your original notes
#Clear definition before each topic.
# Every query includes Purpose, Syntax, Explanation, Output, Real-world example, and Interview question.
# Consistent formatting and indentation.
# Corrected table and column names to match your database.
# Organized into numbered methods for easier revision.

#This style is suitable for creating a complete SQL handbook from beginner to advanced.

-- Group By
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

SELECT *
FROM employee_demographics;

-- when you use group by  you have to have the same columns you're grouping on in the group by statement
SELECT gender
FROM employee_demographics
GROUP BY gender;


SELECT first_name
FROM employee_demographics
GROUP BY gender;

SELECT occupation
FROM employee_salary
GROUP BY occupation;
-- notice there is only one office manager row
-- when we group by 2 columns we now have a row for both occupation and salary because salary is different

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

-- now the most useful reason we use group by is so we can perform out aggregate functions on them
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender;

## -- GROUP BY with WHERE
SELECT gender, COUNT(*) FROM employee_demographics WHERE age > 35 GROUP BY gender;

## --GROUP BY with HAVING
SELECT dept_id, AVG(salary) FROM employee_salary  GROUP BY dept_id HAVING AVG(salary) > 60000;

## 

## --Higest Salary in every Department 
SELECT dept_id,  MAX(salary) FROM employee_salary GROUP BY dept_id;

## --Higest Salary in every Department 
SELECT dept_id,  MIN(salary) FROM employee_salary GROUP BY dept_id;

## --Number of Employees in Each Occupation
SELECT occupation, COUNT(*) FROM employee_salary GROUP BY occupation;


#### - The ORDER BY clause:  ####
-------------------------
#The ORDER BY keyword is used to sort the result-set in ascending or descending order.

#The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.


#So let's try it out with our customer table
#First let's start simple with just ordering by one column
SELECT *
FROM customers
ORDER BY first_name;

#You can see that first name is ordered from a - z or Ascending.

#We can change that by specifying DESC after it
SELECT *
FROM employee_demographics;

-- if we use order by it goes a to z by default (ascending order)
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- we can manually change the order by saying desc
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

#Now we can also do multiple columns like this:

SELECT *
FROM employee_demographics
ORDER BY gender, age;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC;



#now we don't actually have to spell out the column names. We can actually just use their column position

#State is in position 8 and money is in 9, we can use those as well.
SELECT *
FROM employee_demographics
ORDER BY 5 DESC, 4 DESC;

#Now best practice is to use the column names as it's more overt and if columns are added or replaced or something in this table it will still use the right columns to order on.

#So that's all there is to order by - fairly straight forward, but something I use for most queries I use in SQL, in this code add more operation of group by on the basis of it 










#Yes. Your notes are good, but they only cover the basic use of GROUP BY. For learning SQL from beginner to advanced, you should understand all common GROUP BY operations.

#Below is a complete version with definition → syntax → explanation → examples → output → interview questions → real-world use.

# SQL GROUP BY Clause
/*======================================================================
                        GROUP BY CLAUSE
=======================================================================*/

/*
Definition
----------
The GROUP BY clause is used to group rows that have the same value
in one or more columns.

After grouping the rows, we can perform Aggregate Functions like:

COUNT()
SUM()
AVG()
MIN()
MAX()

Syntax

SELECT column_name,
       aggregate_function(column_name)
FROM table_name
GROUP BY column_name;

*/
Method 1 : Display All Records
/*======================================================================
METHOD 1 : Display Complete Table
=======================================================================*/

SELECT *
FROM employee_demographics;


#This displays every employee.

#No grouping is performed.

# Method 2 : GROUP BY Single Column
SELECT gender
FROM employee_demographics
GROUP BY gender;

#Method 3 : GROUP BY Multiple Columns

SELECT first_name
FROM employee_demographics
GROUP BY gender;

# Methd 4 :Count 
SELECT occupation
FROM employee_salary
GROUP BY occupation
;

-- notice there is only one office manager row

-- when we group by 2 columns we now have a row for both occupation and salary because salary is different
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- now the most useful reason we use group by is so we can perform out aggregate functions on them
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;
# method 5 : find min, max, avg, cunt, sum
SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender
;
#=====================================
# Method 6: Multiple Aggregate Fuction :
#=======================================
SELECT
gender,
COUNT(*) AS Employees,
MIN(age) AS Youngest,
MAX(age) AS Oldest,
AVG(age) AS Average_Age
FROM employee_demographics
GROUP BY gender;

# Method 7 : Salary Analysis Department-wise
SELECT dept_id, COUNT(*) AS Employees, 
SUM (salary) AS Average_salary,
AVG(salary) AS Minimum_salary,
MAX(salary) AS Maximum_salary FROM employee_salary GROUP BY  dept_id;














#10 - The ORDER BY clause:
-------------------------
#The ORDER BY keyword is used to sort the result-set in ascending or descending order.

#The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.


#So let's try it out with our customer table
#First let's start simple with just ordering by one column
SELECT *
FROM customers
ORDER BY first_name;

#You can see that first name is ordered from a - z or Ascending.

#We can change that by specifying DESC after it
SELECT *
FROM employee_demographics;

-- if we use order by it goes a to z by default (ascending order)
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- we can manually change the order by saying desc
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

#Now we can also do multiple columns like this:

SELECT *
FROM employee_demographics
ORDER BY gender, age;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC;



#now we don't actually have to spell out the column names. We can actually just use their column position

#State is in position 8 and money is in 9, we can use those as well.
SELECT *
FROM employee_demographics
ORDER BY 5 DESC, 4 DESC;

#Now best practice is to use the column names as it's more overt and if columns are added or replaced or something in this table it will still use the right columns to order on.

#So that's all there is to order by - fairly straight forward, but something I use for most queries I use in SQL









