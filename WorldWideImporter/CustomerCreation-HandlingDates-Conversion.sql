/*
Q8: All the customers who have been created between 
the 01/01/2013 and 15/02/2013
*/
-- This T-SQL : Transact-SQL
DECLARE @StyleDate int;
SET @StyleDate = 103;

SELECT CustomerID, CustomerName, CONVERT(varchar, AccountOpenedDate, @StyleDate)
FROM Sales.Customers
WHERE
	AccountOpenedDate BETWEEN 
		CONVERT(date, '01/01/2013', @StyleDate)  
		AND CONVERT(date, '15/02/2014', @StyleDate)
ORDER BY AccountOpenedDate DESC