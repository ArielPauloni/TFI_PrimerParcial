USE [master]
GO
/****** Object:  Table [dbo].[Abonado]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE DATABASE [TFI_Telefonica_Pauloni]
GO
USE [TFI_Telefonica_Pauloni]
GO
CREATE TABLE [dbo].[Abonado](
	[NroAbonado] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPersona] [int] NOT NULL,
	[CodigoLinea] [int] NOT NULL,
	[Inactivo] [bit] NOT NULL,
	[FechaAlta] [date] NULL,
 CONSTRAINT [PK_Abonado] PRIMARY KEY CLUSTERED 
(
	[NroAbonado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[CodigoCiudad] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionCiudad] [varchar](70) NULL,
	[PrefijoCiudad] [varchar](10) NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[CodigoCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costo]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costo](
	[CodigoCosto] [int] IDENTITY(1,1) NOT NULL,
	[TipoServicioOrigen] [int] NULL,
	[TipoServicioDestino] [int] NULL,
	[MismaEmpresa] [bit] NULL,
	[EsNacional] [bit] NULL,
	[IncluyeRoaming] [bit] NULL,
	[Costo] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Costo] PRIMARY KEY CLUSTERED 
(
	[CodigoCosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Linea](
	[CodigoLinea] [int] IDENTITY(1,1) NOT NULL,
	[NroLinea] [varchar](100) NULL,
	[TipoServicio] [int] NULL,
	[Ciudad] [int] NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[CodigoLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Llamada]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Llamada](
	[CodigoLlamada] [int] IDENTITY(1,1) NOT NULL,
	[NroAbonado] [int] NOT NULL,
	[CodigoLinea] [int] NOT NULL,
	[MinutosDuracion] [smallint] NOT NULL,
	[FechaLlamada] [datetime] NOT NULL,
 CONSTRAINT [PK_Llamada] PRIMARY KEY CLUSTERED 
(
	[CodigoLlamada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[CodigoPais] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionPais] [varchar](70) NULL,
	[PrefijoPais] [varchar](10) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[CodigoPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaisCiudad]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaisCiudad](
	[CodigoPais] [int] NOT NULL,
	[CodigoCiudad] [int] NOT NULL,
 CONSTRAINT [PK_PaisCiudad] PRIMARY KEY CLUSTERED 
(
	[CodigoPais] ASC,
	[CodigoCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[CodigoPersona] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[TipoDocumento] [int] NULL,
	[NroDocumento] [varchar](30) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[CodigoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[CodigoTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoDocumento] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[CodigoTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 22/09/2021 19:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[CodigoTipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoServicio] [varchar](50) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[CodigoTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abonado] ON 
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (1, 3, 6, 0, CAST(N'2021-09-18' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (2, 1, 7, 0, CAST(N'2021-09-18' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (3, 5, 4, 0, CAST(N'2021-09-18' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (4, 6, 2, 0, CAST(N'2021-09-19' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (5, 8, 9, 0, CAST(N'2021-09-19' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (6, 8, 10, 0, CAST(N'2021-09-19' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (7, 9, 1, 0, CAST(N'2021-09-20' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (8, 9, 13, 0, CAST(N'2021-09-21' AS Date))
GO
INSERT [dbo].[Abonado] ([NroAbonado], [CodigoPersona], [CodigoLinea], [Inactivo], [FechaAlta]) VALUES (9, 1, 12, 0, CAST(N'2021-09-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Abonado] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (1, N'Ciudad Autónoma de Buenos Aires (CABA)', N'11')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (2, N'Córdoba', N'351')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (3, N'Corrientes', N'379')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (4, N'Formosa', N'370')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (5, N'La Plata (Provincia de Buenos Aires)', N'221')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (6, N'La Rioja', N'380')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (7, N'Mendoza', N'261')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (8, N'Neuquén', N'299')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (9, N'Paraná (Provincia de Entre Ríos)', N'343')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (10, N'Posadas (Provincia de Misiones)', N'376')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (11, N'Rawson (Provincia del Chubut)', N'280')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (12, N'Resistencia (Provincia del Chaco)', N'362')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (13, N'Río Gallegos (Provincia de Santa Cruz)', N'2966')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (14, N'Salta', N'387')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (15, N'San Fernando del Valle (Provincia de Catamarca)', N'383')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (16, N'San Juan', N'264')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (17, N'San Luis', N'266')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (18, N'San Miguel de Tucumán (Provincia de Tucumán)', N'381')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (19, N'San Salvador de Jujuy (Provincia de Jujuy)', N'388')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (20, N'Santa Fe (Provincia de Santa Fe)', N'342')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (21, N'Santa Rosa (Provincia de La Pampa)', N'2954')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (22, N'Santiago del Estero', N'385')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (23, N'Viedma (Provincia de Río Negro)', N'2920')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (24, N'Ushuaia (Provincia de Tierra del Fuego)', N'2901')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (25, N'Los Angeles ', N'213')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (26, N'Nueva York', N'917')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (27, N'Madrid ', N'91')
GO
INSERT [dbo].[Ciudad] ([CodigoCiudad], [DescripcionCiudad], [PrefijoCiudad]) VALUES (28, N'Barcelona ', N'93')
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Costo] ON 
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (1, 2, 2, 1, 1, 0, CAST(0.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (2, 2, 1, 1, 1, 0, CAST(0.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (3, 1, 2, 1, 1, 0, CAST(0.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (4, 1, 1, 1, 1, 0, CAST(0.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (5, 2, 2, 0, 1, 0, CAST(0.80 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (6, 2, 1, 0, 1, 0, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (7, 1, 2, 0, 1, 0, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (8, 1, 1, 0, 1, 0, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (9, 2, 2, 1, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (10, 2, 1, 1, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (11, 1, 2, 1, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (12, 1, 1, 1, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (13, 2, 2, 0, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (14, 2, 1, 0, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (15, 1, 2, 0, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[Costo] ([CodigoCosto], [TipoServicioOrigen], [TipoServicioDestino], [MismaEmpresa], [EsNacional], [IncluyeRoaming], [Costo]) VALUES (16, 1, 1, 0, 0, 1, CAST(0.95 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[Costo] OFF
GO
SET IDENTITY_INSERT [dbo].[Linea] ON 
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (1, N'4228 9367', 1, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (2, N'4526 8898', 1, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (3, N'5989 2233', 2, 5)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (4, N'555 5555', 1, 26)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (6, N'4433 2156', 1, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (7, N'6321 9852', 2, 17)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (8, N'5989 6353', 2, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (9, N'5989 2234', 2, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (10, N'5989 2235', 2, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (11, N'854 9963', 1, 27)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (12, N'4852 9985', 2, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (13, N'4285 6633', 2, 1)
GO
INSERT [dbo].[Linea] ([CodigoLinea], [NroLinea], [TipoServicio], [Ciudad]) VALUES (14, N'3549 9999', 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Linea] OFF
GO
SET IDENTITY_INSERT [dbo].[Llamada] ON 
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (1, 1, 3, 2, CAST(N'2021-09-20T18:29:25.447' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (2, 5, 10, 8, CAST(N'2021-09-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (3, 5, 3, 6, CAST(N'2021-09-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (4, 5, 2, 7, CAST(N'2021-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (5, 5, 10, 4, CAST(N'2021-09-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (6, 5, 10, 6, CAST(N'2021-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (7, 7, 2, 1, CAST(N'2021-09-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (8, 7, 4, 1, CAST(N'2021-09-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (9, 7, 11, 1, CAST(N'2021-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (10, 7, 3, 1, CAST(N'2021-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Llamada] ([CodigoLlamada], [NroAbonado], [CodigoLinea], [MinutosDuracion], [FechaLlamada]) VALUES (11, 7, 12, 4, CAST(N'2021-09-21T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Llamada] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (1, N'Afganistán', N'93')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (2, N'Albania', N'355')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (3, N'Alemania', N'49')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (4, N'Andorra', N'376')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (5, N'Angola', N'244')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (6, N'Anguila', N'1 264')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (7, N'Antigua y Barbuda', N'1 268')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (8, N'Antillas Neerlandesas Bonaire, Curacao, Saba, St. Eustis', N'599')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (9, N'Arabia Saudita', N'966')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (10, N'Argelia', N'213')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (11, N'Argentina', N'54')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (12, N'Armenia', N'374')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (13, N'Aruba', N'297')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (14, N'Australia', N'61')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (15, N'Austria', N'43')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (16, N'Autoridad Palestina', N'970')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (17, N'Azerbaiyán', N'994')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (18, N'Bahamas', N'1 242')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (19, N'Bahrain', N'973')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (20, N'Bangladesh', N'880')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (21, N'Barbados', N'1 246')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (22, N'Belarus', N'375')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (23, N'Bélgica', N'32')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (24, N'Belice', N'501')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (25, N'Benín', N'229')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (26, N'Bermuda', N'1 441')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (27, N'Bolivia', N'591')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (28, N'Bosnia/Herzegovina', N'387')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (29, N'Botsuana', N'267')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (30, N'Brasil', N'55')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (31, N'Brunéi', N'673')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (32, N'Bulgaria', N'359')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (33, N'Burkina Faso', N'226')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (34, N'Burundi', N'257')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (35, N'Bután', N'975')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (36, N'Camboya', N'855')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (37, N'Camerún', N'237')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (38, N'Chad', N'235')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (39, N'Chile', N'56')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (40, N'China', N'86')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (41, N'Chipre', N'357')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (42, N'Colombia', N'57')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (43, N'Comoras', N'269')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (44, N'Congo DROC, República Democrática del', N'243')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (45, N'Congo ROC, República de', N'242')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (46, N'Corea Norte', N'850')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (47, N'Corea Sur', N'82')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (48, N'Costa de Marfil', N'225')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (49, N'Costa Rica', N'506')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (50, N'Croacia', N'385')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (51, N'Cuba', N'53')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (52, N'Diego García', N'246')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (53, N'Dinamarca', N'45')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (54, N'Dominica', N'1 767')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (55, N'Ecuador', N'593')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (56, N'Egipto', N'20')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (57, N'El Salvador', N'503')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (58, N'Emiratos Árabes Unidos', N'971')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (59, N'Eritrea', N'291')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (60, N'Eslovaquia', N'421')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (61, N'Eslovenia', N'386')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (62, N'España', N'34')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (63, N'Estados Unidos', N'1')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (64, N'Etiopía', N'251')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (65, N'Filipinas', N'63')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (66, N'Finlandia', N'358')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (67, N'Fiyi', N'679')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (68, N'Francia', N'33')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (69, N'Gabón', N'241')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (70, N'Gambia', N'220')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (71, N'Georgia', N'995')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (72, N'Ghana', N'233')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (73, N'Gibraltar', N'350')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (74, N'Granada', N'1 473')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (75, N'Grecia', N'30')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (76, N'Groenlandia', N'299')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (77, N'Guadalupe Antillas Francesas', N'590')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (78, N'Guatemala', N'502')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (79, N'Guernsey', N'44')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (80, N'Guinea', N'224')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (81, N'Guinea Ecuatorial', N'240')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (82, N'Guinea-Bisáu', N'245')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (83, N'Guyana', N'592')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (84, N'Guyana Francesa', N'594')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (85, N'Haití', N'509')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (86, N'Holanda', N'31')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (87, N'Honduras', N'504')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (88, N'Hong Kong', N'852')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (89, N'Hungría', N'36')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (90, N'India', N'91')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (91, N'Indonesia', N'62')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (92, N'Irán', N'98')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (93, N'Iraq', N'964')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (94, N'Irlanda', N'353')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (95, N'Isla de Man', N'44')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (96, N'Isla de San Martín', N'1 721')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (97, N'Islandia', N'354')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (98, N'Islas Caimán', N'1 345')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (99, N'Islas Cook', N'682')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (100, N'Islas de Cabo Verde', N'238')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (101, N'Islas Feroe', N'298')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (102, N'Islas Malvinas', N'500')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (103, N'Islas Marianas del Norte', N'1 670')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (104, N'Islas Marshall', N'692')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (105, N'Islas Mauricio', N'230')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (106, N'Islas Salomón', N'677')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (107, N'Islas Turcas y Caicos', N'1 649')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (108, N'Islas Vírgenes Británicas', N'1 284')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (109, N'Israel', N'972')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (110, N'Italia', N'39')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (111, N'Jamaica', N'1 876')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (112, N'Japón', N'81')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (113, N'Jersey', N'44')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (114, N'Jordania', N'962')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (115, N'Kazajistán', N'7')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (116, N'Kenia', N'254')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (117, N'Kirguizistán', N'996')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (118, N'Kiribati', N'686')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (119, N'Kuwait', N'965')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (120, N'Laos', N'856')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (121, N'Lesoto', N'266')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (122, N'Letonia', N'371')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (123, N'Líbano', N'961')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (124, N'Liberia', N'231')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (125, N'Libia', N'218')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (126, N'Liechtenstein', N'423')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (127, N'Lituania', N'370')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (128, N'Luxemburgo', N'352')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (129, N'Macau', N'853')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (130, N'Macedonia', N'389')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (131, N'Madagascar', N'261')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (132, N'Malasia', N'60')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (133, N'Malaui', N'265')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (134, N'Maldivas', N'960')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (135, N'Malí', N'223')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (136, N'Malta', N'356')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (137, N'Marruecos', N'212')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (138, N'Martinica', N'596')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (139, N'Mauritania', N'222')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (140, N'México', N'52')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (141, N'Micronesia', N'691')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (142, N'Moldova', N'373')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (143, N'Mónaco', N'377')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (144, N'Mongolia', N'976')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (145, N'Montenegro', N'382')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (146, N'Montserrat', N'1 664')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (147, N'Mozambique', N'258')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (148, N'Myanmar Birmania', N'95')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (149, N'Namibia', N'264')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (150, N'Nauru', N'674')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (151, N'Nepal', N'977')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (152, N'Nicaragua', N'505')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (153, N'Níger', N'227')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (154, N'Nigeria', N'234')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (155, N'Noruega', N'47')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (156, N'Nueva Caledonia', N'687')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (157, N'Nueva Zelanda', N'64')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (158, N'Omán', N'968')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (159, N'Pakistán', N'92')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (160, N'Palaos', N'680')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (161, N'Panamá', N'507')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (162, N'Papúa Nueva Guinea', N'675')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (163, N'Paraguay', N'595')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (164, N'Perú', N'51')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (165, N'Polonia', N'48')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (166, N'Portugal', N'351')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (167, N'Qatar', N'974')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (168, N'Reino Unido', N'44')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (169, N'República Centroafricana', N'236')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (170, N'República Checa', N'420')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (171, N'República Dominicana', N'1 809')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (172, N'Reunión', N'262')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (173, N'Ruanda', N'250')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (174, N'Rumania', N'40')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (175, N'Rusia', N'7')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (176, N'Saipán Islas Marianas del Norte', N'1 670')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (177, N'Samoa', N'685')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (178, N'Samoa Americana', N'1 684')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (179, N'San Cristóbal/Nieves', N'1 869')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (180, N'San Marino', N'378')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (181, N'San Pedro/Miquelón', N'508')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (182, N'San Vicente/Granadinas', N'1 784')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (183, N'Santa Lucía', N'1 758')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (184, N'Santo Tomé/Príncipe', N'239')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (185, N'Senegal', N'221')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (186, N'Serbia', N'381')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (187, N'Seychelles', N'248')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (188, N'Sierra Leona', N'232')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (189, N'Singapur', N'65')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (190, N'Siria', N'963')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (191, N'Sri Lanka', N'94')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (192, N'Suazilandia', N'268')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (193, N'Sudáfrica', N'27')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (194, N'Sudán', N'249')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (195, N'Sudán Meridional', N'211')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (196, N'Suecia', N'46')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (197, N'Suiza', N'41')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (198, N'Suriname', N'597')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (199, N'Tailandia', N'66')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (200, N'Taiwán', N'886')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (201, N'Tanzania', N'255')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (202, N'Tayikistán', N'992')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (203, N'Territorio australiano', N'672')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (204, N'Togo', N'228')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (205, N'Tokelau', N'690')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (206, N'Tonga', N'676')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (207, N'Trinidad y Tobago', N'1 868')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (208, N'Túnez', N'216')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (209, N'Turkmenistán', N'993')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (210, N'Turquía', N'90')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (211, N'Tuvalu', N'688')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (212, N'Ucrania', N'380')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (213, N'Uganda', N'256')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (214, N'Uruguay', N'598')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (215, N'Uzbekistán', N'998')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (216, N'Vanuatu', N'678')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (217, N'Venezuela', N'58')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (218, N'Vietnam', N'84')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (219, N'Yemen', N'967')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (220, N'Yibuti', N'253')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (221, N'Zambia', N'260')
GO
INSERT [dbo].[Pais] ([CodigoPais], [DescripcionPais], [PrefijoPais]) VALUES (222, N'Zimbabue', N'263')
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 1)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 2)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 3)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 4)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 5)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 6)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 7)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 8)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 9)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 10)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 11)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 12)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 13)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 14)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 15)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 16)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 17)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 18)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 19)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 20)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 21)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 22)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 23)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (11, 24)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (62, 27)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (62, 28)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (63, 25)
GO
INSERT [dbo].[PaisCiudad] ([CodigoPais], [CodigoCiudad]) VALUES (63, 26)
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (1, N'Ibañez', N'Juan', 1, N'16898235')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (2, N'Gomez', N'Jose', 1, N'30845245')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (3, N'Becerra', N'Juan', 1, N'15458789')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (5, N'Smith', N'John', 3, N'C03005988')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (6, N'ACME SA', N'.', 2, N'30-64551583-8')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (7, N'Ariel', N'Ortega', 1, N'27892634')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (8, N'Mi Empresa SRL', N'.', 2, N'30-42685283-8')
GO
INSERT [dbo].[Persona] ([CodigoPersona], [Apellido], [Nombre], [TipoDocumento], [NroDocumento]) VALUES (9, N'Grillo', N'Pepe', 1, N'12345678')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 
GO
INSERT [dbo].[TipoDocumento] ([CodigoTipoDocumento], [DescripcionTipoDocumento]) VALUES (1, N'DNI')
GO
INSERT [dbo].[TipoDocumento] ([CodigoTipoDocumento], [DescripcionTipoDocumento]) VALUES (2, N'CUIT')
GO
INSERT [dbo].[TipoDocumento] ([CodigoTipoDocumento], [DescripcionTipoDocumento]) VALUES (3, N'Pasaporte')
GO
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoServicio] ON 
GO
INSERT [dbo].[TipoServicio] ([CodigoTipoServicio], [DescripcionTipoServicio]) VALUES (1, N'Fijo')
GO
INSERT [dbo].[TipoServicio] ([CodigoTipoServicio], [DescripcionTipoServicio]) VALUES (2, N'Celular')
GO
SET IDENTITY_INSERT [dbo].[TipoServicio] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Linea_NroLinea]    Script Date: 22/09/2021 19:21:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Linea_NroLinea] ON [dbo].[Linea]
(
	[NroLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Persona_TipoNumDoc]    Script Date: 22/09/2021 19:21:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Persona_TipoNumDoc] ON [dbo].[Persona]
(
	[TipoDocumento] ASC,
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abonado] ADD  CONSTRAINT [DF_Abonado_Inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[Abonado]  WITH CHECK ADD  CONSTRAINT [FK_Abonado_Linea] FOREIGN KEY([CodigoLinea])
REFERENCES [dbo].[Linea] ([CodigoLinea])
GO
ALTER TABLE [dbo].[Abonado] CHECK CONSTRAINT [FK_Abonado_Linea]
GO
ALTER TABLE [dbo].[Abonado]  WITH CHECK ADD  CONSTRAINT [FK_Abonado_Persona] FOREIGN KEY([CodigoPersona])
REFERENCES [dbo].[Persona] ([CodigoPersona])
GO
ALTER TABLE [dbo].[Abonado] CHECK CONSTRAINT [FK_Abonado_Persona]
GO
ALTER TABLE [dbo].[Costo]  WITH CHECK ADD  CONSTRAINT [FK_Costo_TipoServicioDestino] FOREIGN KEY([TipoServicioDestino])
REFERENCES [dbo].[TipoServicio] ([CodigoTipoServicio])
GO
ALTER TABLE [dbo].[Costo] CHECK CONSTRAINT [FK_Costo_TipoServicioDestino]
GO
ALTER TABLE [dbo].[Costo]  WITH CHECK ADD  CONSTRAINT [FK_Costo_TipoServicioOrigen] FOREIGN KEY([TipoServicioOrigen])
REFERENCES [dbo].[TipoServicio] ([CodigoTipoServicio])
GO
ALTER TABLE [dbo].[Costo] CHECK CONSTRAINT [FK_Costo_TipoServicioOrigen]
GO
ALTER TABLE [dbo].[Linea]  WITH CHECK ADD  CONSTRAINT [FK_Linea_Ciudad] FOREIGN KEY([Ciudad])
REFERENCES [dbo].[Ciudad] ([CodigoCiudad])
GO
ALTER TABLE [dbo].[Linea] CHECK CONSTRAINT [FK_Linea_Ciudad]
GO
ALTER TABLE [dbo].[Linea]  WITH CHECK ADD  CONSTRAINT [FK_Linea_TipoServicio] FOREIGN KEY([TipoServicio])
REFERENCES [dbo].[TipoServicio] ([CodigoTipoServicio])
GO
ALTER TABLE [dbo].[Linea] CHECK CONSTRAINT [FK_Linea_TipoServicio]
GO
ALTER TABLE [dbo].[Llamada]  WITH CHECK ADD  CONSTRAINT [FK_Llamada_Abonado] FOREIGN KEY([NroAbonado])
REFERENCES [dbo].[Abonado] ([NroAbonado])
GO
ALTER TABLE [dbo].[Llamada] CHECK CONSTRAINT [FK_Llamada_Abonado]
GO
ALTER TABLE [dbo].[Llamada]  WITH CHECK ADD  CONSTRAINT [FK_Llamada_Linea] FOREIGN KEY([CodigoLinea])
REFERENCES [dbo].[Linea] ([CodigoLinea])
GO
ALTER TABLE [dbo].[Llamada] CHECK CONSTRAINT [FK_Llamada_Linea]
GO
ALTER TABLE [dbo].[PaisCiudad]  WITH CHECK ADD  CONSTRAINT [FK_PaisCiudad_Ciudad] FOREIGN KEY([CodigoCiudad])
REFERENCES [dbo].[Ciudad] ([CodigoCiudad])
GO
ALTER TABLE [dbo].[PaisCiudad] CHECK CONSTRAINT [FK_PaisCiudad_Ciudad]
GO
ALTER TABLE [dbo].[PaisCiudad]  WITH CHECK ADD  CONSTRAINT [FK_PaisCiudad_Pais] FOREIGN KEY([CodigoPais])
REFERENCES [dbo].[Pais] ([CodigoPais])
GO
ALTER TABLE [dbo].[PaisCiudad] CHECK CONSTRAINT [FK_PaisCiudad_Pais]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocumento] FOREIGN KEY([TipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([CodigoTipoDocumento])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocumento]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_Actualizar_Costo]
@CodigoCosto INT,
@Costo DECIMAL(12,2)
AS

UPDATE dbo.Costo
SET Costo = @Costo
WHERE CodigoCosto = @CodigoCosto
GO
/****** Object:  StoredProcedure [dbo].[pr_Actualizar_Linea]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Actualizar_Linea]
@CodigoLinea INT,
@NroLinea VARCHAR(100),
@TipoServicio INT,
@Ciudad INT
AS

UPDATE dbo.Linea 
SET NroLinea = @NroLinea, TipoServicio = @TipoServicio, Ciudad = @Ciudad
WHERE CodigoLinea = @CodigoLinea
GO
/****** Object:  StoredProcedure [dbo].[pr_Insertar_Abonado]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Insertar_Abonado]
@CodigoPersona INT,
@CodigoLinea INT
AS

INSERT INTO dbo.Abonado (CodigoPersona, CodigoLinea, FechaAlta) 
VALUES (@CodigoPersona, @CodigoLinea, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[pr_Insertar_Linea]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Insertar_Linea]
@NroLinea VARCHAR(100),
@TipoServicio INT,
@Ciudad INT
AS

INSERT INTO dbo.Linea (NroLinea, TipoServicio, Ciudad) 
VALUES (@NroLinea, @TipoServicio, @Ciudad)
GO
/****** Object:  StoredProcedure [dbo].[pr_Insertar_Llamada]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Insertar_Llamada]
@NroAbonado INT,
@CodigoLinea INT,
@FechaLlamada DATETIME,
@MinutosDuracion SMALLINT
AS

INSERT INTO dbo.Llamada (NroAbonado, CodigoLinea, FechaLlamada, MinutosDuracion) 
VALUES (@NroAbonado, @CodigoLinea, @FechaLlamada, @MinutosDuracion)
GO
/****** Object:  StoredProcedure [dbo].[pr_Insertar_Persona]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Insertar_Persona]
@Apellido VARCHAR(100),
@Nombre VARCHAR(100),
@TipoDocumento INT,
@NroDocumento VARCHAR(30)
AS

INSERT INTO dbo.Persona(Apellido, Nombre, TipoDocumento, NroDocumento) 
VALUES (@Apellido, @Nombre, @TipoDocumento, @NroDocumento)
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Abonados]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Abonados]
AS

SELECT pers.CodigoPersona, pers.Apellido, pers.Nombre, pers.NroDocumento, tDoc.CodigoTipoDocumento,
	   tDoc.DescripcionTipoDocumento, l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, 
	   ts.DescripcionTipoServicio, c.CodigoCiudad, c.DescripcionCiudad, p.CodigoPais, 
	   a.NroAbonado, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea,
	   a.FechaAlta
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
JOIN dbo.Abonado a ON l.CodigoLinea = a.CodigoLinea
JOIN dbo.Persona pers ON a.CodigoPersona = pers.CodigoPersona
JOIN dbo.TipoDocumento tDoc ON pers.TipoDocumento = tDoc.CodigoTipoDocumento
WHERE a.CodigoLinea IS NOT NULL
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_AbonadosDelMes]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_AbonadosDelMes]
@fecha DATETIME
AS

SELECT DISTINCT pers.CodigoPersona, pers.Apellido, pers.Nombre, pers.NroDocumento, tDoc.CodigoTipoDocumento,
				tDoc.DescripcionTipoDocumento, l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, 
				ts.DescripcionTipoServicio, c.CodigoCiudad, c.DescripcionCiudad, p.CodigoPais, 
				a.NroAbonado, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea,
				a.FechaAlta
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
JOIN dbo.Abonado a ON l.CodigoLinea = a.CodigoLinea
JOIN dbo.Persona pers ON a.CodigoPersona = pers.CodigoPersona
JOIN dbo.TipoDocumento tDoc ON pers.TipoDocumento = tDoc.CodigoTipoDocumento
WHERE a.CodigoLinea IS NOT NULL AND
	  a.FechaAlta < @fecha --Para asegurarme que estaba vigente en esa fecha
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_CiudadPorPais]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_CiudadPorPais]
@CodigoPais INT
AS
SELECT p.CodigoPais, p.DescripcionPais, p.PrefijoPais, c.CodigoCiudad, c.DescripcionCiudad, c.PrefijoCiudad
FROM dbo.Pais p
JOIN dbo.PaisCiudad pc ON p.CodigoPais = pc.CodigoPais
JOIN dbo.Ciudad c ON pc.CodigoCiudad = c.CodigoCiudad
WHERE p.CodigoPais = @CodigoPais
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Costos]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_Listar_Costos]
AS

SELECT c.CodigoCosto, tsOrig.CodigoTipoServicio AS TipoServicioOrigen, 
	   tsOrig.DescripcionTipoServicio AS DescripcionServicioOrigen,
	   tsDest.CodigoTipoServicio AS TipoServicioDestino, 
	   tsDest.DescripcionTipoServicio AS DescripcionServicioDestino,
	   c.MismaEmpresa, c.EsNacional, c.IncluyeRoaming, c.Costo
FROM dbo.Costo c
JOIN dbo.TipoServicio tsOrig ON c.TipoServicioOrigen = tsOrig.CodigoTipoServicio
JOIN dbo.TipoServicio tsDest ON c.TipoServicioDestino = tsDest.CodigoTipoServicio

GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Linea]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Linea]
@CodigoLinea INT
AS

SELECT l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, ts.DescripcionTipoServicio, c.CodigoCiudad,
	   c.DescripcionCiudad, p.CodigoPais, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea 
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
WHERE l.CodigoLinea = @CodigoLinea
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_LineaConAbonado]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_LineaConAbonado]
@CodigoLinea INT
AS

SELECT l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, ts.DescripcionTipoServicio, c.CodigoCiudad,
	   c.DescripcionCiudad, p.CodigoPais, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea 
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
JOIN dbo.Abonado a ON l.CodigoLinea = a.CodigoLinea
WHERE l.CodigoLinea = @CodigoLinea
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Lineas]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Lineas]
AS

SELECT l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, ts.DescripcionTipoServicio, c.CodigoCiudad,
	   c.DescripcionCiudad, p.CodigoPais, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea 
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_LineasSinTitular]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_LineasSinTitular]
AS

SELECT l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, ts.DescripcionTipoServicio, c.CodigoCiudad,
	   c.DescripcionCiudad, p.CodigoPais, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea 
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
LEFT JOIN dbo.Abonado a ON l.CodigoLinea = a.CodigoLinea
WHERE a.CodigoLinea IS NULL
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Llamadas]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Llamadas]
AS

SELECT llam.CodigoLlamada, llam.FechaLlamada, llam.MinutosDuracion, lin.CodigoLinea, 
	   lin.NroLinea, tips.CodigoTipoServicio, tips.DescripcionTipoServicio, ciu.CodigoCiudad, 
	   ciu.DescripcionCiudad, pais.CodigoPais, pais.DescripcionPais, 
	   pais.PrefijoPais + '-' + ciu.PrefijoCiudad AS PrefijoLinea, linAbo.CodigoLinea AS CodigoLineaAbonado, 
	   linAbo.NroLinea AS NroLineaAbonado, tipsAbo.CodigoTipoServicio AS CodigoTipoServicioAbonado,
	   tipsAbo.DescripcionTipoServicio AS DescripcionTipoServicioAbonado, 
	   ciuAbo.CodigoCiudad AS CodigoCiudadAbonado, ciuAbo.DescripcionCiudad AS DescripcionCiudadAbonado,
	   paisAbo.CodigoPais AS CodigoPaisAbonado, paisAbo.DescripcionPais AS DescripcionPaisAbonado, 
	   paisAbo.PrefijoPais + '-' + ciuAbo.PrefijoCiudad AS PrefijoLineaAbonado,
	   tipd.CodigoTipoDocumento, tipd.DescripcionTipoDocumento, pers.Apellido, pers.Nombre,
	   pers.CodigoPersona, pers.NroDocumento, abo.NroAbonado
FROM dbo.Llamada llam
JOIN dbo.Linea lin ON llam.CodigoLinea = lin.CodigoLinea
JOIN dbo.TipoServicio tips ON lin.TipoServicio = tips.CodigoTipoServicio
JOIN dbo.Ciudad ciu ON lin.Ciudad = ciu.CodigoCiudad
JOIN dbo.PaisCiudad paci ON ciu.CodigoCiudad = paci.CodigoCiudad
JOIN dbo.Pais pais ON paci.CodigoPais = pais.CodigoPais
JOIN dbo.Abonado abo ON llam.NroAbonado = abo.NroAbonado
JOIN dbo.Linea linAbo ON llam.CodigoLinea = linAbo.CodigoLinea
JOIN dbo.TipoServicio tipsAbo ON linAbo.TipoServicio = tipsAbo.CodigoTipoServicio
JOIN dbo.Ciudad ciuAbo ON linAbo.Ciudad = ciuAbo.CodigoCiudad
JOIN dbo.PaisCiudad paciAbo ON ciuAbo.CodigoCiudad = paciAbo.CodigoCiudad
JOIN dbo.Pais paisAbo ON paciAbo.CodigoPais = paisAbo.CodigoPais
JOIN dbo.Persona pers ON abo.CodigoPersona = pers.CodigoPersona
JOIN dbo.TipoDocumento tipd ON pers.TipoDocumento = tipd.CodigoTipoDocumento
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_LlamadasPorAbonado]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_LlamadasPorAbonado]
@NroAbonado INT,
@fDesde DATETIME = NULL,
@fHasta DATETIME = NULL
AS

SELECT llam.CodigoLlamada, llam.FechaLlamada, llam.MinutosDuracion, lin.CodigoLinea, 
	   lin.NroLinea, tips.CodigoTipoServicio, tips.DescripcionTipoServicio, ciu.CodigoCiudad, 
	   ciu.DescripcionCiudad, pais.CodigoPais, pais.DescripcionPais, 
	   pais.PrefijoPais + '-' + ciu.PrefijoCiudad AS PrefijoLinea, linAbo.CodigoLinea AS CodigoLineaAbonado, 
	   linAbo.NroLinea AS NroLineaAbonado, tipsAbo.CodigoTipoServicio AS CodigoTipoServicioAbonado,
	   tipsAbo.DescripcionTipoServicio AS DescripcionTipoServicioAbonado, 
	   ciuAbo.CodigoCiudad AS CodigoCiudadAbonado, ciuAbo.DescripcionCiudad AS DescripcionCiudadAbonado,
	   paisAbo.CodigoPais AS CodigoPaisAbonado, paisAbo.DescripcionPais AS DescripcionPaisAbonado, 
	   paisAbo.PrefijoPais + '-' + ciuAbo.PrefijoCiudad AS PrefijoLineaAbonado,
	   tipd.CodigoTipoDocumento, tipd.DescripcionTipoDocumento, pers.Apellido, pers.Nombre,
	   pers.CodigoPersona, pers.NroDocumento, abo.NroAbonado
FROM dbo.Llamada llam
JOIN dbo.Linea lin ON llam.CodigoLinea = lin.CodigoLinea
JOIN dbo.TipoServicio tips ON lin.TipoServicio = tips.CodigoTipoServicio
JOIN dbo.Ciudad ciu ON lin.Ciudad = ciu.CodigoCiudad
JOIN dbo.PaisCiudad paci ON ciu.CodigoCiudad = paci.CodigoCiudad
JOIN dbo.Pais pais ON paci.CodigoPais = pais.CodigoPais
JOIN dbo.Abonado abo ON llam.NroAbonado = abo.NroAbonado
JOIN dbo.Linea linAbo ON llam.CodigoLinea = linAbo.CodigoLinea
JOIN dbo.TipoServicio tipsAbo ON linAbo.TipoServicio = tipsAbo.CodigoTipoServicio
JOIN dbo.Ciudad ciuAbo ON linAbo.Ciudad = ciuAbo.CodigoCiudad
JOIN dbo.PaisCiudad paciAbo ON ciuAbo.CodigoCiudad = paciAbo.CodigoCiudad
JOIN dbo.Pais paisAbo ON paciAbo.CodigoPais = paisAbo.CodigoPais
JOIN dbo.Persona pers ON abo.CodigoPersona = pers.CodigoPersona
JOIN dbo.TipoDocumento tipd ON pers.TipoDocumento = tipd.CodigoTipoDocumento
WHERE (@NroAbonado = 0 OR llam.NroAbonado = @NroAbonado) AND
	(@fDesde IS NULL OR llam.FechaLlamada >= @fDesde) AND
	(@fHasta IS NULL OR llam.FechaLlamada <= @fHasta)
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Paises]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Paises]
AS
SELECT DISTINCT p.CodigoPais, DescripcionPais, PrefijoPais
FROM dbo.Pais p
JOIN dbo.PaisCiudad pc ON p.CodigoPais = pc.CodigoPais
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_Personas]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_Personas]
AS

SELECT p.CodigoPersona, p.Apellido, p.Nombre, td.CodigoTipoDocumento, td.DescripcionTipoDocumento, p.NroDocumento
FROM dbo.Persona p
JOIN dbo.TipoDocumento td ON p.TipoDocumento = td.CodigoTipoDocumento
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_TipoDocumento]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_TipoDocumento]
AS
SELECT CodigoTipoDocumento, DescripcionTipoDocumento
FROM dbo.TipoDocumento
GO
/****** Object:  StoredProcedure [dbo].[pr_Listar_TipoServicio]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Listar_TipoServicio]
AS
SELECT CodigoTipoServicio, DescripcionTipoServicio
FROM dbo.TipoServicio
GO
/****** Object:  StoredProcedure [dbo].[pr_Obtener_Abonado]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Obtener_Abonado]
@NroAbonado INT
AS

SELECT pers.CodigoPersona, pers.Apellido, pers.Nombre, pers.NroDocumento, tDoc.CodigoTipoDocumento,
	   tDoc.DescripcionTipoDocumento, l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, 
	   ts.DescripcionTipoServicio, c.CodigoCiudad, c.DescripcionCiudad, p.CodigoPais, 
	   a.NroAbonado, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea,
	   a.FechaAlta
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
JOIN dbo.Abonado a ON l.CodigoLinea = a.CodigoLinea
JOIN dbo.Persona pers ON a.CodigoPersona = pers.CodigoPersona
JOIN dbo.TipoDocumento tDoc ON pers.TipoDocumento = tDoc.CodigoTipoDocumento
WHERE a.NroAbonado = @NroAbonado AND a.CodigoLinea IS NOT NULL
GO
/****** Object:  StoredProcedure [dbo].[pr_Obtener_Linea]    Script Date: 22/09/2021 19:24:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Obtener_Linea]
@CodigoLinea INT
AS

SELECT l.CodigoLinea, l.NroLinea, ts.CodigoTipoServicio, ts.DescripcionTipoServicio, c.CodigoCiudad,
	   c.DescripcionCiudad, p.CodigoPais, p.DescripcionPais, p.PrefijoPais + '-' + c.PrefijoCiudad AS PrefijoLinea 
FROM dbo.Linea l
JOIN dbo.TipoServicio ts ON l.TipoServicio = ts.CodigoTipoServicio
JOIN dbo.Ciudad c ON l.Ciudad = c.CodigoCiudad
JOIN dbo.PaisCiudad pc ON c.CodigoCiudad = pc.CodigoCiudad
JOIN dbo.Pais p ON pc.CodigoPais = p.CodigoPais
WHERE l.CodigoLinea = @CodigoLinea
GO
