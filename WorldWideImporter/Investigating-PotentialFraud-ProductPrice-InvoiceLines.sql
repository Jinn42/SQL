/*
	Q9:
	Is there any lines of invoices where product unit price
	is different from the product catalog unit price
*/
/*
SELECT COUNt(*)
FROM
	Sales.InvoiceLines as IL
	*/

SELECT 
		IL.InvoiceID
		, I.CustomerID
		, I.InvoiceDate
		, IL.InvoiceLineID
		, IL.Quantity
		, IL.UnitPrice
		, SI.UnitPrice
FROM
	Sales.InvoiceLines as IL
	, Warehouse.StockItems as SI
	, Sales.Invoices as I
WHERE
	IL.StockItemID = SI.StockItemID
	AND I.InvoiceID = IL.InvoiceID
	AND IL.UnitPrice <> SI.UnitPrice
ORDER BY IL.InvoiceID, I.InvoiceDate, I.CustomerID