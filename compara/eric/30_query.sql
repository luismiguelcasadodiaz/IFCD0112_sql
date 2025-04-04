USE AdventureWorks2022

SELECT pc.Name AS Categoria
FROM Production.ProductCategory pc
JOIN Production.ProductSubcategory ps ON pc.ProductCategoryID = ps.ProductCategoryID
JOIN Production.Product p ON ps.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY pc.Name, ps.Name
HAVING COUNT(p.ProductID) * 100.0 / (SELECT COUNT(*) FROM Production.Product) BETWEEN 0.78 AND 0.80;