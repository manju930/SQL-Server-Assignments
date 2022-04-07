--4. SQL Server Assignment

--1.	Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name


SELECT sum(TotalAmount),ShippedName from order O left join orderItem OI on o.id = OI.OrderId where O.ShippedName = 'Exotic Liquids' and OI.UnitPrice > 50  Group by ShippedName;

--2.	Display the employee details whose joined at first
--Adding employee joining date COLUMNS
ALTER TABLE EMPLOYEE
ADD JOIN_DATE DATETIME;

SELECT  * FROM EMPLOYEE ORDER BY JOIN_DATE;
--3.	Display the employee details whose joined at recently
SELECT  * FROM EMPLOYEE ORDER BY JOIN_DATE DESC;
--4.	Write a query to get most expense and least expensive Product list (name and unit price).
SELECT MAX(UNITPRICE),MIN(UNITPRICE) FROM PRODUCT;
--5.	Display the list of products that are out of stock
--ADING STOCK COUNT TO THE PRODUCT TABLE
ALTER TABLE PRODUCT
ADD AVAILABLE_STOCK_QUANTITY INT;

SELECT * FROM PRODUCT WHERE AVAILABLE_STOCK_QUANTITY = 0;

--6.	Display the list of products whose unitinstock is less than unitonorder
SELECT * FROM PRODUCTS WHERE UNITSTOCK < UNITORDER;

--7.	Display list of categories and suppliers who supply products within those categories
SELECT CATEGORYNAME,ShippedName FROM PRODUCT GROUP BY PRODUCTNAME,SHIPPEDNAME  HAVING COUNT(SHIPPEDNAME)>1;
--8.	Display complete list of customers, the OrderID and date of any orders they have made
SELECT C.FIRSTNAME,C.LASTNAME,O.ORDERID,O.ORDERDATE FROM ORDER O JOIN CUSTOMER C ON O.CUSTOMERID=C.ID WHERE COUNT(O.ORDERID)>0;
--9.	Write  query that determines the customer who has placed the maximum number of orders
SELECT * FROM CUSTOMER WHERE CUSTOMERID IN ( SELECT CUSTOMERID,MAX(COUNT(ORDERID)) FROM ORDER GROUP BY CUSTOMERID);
--10.	Display the customerid whose name has substring ‘RA’
SELECT ID FROM CUSTOMER WHERE CONCAT(FIRSTNAME,LASTNAME) LIKE '%RA%';
--11.	Display the first word of all the company name
SELECT LEFT(COMPANYNAME,10) FROM EMPLOYEE;


