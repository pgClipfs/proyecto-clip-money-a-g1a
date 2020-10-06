USE [master]
GO
/****** Object:  Database [moneyCLIP]    Script Date: 6/10/2020 11:24:47 ******/
CREATE DATABASE [moneyCLIP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'moneyCLIP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\moneyCLIP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'moneyCLIP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\moneyCLIP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [moneyCLIP] SET COMPATIBILITY_LEVEL = 150
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
USE [moneyCLIP]
GO
/****** Object:  User [clip]    Script Date: 6/10/2020 11:24:48 ******/
CREATE USER [clip] FOR LOGIN [clip] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [clip]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[estado] [nchar](10) NULL,
	[saldo] [money] NULL,
	[nro_cuenta] [int] NULL,
	[alias] [nchar](10) NULL,
	[cbu] [bigint] NULL,
	[moneda] [nchar](10) NULL,
	[id_usuario] [smallint] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[codigo_postal] [smallint] NOT NULL,
	[id_provincia] [smallint] NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[monto] [money] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tasa_interes] [float] NULL,
	[monto_maximo] [money] NULL,
	[situacion_crediticia] [smallint] NULL,
	[id_cuenta] [smallint] NOT NULL,
	[id_tipo_operacion] [smallint] NOT NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
 CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [char](20) NOT NULL,
	[apellido] [char](20) NOT NULL,
	[cuit] [bigint] NOT NULL,
	[direccion] [char](20) NOT NULL,
	[id_localidad] [smallint] NOT NULL,
	[estado_civil] [char](10) NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[id_pais] [smallint] NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operacion]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operacion](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[tipo] [nchar](20) NOT NULL,
 CONSTRAINT [PK_tipo_operacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[usuario] [nchar](10) NOT NULL,
	[pass] [char](10) NOT NULL,
	[id_persona] [smallint] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cuenta] ON 
GO
INSERT [dbo].[cuenta] ([id], [estado], [saldo], [nro_cuenta], [alias], [cbu], [moneda], [id_usuario]) VALUES (1, N'activo    ', 4500.0000, 58, N'mago      ', NULL, N'peso      ', 1)
GO
INSERT [dbo].[cuenta] ([id], [estado], [saldo], [nro_cuenta], [alias], [cbu], [moneda], [id_usuario]) VALUES (2, N'inactivo  ', 0.0000, NULL, N'ojo       ', NULL, NULL, 2)
GO
SET IDENTITY_INSERT [dbo].[cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 
GO
INSERT [dbo].[localidad] ([id], [nombre], [codigo_postal], [id_provincia]) VALUES (1, N'Cordoba             ', 5000, 1)
GO
INSERT [dbo].[localidad] ([id], [nombre], [codigo_postal], [id_provincia]) VALUES (2, N'Jesus Maria         ', 5220, 1)
GO
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[operacion] ON 
GO
INSERT [dbo].[operacion] ([id], [monto], [fecha], [tasa_interes], [monto_maximo], [situacion_crediticia], [id_cuenta], [id_tipo_operacion]) VALUES (1, 1000.0000, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, 2)
GO
INSERT [dbo].[operacion] ([id], [monto], [fecha], [tasa_interes], [monto_maximo], [situacion_crediticia], [id_cuenta], [id_tipo_operacion]) VALUES (2, 3000.0000, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, 1)
GO
INSERT [dbo].[operacion] ([id], [monto], [fecha], [tasa_interes], [monto_maximo], [situacion_crediticia], [id_cuenta], [id_tipo_operacion]) VALUES (3, 2000.0000, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, 1)
GO
INSERT [dbo].[operacion] ([id], [monto], [fecha], [tasa_interes], [monto_maximo], [situacion_crediticia], [id_cuenta], [id_tipo_operacion]) VALUES (4, 2000.0000, CAST(N'2020-10-06T10:23:35.807' AS DateTime), 5.5, 3000.0000, 1, 1, 4)
GO
INSERT [dbo].[operacion] ([id], [monto], [fecha], [tasa_interes], [monto_maximo], [situacion_crediticia], [id_cuenta], [id_tipo_operacion]) VALUES (5, 500.0000, CAST(N'2020-10-06T10:50:50.160' AS DateTime), NULL, NULL, NULL, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[pais] ON 
GO
INSERT [dbo].[pais] ([id], [nombre]) VALUES (1, N'Argentina           ')
GO
SET IDENTITY_INSERT [dbo].[pais] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 
GO
INSERT [dbo].[persona] ([id], [nombre], [apellido], [cuit], [direccion], [id_localidad], [estado_civil]) VALUES (1, N'juan                ', N'alvarez             ', 20364251251, N'urquiza 56          ', 1, N'soltero   ')
GO
INSERT [dbo].[persona] ([id], [nombre], [apellido], [cuit], [direccion], [id_localidad], [estado_civil]) VALUES (2, N'pedro               ', N'morini              ', 20334255871, N'tucuma 65           ', 2, N'casado    ')
GO
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 
GO
INSERT [dbo].[provincia] ([id], [nombre], [id_pais]) VALUES (1, N'Cordoba             ', 1)
GO
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_operacion] ON 
GO
INSERT [dbo].[tipo_operacion] ([id], [tipo]) VALUES (1, N'Transferencia       ')
GO
INSERT [dbo].[tipo_operacion] ([id], [tipo]) VALUES (2, N'Extraccion          ')
GO
INSERT [dbo].[tipo_operacion] ([id], [tipo]) VALUES (3, N'Deposito            ')
GO
INSERT [dbo].[tipo_operacion] ([id], [tipo]) VALUES (4, N'Giro                ')
GO
SET IDENTITY_INSERT [dbo].[tipo_operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [usuario], [pass], [id_persona]) VALUES (1, N'ale5      ', N'9874      ', 1)
GO
INSERT [dbo].[usuario] ([id], [usuario], [pass], [id_persona]) VALUES (2, N'pedro55   ', N'9789      ', 2)
GO
INSERT [dbo].[usuario] ([id], [usuario], [pass], [id_persona]) VALUES (4, N'aatorancio', N'casa      ', 1)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_usuario] FOREIGN KEY([id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_usuario]
GO
ALTER TABLE [dbo].[localidad]  WITH CHECK ADD  CONSTRAINT [FK_localidad_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id])
GO
ALTER TABLE [dbo].[localidad] CHECK CONSTRAINT [FK_localidad_provincia]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_cuenta]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_tipo_operacion] FOREIGN KEY([id_tipo_operacion])
REFERENCES [dbo].[tipo_operacion] ([id])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_tipo_operacion]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [FK_persona_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [FK_persona_localidad]
GO
ALTER TABLE [dbo].[provincia]  WITH CHECK ADD  CONSTRAINT [FK_provincia_pais] FOREIGN KEY([id_pais])
REFERENCES [dbo].[pais] ([id])
GO
ALTER TABLE [dbo].[provincia] CHECK CONSTRAINT [FK_provincia_pais]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_persona] FOREIGN KEY([id_persona])
REFERENCES [dbo].[persona] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_persona]
GO
/****** Object:  StoredProcedure [dbo].[deposito]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deposito]

	@monto float, @id_cuenta smallint

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[operacion]
           ([monto]
           ,[fecha]
           ,[id_cuenta]
           ,[id_tipo_operacion])
	VALUES
		(@monto, GETDATE(), @id_cuenta, 2)

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] + @monto
       
	WHERE [id] = @id_cuenta 

END
GO
/****** Object:  StoredProcedure [dbo].[extraccion]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[extraccion]

	@monto float, @id_cuenta smallint

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[operacion]
           ([monto]
           ,[fecha]
           ,[id_cuenta]
           ,[id_tipo_operacion])
	VALUES
		(@monto, GETDATE(), @id_cuenta, 2)

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] - @monto
       
	WHERE [id] = @id_cuenta 

END
GO
/****** Object:  StoredProcedure [dbo].[giro]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[giro]

	@monto float, @id_cuenta smallint, @tasa float, @monto_max money, @situacion smallint

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[operacion]
           ([monto]
           ,[fecha]
           ,[tasa_interes]
           ,[monto_maximo]
           ,[situacion_crediticia]
           ,[id_cuenta]
           ,[id_tipo_operacion])
	VALUES
		(@monto, GETDATE(),@tasa, @monto_max, @situacion, @id_cuenta, 4)

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] - @monto
       
	WHERE [id] = @id_cuenta 

END
GO
/****** Object:  StoredProcedure [dbo].[nuevo_usuario]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nuevo_usuario]

	@usuario nchar(10), @pass char(10), @id_persona smallint

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[usuario]
           ([usuario]
           ,[pass]
           ,[id_persona])
     VALUES
           (@usuario, @pass, @id_persona)
         

END
GO
/****** Object:  StoredProcedure [dbo].[transferencia]    Script Date: 6/10/2020 11:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[transferencia]

	@monto float, @id_cuenta smallint

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[operacion]
           ([monto]
           ,[fecha]
           ,[id_cuenta]
           ,[id_tipo_operacion])
	VALUES
		(@monto, GETDATE(), @id_cuenta, 1)

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] - @monto
       
	WHERE [id] = @id_cuenta 

END
GO
USE [master]
GO
ALTER DATABASE [moneyCLIP] SET  READ_WRITE 
GO
