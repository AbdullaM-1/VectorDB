USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalyticDashboardWidget](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DashboardId] [int] NOT NULL,
	[WidgetId] [int] NOT NULL,
	[IsGraph] [bit] NOT NULL,
	[GraphType] [varchar](50) NULL,
	[ChartConfigAsJson] [varchar](max) NULL,
 CONSTRAINT [PK_AnalyticDashboardWidget] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnalyticDashboardWidget]  WITH CHECK ADD  CONSTRAINT [FK_AnalyticDashboardWidget_AnalyticDashboard] FOREIGN KEY([DashboardId])
REFERENCES [dbo].[AnalyticDashboard] ([Id])
GO
ALTER TABLE [dbo].[AnalyticDashboardWidget] CHECK CONSTRAINT [FK_AnalyticDashboardWidget_AnalyticDashboard]
GO
ALTER TABLE [dbo].[AnalyticDashboardWidget]  WITH CHECK ADD  CONSTRAINT [FK_AnalyticDashboardWidget_AnalyticWidgetConfiguration] FOREIGN KEY([WidgetId])
REFERENCES [dbo].[AnalyticWidgetConfiguration] ([Id])
GO
ALTER TABLE [dbo].[AnalyticDashboardWidget] CHECK CONSTRAINT [FK_AnalyticDashboardWidget_AnalyticWidgetConfiguration]
GO
