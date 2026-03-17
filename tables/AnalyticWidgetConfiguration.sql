USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalyticWidgetConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WidgetName] [varchar](50) NOT NULL,
	[AnalyticsGroupName] [varchar](50) NOT NULL,
	[Filters] [varchar](500) NULL,
	[IsGraph] [bit] NOT NULL,
	[GraphType] [varchar](1000) NULL,
	[StoredProcName] [varchar](100) NOT NULL,
	[WidgetCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AnalyticWidgetConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
