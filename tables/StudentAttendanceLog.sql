USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendanceLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[InOutDateUTC] [datetime] NOT NULL,
	[VerifyMode] [int] NULL,
	[InOutMode] [int] NULL,
	[WorkCode] [int] NULL,
	[InsertStatus] [bit] NULL,
	[AccountId] [int] NULL,
	[EventSource] [int] NULL,
	[GuestAccountId] [int] NULL,
 CONSTRAINT [PK_StudentAttendanceLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendanceLog_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StudentAttendanceLog] CHECK CONSTRAINT [FK_StudentAttendanceLog_Accounts]
GO
ALTER TABLE [dbo].[StudentAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendanceLog_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentAttendanceLog] CHECK CONSTRAINT [FK_StudentAttendanceLog_Students]
GO
ALTER TABLE [dbo].[StudentAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendanceLog_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentAttendanceLog] CHECK CONSTRAINT [FK_StudentAttendanceLog_SwimClassSchedule]
GO
