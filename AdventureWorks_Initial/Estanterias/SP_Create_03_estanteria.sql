ALTER PROCEDURE create_estanteria
(
	  @est tinyint
	)
AS
	DECLARE @fil tinyint = 1;
	DECLARE @max_fil tinyint = 3;
	WHILE (@fil <= @max_fil)
	BEGIN
		EXEC dbo.create_row @est, @fil;
		SET @fil = @fil + 1;
	END