SELECT
	ShipMethodID as tipoEnvio,
	orderDate as fecha,
	count(EmployeeID) as NumEmpleados,
	GROUPING(ShipMethodID) as agrupadoEnvio,
	GROUPING(OrderDate) as agrupafecha
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
GROUP By ROLLUP(ShipMethodID,	orderDate)
ORDER BY OrderDate DESC;