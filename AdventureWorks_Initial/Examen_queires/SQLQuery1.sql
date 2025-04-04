/*

¿En qué categoría de producto (ProductCategoryID) el precio promedio (ListPrice) está entre 100 y 150, considerando únicamente las categorías que tienen al menos 5 productos registrados?

*/


SELECT ps.ProductCategoryID,   AVG(p.ListPrice), COUNT(p.ProductID)
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.ListPrice > 0
GROUP BY ps.ProductCategoryID, 
HAVING AVG(p.ListPrice) BETWEEN 100 AND 150 
       AND COUNT(p.ProductID) >= 5;
