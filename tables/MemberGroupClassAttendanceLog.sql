USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroupClassAttendanceLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[OnlineAccountId] [int] NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[InOutDateUTC] [datetime] NOT NULL,
	[VerifyMode] [int] NULL,
	[InOutMode] [int] NULL,
	[WorkCode] [int] NULL,
	[InsertStatus] [bit] NULL,
	[AccountId] [int] NULL,
	[EventSource] [int] NULL,
	[MemberKidId] [int] NOT NULL,
	[AttendanceStatus] [int] NOT NULL,
	[IsCheckOut] [bit] NOT NULL,
	[CheckOutDateTimeUtc] [datetime] NULL,
	[BookingSourceId] [int] NULL,
 CONSTRAINT [PK_MemberGroupClassAttendanceLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog] ADD  CONSTRAINT [DF_MemberGroupClassAttendanceLog_MemberKidId]  DEFAULT ((0)) FOR [MemberKidId]
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog] ADD  DEFAULT ((1)) FOR [AttendanceStatus]
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog] ADD  DEFAULT ((0)) FOR [IsCheckOut]
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroupClassAttendanceLog_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog] CHECK CONSTRAINT [FK_MemberGroupClassAttendanceLog_Accounts]
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroupClassAttendanceLog_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[MemberGroupClassAttendanceLog] CHECK CONSTRAINT [FK_MemberGroupClassAttendanceLog_ClassSchedule]
GO
