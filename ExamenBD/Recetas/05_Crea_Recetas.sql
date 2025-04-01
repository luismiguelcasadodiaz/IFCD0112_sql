/*De la receta sabemos 
las instrucciones de elaboración, 
el tiempo de elaboración. 
La receta la podemos calificar como muy fácil, elaborada o complicada. 
La receta puede ser de estas categorías: Entrantes, Ensaladas, Sopas, Cremas, 
Hortalizas, Legumbres, Huevos, Arroces, Pastas, Aves, Carnes, Pescados, Mariscos, Postres. */
USE recetas_para_aprobar;
GO

CREATE TABLE Recetas
(
	rec_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
	rec_nom VARCHAR(50) NOT NULL,
	rec_ins VARCHAR(500) NOT NULL,
	rec_tiem TINYINT CHECK (rec_tiem > 0) DEFAULT 10,
	rec_dif_FK TINYINT FOREIGN KEY (rec_dif_FK) REFERENCES Dificultades(dif_PK),
	rec_cat_FK TINYINT FOREIGN KEY (rec_cat_FK) REFERENCES Categorias(cat_PK)
	);
