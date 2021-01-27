USE [master]
GO
/****** Object:  Database [moneyCLIP]    Script Date: 27/01/2021 19:15:14 ******/
CREATE DATABASE [moneyCLIP]

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
/****** Object:  User [clip]    Script Date: 27/01/2021 19:15:15 ******/
/****** Object:  Table [dbo].[cuenta]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nchar](10) NULL,
	[saldo] [money] NULL,
	[nro_cuenta] [int] NULL,
	[alias] [nchar](10) NULL,
	[cbu] [bigint] NULL,
	[moneda] [nchar](10) NULL,
	[id_persona] [int] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[monto] [money] NOT NULL,
	[fecha] [smalldatetime] NOT NULL,
	[tasa_interes] [float] NULL,
	[monto_maximo] [money] NULL,
	[situacion_crediticia] [smallint] NULL,
	[id_cuenta] [int] NOT NULL,
	[tipo_operacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[cuit] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[sexo] [nvarchar](50) NULL,
	[celular] [nvarchar](50) NULL,
	[foto] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
	[localidad] [nvarchar](50) NULL,
	[provincia] [nvarchar](50) NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id] [int] NOT NULL,
	[provincia] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ultimos_mov]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ultimos_mov](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[monto] [money] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[id_tipo_operacion] [smallint] NOT NULL,
 CONSTRAINT [PK_ultimos_mov] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/01/2021 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[id_persona] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cuenta] ON 
GO
INSERT [dbo].[cuenta] ([id], [estado], [saldo], [nro_cuenta], [alias], [cbu], [moneda], [id_persona]) VALUES (1, N'1         ', 0.0000, 1234, N'alias     ', 12345678910, N'pesos     ', 1)
GO
INSERT [dbo].[cuenta] ([id], [estado], [saldo], [nro_cuenta], [alias], [cbu], [moneda], [id_persona]) VALUES (2, N'1         ', 1000.0000, 12345, N'alias     ', 123456789, N'pesos     ', 2)
GO
SET IDENTITY_INSERT [dbo].[cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 
GO
INSERT [dbo].[persona] ([id], [nombre], [apellido], [cuit], [direccion], [sexo], [celular], [foto], [email], [pass], [localidad], [provincia]) VALUES (1, N'Alejandro', N'Torancio', N'20202020', N'Piedras 1234', NULL, N'123456789', NULL, N'alejandro@gmail.com', N'123456', N'LA CRUZ', N'Córdoba')
GO
INSERT [dbo].[persona] ([id], [nombre], [apellido], [cuit], [direccion], [sexo], [celular], [foto], [email], [pass], [localidad], [provincia]) VALUES (2, N'Diana', N'Mirol', N'2012345679', N'Av1234', N'F', N'123456', N'0', N'diana@gmail.com', N'12345678', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (2, N'Buenos Aires-GBA')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (3, N'Capital Federal')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (4, N'Catamarca')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (5, N'Chaco')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (6, N'Chubut')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (7, N'Córdoba')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (8, N'Corrientes')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (9, N'Entre Ríos')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (10, N'Formosa')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (11, N'Jujuy')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (12, N'La Pampa')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (13, N'La Rioja')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (14, N'Mendoza')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (15, N'Misiones')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (16, N'Neuquén')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (17, N'Río Negro')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (18, N'Salta')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (19, N'San Juan')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (20, N'San Luis')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (21, N'Santa Cruz')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (22, N'Santa Fe')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (23, N'Santiago del Estero')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (24, N'Tierra del Fuego')
GO
INSERT [dbo].[provincias] ([id], [provincia]) VALUES (25, N'Tucumán')
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [usuario], [pass], [id_persona]) VALUES (1, N'alejandro@gmail.com', N'abcd1234', 1)
GO
INSERT [dbo].[usuario] ([id], [usuario], [pass], [id_persona]) VALUES (2, N'agustin124@gmail.com', N'abcd1234', 2)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[ultimos_mov]  WITH CHECK ADD  CONSTRAINT [FK_ultimos_mov_cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[ultimos_mov] CHECK CONSTRAINT [FK_ultimos_mov_cuenta]
GO
ALTER TABLE [dbo].[ultimos_mov]  WITH CHECK ADD  CONSTRAINT [FK_ultimos_mov_operacion] FOREIGN KEY([id_tipo_operacion])
REFERENCES [dbo].[operacion] ([id])
GO
ALTER TABLE [dbo].[ultimos_mov] CHECK CONSTRAINT [FK_ultimos_mov_operacion]
GO
/****** Object:  StoredProcedure [dbo].[consulta_saldo]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consulta_saldo]
@id int
as
begin
Select id, saldo
from cuenta
where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deposito]    Script Date: 27/01/2021 19:15:16 ******/
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
           ,[tipo_operacion])
	VALUES
		(@monto, GETDATE(), @id_cuenta, 'Deposito')

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] + @monto
       
	WHERE [id] = @id_cuenta 

END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_persona]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_persona]
	@id int
AS
BEGIN
	DELETE FROM [dbo].[persona]
      WHERE @id = id
END
GO
/****** Object:  StoredProcedure [dbo].[extraccion]    Script Date: 27/01/2021 19:15:16 ******/
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
/****** Object:  StoredProcedure [dbo].[giro]    Script Date: 27/01/2021 19:15:16 ******/
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

	@monto float, @id_cuenta smallint,  @monto_max money

AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[operacion]
           ([monto]
           ,[fecha]
           ,[monto_maximo]
           ,[id_cuenta]
           ,[tipo_operacion])
	VALUES
		(@monto, GETDATE(), @monto_max, @id_cuenta, 'Giro')

	UPDATE [dbo].[cuenta]
	SET 
      [saldo] = [saldo] - @monto
       
	WHERE [id] = @id_cuenta 

END
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_persona] 
	
	@nombre char(20), @apellido char (20), @email nchar(50), @pass char(20)
	
AS
BEGIN
	INSERT INTO [dbo].[persona]
           ([nombre]
           ,[apellido]
           ,[email]
           ,[pass])
     VALUES
           (@nombre, @apellido, @email, @pass);
	SELECT CAST(scope_identity() AS int)

END
GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_usuario]
	
	@usuario nchar(50), @pass char(20), @id_persona int
AS
BEGIN
	INSERT INTO [dbo].[usuario]
           ([usuario]
           ,[pass]
           ,[id_persona])
     VALUES
           (@usuario, @pass, @id_persona);
		SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[nuevo_usuario]    Script Date: 27/01/2021 19:15:16 ******/
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
/****** Object:  StoredProcedure [dbo].[obtener_login]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_login]
	@email nchar(50), @pass char(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT [id]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[pass]
	FROM [dbo].[persona] WHERE email= @email and pass = @pass
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_personas]    Script Date: 27/01/2021 19:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_personas]
	
AS

	SELECT [id]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[pass]
      
      
  FROM [dbo].[persona]
GO
/****** Object:  StoredProcedure [dbo].[transferencia]    Script Date: 27/01/2021 19:15:16 ******/
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
           ,[tipo_operacion])
	VALUES
		(@monto, GETDATE(), @id_cuenta, 'Transferencia')

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
