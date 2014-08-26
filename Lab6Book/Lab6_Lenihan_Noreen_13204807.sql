/* COMP 40725 Lab Book 6
*
* Student Name: Noreen Lenihan
* Student ID: 13204807
* Lecturer: Dr. Mark Scanlon
* Head Teaching Assistant: Alex Cronin, PhD Candidate
* Assignment Due Date: Wed, March 5, 2014
*
*/



-- Question 1

/* Whilst setting 'autocommit' to off, insert values into
the 'customer', 'employee' and 'cust_order' tables, using transactions 
(a set of one or more logically-ordered SQL statements that are treated as 
an atomic unit) and commit these data to the database when finished */

-- Before commencing a transaction, set autocommit to off
SET AUTOCOMMIT OFF;

/*Commit at the beginning of each sql query block to ensure no previous statements 
 prior to the transaction described here */
COMMIT;

-- Set transaction name so that administrator can view the transaction for future reference 
SET TRANSACTION NAME 'Lab6_q1';
-- Perform some insert statements in all three tables
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES (110, 'Simon', 'Garfunkel');
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES (111, 'Brian', 'McDonagh');
-- Confirm updates 
SELECT * FROM CUSTOMER;
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES (306, 'Lorraine', 'Keane', 304);
SELECT * FROM EMPLOYEE;
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1026, 110, 306, 45.99);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1027, 111, 306, 34.99);
SELECT * FROM CUST_ORDER;
-- Apply changes to database
COMMIT;


/*----------------------------------------------*/

-- Question 2
/* The following queries demonstrate the utility of the rollback 
function in Oracle SQL, which is to undo transactions that have not 
as yet been committed to the database (i.e. it undoes updates since the previous
COMMIT statement or ROLLBACK statement). We accomplish this by inserting
some data before and after the rollback to observe its effects. */

SET AUTOCOMMIT OFF;
COMMIT;
SET TRANSACTION NAME 'Lab6_q2';
-- Perform some insert statements prior to rollback to show its effects
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1028, 110, 306, 570.80);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1029, 111, 306, 699.99); 
-- Rollback to last commit statement
ROLLBACK;
-- Insert data after rollback to see that these data has been stored in DB
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1040, 110, 306, 600.80);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALES_PRICE) VALUES (1041, 110, 306, 700.80);
COMMIT;

/*---------------------------------------------------*/

-- Question 3

/* This question aims to test the functionality of 'savepoint', that is
a point established in a transaction that allows a rollback to roll
back to this point, without cancelling the entire transaction. Here, 
we show that the first two orders are pretty much immune to effects from any
failed transactions, if we create a savepoint directly after the second insertion. */
SET AUTOCOMMIT OFF;
COMMIT;
SET TRANSACTION NAME 'Lab6_q3';
INSERT INTO CUST_ORDER VALUES (1028, 110, 306, 40.99);
-- Make first savepoint
SAVEPOINT CUST_ORDER1;
INSERT INTO CUST_ORDER VALUES (1029, 111, 306, 4.99);
-- Make second savepoint
SAVEPOINT CUST_0RDER2;
-- Make erroneous/failed insertion (duplicate primary key: order number)
INSERT INTO CUST_ORDER VALUES (1026, 110, 306, 500.80); 
ROLLBACK TO CUST_ORDER2;
COMMIT;

/*-------------------------------------*/

-- Question 4

/* This query demonstrates how to create a new password-protected user in 
database, and grant them certain privileges (SELECT, INSERT,
UPDATE, DELETE) on some table (in this case, w.r.t. the EMPLOYEE table).
Further, we ensure that the new user can successfully connect with
the database and test queries in the accessible table. */

-- Must have system administrative privileges (enter password here too)
CONNECT sys as sysdba

CREATE USER noreen IDENTIFIED BY password;
GRANT CREATE SESSION TO noreen;
-- Assign privileges to new user
GRANT SELECT, INSERT, UPDATE, DELETE ON LAB5.EMPLOYEE TO noreen;
-- An alternative solution...
/*GRANT SELECT ON LAB5.EMPLOYEE TO noreen;
GRANT INSERT ON LAB5.EMPLOYEE TO noreen;
GRANT UPDATE ON LAB5.EMPLOYEE TO noreen;
GRANT DELETE ON LAB5.EMPLOYEE TO noreen;*/
CONNECT noreen
-- Test use of privileges as user 'noreen'
-- Enter password here also
SET AUTOCOMMIT OFF;
COMMIT;
SET TRANSACTION NAME 'LAB6_Q4';
SELECT * FROM LAB5.EMPLOYEE;
INSERT INTO LAB5.EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES (307, 'Bob', 'Marley', 304);
UPDATE LAB5.EMPLOYEE SET FNAME = 'Robert' WHERE EMP_ID= 307;
DELETE FROM LAB5.EMPLOYEE WHERE EMP_ID=307;
COMMIT;

/*-----------------------------------------*/

-- Question 5

/* Revoke the 'delete' privilege from the new user, and
test by connecting to the database schema as new user, and
attempting a deletion on some data */
CONNECT sys as sysdba
--enter password
REVOKE DELETE ON LAB5.EMPLOYEE FROM noreen;
CONNECT noreen
-- (Enter password)
-- Test making sure we cannot delete records from the Employee table (we should see error here)
DELETE FROM LAB5.EMPLOYEE WHERE EMP_ID=306;

/*------------------------------------------*/

-- Question 6
/* The purpose of this question is to display the first name, surname
and associated order details (order number, employee id of sales rep, and
the price of the order) of the customer with the smallest order. This can
be achieved using the following scalar subquery */
CONNECT LAB5
SET AUTOCOMMIT OFF;
COMMIT;
SET TRANSACTION NAME 'Lab6_q6';
-- Find customer with smallest order
SELECT FNAME, LNAME, ORDER_NBR, SALES_EMP_ID, SALES_PRICE FROM customer, CUST_ORDER 
WHERE customer.CUST_NBR=CUST_ORDER.CUST_NBR AND SALES_PRICE= (SELECT MIN(SALES_PRICE) 
FROM CUST_ORDER);

COMMIT;

/*-------------------------------------------*/

-- Question 7

/* The following queries illustrate the use of exception-handling in 
Oracle SQL. We perform a failed insertion (primary key constraint violation)
and observe the behaviour when this error is encountered, which is, namely, 
a rollback to the point prior to the failed insert. The method of catching and handling
exceptions were obtained from the Oracle SQL documentation online. */
SET AUTOCOMMIT OFF;
COMMIT;
SET TRANSACTION NAME 'Lab6_q7';
BEGIN
INSERT INTO CUST_ORDER VALUES (1030, 110, 306, 45.99);
SAVEPOINT question_7;
INSERT INTO CUST_ORDER VALUES (1031, 111, 306, 34.99);
SAVEPOINT question_7;
-- Make faulty insertion (duplicate value for primary key of cust_order table)
INSERT INTO CUST_ORDER VALUES (1029, 110, 306, 570.80); 
-- Handle an exception of the duplicate value on unique index variety!
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
-- rollback is the exception-handling behavior in this scenario
ROLLBACK TO question_7;
END;
/
COMMIT;
SELECT * FROM CUST_ORDER;

/*------------------------------------------------------------------*/




