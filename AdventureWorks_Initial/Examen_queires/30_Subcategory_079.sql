/*
¿Que Subcategoría de produtos ([Production].[ProductSubcategory]) 
supone el 0,79% del total de productos ([Production].[Product] ?

*/

DECLARE @COUNTPRODUCTOS SMALLINT
SELECT @COUNTPRODUCTOS = COUNT(*) FROM [AdventureWorks2022].[Production].[Product];

PRINT 'Hay ' + CAST(@COUNTPRODUCTOS AS VARCHAR) + ' Productos';

WITH Productosporcategorias AS (

SELECT
ISNULL(C.Name, 'Sin Categoria') as Categoria,
ISNULL(S.Name, 'Sin Subcategoría') as SubCategory, 
CAST(100 * COUNT(*) /CAST(@COUNTPRODUCTOS AS FLOAT) AS DECIMAL(5,2))  as 'cantidadProductos'

FROM [AdventureWorks2022].[Production].[Product] AS P
LEFT JOIN [AdventureWorks2022].[Production].[ProductSubcategory] AS S
ON S.ProductSubCategoryID = P.ProductSubCategoryID
LEFT JOIN [AdventureWorks2022].[Production].[Productcategory] AS C
ON C.ProductCategoryID = S.ProductCategoryID
GROUP BY ROLLUP(C.Name, S.NAme)
)
SELECT SubCategory 
FROM Productosporcategorias
WHERE cantidadProductos = 0.79