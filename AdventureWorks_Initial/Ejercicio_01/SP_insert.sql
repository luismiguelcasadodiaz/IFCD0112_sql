CREATE PROCEDURE InsertWithConstraintCheck
    @TableName NVARCHAR(128),
    @Column1Value INT,
    @Column2Value NVARCHAR(255)
AS
BEGIN
    BEGIN TRY
        -- Insert operation
        INSERT INTO dbo.MyTable (Column1, Column2)
        VALUES (@Column1Value, @Column2Value);

        -- Output a success message
        PRINT 'Insert succeeded.';
    END TRY
    BEGIN CATCH
        -- Handle constraint errors
        IF ERROR_NUMBER() IN (2627, 547, 2601) -- Common constraint errors
        BEGIN
            PRINT 'Constraint error detected.';
            PRINT 'Error Message: ' + ERROR_MESSAGE();
        END
        ELSE
        BEGIN
            -- Handle other errors
            PRINT 'An error occurred.';
            PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
            PRINT 'Error Message: ' + ERROR_MESSAGE();
        END
    END CATCH
END;
GO
