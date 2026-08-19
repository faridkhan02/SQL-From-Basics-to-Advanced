/*=========================================================
            WHERE vs HAVING
=========================================================*/

-- Both were created to filter rows of data, but they filter 2 separate things
-- Where is going to filters rows based off columns of data
-- Having is going to filter rows based off aggregated columns when grouped


-- Method 1 : Display Average Age by Gender
SELECT
    gender,
    AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender;



-- Method 2 : WRONG - WHERE cannot use Aggregate Functions
SELECT
    gender,
    AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40      -- ERROR
GROUP BY gender;



-- Method 3 : Correct Way - HAVING with AVG()
SELECT
    gender,
    AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;



-- Method 4 : HAVING using Alias (Works in MySQL)
SELECT
    gender,
    AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;



-- Method 5 : WHERE + GROUP BY + HAVING
SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employee_salary
WHERE salary > 30000
GROUP BY dept_id
HAVING AVG(salary) > 60000;



-- Method 6 : HAVING with COUNT()
SELECT
    gender,
    COUNT(*) AS total_employee
FROM employee_demographics
GROUP BY gender
HAVING COUNT(*) > 3;



-- Method 7 : HAVING with SUM()
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employee_salary
GROUP BY dept_id
HAVING SUM(salary) > 100000;



-- Method 8 : HAVING with MAX()
SELECT
    dept_id,
    MAX(salary) AS highest_salary
FROM employee_salary
GROUP BY dept_id
HAVING MAX(salary) > 80000;



-- Method 9 : HAVING with MIN()
SELECT
    dept_id,
    MIN(salary) AS lowest_salary
FROM employee_salary
GROUP BY dept_id
HAVING MIN(salary) < 30000;



-- Method 10 : HAVING with Multiple Conditions
SELECT
    dept_id,
    COUNT(*) AS total_employee,
    AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY dept_id
HAVING COUNT(*) >= 2
AND AVG(salary) > 50000;



-- Method 11 : WHERE with Multiple Conditions
SELECT *
FROM employee_demographics
WHERE gender = 'Male'
AND age > 30;



-- Method 12 : WHERE using BETWEEN
SELECT *
FROM employee_demographics
WHERE age BETWEEN 30 AND 40;



-- Method 13 : WHERE using IN
SELECT *
FROM employee_salary
WHERE dept_id IN (1,3,4);



-- Method 14 : WHERE using NOT IN
SELECT *
FROM employee_salary
WHERE dept_id NOT IN (1,3);



-- Method 15 : WHERE using LIKE
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%';



-- Method 16 : WHERE using IS NULL
SELECT *
FROM employee_salary
WHERE dept_id IS NULL;



-- Method 17 : WHERE using IS NOT NULL
SELECT *
FROM employee_salary
WHERE dept_id IS NOT NULL;



-- Method 18 : ORDER BY after HAVING
SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY dept_id
HAVING AVG(salary) > 40000
ORDER BY avg_salary DESC;













