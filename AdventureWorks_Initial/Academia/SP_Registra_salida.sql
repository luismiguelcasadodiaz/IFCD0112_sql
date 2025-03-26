ALTER PROCEDURE registra_salida
(
	@alumno varchar(15)
)
AS
	-- Verfica la existencia del alumno
	IF NOT EXISTS (SELECT TOP 1 Alum_nom FROM alumnos WHERE Alum_nom = @alumno)
	BEGIN
		PRINT 'El alumno ' + @alumno + ' no está matriculado';
		RETURN;
	END

	-- Borra el aula del alumno
	UPDATE alumnos 
	SET Alum_aula_FK = NULL
	WHERE Alum_nom = @alumno;