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


