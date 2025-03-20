-- Para cada país del año 2018, identificar el mes con máximo beneficio y el mes con menor beneficio
USE Apol_Excel_02;

SELECT 
Pais_txt as pais, 
DAY(fecha) as mes, 
MAX(Ingresos) as ingresos, 
MAX(Gastos) as gastos,
MAX(Ingresos - Gastos)
FROM Datos
inner join Paises
on Pais_PK = Pais_FK
inner join Productos
on Producto_PK = Producto_FK
where YEAR(fecha) = 2018 AND [Tipo Producto] = 'TV' and Pais_FK = 2
GROUP BY Pais_txt, DAY(fecha);



WITH BeneficioPorMes AS (
    SELECT 
        Pais_txt,
        DATEPART(MONTH, fecha) AS Mes,
        SUM(Ingresos - gastos) AS Beneficio
    FROM 
        Datos
    WHERE 
        YEAR(fecha) = 2018
    GROUP BY 
        Pais, DATEPART(MONTH, fecha)
),
MesesMaxMin AS (
    SELECT
        Pais,
        Mes AS MejorMes,
        ROW_NUMBER() OVER (PARTITION BY Pais ORDER BY Beneficio DESC) AS RangoMax,
        Mes AS PeorMes,
        ROW_NUMBER() OVER (PARTITION BY Pais ORDER BY Beneficio ASC) AS RangoMin
    FROM 
        BeneficioPorMes
)
SELECT 
    Pais_txt,
    MAX(CASE WHEN RangoMax = 1 THEN MejorMes END) AS MejorMes,
    MAX(CASE WHEN RangoMin = 1 THEN PeorMes END) AS PeorMes
FROM 
    MesesMaxMin
GROUP BY 
    Pais_txt;
