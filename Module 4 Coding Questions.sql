-- 1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together.
--    Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT 
	CustomerId,
	FirstName ||' '|| LastName AS FullName,
	Address,
	UPPER(City ||' '|| Country) AS City_Country
From customers
-- What is the city and country result for CustomerID 16?
WHERE CustomerId = '16';

--------------------------------------------------------------------------------------------------------------------------------------

-- 2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name.
--	  Make the new field lower case and pull each individual step to show your work.
SELECT
	FirstName,
	LastName,
	LOWER(substr(FirstName,1,4) ||''|| substr(LastName,1,2)) AS UserId
FROM employees ;

--------------------------------------------------------------------------------------------------------------------------------------

-- 3) Show a list of employees who have worked for the company for 15 or more years using the current date function.
--    Sort by lastname ascending.
SELECT 
	FirstName,
	LastName,
	BirthDate,
	DATE('now') - BirthDate AS Age,
	DATE('now') - HireDate AS Work_Year
FROM employees
WHERE Work_Year >= 15
ORDER BY LastName ; 

--------------------------------------------------------------------------------------------------------------------------------------

-- 4) Profiling the Customers table, answer the following question.
SELECT *
FROM customers 
-- Are there any columns with null values? Indicate any below. Select all that apply.
WHERE ColumnName IS NULL ;

--------------------------------------------------------------------------------------------------------------------------------------

-- 5) Find the cities with the most customers and rank in descending order.
SELECT 
	City,
	count(City) AS Counts	
FROM customers
GROUP BY City
ORDER BY Counts DESC ; 

--------------------------------------------------------------------------------------------------------------------------------------

-- 6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name 
--    while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT
	a.FirstName,
	a.LastName,
	b.InvoiceId,
	a.FirstName ||''|| a.LastName ||''|| b.InvoiceId  AS NewInvoiceId
FROM customers a
LEFT JOIN invoices b
ON a.CustomerId = b.CustomerId
-- Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.
WHERE NewInvoiceId LIKE 'AstridGruber%' ; 