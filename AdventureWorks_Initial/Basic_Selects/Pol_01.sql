

-- Calcual el precio promedio de los productos por a�o

SELECT
	YEAR(DueDate)  as a�o, 
	AVG([UnitPrice])
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
GROUP BY YEAR(DueDate)



-- con jeraqu�a de valores
SELECT
	ProductID as producto, 
	YEAR(DueDate)  as a�o,
	SUM([UnitPrice]) as preciomedio,
	GROUPING(ProductID) as grupoPorducto,
	GROUPING(YEAR(DueDate)) as grupoa�o
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
GROUP BY ROLLUP(ProductID, YEAR(DueDate))