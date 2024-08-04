SELECT
SELECT CustomerID, LastName, FirstName, CompanyName
FROM SalesLT.Customer

SELECT Name, ProductNumber, Color
FROM SalesLT.Product

SELECT CustomerID, SalesOrderID
FROM SalesLT.SalesOrderHeader


FILTERING DATA
SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle = 'Research and Development Engineer' 

SELECT FirstName, LastName, MiddleName
FROM Person.Person
WHERE MiddleName = 'J'

SELECT *
FROM Production.ProductCostHistory
WHERE ModifiedDate = '2013-05-16'

SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle <> 'Research and Development Engineer'

SELECT BusinessEntityID, FirstName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate > '2000-01-29'
ORDER BY ModifiedDate DESC

SELECT BusinessEntityID, FirstName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate <> '2000-01-29'

SELECT BusinessEntityID, FirstName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate BETWEEN '2008-12-01' AND '2008-12-31'
ORDER BY ModifiedDate DESC

SELECT BusinessEntityID, FirstName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate NOT BETWEEN '2008-12-01' AND '2008-12-31'
ORDER BY ModifiedDate DESC



NULLS
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IS NULL

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IS NULL OR Color <> 'Blue'

SELECT ProductID, Name, Style, Size, Color
FROM Production.Product
WHERE Style IS NOT NULL OR Size IS NOT NULL OR Color IS NOT NULL


Sorting
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY LastName DESC, FirstName DESC, MiddleName DESC

SELECT AddressLine1 + '(' + City + ' ' + PostalCode + ')' AS new_format
FROM Person.Address


Functions and Expressions
SELECT ProductID, Name + ISNULL(':'  + color, '') AS Description
FROM Production.Product


Mathematical Operations
SELECT MaxQty - MinQty AS DIFF, SpecialOfferID, Description
FROM Sales.SpecialOffer

SELECT (MinQty * DiscountPct) AS TOTAL, SpecialOfferID, Description
FROM Sales.SpecialOffer

SELECT  SpecialOfferID, Description, ISNULL(MaxQty, 10) * DiscountPct AS total
FROM Sales.SpecialOffer


String Functions
SELECT RIGHT(AddressLine1, 10) AddressLine1
FROM Person.Address;

SELECT SUBSTRING(AddressLine1, 10, 6) AS Address10to15, AddressLine1
FROM Person.Address;

SELECT UPPER(FirstName) AS FirstUp, UPPER(LastName) LastUp
FROM Person.Person;

SELECT ProductNumber, CHARINDEX('-', ProductNumber) FROM Production.Product;
SELECT ProductNumber, SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) +1, 25) AS otherNum FROM Production.Product

SELECT ProductNumber, CHARINDEX('-',ProductNumber)  FROM Production.Product;  
SELECT ProductNumber, SUBSTRING(ProductNumber, CHARINDEX('-',ProductNumber)+1,25) AS ProdNumber  FROM Production.Product;

DATE FUNCTIONS
SELECT DATEDIFF(day, OrderDate, ShipDate), OrderDate, ShipDate
FROM Sales.SalesOrderHeader

SELECT CAST(OrderDate AS DATE)
FROM Sales.SalesOrderHeader

SELECT CONVERT(VARCHAR,OrderDate,1) AS OrderDate,  CONVERT(VARCHAR, ShipDate,1) AS ShipDate 
FROM Sales.SalesOrderHeader;

SELECT EOMONTH(OrderDate, 6) AS Plus6Months, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader;
SELECT DATEADD(m,6,OrderDate) AS Plus6Months, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, OrderDate, YEAR(OrderDate) AS t_years, MONTH(OrderDate) as t_months
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, OrderDate, DATENAME(month, OrderDate) AS monthNames
FROM Sales.SalesOrderHeader