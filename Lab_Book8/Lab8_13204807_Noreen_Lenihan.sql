/* Lab Book 8
* 
* Course code: COMP40725
* Course instructor: Dr. Mark Scanlon
* Course TA: Alex Cronin, PhD candidate
* Student Name: Noreen A. Lenihan
* Student ID: 13204807
* Submission deadline: Sun, 13 April 2014
*
*/

/* Connect to Lab8 schema */
CONNECT Lab8;
-- Enter password 

/* Displays output of PL/SQL blocks in SQL* Plus */
SET SERVEROUTPUT ON;

/* Question 1 */
/* This question demonstrates the use of a FOR loop counting from 1-100 */

-- Use 'BEGIN' statement to notify terminal of multiline input
BEGIN
-- Define variable 'i' that will act as our counter (no need to declare it) and specify range
FOR i IN 1..100 LOOP
	-- Print out each value of i for each iteration
	DBMS_OUTPUT.PUT_LINE(i);
-- Exit when i variable loop condition false (i.e. > 100)
END LOOP;
-- Close PL/SQL block
END;
-- Use forward slash to execute commands
/

/* Question 2 */
/* This loop demonstrates the use of a nested for loop with 10 iterations per loop */

-- Use 'BEGIN' keyword to start PL/SQL block
BEGIN
-- Label outer loop using triangle brackets
<<outer>>
-- Define variable 'i' that starts at 1 and iterates 10 times
FOR i IN 1..10 LOOP
	-- Label inner loop, 'inner', with triangle brackets
	<<inner>>
	-- Use 10 iterations for inner loop initializing j with sentinel value of 10
	FOR j IN 1..10 LOOP
	-- Print out value of i and append j to get desired out (e.g. 1.1, 1.2, 1.3, etc..)
	DBMS_OUTPUT.PUT_LINE(i||'.'||j);
	-- Exit inner loop when loop continutation condition is false
	END LOOP inner;
-- Exit outer loop when loop continuation condition is false
END LOOP outer; 
-- Finish PL/SQL block
END;
-- Execute statements
/

/* Question 3 */
/* The purpose of this question is to construct an algorithm that
* displays non-prime numbers between 1 and 30. Note, after much research,
* it is the author's considered opinion that the number 1 should be included
* as a non-prime number, as it is by definition of prime numbers, not a prime. */

-- Begin PL/SQL block
BEGIN
-- Declaration section where we declare variables for use in inner PL/SQL block
DECLARE
-- Declare variable 'N' to hold inner loop initialization variable
N NUMBER := 2;
-- Declare variable S to store square root of number, or upper limit of divisors to use
S NUMBER := SQRT(30);
-- Declare boolean variable to hold prime status of number
ISPRIME BOOLEAN := TRUE;
-- Execute statements for block
BEGIN
-- Label outer loop
<<outer>>
-- Use for loop to process first 30 numbers and check their "primeness"
FOR i in 1..30 LOOP
	-- set or reset isPrime variable to true each time, and then try to falsify
	ISPRIME := TRUE;
	/* Based on the literature, 1 is, by definition, not a prime number
	 and so we should explicitly code for this using an if-statement */
	IF i = 1 THEN
	ISPRIME := FALSE;
	END IF;
	-- Label inner loop as 'inner'
	<<inner>>
	-- Execute inner loop starting counter from 2 to the square root of number
	-- Here, j will be the divisor for which we test each number between 2 and 30 with
	FOR j in N..S LOOP
	-- Check if number being tested is divisible by j and if it is not the number itself
	IF MOD(i, j) = 0 AND j < i THEN
		-- If number is divisible by j (and j is a number > 2 and < i ) then it is prime
		ISPRIME := FALSE;
	-- End if-statement
	END IF;
	-- Exit inner loop
	END LOOP inner;
	
	-- For each iteration of i, if i has been proven as not prime (i.e. isPrime is false)
	-- then print out that result
	-- Use if-statement to capture this
	IF ISPRIME = FALSE THEN
	DBMS_OUTPUT.PUT_LINE(i);
	END IF;
-- Exit outer loop
END LOOP outer;
-- Exit execution block
END;
-- End entire PL/SQL code block
END;
-- Execute immediately
/

