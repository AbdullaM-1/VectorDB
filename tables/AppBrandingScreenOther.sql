USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBrandingScreenOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuType] [varchar](20) NOT NULL,
	[LinkType] [varchar](20) NOT NULL,
	[LinkName] [varchar](100) NOT NULL,
	[LinkEndPoint] [varchar](1000) NOT NULL,
	[ColorCode] [varchar](500) NOT NULL,
	[ImageEndPoint] [varchar](1000) NOT NULL,
	[IsStoredInS3] [bit] NOT NULL,
	[ImageHeight] [int] NOT NULL,
	[ImageWidth] [int] NOT NULL,
	[TileTextColor] [varchar](50) NULL,
 CONSTRAINT [PK_AppBrandingScreenOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
