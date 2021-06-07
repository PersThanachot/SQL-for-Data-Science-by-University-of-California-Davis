-- 1) Using a subquery, find the names of all the tracks for the album "Californication".
SELECT 
	a.AlbumId,
	b.TrackId,
	a.Title,
	b.Name
FROM albums a
LEFT JOIN tracks b
ON a.AlbumId = b.AlbumId
WHERE Title = 'Californication'
ORDER BY TrackId ;

----------------------------------------------------------------------------------------------------------------------------

-- 2) Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT 
	a.CustomerId,
	a.FirstName ||' '|| a.LastName AS FullName,
	a.City,
	a.Email,
	count(b.InvoiceId) AS TotalNumber
FROM customers a
LEFT JOIN invoices b
ON a.CustomerId = b.CustomerId
GROUP BY a.CustomerId ;

----------------------------------------------------------------------------------------------------------------------------

-- 3) Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT 
	b.ArtistId,
	a.TrackId,
	b.Title,
	a.Name 
FROM tracks a
LEFT JOIN albums b
ON a.AlbumId = b.AlbumId
-- What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
WHERE TrackId = 12;

----------------------------------------------------------------------------------------------------------------------------

-- 4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT 
	b.EmployeeId,
	b.LastName AS EmployeesLastName,
	b.ReportsTo,
	a.LastName AS ManagersLastName
FROM employees a
LEFT JOIN employees b
ON a.EmployeeId = b.ReportsTo
-- After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
WHERE ManagersLastName = 'Mitchell' ;

----------------------------------------------------------------------------------------------------------------------------

-- 5) Find the name and ID of the artists who do not have albums. 
SELECT 
	a.ArtistId,
	a.Name,
	b.Title
FROM artists a
LEFT JOIN albums b
ON a.ArtistId = b.ArtistId
WHERE b.Title IS NULL ;

----------------------------------------------------------------------------------------------------------------------------

-- 6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT 
	FirstName,
	LastName
FROM employees
UNION
SELECT 
	FirstName,
	LastName
FROM customers
ORDER BY LastName DESC ;

----------------------------------------------------------------------------------------------------------------------------

-- 7) See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT 
	a.CustomerId,
	a.FirstName ||' '|| a.LastName AS FullName,
	a.City,
	b.BillingCity
FROM customers a
LEFT JOIN invoices b
ON a.CustomerId = b.CustomerId
WHERE a.City IS NOT b.BillingCity ;