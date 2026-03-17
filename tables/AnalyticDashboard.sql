USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalyticDashboard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnalyticName] [varchar](100) NOT NULL,
	[AnalyticsGroupName] [varchar](50) NOT NULL,
	[Filters] [varchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsDeletedBy] [int] NULL,
	[IsDeletedOnUtc] [datetime] NULL,
	[GridConfigurationAsJson] [nvarchar](max) NULL,
	[IsSystem] [bit] NOT NULL,
 CONSTRAINT [PK_AnalyticDashboard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnalyticDashboard] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
