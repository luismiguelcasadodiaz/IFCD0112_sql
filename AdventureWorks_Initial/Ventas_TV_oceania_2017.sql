-- Ventas de televisiones en oceania en 2017 

SELECT P.Pais_txt, D.Ingresos
from Continentes as C
inner join Paises as P
on P.Continente_FK = C.Continente_PK
inner join Datos as D
on D.Pais_FK = P.Pais_PK
inner join Productos as PRO
on PRO.Producto_PK = D.Producto_FK
where C.Continente = 'Oceanía' and PRO.[Tipo Producto] = 'TV' and YEAR(D.fecha) = 2017;

SELECT P.Pais_txt, SUM(D.Ingresos)
from Continentes as C
inner join Paises as P
on P.Continente_FK = C.Continente_PK
inner join Datos as D
on D.Pais_FK = P.Pais_PK
inner join Productos as PRO
on PRO.Producto_PK = D.Producto_FK
where C.Continente = 'Oceanía' and PRO.[Tipo Producto] = 'TV' and YEAR(D.fecha) = 2017;
