use classicmodels;


-- 1. Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible for that customer’s orders.
--    The employee name should be in a single “Sales Rep” column formatted AS “lastName, firstName”.
--    The output should be sorted alphabetically by customer name.
SELECT customerName AS `Customer Name`, CONCAT(e.lastName, ', ', e.firstName) AS `Sales Rep`
FROM customers AS c
INNER JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY c.customerName;


-- 2. Determine which products are most popular with our customers. For each product, list the total quantity ordered along with the total sale
--    generated (total quantity ordered * priceEach) for that product. The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”.
--    List the products by Total Sale descending.
SELECT productName AS `Product Name`, od.quantityOrdered AS `Total # Ordered`, SUM(od.priceEach * od.quantityOrdered) AS `Total Sale`
FROM products AS p
INNER JOIN orderdetails AS od ON p.productCode = od.productCode
GROUP BY productName
ORDER BY `Total Sale` desc;


-- 3. Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” and “# Orders”.
-- 	  Sort alphabetically by status.
SELECT status AS `Order Status`, COUNT(*) AS `# Orders`
FROM orders
GROUP BY status
ORDER BY status;


-- 4. Write a query to list, for each product line, the total # of products sold from that product line. The first column should be “Product Line” and
--    the second should be “# Sold”. Order by the second column descending.
SELECT pl.productLine AS `Product Line`, sum(od.quantityOrdered) AS `# Sold`
FROM productlines AS pl
JOIN products AS p ON pl.productLine = p.productLine
JOIN orderdetails AS od ON p.productCode = od.productCode
GROUP BY pl.productLine
ORDER BY `# Sold` desc;


-- 5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of
--    those orders. The employee name should be output AS a single column named “Sales Rep” formatted AS “lastName, firstName”.
--    The second column should be titled “# Orders” and the third should be “Total Sales”.
--    Sort the output by Total Sales descending.
--    Only (and all) employees with the job title ‘Sales Rep’ should be included in the output
--    if the employee made no sales the Total Sales should display AS “0.00”.
SELECT CONCAT(e.lastName, ', ', e.firstName) `Sales Rep`, COUNT(o.orderNumber) `# Orders`, IF(od.quantityOrdered IS NULL, '0.00',SUM(od.quantityOrdered*od.priceEach)) AS `Total Sales`
FROM 	  	employees     AS e
LEFT JOIN 	customers     AS c 	on e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN 	orders 		  AS o 	on c.customerNumber = o.customerNumber
LEFT JOIN 	orderdetails  AS od ON o.orderNumber    = od.orderNumber
WHERE e.jobTitle = 'Sales Rep'
GROUP BY e.employeeNumber
ORDER BY SUM(od.quantityOrdered * od.priceEach) DESC;


-- 6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. Write a query to output the month
--    (January, February, etc.), 4-digit year, and total sales for that month. The first column should be labeled ‘Month’, the second ‘Year’,
--    and the third should be ‘Payments Received’. Values in the third column should be formatted AS numbers with two decimals – for example: 694,292.68.
SELECT MONTHNAME(paymentDate) AS `Month`, YEAR(paymentDate) AS `Year`, FORMAT(SUM(amount), 2) AS `Payments Received`
from payments
group by `Month`, `Year`
order by paymentDate;
Select * from payments;
