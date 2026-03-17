USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRewardsProgram](
	[MemberRewardsProgramId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[CurrentPoints] [int] NOT NULL,
	[RewardsProgramPointLevelId] [int] NULL,
	[RewardsProgramId] [int] NOT NULL,
 CONSTRAINT [PK_MemberRewardsProgram] PRIMARY KEY CLUSTERED 
(
	[MemberRewardsProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberRewardsProgram]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgram_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberRewardsProgram] CHECK CONSTRAINT [FK_MemberRewardsProgram_Members]
GO
ALTER TABLE [dbo].[MemberRewardsProgram]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgram_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[MemberRewardsProgram] CHECK CONSTRAINT [FK_MemberRewardsProgram_RewardsProgram]
GO
ALTER TABLE [dbo].[MemberRewardsProgram]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgram_RewardsProgramPointLevel] FOREIGN KEY([RewardsProgramPointLevelId])
REFERENCES [dbo].[RewardsProgramPointLevel] ([RewardsProgramPointLevelId])
GO
ALTER TABLE [dbo].[MemberRewardsProgram] CHECK CONSTRAINT [FK_MemberRewardsProgram_RewardsProgramPointLevel]
GO
