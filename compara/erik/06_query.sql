USE AdventureWorks2022

SELECT SUM(RejectedQty * UnitPrice) AS CosteTotalRechazado
FROM Purchasing.PurchaseOrderDetail;