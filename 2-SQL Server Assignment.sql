--Assignment Day2

--Display the details from Customer table who is from country Germany
Select * from Customer where country = 'Germany';

--Display the  full name of the employee
	--Creating employee TABLE

CREATE TABLE Employee
(
EmployeeId INT PRIMARY KEY IDENTITY(1,1),
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40)
);

INSERT INTO Employee(FirstName,LastName,City,Country,Phone)
VALUES ('Manjunath','M','Bangalore','India','82827393933'),
('Anand kumar','Mara','Canberra','Australia','9876543218'),

Select CONCAT(FirstName, ' ', LastName) as 'Name' from Customer;

--Display the  customer details  who has Fax number
	--Add FaxNumber column
ALTER TABLE Customer
ADD FaxNumber INT;

Select * from Customer where faxnumber is not null;

--display the customer details whose name holds second letter as U
Select * from customer where SUBSTRING(Concate(Firstname,LastName),2,1) = 'U';

--select order Details where unit price is greater than 10 and less than 20
Select * from Order where unitprice > 10 and unitprice < 20;

--Display order details which contains shipping date and arrange the order by date
Select OrderDate as [Shippping_Date]* from Order order by OrderDate;

--Print the orders shipped by ship name 'La corned'abondance' between 2 dates(Choose dates of your choice)
--Add column ShippedName
ALTER TABLE ORDER
ADD ShippedName nvarchar(40);

Select * from Order where ShippedName ='La corned''abondance' and OrderDate Between '2022-03-15' and '2022-04-04';

--Print the products supplied by 'Exotic Liquids'
Select * from Product where package = 'Exotic Liquids'

--print the average quantity ordered for every product
Select AVG(Quantity),ProductId from OrderItem  group by ProductID
--Print all the Shipping company name and the ship names if they are operational
	--Adding Shipping operationl COLUMNS
ALTER TABLE ORDER
ADD isShippingOperation bit(40);

Select ShippedName from Order where isShippingOperation = 1;
	
--Print all Employees with Manager Name
ALTER TABLE Employee
ADD ManagerId INT; --Employee.EmployeeId

Select CONCAT(A.Firstname,A.LastName) as [Employee_Name],CONCAT(B.Firstname,B.LastName) as [Manager_Name] from Employee A join Employee B on A.Employeeid = B.ManagerId;

--Print the bill for a given order id .bill should contain Productname, Categoryname,price after discount
	--Adding Categoryname to the Product TABLE
	ALTER TABLE Product
	ADD Categoryname nvarchar(40);
	
	SELECT P.ProductName,P.Categoryname,O.TotalAmount from Order O join OrderItem OI on O.id = OI.orderId join Product P on P.id = OI.ProductId where O.Id = '83733' -- Input bill Number
	
--Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name

SELECT sum(TotalAmount),ShippedName from order O left join orderItem OI on o.id = OI.OrderId where  O.ShippedName = 'Exotic Liquids' and OI.UnitPrice > 50  Group by ShippedName;