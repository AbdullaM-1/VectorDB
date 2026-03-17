USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoster](
	[AccountRosterId] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[RosterDate] [date] NOT NULL,
	[StaffId] [int] NOT NULL,
	[ShiftStartDateTime] [datetime] NULL,
	[ShiftEndDateTime] [datetime] NULL,
	[ShiftNote] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedByUsername] [nvarchar](50) NOT NULL,
	[HourlyRate] [decimal](10, 2) NULL,
 CONSTRAINT [PK_AccountRoster] PRIMARY KEY CLUSTERED 
(
	[AccountRosterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountRoster]  WITH CHECK ADD  CONSTRAINT [FK_AccountRoster_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountRoster] CHECK CONSTRAINT [FK_AccountRoster_Accounts]
GO
ALTER TABLE [dbo].[AccountRoster]  WITH CHECK ADD  CONSTRAINT [FK_AccountRoster_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[AccountRoster] CHECK CONSTRAINT [FK_AccountRoster_Staff]
GO
