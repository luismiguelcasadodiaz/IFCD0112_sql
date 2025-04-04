USE AdventureWorks2022

;
WITH PersonasConNombre10Letras AS (
    SELECT 
        FirstName,
        COUNT(*) AS Cantidad
    FROM Person.Person
    WHERE LEN(FirstName) = 10
    GROUP BY FirstName
)
SELECT TOP 1 
    FirstName AS NombreMasFrecuente,
    Cantidad
FROM PersonasConNombre10Letras
ORDER BY Cantidad DESC;