-- Show each sales employee's first name and surname and associated customer order number
SELECT ORDER_NBR, FNAME, LNAME FROM CUST_ORDER, EMPLOYEE WHERE EMPLOYEE.EMP_ID=CUST_ORDER.SALES_EMP_ID;




/* Join table to itself with the join condition reading as 'where the manager's
* employee ID (EMP_ID) is the same as the employee's manager's employee ID (MANAGER_EMP_ID).
* This can be achieved by using the Employee table twice in the FROM clause, but using table
* aliases, and thus pretending to treat it as two separate tables. The result of this
* self-equi join is that we can easily peruse each manager's full name and ID and 
* the relevant employee's (being managed under that particular manager) full name and ID.
*/
SELECT a.MANAGER_EMP_ID, a.FNAME AS ManagerFNAME, a.LNAME AS ManagerLNAME, b.EMP_ID, b.FNAME AS EmployeeFNAME,
b.LNAME AS EMPLOYEELNAME FROM EMPLOYEE a, EMPLOYEE b WHERE a.EMP_ID=b.MANAGER_EMP.ID;


/* Perform an outer join on Employee and Cust_Order table, including all rows from the Employee table that 
* do not have corresponding rows in the CUST_ORDER table (this is what makes it an 'Outer Join'). 
* This query lists all employee's full names with the customer order that they are serviced, and includes employees
* who have never had a sale, with the join condition being where the employee id's from the two tables, match .*/
SELECT FNAME, LNAME, ORDER_NBR FROM Employee LEFT OUTER JOIN CUST_ORDER ON EMP_ID = SALES_EMP_ID;

-- Use aggregate function, SUM(), to display total sales price of all orders from CUST_ORDER table
SELECT SUM(SALES_PRICE) FROM CUST_ORDER;

-- Use the AVG() aggregate function to display the average sales price of orders for each employee
SELECT SALES_EMP_ID, AVG(SALES_PRICE) AS Average_Sales_Price FROM CUST_ORDER GROUP BY EMP_ID;


/*Use aggregate function SUM() to display the total sales price of all orders from each customer,
* and displaying the corresponding customer number beside each total.*/
SELECT CUST_NBR, SUM(SALES_PRICE) AS TotalSalesFromCust FROM CUST_ORDER GROUP BY CUST_NBR;


/* This query builds upon previous Q7 query with additional filter implemented using HAVING clause
* to display only those customers and sales where the customer had total sales greater than 1000, i.e.
* show details for ustomer numbers that satisfy the condition specified in the HAVING clause */
SELECT CUST_NBR, SUM(SALES_PRICE) AS TotalSalesFromCust FROM CUST_ORDER GROUP BY CUST_NBR HAVING SUM(SALES_PRICE) > 1000;



/* The CUBE function is an extension of the GROUP BY clause, and generates subtotals for all possible combinations of 
* the grouping columns. The use of the CUBE function is demonstrated here using total sales price subtotals for each customer 
* individually, each employee individually, each customer-employee pairing, and a grand total of sales prices.
*/
SELECT CUST_NBR, SALES_EMP_ID, SUM(SALES_PRICE) AS TOTAL_SALES FROM CUST_ORDER GROUP BY CUBE (CUST_NBR, SALES_EMP_ID);


/* ROLLUP is also an extension of the GROUP BY clause whereby its groups the selected rows based on the expression
* in the GROUP BY clause, and gives us a summary row for each grouping. In this query, we utilize the ROLLUP operation 
* to show use the sales from that order based on each grouping customers and order number, and subtotals for each 
* customer individually (as well as a grand total at the very end).
*/
SELECT CUST_NBR, ORDER_NBR, SUM(SALES_PRICE) AS SALES_FROM_ORDER FROM CUST_ORDER GROUP BY ROLLUP (CUST_NBR, ORDER_NBR);