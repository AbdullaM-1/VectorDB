USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttendanceLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[VerifyMode] [int] NULL,
	[InOutMode] [int] NULL,
	[InOutDateTimeLocal] [datetime] NOT NULL,
	[WorkCode] [int] NULL,
	[InsertStatus] [bit] NULL,
	[AccountId] [int] NULL,
	[EventSource] [int] NULL,
	[MemberStatus] [nvarchar](50) NULL,
	[Door] [nvarchar](255) NULL,
 CONSTRAINT [PK_StaffAttendanceLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttendanceLog_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StaffAttendanceLog] CHECK CONSTRAINT [FK_StaffAttendanceLog_Accounts_AccountId]
GO
ALTER TABLE [dbo].[StaffAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttendanceLog_Staff_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffAttendanceLog] CHECK CONSTRAINT [FK_StaffAttendanceLog_Staff_StaffId]
GO
