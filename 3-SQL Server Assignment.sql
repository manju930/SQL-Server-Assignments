--3. SQL Server Assignment
--1. write a query to display the orders placed by customer with phone number 030-0074321
INSERT into Customer values (12,'Rama','Seetha','Hyderabad','India','030-0074321');

SELECT * FROM ORDER o INNER JOIN CUSTOMER C ON O.CustomerID = C.id 
	where c.Phone = '030-0074321';

--2.fetching all the products which are available under Category ‘Seafood’.
SELECT * FROM PRODUCTS WHERE Categoryname = 'Seafood';

--3.Display the orders placed by customers not in London
SELECT * FROM ORDER o INNER JOIN CUSTOMER C ON O.CustomerID = C.id 
	where c.city <> 'London';
	
--4.selects all the order which are placed for the product Chai.
SELECT O.* from order O left join orderItem OI on o.id = OI.OrderId join product P on P.id = OI.ProductId where p.productname ='Chai';

--5.Write a query to display the name , department name and rating  of any given employee

--Adding column department to the employee TABLE
ALTER TABLE EMPLOYEE
ADD DEPARTMENT VARCHAR(30),
Rating nvarchar(20);

CREATE TABLE EMP_RATING
(
RATING_ID INT PRIMARYKEY,
EMP_id INT,
RATING NVARCHAR(20)
);

SELECT Firstname,LastName,Department,Rating FROM EMPLOYEE E LEFT JOIN EMP_RATING R ON  E.ID = R.EMP_ID WHERE E.EmployeeId = '8373';
 

