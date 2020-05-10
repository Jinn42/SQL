/*
Q7: Sales Report by Quarters for 2014
*/
select
	SUM(
			CASE WHEN DATEPART(quarter, I.InvoiceDate) = 1
				THEN IL.Quantity* IL.UnitPrice
			END
			) SalesQ1,
	SUM(
			CASE WHEN DATEPART(quarter, I.InvoiceDate) = 2
				THEN IL.Quantity* IL.UnitPrice
			END
			) SalesQ2,
	SUM(
			CASE WHEN DATEPART(quarter, I.InvoiceDate) = 3
				THEN IL.Quantity* IL.UnitPrice
			END
			) SalesQ3,
	SUM(
			CASE WHEN DATEPART(quarter, I.InvoiceDate) = 4
				THEN IL.Quantity* IL.UnitPrice
			END
			) SalesQ4
from
	Sales.InvoiceLines as IL,
	Sales.Invoices as I
WHERE
	I.InvoiceID = IL.InvoiceID
	AND YEAR(I.InvoiceDate) = 2014