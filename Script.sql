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
order by contactFirstName, contactLastName; -- asc is optional because it is the DEFAULT

SELECT DISTINCT orderNumber FROM orderdetails;

SELECT * FROM offices;
INSERT INTO offices values('8', 'Plano', '5554443333', '123 street', NULL, 'TX', 'USA', '12345', 'NA');
SELECT * FROM offices WHERE officeCode = '8';
DELETE FROM offices WHERE officeCode = '8';

-- start transaction

describe offices;
INSERT INTO offices (`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`)
values('8', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA');

INSERT INTO offices (`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`)
values
('9', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA'),
('10', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA');

-- start transaction;

delete from offices where city = 'Plano';

-- commit;
-- rollback;

SELECT * FROM offices ORDER BY officeCode;



