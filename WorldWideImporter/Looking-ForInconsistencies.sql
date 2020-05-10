/*
Q1: Extract all InvoiceIDs, their attached CustId + BillToCustID
and the value of BillToCustId in the table Customer
where BillToCustId in Invoices is <> from BillToCustId in Customers
*/
SELECT
		i.InvoiceID
		, i.CustomerID
		, i.BillToCustomerID
		, c.BillToCustomerID
FROM
		Sales.Invoices as i,
		Sales.Customers as c
WHERE
		i.CustomerID = c.CustomerID
		AND i.BillToCustomerID <> c.BillToCustomerID