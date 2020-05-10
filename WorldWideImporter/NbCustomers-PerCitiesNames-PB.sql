USE [WideWorldImporters];

/*	Q4:
	Provide the numbers of customers per city
	We need to count something: the number of rows in the table Customer
*/
-- LOOK AT THE "NbCustomers" column here!!!!!
-- HIGHER THAN THE TOTAL NB OF CUSTOMERS (663)!!!! WHY?
SELECT	COUNT(*) As NbCustomers
		, Ci.CityName
FROM
		Sales.Customers as Cu
		,[Application].Cities as Ci
GROUP BY Ci.CityName
ORDER BY NbCustomers DESC -- IN SOME RDBMS, the column alias is not usable
		-- If column aliases are not available, use the  COUNT(*)
		, Ci.CityName ASC

