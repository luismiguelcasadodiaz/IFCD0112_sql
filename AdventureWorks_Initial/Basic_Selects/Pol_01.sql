

-- Calcual el precio promedio de los productos por año

SELECT
	YEAR(DueDate)  as año, 
	AVG([UnitPrice])
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
GROUP BY YEAR(DueDate)



-- con jeraquía de valores
SELECT
	ProductID as producto, 
	YEAR(DueDate)  as año,
	SUM([UnitPrice]) as preciomedio,
	GROUPING(ProductID) as grupoPorducto,
	GROUPING(YEAR(DueDate)) as grupoaño
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
GROUP BY ROLLUP(ProductID, YEAR(DueDate))