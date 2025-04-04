USE AdventureWorks2022

SELECT SUM(RejectedQty * UnitPrice) AS CosteTotalRechazadas
FROM Purchasing.PurchaseOrderDetail;