USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleAgeRestriction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[AgeMin] [int] NOT NULL,
	[AgeMax] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[LastUpdatedBy] [varchar](100) NOT NULL,
	[LastUpdatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassScheduleAgeRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleAgeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleAgeRestriction_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleAgeRestriction] CHECK CONSTRAINT [FK_ClassScheduleAgeRestriction_ClassSchedule]
GO
