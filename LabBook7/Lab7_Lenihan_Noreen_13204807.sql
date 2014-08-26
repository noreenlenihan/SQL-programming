/* Lab Book 7
*
* Student Name: Noreen Lenihan
* Student ID: 13204807
* Course: COMP 40725 Introduction to Relational Databases & SQL Programming
* Lecturer: Dr. Mark Scanlon
* Head TA: Alex Cronin, PhD Candidate
* Assignment deadline: 12 March, 2014
*
*/



/* Question 1 */

CONNECT sys as sysdba

-- Enable text display in a PL/SQL block (using DBSMS_OUTPUT.PUT_LINE)
SET SERVEROUTPUT ON;

/* Create procedure, as demonstrated in lecture notes, to
* print out 'Hello, world' when invoked */
CREATE OR REPLACE PROCEDURE HelloWorldProc
IS 
BEGIN
	-- Print the timeless string, 'Hello, world!'
	DBMS_OUTPUT.PUT_LINE('Hello, world!');
END HelloWorldProc;
/

/* Procedure call */
BEGIN 
	HelloWorldProc();
END;
/

/* Create a function (taken from lecture notes) that
prints out the same line as the procedure above */
CREATE OR REPLACE FUNCTION HelloWorldFunc
RETURN NUMBER
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello world');
	-- Function must return some value
	RETURN 1;
END HelloWorldFunc;
/

/* Function call */
SELECT HelloWorldFunc() FROM DUAL;

-------------------------------------
/* Question 2 */

/* Creates a procedure that receives two inputs and DBMS outputs
* the full name as lowercase, uppercase and initial-capitalized strings */
CREATE OR REPLACE PROCEDURE HelloPerson (firstname IN VARCHAR2, surname IN VARCHAR2)
IS
	fname_lower VARCHAR2(50);
	lname_lower VARCHAR2(50);
BEGIN
	-- Use lower(str) function to convert a string to lowercase and store in vars declared above
	SELECT LOWER(firstname) INTO fname_lower from dual; 
	SELECT LOWER(surname) INTO lname_lower from dual; 
	-- Print lowercase-ed version of names
	DBMS_OUTPUT.PUT_LINE('Lowercase full name is ' || fname_lower || ' ' || lname_lower);
	-- Use upper(str) function to change string to uppercase
	SELECT UPPER(firstname) INTO fname_lower from dual;
	SELECT UPPER(surname) INTO lname_lower from dual;
	-- Print uppercase output
	DBMS_OUTPUT.PUT_LINE('Uppercase full name is ' || fname_lower || ' ' || lname_lower);
	-- Use initcap(str) function to capitalize the first letter of each word
	SELECT INITCAP(firstname) INTO fname_lower from dual;
	SELECT INITCAP(surname) INTO lname_lower from dual;
	-- Print initial-capitalized string
	DBMS_OUTPUT.PUT_LINE('Initial-capitalised full name is ' || fname_lower || ' ' || lname_lower);
END HelloPerson;
/

/* Call procedure, passing some arguments, to test */
BEGIN 
HelloPerson('Noreen', 'Lenihan');
END;
/

-----------------------------------------

/* Question 3 */

/* Creates a procedure that receives a name as one input and prints out
* a trimmed version with first letter of each word capitalized, and finally,
* count the no. of bytes in the internal representation of person's name */
CREATE OR REPLACE PROCEDURE HelloFullName (fullname IN VARCHAR2)
IS
	-- declare variable to store modified 'fullname' variable
	fullname_mod VARCHAR2(50);
BEGIN
	-- Call initcap(str) and trim(str) function to perform modifications on 'fullname'
	SELECT INITCAP(TRIM(fullname)) into fullname_mod from dual;
	-- Print output
	DBMS_OUTPUT.PUT_LINE('Initial-capitalized version of name: ' || fullname_mod);
	-- Use VSIZE function to return no. of bytes in internal representation of expression
	SELECT VSIZE( TRIM(fullname)) INTO fullname_mod from dual;
	-- Print output message
	DBMS_OUTPUT.PUT_LINE('Number of bytes in internal representation of name: ' || fullname_mod);	
END HelloFullName;
/

/* Call procedure to test */
BEGIN
HelloFullName('     Noreen lenihan     ');
END;
/

---------------------------------------------
/* Question 4 */

/* Creates a procedure that removes all the vowels from a string using IN OUT formal parameter*/
CREATE OR REPLACE PROCEDURE remove_vowels(stringy IN OUT VARCHAR2)
IS
BEGIN
-- Replace any vowels with a empty space using a regular expression and replace combo function
SELECT REGEXP_REPLACE(stringy, 'a|A|o|O|E|e|I|i|U|u', '') into stringy from dual;
END remove_vowels;

/* Use an anonymous PL/SQL block to demonstrate procedure 'remove_vowels'*/
DECLARE 
-- Variable to be passed to procedure
string VARCHAR2(50) := 'ToBAggIneoU';
BEGIN
	-- Call procedure
	remove_vowels(string);
	-- Print message
	DBMS_OUTPUT.PUT_LINE('Input with vowels removed: ' || string);
