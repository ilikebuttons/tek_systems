-- uses the databases
use classicmodels; -- another comment
describe customers;
/*
 * multiline comment
 * 
 */
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM employees WHERE employeeNumber = 1102;
SELECT count(*) from orders;
SELECT count() from orders;

SELECT contactfirstname as `First Name`, contactLastName as `Last Name` from customers
order by contactFirstName, contactLastName; -- asc is optional because it is the default