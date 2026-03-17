USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountEventLog](
	[AccountLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NOT NULL,
	[EventUtcDateTime] [datetime] NOT NULL,
	[EventDescription] [text] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[EventSource] [int] NULL,
 CONSTRAINT [PK_AccountEventLog] PRIMARY KEY CLUSTERED 
(
	[AccountLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountEventLog]  WITH CHECK ADD  CONSTRAINT [FK_AccountEventLog_Accounts] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountEventLog] CHECK CONSTRAINT [FK_AccountEventLog_Accounts]
GO
