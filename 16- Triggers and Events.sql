
              #  SQL TRIGGERS  #


/*
Definition
----------
A Trigger is a special stored program that automatically
executes when an INSERT, UPDATE, or DELETE operation
occurs on a table.

Types of Triggers
-----------------
1. BEFORE INSERT
2. AFTER INSERT
3. BEFORE UPDATE
4. AFTER UPDATE
5. BEFORE DELETE
6. AFTER DELETE




Method 1 : Create Audit Table
==*/

CREATE TABLE employee_log
(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




# Method 2 : AFTER INSERT Trigger

DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT
ON employee_salary
FOR EACH ROW

BEGIN
INSERT INTO employee_log(employee_id, action_type)
VALUES(NEW.employee_id,'New Employee Added');
END $$
DELIMITER ;


# Method 3 : Test AFTER INSERT Trigger
INSERT INTO employee_salary
VALUES
(15,'John','Smith','Developer',65000,3);




# Method 4 : View Trigger Result
SELECT *
FROM employee_log;


# Method 5 : BEFORE INSERT Trigger
DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT
ON employee_salary
FOR EACH ROW

BEGIN
SET NEW.salary = IF(NEW.salary<20000,20000,NEW.salary);
END $$
DELIMITER ;


# Method 6 : AFTER UPDATE Trigger
DELIMITER $$

CREATE TRIGGER after_salary_update
AFTER UPDATE
ON employee_salary
FOR EACH ROW

BEGIN
INSERT INTO employee_log(employee_id,action_type)
VALUES(NEW.employee_id,'Salary Updated');
END $$

DELIMITER ;


# Method 7 : Test UPDATE Trigger
UPDATE employee_salary
SET salary=80000
WHERE employee_id=3;


# Method 8 : AFTER DELETE Trigger

DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE
ON employee_salary
FOR EACH ROW

BEGIN
INSERT INTO employee_log(employee_id,action_type)
VALUES(OLD.employee_id,'Employee Deleted');
END $$

DELIMITER ;


# Method 9 : Test DELETE Trigger

DELETE
FROM employee_salary
WHERE employee_id=15;


# Method 10 : View All Triggers
SHOW TRIGGERS;


# Method 11 : Drop Trigger
DROP TRIGGER after_employee_insert;

/*=========================================================
                    SQL EVENTS
=========================================================*/

/*
Definition
----------
An Event is a scheduled task that automatically
executes at a specified date or time.

It works like Task Scheduler or Cron Job.

Uses

• Automatic Backup
• Delete Old Records
• Send Reports
• Archive Data
• Daily Updates

*/



# Method 1 : Check Event Scheduler

SHOW VARIABLES LIKE 'event_scheduler';


# Method 2 : Enable Event Scheduler

SET GLOBAL event_scheduler = ON;


# Method 3 : Create One-Time Event

CREATE EVENT delete_temp_data
ON SCHEDULE
AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
DELETE FROM employee_log
WHERE action_type='Temp';



# Method 4 : Create Recurring Event

CREATE EVENT salary_backup
ON SCHEDULE
EVERY 1 DAY
DO
INSERT INTO employee_log(employee_id,action_type)
SELECT employee_id,'Daily Backup'
FROM employee_salary;




##  Method 5 : Show Events   ##


SHOW EVENTS;

# Method 6 : Alter Event
ALTER EVENT salary_backup
DISABLE;


# Method 7 : Enable Event
ALTER EVENT salary_backup
ENABLE;

# Method 8 : Drop Event

DROP EVENT salary_backup;