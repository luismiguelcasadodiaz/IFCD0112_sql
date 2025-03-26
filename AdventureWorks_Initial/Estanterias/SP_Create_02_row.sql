CREATE PROCEDURE create_row
(
	  @est tinyint
	, @fil tinyint
	)
AS
	DECLARE @col tinyint = 1;
	DECLARE @max_col tinyint = 20;
	WHILE (@col <= @max_col)
	BEGIN
		EXEC dbo.create_espace @est, @fil, @col;
		SET @col = @col + 1;
	END