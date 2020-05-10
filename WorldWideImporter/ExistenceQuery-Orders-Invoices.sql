/*
Q2: Identify all orders which have not converted into a sale
*/
SELECT *
FROM
	Sales.Orders as o
WHERE
	NOT EXISTS
	(
		SELECT *
		FROM
			Sales.Invoices as i
		WHERE
			i.OrderID = o.OrderID
	)
	