END;
/
	
-------------------------------------

/* Question 5 */

/* Creates a function that takes one number as an input parameter
*  doubles it, and then returns that value */
CREATE OR REPLACE FUNCTION HelloNumbers(num NUMBER)
RETURN NUMBER
IS
	final_num NUMBER(20) := 0;
BEGIN
	-- Multiply input arg by two and store value in final_num
	SELECT (num * 2) INTO final_num from dual;
	-- Print output from this function
	DBMS_OUTPUT.PUT_LINE('Number times two is: ' || final_num);
	-- return final_num for later use
	return final_num;
END HelloNumbers;
/

/* Call function passing a number as argument*/
SELECT HelloNumbers(2) from dual;

-------------------------------------------------

/* Question 6 */

/* Function to sum five number input arguments and then subtract 1 */
CREATE OR REPLACE FUNCTION AddNumbersMinusOne(num1 NUMBER, num2 NUMBER, num3 NUMBER, 
num4 NUMBER, num5 NUMBER)
RETURN NUMBER
IS
	total NUMBER(20) := 0;
BEGIN
	-- Add 5 numbers passed as args and subtract one
	total := (num1 + num2 + num3 + num4 + num5) - 1;
	-- return value
	return total;
END AddNumbersMinusOne;
/

/* Test function using numbers as args */
SELECT AddNumbersMinusOne(1, 2, 3, 4, 5) from dual;

-------------------------------------------------

/* Question 7 */

/* List of functions that demonstrate overloading, i.e. same function name different
* function signature (list of parameters) using a package */

/* Package specification - functions have their headers here */
CREATE OR REPLACE PACKAGE SUM_FUNCS AS
-- Overloaded function with 2 params
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER) RETURN NUMBER;
-- Overloaded function with 3 params
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER) RETURN NUMBER;
-- Overloaded function with 4 params
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER, num4 NUMBER) RETURN NUMBER;
-- Overloaded function with 5 params
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER, num4 NUMBER, num5 NUMBER) RETURN NUMBER;
END;
/

/* Package body*/

/* Overloaded sum function with 2 input params - returns the
* summed value of both params minus one */
CREATE OR REPLACE PACKAGE BODY SUM_FUNCS AS
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER) 
RETURN NUMBER 
IS
	total2 NUMBER(20):= 0;
BEGIN 
	total2 := (num1 + num2) - 1;
	return total2;
END SUMFUNC;

/* Overloaded sum function with 3 input params - returns the
* summed value of all params minus one */
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER) 
RETURN NUMBER 
IS
	total3 NUMBER(20):= 0;
BEGIN 
	total3 := (num1 + num2 + num3) - 1;
	return total3;
END SUMFUNC;


/* Overloaded sum function with 4 input params - returns the
* summed value of all params minus one */
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER, num4 NUMBER) 
RETURN NUMBER 
IS
	total4 NUMBER(20):= 0;
BEGIN 
	total4 := (num1 + num2 + num3 + num4) - 1;
	return total4;
END SUMFUNC;



/* Overloaded sum function with 5 input params - returns the
* summed value of all params minus one */
FUNCTION SUMFUNC(num1 NUMBER, num2 NUMBER, num3 NUMBER, num4 NUMBER, num5 NUMBER) 
RETURN NUMBER 
IS
	total5 NUMBER(20):= 0;
BEGIN 
	total5 := (num1 + num2  + num3 + num4 + num5) - 1;
	return total5;
END SUMFUNC;

/* Initialisation code */
BEGIN
	DBMS_OUTPUT.PUT_LINE('Initializing package...');
END;
/

/* Using an anonymous PL/SQL block (unit of code w/o name), we can demonstrate calls of 
* all the overloaded functions */

/* Declare all variables to be used in block */
DECLARE
	result2 NUMBER(20);
	result3 NUMBER(20);
	result4 NUMBER(20);
	result5 NUMBER(20);
BEGIN
	/* Test functions with different signatures and print output,
	making sure to reference package with dot operator and function name when calling
	functions */
	SELECT SUM_FUNCS.SUMFUNC(2, 3) into result2 from dual;
	DBMS_OUTPUT.PUT_LINE('Result of sum function with 2 parameters is ' || result2);
	SELECT SUM_FUNCS.SUMFUNC(2, 3, 4) into result3 from dual;
	DBMS_OUTPUT.PUT_LINE('Result of sum function with 3 parameters is ' || result3);
	SELECT SUM_FUNCS.SUMFUNC(2, 3, 4, 5) into result4 from dual;
	DBMS_OUTPUT.PUT_LINE('Result of sum function with 4 parameters is ' || result4);
	SELECT SUM_FUNCS.SUMFUNC(2, 3, 4, 5, 6) into result5 from dual;
	DBMS_OUTPUT.PUT_LINE('Result of sum function with 5 parameters is ' || result5);
END;

----------------------------------------------------------------------------

	


