-- Author: James Errington
-- Date Completed: 05/06/2024
-- Script contents: My responses to a sample set of 50 business questions related to the fictional food supplier DB Northwind.

/* 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName. */

use northwind2;

select CategoryName, Description 
from categories
order by categoryname asc;

/* 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table
sorted by Phone. */

SELECT ContactName, CompanyName, ContactTitle, Phone
from customers
order by phone; 

/* 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from the newest to the oldest employee. */

select concat(firstname, ' ', lastname) as FullName, HireDate
from employees
order by hiredate desc;

/* 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted
by Freight in descending order.
*/

select orderid, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by freight desc
limit 10;

/* 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table. */

select lower(customerid) as ID
from customers;

/* 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the
Country in descending order then by CompanyName in ascending order. */

select CompanyName, Fax, Phone, Country, HomePage 
from suppliers
order by country desc, companyname asc;

/* 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only. */

select CompanyName, ContactName
from customers
where city = 'buenos aires';

/* 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock */

select ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
from products 
where UnitsInStock = 0;

/* 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain */

select ContactName, Address, City
from customers
where country not in ('Germany', 'Mexico', 'Spain');

/* 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996. */

select OrderDate, ShippedDate, CustomerID, Freight
from orders
where orderdate = '1996-05-21';

/* 11. Create a report showing FirstName, LastName, Country from the employees not from United States. */

select FirstName, LastName, Country
from employees 
where country != 'USA';

/* 12. Create a report that showsthe EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later
than the required date. */

select 	EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM orders
where ShippedDate > requireddate;

/* 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B. */

select City, CompanyName, ContactName
from customers 
where city like 'A%' OR CITY LIKE 'B%';

/* 14. Create a report showing all the even numbers of OrderID from the orders table. */

select orderid as even_orders
from orders
where substring(orderid,5,1) in (0,2,4,6,8);

/* 15. Create a report that shows all the orders where the freight cost more than $500 */

select orderid, freight
from orders
where freight > 500
order by freight asc;

/* 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for
reorder. */

select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel 
from products
where reorderlevel = 0;

/* 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number. */

select companyname, contactname, fax
from customers
where fax is null;

/* 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody. */

select firstname, lastname, reportsto
from employees 
where reportsto is null;

/* 19. Create a report showing all the odd numbers of OrderID from the orders table */

-- METHOD 1 
select orderid as even_orders
from orders
where substring(orderid,5,1) in (1,3,5,7,9);

-- METHOD 2
select orderid as even_orders
from orders
where mod(orderid,2)=1;

/* 20. Create a report that shows the CompanyName, ContactName, Fax of all customersthat do not have Fax number and sorted
by ContactName */

SELECT CompanyName, ContactName, Fax from 
customers
where fax is null
order by contactname;

/* 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name
sorted by ContactName. */

select  CompanyName, ContactName, City
from  customers 
where city like '%L%'
order by contactname desc;

/* 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s */

use northwind2;

select FirstName, LastName, BirthDate
from employees
where BirthDate >= '1950-01-01' and BirthDate < '1960-01-01'
order by firstname;

/* 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table */

select FirstName, LastName, year(BirthDate) as birthyear
from employees
order by birthyear asc;

/* 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by
OrderID and sorted by NumberofOrders in descending order. */

select orderid, count(orderid) as NoOfOrders
from northwind2.`order details`
group by orderid
order by NoOfOrders desc;

/* 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID */

select products.SupplierID, ProductName, CompanyName
from suppliers
right join products on suppliers.supplierid = products.supplierid
where companyname in ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by supplierid asc;

/* 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders
with ShipPostalCode beginning with "98124". */

select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
where left(shippostalcode,5) = '98124';

/* 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their
ContactTitle. */
 
 select ContactName, ContactTitle, CompanyName
 from customers 
 where contactTitle not like '%Sales%';
 
 /* 28. Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle"; */
 
 select LastName, FirstName, City 
 from employees 
 where city not like '%Seattle%';
 
 /* 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other
cities in Spain other than Madrid. */

select CompanyName, ContactTitle, City, Country
from customers 
where country = 'Mexico' or (country = 'Spain' AND city != 'Madrid')
order by Country, City, CompanyName asc;

/* 30. Create a select statement that outputs the following: */

select concat(firstname, ' ', lastname, ' can be reached at x', extension) as ContactInfo
from employees;

/* 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their
Contactname. */

select contactname
from customers
where contactname not like '_A%';

/* 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and
maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively. */

select round(avg(unitprice),0) as AveragePrice, 
round(sum(unitprice*unitsinstock),2) as TotalStock,
max(UnitsOnOrder) as MaxOrder
from products;

