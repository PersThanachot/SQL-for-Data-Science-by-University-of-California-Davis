-- 1) Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT *
FROM tracks
WHERE Milliseconds >= 5000000;

-----------------------------------------------------------------------------------------------------------

-- 2) Run Query: Find all the invoices whose total is between $5 and $15 dollars.
SELECT *
FROM invoices
-- WHERE Total BETWEEN 5 AND 15
WHERE Total >= 5 AND Total <= 15; 

-----------------------------------------------------------------------------------------------------------

-- 3) Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT *
FROM customers
WHERE State in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY') 
-- What company does Jack Smith work for?
	  AND FirstName = 'Jack' AND LastName = 'Smith';

-----------------------------------------------------------------------------------------------------------

-- 4) Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT *
FROM invoices
WHERE CustomerId in (56,58) AND
	  Total BETWEEN 1 AND 5  
-- What was the invoice date for invoice ID 315?
	  AND InvoiceId = 315;

-----------------------------------------------------------------------------------------------------------

-- 5) Run Query: Find all the tracks whose name starts with 'All'.
SELECT * 
FROM tracks
WHERE name LIKE 'All%';

-----------------------------------------------------------------------------------------------------------

-- 6) Run Query: Find all the customer emails that start with "J" and are from gmail.com.
SELECT *
FROM customers
WHERE Email LIKE 'J%@gmail.com';

-----------------------------------------------------------------------------------------------------------

-- 7) Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver 
--    and sort in descending order by invoice ID.
SELECT *
FROM invoices
WHERE BillingCity in ('Brasília','Edmonton','Vancouver')
ORDER BY InvoiceId DESC;

-----------------------------------------------------------------------------------------------------------

-- 8) Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) 
--    and sort the result by the number of orders in descending order.
SELECT *,
count(InvoiceId) AS  'Number of Orders'
FROM invoices
GROUP BY CustomerId
ORDER BY 'Number of Orders' DESC;

-----------------------------------------------------------------------------------------------------------

-- 9) Run Query: Find the albums with 12 or more tracks.
SELECT *,
count(AlbumId) AS Total_Track
FROM tracks
GROUP BY AlbumId
HAVING Total_Track >= 12;