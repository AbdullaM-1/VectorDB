USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBinaries](
	[BinId] [uniqueidentifier] NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[Bin] [varbinary](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Filename] [nvarchar](255) NOT NULL,
	[Configuration] [nvarchar](max) NULL,
	[Installer] [nvarchar](255) NULL,
	[IsForceInstall] [bit] NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppBinaries] PRIMARY KEY CLUSTERED 
(
	[BinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
