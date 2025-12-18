USE SalesDB;
GO

/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join
/* Retrieve all data from customers and orders as separate results */

select* 
from _Customers;

select*
from _Orders 
-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */

select * 
from _Customers c inner join _Orders o
on c.CustomerID = o.CustomerID


-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */

select * 
from _Customers c Left join _Orders o
on c.CustomerID = o.CustomerID


-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */

select * 
from _Customers c right join _Orders o
on c.CustomerID = o.CustomerID


-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */

select * 
from _Orders o left join _Customers c
on c.CustomerID = o.CustomerID


-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */

select * 
from _Customers c full join _Orders o
on c.CustomerID = o.CustomerID


/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */

select * 
from _Customers c left join _Orders o
on c.CustomerID = o.CustomerID
where o.CustomerID is null

-- RIGHT ANTI JOIN
/* Get all orders without matching customers */

select * 
from _Customers c right join _Orders o
on c.CustomerID = o.CustomerID
where c.CustomerID is null


-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */

select * 
from _Customers c left join _Orders o
on c.CustomerID = o.CustomerID
where c.CustomerID is null


-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */

select * 
from _Customers c left join _Orders o
on c.CustomerID = o.CustomerID
where c.CustomerID is not null
and o.CustomerID is not null


-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */

select * 
from _Customers c full join _Orders o
on c.CustomerID = o.CustomerID
where c.CustomerID is null
or  o.CustomerID is null


-- CROSS JOIN
/* Generate all possible combinations of customers and orders */

select * 
from _Customers c cross join _Orders o



/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

/* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */


select o.OrderID , c.FirstName + ' ' + c.LastName AS 'Customer name',
       p.Product as 'Product name' , o.Sales as 'Sales amount' ,p.Price as 'Product price'
from _Customers c inner join _Orders o
on c.CustomerID = o.CustomerID
inner join _Products p  
on p.ProductID = o.ProductID 




