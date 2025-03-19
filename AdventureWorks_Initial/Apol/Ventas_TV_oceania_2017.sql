-- Ventas de televisiones en oceania en 2017 

SELECT C.Continente, P.Pais_txt, D.Ingresos, D.fecha
from Continentes as C
inner join Paises as P
on P.Continente_FK = C.Continente_PK
inner join Datos as D
on D.Pais_FK = P.Pais_PK
inner join Productos as PRO
on PRO.Producto_PK = D.Producto_FK
where C.Continente = 'Oceanía' and PRO.[Tipo Producto] = 'TV';

SELECT P.Pais_txt, SUM(D.Ingresos)
from Continentes as C
inner join Paises as P
on P.Continente_FK = C.Continente_PK
inner join Datos as D
on D.Pais_FK = P.Pais_PK
inner join Productos as PRO
on PRO.Producto_PK = D.Producto_FK
where C.Continente = 'Oceanía' and PRO.[Tipo Producto] = 'TV' and YEAR(D.fecha) = 2017
group by P.Pais_txt

SELECT SUM(D.Ingresos)
from Continentes as C
inner join Paises as P
on P.Continente_FK = C.Continente_PK
inner join Datos as D
on D.Pais_FK = P.Pais_PK
inner join Productos as PRO
on PRO.Producto_PK = D.Producto_FK
where C.Continente = 'Oceanía' and PRO.[Tipo Producto] = 'TV' and YEAR(D.fecha) = 2017

-- Como todas las columnas tienen nombres diferentes no son necesarios los alias

SELECT sum(Ingresos)
from Continentes
inner join Paises
on Continente_FK = Continente_PK
inner join Datos
on Pais_FK = Pais_PK
inner join Productos 
on Producto_PK = Producto_FK
where Continente = 'Oceanía' and [Tipo Producto] = 'TV' and YEAR(fecha) = 2017;