/* 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products,
suppliers and categories table. */

select /* P.SupplierID, */CompanyName, CategoryName, ProductName, UnitPrice
from products as P
left join suppliers as S on P.supplierid = S.supplierid
left join categories as C on P.categoryID = C.categoryID
order by P.supplierid, categoryname, productname, unitprice;

/* 34. Create a report that shows the CustomerID,sum of Freight, from the orders table with sum of freight greater $200, grouped
by CustomerID. HINT: you will need to use a Groupby and a Having statement. */

select orders.customerid, companyname, sum(freight) as freight_total
from orders
left join customers on orders.customerid = customers.customerid
group by customerid
having freight_total > 200
order by freight_total desc;

/* 35. Create a report that shows the OrderID, ContactName, UnitPrice, Quantity, Discount from the order details, orders and
customers table with discount given on every purchase */

select OD.OrderID, Companyname, ContactName, UnitPrice, Quantity, Discount
from northwind2.`order details` as OD
left join orders as O ON OD.OrderID = O.orderid
left join customers as C on O.customerid = C.customerID
where discount != 0
order by Companyname asc, contactname, discount desc;

/* 36. Create a report that showsthe EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of
who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin. */

select E1.employeeid, concat(E1.firstname, ' ', E1.lastname) as employee_name, concat(E2.firstname, ' ', E2.lastname) as line_manager
from employees as E1
join employees as E2 on E1.reportsTo = E2.employeeid;

/* 37. - Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice
and MaximumPrice respectively */

select round(avg(unitprice),2) as average_unit_price, round(min(unitprice),2) as cheapest_product, round(max(unitprice),2) as most_expensive_product
from products;

/* 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View. */

create view CustomerInfo as 
select O.CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate
from customers as C
right join orders as O on O.customerid = C.customerid;

select /*customerid,*/ companyname, country, count(*) as no_of_orders
from customerinfo
group by customerid
-- having no_of_orders > 20
order by no_of_orders desc;

/* 39. Change the name of the view you created from customerinfo to customer details */

RENAME TABLE customerinfo to customerdetails;

/* 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description,
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and
categories tables. HINT: Create a View
 */
 
create view ProductDetails as
select P.ProductID, ProductName, CompanyName,  CategoryName, C.Description,
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued 
from products as P
left join suppliers as S on P.supplierid = S.supplierid
left join categories as C on C.categoryid = P.categoryid;

/* 41. Drop the customer details view. */

drop view customerdetails;

/* 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
 */
 
 select left(categoryName,5) as ShortInfo
 from categories;
 
 /* 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy ofshippers data into the new table HINT: Create
a Table, use the LIKE Statement and INSERT INTO statement. */

create table shippers_duplicate like shippers;

insert into shippers_duplicate select * from shippers;

/* 44. Create a select statement that outputs the following from the shippers_duplicate Table:
 */
 
 select shipperid, companyname, phone, lower(concat(replace(companyname,' ',''),'@gmail.com')) as Email
 from shippers_duplicate;
 
 /* 45.  Create a report that shows the CompanyName and ProductName from all product in the Seafood category. */
 
 -- select categoryid, categoryname
 -- from categories;
 
 -- >>>  Seafood category = 8
 
 select productname, companyname, categoryid
 from products
 left join suppliers on products.supplierid = suppliers.supplierid
 where categoryid = 8;

 /* 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5. */
 
 use northwind2;
 
 -- NOTE - I have added an extra join to bring in the category name for extra detail
 
 select products.categoryid, categoryname, companyname, productname
 from products
 left join suppliers on products.supplierid = suppliers.supplierid
 left join categories on products.categoryid = categories.categoryid
 where products.categoryid = 5;
 
 /* 47. Delete the shippers_duplicate table. */
 
 drop table shippers_duplicate;
 
 /* 48. - Create a select statement that ouputs the following from the employees table.
NB: The age might differ depending on the year you are attempting this query. */

SELECT firstname, lastname, birthdate, concat( (DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birthdate)), '%Y') 
+ 0), ' Years') AS age 
from employees;

/* 49. - Create a report that the CompanyName and total number of orders by customer renamed as number of orders since
December 31, 1994. Show number of Orders greater than 10 */

SELECT companyname, count(*) as total_no_of_orders
from orders as O
left join customers as C on O.customerid = C.customerid
where orderdate > '1994-12-31'
group by companyname
having total_no_of_orders > 10
order by total_no_of_orders desc;

/* 50. Create a select statement that ouputs the following from the product table */

select concat(productname, ' weighs/is ', quantityperunit, ' and cost $', round(unitprice,0)) as ProductInfo
from products;