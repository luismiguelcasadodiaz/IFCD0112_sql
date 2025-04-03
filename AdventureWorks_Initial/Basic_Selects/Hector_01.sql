/*
-- ¿Cual es el Coste total de las unidades rechazadas (RejectedQty) 
en todos los pedidos de compra [Purchasing].[PurchaseOrderDetail]?
*/


SELECT SUM(UnitPrice * RejectedQty) as RejetedCost
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
WHERE RejectedQty > 0