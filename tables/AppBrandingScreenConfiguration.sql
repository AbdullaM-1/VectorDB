USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBrandingScreenConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppBrandingScreenId] [int] NOT NULL,
	[ConfigName] [nvarchar](50) NOT NULL,
	[ConfigValue] [nvarchar](max) NOT NULL,
	[IsStoredInS3] [bit] NOT NULL,
	[ImageHeight] [int] NOT NULL,
	[ImageWidth] [int] NOT NULL,
 CONSTRAINT [PK_AppBrandingScreenConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppBrandingScreenConfiguration] ADD  DEFAULT ((0)) FOR [ImageHeight]
GO
ALTER TABLE [dbo].[AppBrandingScreenConfiguration] ADD  DEFAULT ((0)) FOR [ImageWidth]
GO
ALTER TABLE [dbo].[AppBrandingScreenConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_AppBrandingScreen_AppBrandingScreenConfigurations] FOREIGN KEY([AppBrandingScreenId])
REFERENCES [dbo].[AppBrandingScreen] ([Id])
GO
ALTER TABLE [dbo].[AppBrandingScreenConfiguration] CHECK CONSTRAINT [FK_AppBrandingScreen_AppBrandingScreenConfigurations]
GO