/* Question 4 */
/* This question tests the creation of a sequence and a trigger for when the sequence
* should come into play. We recreate the Employee table from Lab Book 3 to test this. */

-- Create Employee table as per Lab 3
CREATE TABLE EMPLOYEE (
EMP_ID NUMBER(10) NOT NULL,
FNAME NVARCHAR2(20) NULL,
LNAME NVARCHAR2(20) NULL,
MANAGER_EMP_ID NUMBER(10) NULL,
PRIMARY KEY(EMP_ID),
FOREIGN KEY(MANAGER_EMP_ID)
REFERENCES EMPLOYEE(EMP_ID)
);

-- Insert preliminary data into Employee table based on Lab 3
BEGIN
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 304,'Reno', 'Lopez', 304);
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 305,'Stewart', 'Fulbright', 305);

INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 300,'Jason', 'Chase', 304);
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 301,'James', 'Mason', 304);
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 302,'Mila', 'Freeman', 305);
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 303,'Michael', 'Berry', 305);
END;
/
-- Apply data to DB
COMMIT;

-- Create a sequence for Employee table that auto-generates primary key (in sequence)
CREATE SEQUENCE EMPLOYEE_SEQ 
-- Start incrementing from 306 to be consistent with existing PK values
START WITH 306
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to increment employee ID each there is an insert on the Employee table
CREATE OR REPLACE TRIGGER EMPLOYEE_INC
-- This line specifies the trigger should fire before an insert on the Employee table
BEFORE INSERT ON EMPLOYEE
-- For each row affected 
FOR EACH ROW
-- Start PL/SQL block
BEGIN
	-- If there does not exist a value for Emp_ID column for the new insert then
	IF :NEW.EMP_ID IS NULL THEN
	-- assign the employee ID as the next value from the sequence 'EMPLOYEE_SEQ' created above
	:NEW.EMP_ID := EMPLOYEE_SEQ.NEXTVAL;
	-- End if-statement
	END IF;
-- Exit PL/SQL block
END;
-- Execute code
/

-- Show Employee table
SELECT * FROM EMPLOYEE;

-- Perform insertion on Employee table omitting the auto-generated primary key
INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('Nathan', 'Scott', 305);
COMMIT;

-- Show all data from Employee table with newly inserted Nathan Scott employee
SELECT * FROM EMPLOYEE;


/* Question 5 */

/* This multi-part section involves modifying the table structure by adding a
* salary column and populating it with a range of values, and finally the creation of
* a trigger  */

-- Add a new column, 'Salary' to Employee table
ALTER TABLE EMPLOYEE ADD (SALARY NUMBER);

-- Populate salary column with a range of values (ca. 28000 - 144000) for employees 300-306
UPDATE EMPLOYEE SET SALARY = 28000 WHERE EMP_ID = 306;
UPDATE EMPLOYEE SET SALARY = 55000 WHERE EMP_ID = 300;
UPDATE EMPLOYEE SET SALARY = 76000 WHERE EMP_ID = 301;
UPDATE EMPLOYEE SET SALARY = 43000 WHERE EMP_ID = 302;
UPDATE EMPLOYEE SET SALARY = 100000 WHERE EMP_ID = 303;
UPDATE EMPLOYEE SET SALARY = 125000 WHERE EMP_ID = 304;
UPDATE EMPLOYEE SET SALARY = 144000 WHERE EMP_ID = 305;
-- Apply data to database
COMMIT;

/* Create trigger to check if a salary is changed to >100000 and 
   if so print out emp_id in question and new salary */
   
