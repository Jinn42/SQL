SELECT 
	SUM(
			CASE WHEN YEAR(I.InvoiceDate) = 2014
					THEN IL.UnitPrice * IL.Quantity
			END
	) As Sales2014,

	SUM(
			CASE WHEN YEAR(I.InvoiceDate) = 2015
					THEN IL.UnitPrice * IL.Quantity
			END
	) As Sales2015,
	SUM(
			CASE WHEN YEAR(I.InvoiceDate) = 2016
					THEN IL.UnitPrice * IL.Quantity
			END
	) As Sales2016

FROM
	Sales.Invoices as I
	, Sales.InvoiceLines as IL
WHERE
	I.InvoiceID = IL.InvoiceID
	AND YEAR(I.InvoiceDate) BETWEEN 2014 AND 2016 