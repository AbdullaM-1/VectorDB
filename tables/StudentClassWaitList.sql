USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClassWaitList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ModifiedDateTimeUtc] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_StudentClassWaitList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentClassWaitList] ADD  CONSTRAINT [DF_StudentClassWaitList_IsActive]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[StudentClassWaitList]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassWaitList_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentClassWaitList] CHECK CONSTRAINT [FK_StudentClassWaitList_Students]
GO
ALTER TABLE [dbo].[StudentClassWaitList]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassWaitList_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentClassWaitList] CHECK CONSTRAINT [FK_StudentClassWaitList_SwimClassSchedule]
GO
