USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleOnDemand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[ClassTitle] [varchar](500) NOT NULL,
	[ClassUrlLink] [nvarchar](max) NOT NULL,
	[LastUpdatedBy] [varchar](100) NOT NULL,
	[LastUpdatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassScheduleOnDemand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleOnDemand]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleOnDemand_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleOnDemand] CHECK CONSTRAINT [FK_ClassScheduleOnDemand_ClassSchedule]
GO
