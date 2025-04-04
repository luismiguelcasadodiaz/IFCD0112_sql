USE AdventureWorks2022

;
WITH SubcategoryCounts AS (
    SELECT 
        pc.Name AS Categoria,
        ps.Name AS Subcategoria,
        COUNT(p.ProductID) AS TotalProductos,
        COUNT(p.ProductID) * 100.0 / (SELECT COUNT(*) FROM Production.Product) AS Porcentaje
    FROM Production.Product p
    JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
    JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
    GROUP BY pc.Name, ps.Name
)
SELECT Categoria
FROM SubcategoryCounts
WHERE ABS(Porcentaje - 0.79) < 0.01;