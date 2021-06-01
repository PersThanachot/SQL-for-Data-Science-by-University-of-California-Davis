-- Database From Chinook
-- 1) Retrieve all the records from the Employees table.
SELECT 
	FirstName,
	LastName,
	Address,
	City,
	State,
	Country
FROM employees
-- What is Robert King's mailing address?
WHERE FirstName = 'Robert' AND
	  LastName = 'King';
	  
-- Easy Way --
SELECT *
FROM employees; -- Note: You will have to scroll to the right in order to see it.
------------------------------------------------------------------------------------------------------

-- 2) Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
SELECT 
	FirstName,
	LastName,
	BirthDate,
	Address,
	City,
	State
FROM employees
-- Which of the employees listed below has a birthdate of 3-3-1965?
WHERE BirthDate LIKE '1965-03-03%';

------------------------------------------------------------------------------------------------------

-- 3) Retrieve all the columns from the Tracks table, but only return 20 rows.
-- What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"?
SELECT 
	TrackId,
	Name,
	Milliseconds
FROM tracks
WHERE TrackId = 5
-- Easy Way --
SELECT *
FROM tracks
LIMIT 20 --LIMIT 5 or 10



