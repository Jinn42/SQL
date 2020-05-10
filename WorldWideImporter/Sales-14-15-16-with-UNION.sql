/*
Q6: Total values of sales for years 2014, 2015, 2016
*/

-- First step: total sum of sales
SELECT SUM(Sales2014) As Sales2014
	,SUM(Sales2015) As Sales2015
	, SUM(Sales2016) As Sales2016
FROM
(
	(
	SELECT SUM(IL.Quantity*IL.UnitPrice) As Sales2014
			, 0 As Sales2015
			, 0 as Sales2016
	FROM
		Sales.InvoiceLines as IL
		,Sales.Invoices as I
	WHERE
		I.InvoiceID = IL.InvoiceID
		AND YEAR(I.InvoiceDate) = 2014
	)
	UNION
	(
	SELECT 0 As Sales2014
			, SUM(IL.Quantity*IL.UnitPrice) As Sales2015
			, 0 as Sales2016
	FROM
		Sales.InvoiceLines as IL
		,Sales.Invoices as I
	WHERE
		I.InvoiceID = IL.InvoiceID
		AND YEAR(I.InvoiceDate) = 2015
	)
	UNION
	(
	SELECT 0 As Sales2014
			, 0 As Sales2015
			, SUM(IL.Quantity*IL.UnitPrice) as Sales2016
	FROM
		Sales.InvoiceLines as IL
		,Sales.Invoices as I
	WHERE
		I.InvoiceID = IL.InvoiceID
		AND YEAR(I.InvoiceDate) = 2016
	)
) as tmp