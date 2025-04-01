USE recetas_para_aprobar;
GO
CREATE TABLE Ingredientes_Recetas
(
	ing_rec_rec_FK TINYINT NOT NULL FOREIGN KEY(ing_rec_rec_FK) REFERENCES Recetas(rec_PK),
	ing_rec_ing_FK TINYINT NOT NULL FOREIGN KEY(ing_rec_ing_FK) REFERENCES Ingredientes(ing_PK),
	ing_rec_gramos INT NOT NULL CHECK(ing_rec_gramos > 1),
	PRIMARY KEY (ing_rec_rec_FK, ing_rec_ing_FK )
)