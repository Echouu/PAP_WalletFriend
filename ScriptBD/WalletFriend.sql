USE [WalletFriend]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 21/01/2022 23:07:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
    [IDCliente] [int] IDENTITY(1,1) NOT NULL,
    [Nome] [varchar](50) NOT NULL,
    [Email] [varchar](75) NOT NULL,
    [Username] [varchar](50) NOT NULL,
    [Password] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Cliente_IDCliente] PRIMARY KEY CLUSTERED 
(
    [IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [WalletFriend]
GO

/****** Object:  Table [dbo].[Metodos]    Script Date: 21/01/2022 23:07:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Metodos](
    [IDMetodo] [int] IDENTITY(1,1) NOT NULL,
    [Nome] [varchar](25) NOT NULL,
    [IDCliente] [int] NULL,
 CONSTRAINT [Pk_Metodos_IDMetodo] PRIMARY KEY CLUSTERED 
(
    [IDMetodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Metodos]  WITH CHECK ADD  CONSTRAINT [Fk_Metodos_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO

ALTER TABLE [dbo].[Metodos] CHECK CONSTRAINT [Fk_Metodos_Cliente]
GO

USE [WalletFriend]
GO

/****** Object:  Table [dbo].[Tipos]    Script Date: 21/01/2022 23:07:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tipos](
    [IDTipo] [int] IDENTITY(1,1) NOT NULL,
    [Nome] [varchar](25) NOT NULL,
    [isReceita] [bit] NOT NULL,
    [IDCliente] [int] NULL,
 CONSTRAINT [Pk_Tipos_IDTipo] PRIMARY KEY CLUSTERED 
(
    [IDTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tipos]  WITH CHECK ADD  CONSTRAINT [Fk_Tipos_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO

ALTER TABLE [dbo].[Tipos] CHECK CONSTRAINT [Fk_Tipos_Cliente]
GO


USE [WalletFriend]
GO

/****** Object:  Table [dbo].[Movimentos]    Script Date: 21/01/2022 23:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movimentos](
    [IDMovimento] [int] IDENTITY(1,1) NOT NULL,
    [Valor] [float] NOT NULL,
    [Data] [date] NOT NULL,
    [IDCliente] [int] NOT NULL,
    [IDTipo] [int] NOT NULL,
    [IDMetodo] [int] NOT NULL,
 CONSTRAINT [Pk_Movimentos_IDMovimento] PRIMARY KEY CLUSTERED 
(
    [IDMovimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Movimentos]  WITH CHECK ADD  CONSTRAINT [Fk_Movimentos_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO

ALTER TABLE [dbo].[Movimentos] CHECK CONSTRAINT [Fk_Movimentos_Cliente]
GO

ALTER TABLE [dbo].[Movimentos]  WITH CHECK ADD  CONSTRAINT [Fk_Movimentos_Metodos] FOREIGN KEY([IDMetodo])
REFERENCES [dbo].[Metodos] ([IDMetodo])
GO

ALTER TABLE [dbo].[Movimentos] CHECK CONSTRAINT [Fk_Movimentos_Metodos]
GO

ALTER TABLE [dbo].[Movimentos]  WITH CHECK ADD  CONSTRAINT [Fk_Movimentos_Tipos] FOREIGN KEY([IDTipo])
REFERENCES [dbo].[Tipos] ([IDTipo])
GO

ALTER TABLE [dbo].[Movimentos] CHECK CONSTRAINT [Fk_Movimentos_Tipos]
GO