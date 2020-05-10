/* Q1: Extract 
Product Identifier, Product Name and 
the countries of manufacturing for each product in the catalog
		IMPOSSIBLE! TABLE NOT IN 1NF
*/

SELECT StockItemID, StockItemName, CustomFields
FROM Warehouse.StockItems
WHERE CustomFields LIKE '%"China"%'