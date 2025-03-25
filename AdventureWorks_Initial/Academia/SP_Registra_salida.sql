CREATE PROCEDURE registra_salida
(
	@alumno varchar(15),
	@aula char(10)
)
AS
	-- Verfica la existencia del alumno
	IF NOT EXISTS (SELECT TOP 1 Alum_nom FROM alumnos WHERE Alum_nom = @alumno)
	BEGIN
		PRINT 'El alumno ' + @alumno + ' no está matriculado';
		RETURN;
	END
	-- Verifica le existencia del aula
	IF NOT EXISTS (SELECT TOP 1 Aula_PK FROM aulas WHERE Aula_nom = @aula)
	BEGIN
		PRINT 'El Aula ' + @aula + ' no existe';
		RETURN;
	END

	-- Borra el aula del alumno
	UPDATE alumnos 
	SET Alum_aula_FK = NULL
	WHERE Alum_nom = @alumno;