USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRosterActivity](
	[AccountRosterActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[RosterActivityNumber] [int] NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsBookable] [bit] NOT NULL,
	[IsPayable] [bit] NOT NULL,
	[IsSystemActivity] [bit] NOT NULL,
	[DisplayColor] [nvarchar](9) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountRosterActivity] PRIMARY KEY CLUSTERED 
(
	[AccountRosterActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_IsBookable]  DEFAULT ((1)) FOR [IsBookable]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_IsPayable]  DEFAULT ((1)) FOR [IsPayable]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_IsSystemActivity]  DEFAULT ((0)) FOR [IsSystemActivity]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_DisplayColor]  DEFAULT ((0)) FOR [DisplayColor]
GO
ALTER TABLE [dbo].[AccountRosterActivity] ADD  CONSTRAINT [DF_AccountRosterActivity_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountRosterActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountRosterActivity_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountRosterActivity] CHECK CONSTRAINT [FK_AccountRosterActivity_Accounts]
GO
