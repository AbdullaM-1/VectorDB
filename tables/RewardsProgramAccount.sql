USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardsProgramAccount](
	[RewardsProgramAccountId] [int] IDENTITY(1,1) NOT NULL,
	[RewardsProgramId] [int] NOT NULL,
	[ParticipatingAccountId] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[IsParticipating] [bit] NOT NULL,
 CONSTRAINT [PK_RewardsProgramAccount] PRIMARY KEY CLUSTERED 
(
	[RewardsProgramAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RewardsProgramAccount]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramAccount_Accounts] FOREIGN KEY([ParticipatingAccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[RewardsProgramAccount] CHECK CONSTRAINT [FK_RewardsProgramAccount_Accounts]
GO
ALTER TABLE [dbo].[RewardsProgramAccount]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramAccount_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[RewardsProgramAccount] CHECK CONSTRAINT [FK_RewardsProgramAccount_RewardsProgram]
GO
