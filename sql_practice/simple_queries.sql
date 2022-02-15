use classicmodels;

-- 1.)
select productName as `Name`, productLine as `Product Line`, buyPrice as `Buy Price` from products
order by buyPrice desc;

-- 2.)
select contactFirstName as `First Name`, contactLastName as `Last Name`, city as `City`
from customers as c
where country = 'Germany'
order by contactLastName;

-- 3.)
select status as `Status` 
from orders
group by status;

-- 4.)
select *
from payments
where paymentDate >= '2005-01-01'
order by paymentDate;

-- 5.)
select lastName as `Last Name`, firstName as `First Name`, email as `Email`, jobTitle as `Job Title` from employees
where officeCode = 1
order by lastName;

-- 6.)
select productName as `Name`, productLine as `Product Line`, productScale as `Scale`, productVendor as `Vendor` from products
where productLine = 'Classic Cars' or productLine =  'Vintage Cars'
order by productLine desc, productName;