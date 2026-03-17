USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectAttendanceLog](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[EnrollNumber] [nvarchar](10) NULL,
	[VerifyMode] [int] NULL,
	[InOutMode] [int] NULL,
	[InOutDate] [datetime] NULL,
	[WorkCode] [int] NULL,
	[InsertStatus] [bit] NULL,
	[AccountId] [int] NULL,
	[EventSource] [int] NULL,
	[ProspectStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProspectAttendanceLog] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_ProspectAttendanceLog_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[ProspectAttendanceLog] CHECK CONSTRAINT [FK_ProspectAttendanceLog_Accounts]
GO