-- Create trigger 'LOG_SALARY_CHANGES'
CREATE OR REPLACE TRIGGER LOG_SALARY_CHANGES
-- to fire before any update on Employee table
BEFORE UPDATE ON EMPLOYEE
-- check for each row affected
FOR EACH ROW
-- condition for trigger output is when salary is now greater than 100k
WHEN (NEW.SALARY > 100000)
-- declare variable to store difference between old and new salary
DECLARE
SALARY_DIFF NUMBER;
-- Beginning of PL/SQL statements to be executed if 'when' condition satisfied
BEGIN
-- Calculate difference between old and new salary for those now earning above 100k
SALARY_DIFF := :NEW.SALARY - :OLD.SALARY;
-- Print out the salary change for the employee in question
DBMS_OUTPUT.PUT_LINE('Salary changed to more than 100,000 Euro for Employee: ' || :OLD.EMP_ID);
-- Print out previous salary
DBMS_OUTPUT.PUT_LINE(' Previous: ' || :OLD.SALARY);
-- Print out new salary that is greater than 100k
DBMS_OUTPUT.PUT_LINE(' New: ' || :NEW.SALARY);
-- Print out the salary difference
DBMS_OUTPUT.PUT_LINE(' --> Difference: '|| SALARY_DIFF);
-- End PL/SQL statements block
END;
-- Execute code
/

-- NB to apply changes to database before testing
COMMIT;

-- Test by updating an employee's salary to 50,000, that is, safely below 100,000
UPDATE EMPLOYEE SET SALARY = 50000 WHERE EMP_ID = 306;
-- Apply changes to DB
COMMIT;

-- Confirm change in Employee table
SELECT * FROM EMPLOYEE;

-- Now modify the salary of that same employee to above 100,000 to observe trigger in action
UPDATE EMPLOYEE SET SALARY = 110000 WHERE EMP_ID = 306;
-- We can commit this change also
COMMIT;

-- Ensure change of salary by viewing the data in the table
SELECT * FROM EMPLOYEE;

/* Question 6 */
/* This question shows how to populate data in table with use of a 'for' loop */

-- Show all data from the Employee table
SELECT * FROM EMPLOYEE;

-- Use 'begin' statement for multiline statements
BEGIN
/* Use a for loop whose counter starts at 1 and should terminate when it reaches 1000 (inclusive)
to insert 1000 employees into the Employee table, alternating names, manager numbers and salary
for every 100 hundred employees. Primary keys (emp_ids) are generated from trigger created in Part 4. */
FOR i in 1..1000 LOOP
	-- First 100 new insertions will be called Donald Knuth, have manager 304, and earn 88k
	IF i <= 100 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Donald', 'Gnuth', 304, 88000);
	-- New employees generated when i is 101 - 200 (incl.), will be Edgar Hammock, have manager 305, and earn 27k
	ELSIF i <= 200 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Edgar', 'Hammock', 305, 27000);
	-- New employees generated when i is 201 - 300 (incl.), will be Alan Curing, have manager 304, and earn 77k
	ELSIF i <= 300 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Alan', 'Curing', 304, 77000);
	-- New employees generated when i is 301 - 400 (incl.), will be Blaise Rascal, have manager 305, and earn 92k
	ELSIF i <= 400 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Blaise', 'Rascal', 305, 92000);
	-- New employees generated when i is 401 - 500 (incl.), will be Irving Wisher, have manager 304, and earn 31k
	ELSIF i <= 500 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Irving', 'Wisher', 304, 31000);
	-- New employees generated when i is 501 - 600 (incl.), will be Ada Loveshoe, have manager 305, and earn 45k
	ELSIF i <= 600 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Ada', 'Loveshoe', 305, 45000);
	-- New employees generated when i is 601 - 700 (incl.), will be Charles Cabbage, have manager 304, and earn 99k
	ELSIF i <= 700 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Charles', 'Cabbage', 304, 99000);
	-- New employees generated when i is 701 - 800 (incl.), will be Lord Syron, have manager 305, and earn 68k
	ELSIF i <= 800 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Lord', 'Syron', 305, 68000);
	-- New employees generated when i is 801 - 900 (incl.), will be Richard Findman, have manager 304, and earn 27k
	ELSIF i <= 900 THEN
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Richard', 'Findman', 304, 27000);
	-- All other employees beyond when i is 900 will be Benoit Mandelbrov with manager 305 and earn 17k
	ELSE
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Benoit', 'Mandelbrov', 305, 17000);
	-- End if-statement block
	END IF;
-- Exit loop when loop terminating condition is reached
END LOOP;
-- End PL/SQL blocks of statements
END;
-- Execute code now
/

-- Show all (new) data from the employee table
SELECT * FROM EMPLOYEE;

/* Question 7 */

