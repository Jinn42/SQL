SELECT *
FROM Sales.Invoices as i
where i.CustomerID = 2

UPDATE Sales.Invoices
SET BillToCustomerID = 1
WHERE CustomerID = 2