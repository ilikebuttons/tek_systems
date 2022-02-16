use Banking;

-- 1. For each product, show the product name "Product" and the product type name "Type".
select product.NAME as `Product`, product_type.NAME as `Type`
FROM product
INNER JOIN product_type ON product.PRODUCT_TYPE_CD = product_type.PRODUCT_TYPE_CD;

-- 2. For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch.
SELECT b.NAME as `Name`, b.CITY as `City`, e.LAST_NAME as `Last Name`, e.TITLE as `Title`
FROM branch as b
INNER JOIN employee as e ON b.BRANCH_ID = e.ASSIGNED_BRANCH_ID -- TODO: finish this answer

-- 3. Show a list of each unique employee title.
SELECT DISTINCT TITLE AS `Titles` FROM employee
-- GROUP BY Title;

-- 4. Show the last name and title of each employee, along with the last name and title of that employee's boss.
SELECT employee.LAST_NAME as `Last Name`, employee.TITLE as `Title`, e1.LAST_NAME as `Superior's Last Name`, e1.TITLE as `Superior's Title`
FROM employee
JOIN employee as e1 ON employee.SUPERIOR_EMP_ID = e1.EMP_ID;

-- 5. For each account, show the name of the account's product, the available balance, and the customer's last name.
SELECT p.NAME as `Product Name`, account.AVAIL_BALANCE as `Available Balance`, i.LAST_NAME
from account
INNER JOIN product as p on account.PRODUCT_CD = p.PRODUCT_CD
INNER JOIN individual as i on account.CUST_ID = i.CUST_ID;

-- 6. List all account transaction details for individual customers whose last name starts with 'T'.
SELECT ac.* from acc_transaction as ac
INNER JOIN account as a on a.ACCOUNT_ID = ac.ACCOUNT_ID
INNER JOIN individual as i on a.CUST_ID = i.CUST_ID
WHERE i.LAST_NAME LIKE 'T%';

