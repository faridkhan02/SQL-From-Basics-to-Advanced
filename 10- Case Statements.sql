/*
                    SQL CASE STATEMENT
=*/

/*
Definition
----------
The CASE statement is used to add conditional logic
inside a SQL query.

It works like an IF...ELSE statement in programming.

CASE checks conditions one by one.
When a condition is TRUE, it returns the corresponding value.
If no condition is TRUE, ELSE is executed.

Syntax

SELECT
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result
END
FROM table_name;
*/


/*==
Method 1 : Simple CASE Statement
=*/

SELECT
first_name,
last_name,
age,

CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Adult'
    ELSE 'Senior'
END AS Age_Category

FROM employee_demographics;



/*=
Method 2 : CASE using Salary
==*/

SELECT

first_name,
salary,

CASE
    WHEN salary >= 80000 THEN 'High Salary'
    WHEN salary >= 50000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS Salary_Level

FROM employee_salary;



/*=
Method 3 : CASE with Multiple Conditions
=*/

SELECT

first_name,
gender,
age,

CASE
    WHEN gender='Male' AND age < 35 THEN 'Young Male'
    WHEN gender='Female' AND age < 35 THEN 'Young Female'
    ELSE 'Senior Employee'
END AS Category

FROM employee_demographics;



/*==
Method 4 : CASE inside Calculation
=*/

SELECT

first_name,
salary,

CASE
    WHEN salary > 70000 THEN salary + 10000
    ELSE salary + 5000
END AS New_Salary

FROM employee_salary;



/*==
Method 5 : CASE with Bonus Percentage
==*/

SELECT

first_name,
salary,

CASE

WHEN salary >= 80000 THEN salary * 0.20

WHEN salary >= 50000 THEN salary * 0.10

ELSE salary * 0.05

END AS Bonus

FROM employee_salary;



/*=========================================================
Method 6 : CASE with GROUP BY
=========================================================*/

SELECT

CASE

WHEN gender='Male' THEN 'Male'

ELSE 'Female'

END AS Gender,

COUNT(*) AS Total_Employee

FROM employee_demographics

GROUP BY Gender;



/*=========================================================
Method 7 : CASE with ORDER BY
=========================================================*/

SELECT

first_name,

salary,

CASE

WHEN salary >=70000 THEN 'High'

ELSE 'Low'

END AS Salary_Level

FROM employee_salary

ORDER BY salary DESC;



/*=========================================================
Method 8 : CASE with AVG()
=========================================================*/

SELECT

dept_id,

AVG(salary) AS Average_Salary,

CASE

WHEN AVG(salary)>=70000 THEN 'Excellent'

WHEN AVG(salary)>=50000 THEN 'Good'

ELSE 'Average'

END AS Department_Status

FROM employee_salary

GROUP BY dept_id;



/*=========================================================
Method 9 : CASE inside WHERE
=========================================================*/

SELECT *

FROM employee_salary

WHERE

CASE

WHEN salary>=60000 THEN 1

ELSE 0

END =1;



/*=========================================================
Method 10 : CASE with NULL Values
=========================================================*/

SELECT

first_name,

dept_id,

CASE

WHEN dept_id IS NULL THEN 'No Department'

ELSE 'Assigned'

END AS Department_Status

FROM employee_salary;



/*=========================================================
Method 11 : CASE using Occupation
=========================================================*/

SELECT

first_name,

occupation,

CASE

WHEN occupation='Data Scientist' THEN 'IT'

WHEN occupation='Software Engineer' THEN 'IT'

WHEN occupation='Nurse' THEN 'Medical'

ELSE 'Other'

END AS Department_Type

FROM employee_salary;



/*=========================================================
Method 12 : CASE with Multiple Columns
=========================================================*/

SELECT

first_name,

salary,

dept_id,

CASE

WHEN dept_id=1 THEN 'Parks'

WHEN dept_id=3 THEN 'Public Works'

WHEN dept_id=4 THEN 'Healthcare'

WHEN dept_id=6 THEN 'Finance'

ELSE 'Unknown'

END AS Department_Name

FROM employee_salary;



/*=========================================================
Method 13 : CASE with COUNT()
=========================================================*/

SELECT

gender,

COUNT(*) AS Total,

CASE

WHEN COUNT(*)>=5 THEN 'Large Group'

ELSE 'Small Group'

END AS Group_Type

FROM employee_demographics

GROUP BY gender;



/*=========================================================
Method 14 : CASE with SUM()
=========================================================*/

SELECT

dept_id,

SUM(salary) AS Total_Salary,

CASE

WHEN SUM(salary)>=200000 THEN 'High Budget'

ELSE 'Normal Budget'

END AS Budget_Status

FROM employee_salary

GROUP BY dept_id;



/*=========================================================
Method 15 : CASE with UPDATE (Very Important)
=========================================================*/

SELECT

first_name,

salary,

CASE

WHEN dept_id=1 THEN salary*1.10

WHEN dept_id=6 THEN salary*1.15

ELSE salary*1.05

END AS Updated_Salary

FROM employee_salary;