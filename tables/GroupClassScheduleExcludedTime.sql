USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClassScheduleExcludedTime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateTimeUTC] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GroupClassScheduleExcludedTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupClassScheduleExcludedTime] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GroupClassScheduleExcludedTime]  WITH CHECK ADD  CONSTRAINT [FK_GroupClassScheduleExcludedTime_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[GroupClassScheduleExcludedTime] CHECK CONSTRAINT [FK_GroupClassScheduleExcludedTime_ClassSchedule]
GO
ALTER TABLE [dbo].[GroupClassScheduleExcludedTime]  WITH CHECK ADD  CONSTRAINT [FK_GroupClassScheduleExcludedTime_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[GroupClassScheduleExcludedTime] CHECK CONSTRAINT [FK_GroupClassScheduleExcludedTime_Staff]
GO
