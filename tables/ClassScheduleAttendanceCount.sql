USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleAttendanceCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[ClassDate] [datetime] NOT NULL,
	[ClassTime] [varchar](20) NOT NULL,
	[AttendanceCount] [int] NOT NULL,
 CONSTRAINT [PK_ClassScheduleAttendanceCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleAttendanceCount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleAttendanceCount_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassScheduleAttendanceCount] CHECK CONSTRAINT [FK_ClassScheduleAttendanceCount_ClassSchedule]
GO
