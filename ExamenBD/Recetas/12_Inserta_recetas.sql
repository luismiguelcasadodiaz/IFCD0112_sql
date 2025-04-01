/*
Inserta una receta con estos valores 

Nombre:Sopa de Calabaza 

Elaboracion: Cortar la calabaza (500grm) en cubos y caramelizar la cebolla tierna (150 grm). cocinar hasta que la calabaza esté tierna. Triturar. Servir caliente, decorada con perejil fresco (5 gr). 

Tiempo: 30 minutos. 

Categoria: N (siendo N el código de la categoría “Sopas” 

Dificultad: N (siendo N el código de la dificultad “ELaborada”: 


*/
USE recetas_para_aprobar
GO
INSERT INTO Recetas
VALUES
('Sopa de Calabaza',
 'Cortar la calabaza (500grm) en cubos y caramelizar la cebolla tierna (150 grm). cocinar hasta que la calabaza esté tierna. Triturar. Servir caliente, decorada con perejil fresco (5 gr).',
 30,
 3,
 2
)