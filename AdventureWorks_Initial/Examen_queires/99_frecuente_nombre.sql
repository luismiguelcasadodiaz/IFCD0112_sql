/*
�Cual es el nombre (FirstName) m�s frecuente del subconjunto de los personas ([Person].[Person]) 
que tienen un nombre de 10 letras?

de La palabra m�s frecuente en el subconjunto de las palabras de longitud n, 
-- para todas las longitudes de palabra posibles en el dominio 
-- de la columna Nombre.

-- Largo	FirstName
-- 2	Jo
-- 3	Ian
-- 4	Seth
-- 5	James
-- 6	Marcus
-- 7	Richard
-- 8	Jennifer
-- 9	Katherine
-- 10	Jacqueline    <==
-- 11	Christopher
-- 12	Michael John
-- 15	Suzana De Abreu
-- 24	Janaina Barreiro Gambaro
*/

SELECT LEN(FirstName) as largo, 
  FirstName,  
  count(*) as numnom
  FROM [AdventureWorks2022].[Person].[Person]
  GROUP BY ROLLUP (LEN(FirstName), FirstName);



WITH resumen as 
(
  SELECT LEN(FirstName) as largo, 
  FirstName,  
  count(*) as numnom
  FROM [AdventureWorks2022].[Person].[Person]
  GROUP BY ROLLUP (LEN(FirstName), FirstName)
)
Select Largo, FirstName
from resumen as r1
WHERE numnom = (select max(numnom)
				from resumen as r2 
				where r1.largo = r2.largo) and largo = 10