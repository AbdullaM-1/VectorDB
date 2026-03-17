USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceLog](
	[sr_no] [int] IDENTITY(1,1) NOT NULL,
	[enroll_number] [varchar](20) NOT NULL,
	[verify_mode] [int] NULL,
	[in_out_mode] [int] NULL,
	[in_out_date] [datetime] NOT NULL,
	[work_code] [int] NULL,
	[insert_status] [bit] NULL,
	[account_id] [int] NULL,
	[EventSource] [int] NULL,
	[MemberStatus] [nvarchar](50) NULL,
	[Door] [nvarchar](255) NULL,
	[RequestIpAddress] [varchar](50) NULL,
 CONSTRAINT [PK_AttendanceLog] PRIMARY KEY CLUSTERED 
(
	[sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLog_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AttendanceLog] CHECK CONSTRAINT [FK_AttendanceLog_Accounts]
GO
ALTER TABLE [dbo].[AttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLog_Members_MemberNumber] FOREIGN KEY([enroll_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[AttendanceLog] CHECK CONSTRAINT [FK_AttendanceLog_Members_MemberNumber]
GO
