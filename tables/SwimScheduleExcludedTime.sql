USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimScheduleExcludedTime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateTimeUTC] [datetime] NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[IsPermanentlyDelete] [bit] NOT NULL,
	[IsEntireClassSchedule] [bit] NOT NULL,
 CONSTRAINT [PK_SwimScheduleTimeExcluded] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime] ADD  DEFAULT ((0)) FOR [IsPermanentlyDelete]
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime] ADD  DEFAULT ((0)) FOR [IsEntireClassSchedule]
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime]  WITH CHECK ADD  CONSTRAINT [FK_SwimScheduleTimeExcluded_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime] CHECK CONSTRAINT [FK_SwimScheduleTimeExcluded_Staff]
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime]  WITH CHECK ADD  CONSTRAINT [FK_SwimScheduleTimeExcluded_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[SwimScheduleExcludedTime] CHECK CONSTRAINT [FK_SwimScheduleTimeExcluded_SwimClassSchedule]
GO
