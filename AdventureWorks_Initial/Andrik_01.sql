SELECT 
	YEAR(ShipDate) as año, 
	ShipMethodID as tipoenvio,
	FORMAT(SUM(subTotal), 'C', 'uk-gb') as Total,
	GROUPING(YEAR(ShipDate)) as agrupadoporaño,
	GROUPING(ShipMethodID) as agrupadoPorEnvio

FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
GROUP by ROLLUP(YEAR(ShipDate), ShipMethodID);
