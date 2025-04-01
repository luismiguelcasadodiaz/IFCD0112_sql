USE recetas_para_aprobar;
GO

SELECT R.rec_nom as Receta, SUM(IR.ing_rec_gramos) as peso
FROM Recetas as R
INNER JOIN Ingredientes_Recetas as IR
on IR.ing_rec_rec_FK = R.rec_PK
GROUP BY R.rec_nom ;