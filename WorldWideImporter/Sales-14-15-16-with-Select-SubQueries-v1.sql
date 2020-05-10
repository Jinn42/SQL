SELECT
		(
			SELECT SUM(IL.Quantity*IL.UnitPrice) 
			FROM
				Sales.InvoiceLines as IL
				,Sales.Invoices as I
			WHERE
				I.InvoiceID = IL.InvoiceID
				AND YEAR(I.InvoiceDate) = 2014
		) as Sales2014,
		(
			SELECT SUM(IL.Quantity*IL.UnitPrice) 
			FROM
				Sales.InvoiceLines as IL
				,Sales.Invoices as I
			WHERE
				I.InvoiceID = IL.InvoiceID
				AND YEAR(I.InvoiceDate) = 2015
		) as Sales2015,
		(
			SELECT SUM(IL.Quantity*IL.UnitPrice) 
			FROM
				Sales.InvoiceLines as IL
				,Sales.Invoices as I
			WHERE
				I.InvoiceID = IL.InvoiceID
				AND YEAR(I.InvoiceDate) = 2016
		) as Sales2016