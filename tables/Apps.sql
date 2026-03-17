USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apps](
	[AppId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AccountId] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[IsService] [bit] NOT NULL,
	[Exe] [nvarchar](255) NOT NULL,
	[ServiceName] [nvarchar](255) NULL,
	[ConfigurationFile] [nvarchar](255) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apps] ADD  CONSTRAINT [DF_Apps_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
