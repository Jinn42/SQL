/*
	Q3: All the customers (Id, Name, City Name) who have not
	converted orders into sales
*/

SELECT 
		Cu.CustomerID
		, Cu.CustomerName
		, Ci.CityName
FROM
	Sales.Customers as Cu
	, Sales.Orders as O
	, [Application].Cities as Ci
WHERE
	--NOT EXISTS
	O.OrderID NOT IN
	(
		SELECT i.OrderID
		FROM
			Sales.Invoices as i
		-- The join is not necessary with the NOT IN clause
		-- in the outer query
		--WHERE
			--i.OrderID = o.OrderID
	)
	AND Cu.CustomerID = o.CustomerID
	AND Cu.PostalCityID = Ci.CityID
ORDER BY Cu.CustomerID
