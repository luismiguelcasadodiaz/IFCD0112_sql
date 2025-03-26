CREATE DATABASE [ejercicio_01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ejercicio_01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ejercicio_01.mdf' , SIZE = 3072KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ejercicio_01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ejercicio_01_log.ldf' , SIZE = 1024KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 WITH LEDGER = OFF
GO
ALTER DATABASE [ejercicio_01] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [ejercicio_01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ejercicio_01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ejercicio_01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ejercicio_01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ejercicio_01] SET ARITHABORT OFF 
GO
ALTER DATABASE [ejercicio_01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ejercicio_01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ejercicio_01] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [ejercicio_01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ejercicio_01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ejercicio_01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ejercicio_01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ejercicio_01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ejercicio_01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ejercicio_01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ejercicio_01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ejercicio_01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ejercicio_01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ejercicio_01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ejercicio_01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ejercicio_01] SET  READ_WRITE 
GO
ALTER DATABASE [ejercicio_01] SET RECOVERY FULL 
GO
ALTER DATABASE [ejercicio_01] SET  MULTI_USER 
GO
ALTER DATABASE [ejercicio_01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ejercicio_01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ejercicio_01] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ejercicio_01]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [ejercicio_01]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [ejercicio_01] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
