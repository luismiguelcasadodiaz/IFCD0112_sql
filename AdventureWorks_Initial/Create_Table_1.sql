/*
   jueves, 20 de marzo de 202521:10:36
   User: 
   Server: SERVIDORDELL
   Database: Provincias
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Table_1
	(
	Campo1 int NOT NULL IDENTITY (5, 3),
	Campo2 nchar(10) NULL,
	Campo3 decimal(5, 2) NULL,
	Campo4 money NULL,
	Campo5  AS [Campo3] * [Campo4],
	Campo7 bit NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'Nombre del Producto'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Table_1', N'COLUMN', N'Campo2'
GO
DECLARE @v sql_variant 
SET @v = N'IVA'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Table_1', N'COLUMN', N'Campo3'
GO
DECLARE @v sql_variant 
SET @v = N'Precio Unitario'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Table_1', N'COLUMN', N'Campo4'
GO
ALTER TABLE dbo.Table_1 ADD CONSTRAINT
	DF_Table_1_Campo3 DEFAULT 0.25 FOR Campo3
GO
ALTER TABLE dbo.Table_1 ADD CONSTRAINT
	PK_Table_1 PRIMARY KEY CLUSTERED 
	(
	Campo1
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Table_1 SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
