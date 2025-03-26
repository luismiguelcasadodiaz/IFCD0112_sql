--7.	Haz una consulta para saber cuántos Alumnos hay en cada aula.
SELECT Aula_nom AS Aula, count(Alum_nom) as Ausentes
  FROM alumnos
  INNER JOIN aulas
  ON Aula_PK = Alum_aula_FK
  GROUP BY Aula_nom;

--8.	Haz una consulta que nos diga cuantos alumnos han venido a la academia hoy (NoEs Es Nulo).-
Select count(*) as  presentes from alumnos
WHERE Alum_aula_FK IS NOT NULL;

--9.	Haz una consulta que nos diga CUANTOS alumnos no han venido hoy (Es Nulo).
Select count(*) as  Ausentes from alumnos
WHERE Alum_aula_FK IS NULL;

--10.	Haz una consulta que nos diga Que alumnos no han venido hoy (Es Nulo).

Select Alum_nom as Ausentes from alumnos
WHERE Alum_aula_FK IS NULL;

select * from alumnos WHERE Alum_nom = 'PolN'
exec registra_entrada 'PolN', 'Abril'
select * from alumnos WHERE Alum_nom = 'PolN'
exec registra_salida 'PolN'
select * from alumnos WHERE Alum_nom = 'PolN'