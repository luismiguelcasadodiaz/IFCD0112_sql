USE AdventureWorks2022

;
WITH ContratacionesMensuales AS (
    SELECT 
        MONTH(HireDate) AS MesNumero,
        DATENAME(MONTH, HireDate) AS MesNombre,
        Gender,
        COUNT(*) AS TotalContrataciones
    FROM HumanResources.Employee
    GROUP BY MONTH(HireDate), DATENAME(MONTH, HireDate), Gender
),
MujeresPorMes AS (
    SELECT 
        MesNumero,
        MesNombre,
        TotalContrataciones
    FROM ContratacionesMensuales
    WHERE Gender = 'F'
)
SELECT TOP 1 MesNombre
FROM MujeresPorMes
ORDER BY TotalContrataciones ASC;