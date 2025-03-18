-- Coste total de los productos rechazados 

SELECT SUM(UnitPrice * RejectedQty) as RejetedCost
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
WHERE RejectedQty > 0