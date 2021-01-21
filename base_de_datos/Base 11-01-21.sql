USE [master]
GO

/****** Object:  Database [moneyCLIP]    Script Date: 11/01/2021 20:34:53 ******/
CREATE DATABASE [moneyCLIP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'moneyCLIP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\moneyCLIP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'moneyCLIP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\moneyCLIP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [moneyCLIP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [moneyCLIP] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [moneyCLIP] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [moneyCLIP] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [moneyCLIP] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [moneyCLIP] SET ARITHABORT OFF 
GO

ALTER DATABASE [moneyCLIP] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [moneyCLIP] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [moneyCLIP] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [moneyCLIP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [moneyCLIP] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [moneyCLIP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [moneyCLIP] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [moneyCLIP] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [moneyCLIP] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [moneyCLIP] SET  DISABLE_BROKER 
GO

ALTER DATABASE [moneyCLIP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [moneyCLIP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [moneyCLIP] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [moneyCLIP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [moneyCLIP] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [moneyCLIP] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [moneyCLIP] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [moneyCLIP] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [moneyCLIP] SET  MULTI_USER 
GO

ALTER DATABASE [moneyCLIP] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [moneyCLIP] SET DB_CHAINING OFF 
GO

ALTER DATABASE [moneyCLIP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [moneyCLIP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [moneyCLIP] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [moneyCLIP] SET QUERY_STORE = OFF
GO

ALTER DATABASE [moneyCLIP] SET  READ_WRITE 
GO


