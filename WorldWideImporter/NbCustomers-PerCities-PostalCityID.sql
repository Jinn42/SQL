USE [WideWorldImporters];

/*	Q4:
	Provide the numbers of customers per city
	We need to count something: the number of rows in the table Customer
*/
-- LOOK AT THE "NbCustomers" column here!!!!!
-- HIGHER THAN THE TOTAL NB OF CUSTOMERS (663)!!!! WHY?
SELECT	COUNT(*) As NbCustomers
		, Cu.PostalCityID
FROM
		Sales.Customers as Cu
GROUP BY Cu.PostalCityID
ORDER BY NbCustomers DESC -- IN SOME RDBMS, the column alias is not usable
		-- If column aliases are not available, use the  COUNT(*)
		, Cu.PostalCityID ASC