/* This question demonstrates the use of an explicit cursor to act as a pointer when
* accessing each row of a table and checking for specified conditions stated below */

-- Use 'Begin' keyword to start PL/SQL code block
BEGIN
-- Declare cursor name and what it consists of
DECLARE CURSOR CUR_EMPLOYEE 
IS
-- Select employee ID, firstname, surname, manager ID and salary to be represented by cursor
SELECT EMP_ID, FNAME, LNAME, MANAGER_EMP_ID, SALARY FROM EMPLOYEE;
-- declare variable of type %ROWTYPE to represent every column in a row returned
EMPLOYEE_ROW CUR_EMPLOYEE%ROWTYPE;
-- Declare custom exception
INVALID_SALARY EXCEPTION;
-- Associate an ORA error number to our user-defined exception
PRAGMA EXCEPTION_INIT(INVALID_SALARY, -20001);
-- Begin PL/SQL block
BEGIN
-- Before a cursor is used, it must be opened
OPEN CUR_EMPLOYEE;
-- Read a row returned by cursor into variable EMPLOYEE_ROW that is of type %ROWTYPE
FETCH CUR_EMPLOYEE INTO EMPLOYEE_ROW;

-- Use a while loop to process each returned by cursor
-- where while-loop continuation condition can be said as 'while(a row is selected)'
WHILE CUR_EMPLOYEE%FOUND LOOP
-- if an employee's salary is less than 20,000, then raise an application error and return their ID
IF EMPLOYEE_ROW.SALARY < 20000 THEN
/* Raise application error which calling block can handle - does not necessarily have to be
* user-defined exception. I used a different error number so I could test both conditions, that is,
* when salary was < 20000 and when salary was > 90000 */
RAISE_APPLICATION_ERROR(-20002, 'Salary is less than 20,000Euro for Employee ' || EMPLOYEE_ROW.EMP_ID);
-- End if-statement
END IF;
-- If an employee's salary is greater than 90,000 then raise custom exception, 'Invalid_Salary'
-- and pass control to exception section
IF EMPLOYEE_ROW.SALARY > 90000 THEN
-- raise user-defined exception, 'INVALID_SALARY'
--When an error occurs, execution stops and the exception section is run
RAISE INVALID_SALARY;
-- End if-statement
END IF;
-- Retrieve the next selected row
FETCH CUR_EMPLOYEE INTO EMPLOYEE_ROW;
-- End while loop
END LOOP;

/* Exception section */
EXCEPTION
-- Handle our custom exception, 'INVALID_SALARY' by printing employee id and new salary (> 90k)
-- and re-raising exception
WHEN INVALID_SALARY THEN
DBMS_OUTPUT.PUT_LINE('Employee  number ' || EMPLOYEE_ROW.EMP_ID || ' has salary of ' ||
EMPLOYEE_ROW.SALARY || ', which is greater than 90,000 Euro.');
-- Re-raise the exception (that is, handle exception and alert caller that exception occurred)
RAISE;

-- Close our cursor
CLOSE CUR_EMPLOYEE;
-- Exit PL/SQL block
END;
-- Exit PL/SQL block
END;
-- Execute PL/SQL block
/

/* Question 8 */
/* This question demonstrates how to catch and handle a system exception, namely, the
* NO_DATA_FOUND system exception. */

-- Begin PL/SQL block
BEGIN
-- Declare section where we declare a variable to hold employee ID
DECLARE
EMPLOYEE_NBR NUMBER;
-- Begin PL/SQL block
BEGIN
-- Wrongly attempt to save the employee ID of any employee named 'Christine' (which is none)
--  into declared variable
SELECT EMP_ID INTO EMPLOYEE_NBR FROM EMPLOYEE WHERE FNAME = 'Christine';

/* Exception section */
EXCEPTION WHEN
-- Handle cases when a select query (such as above) was meant to save a result into a variable
-- but in fact returned no rows
NO_DATA_FOUND THEN
-- Print error message to inform user of error
DBMS_OUTPUT.PUT_LINE('No data found for this employee ' || EMPLOYEE_NBR);
-- End PL/SQL block
END;
-- End PL/SQL block
END;
-- Execute code now
/

/* End of Assignment */


	




