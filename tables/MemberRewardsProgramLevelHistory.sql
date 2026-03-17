USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRewardsProgramLevelHistory](
	[MemberRewardsProgramLevelId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[RewardsProgramPointLevelId] [int] NOT NULL,
	[RewardsProgramId] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedLocalDateTime] [datetime] NOT NULL,
	[IsRedeem] [bit] NOT NULL,
 CONSTRAINT [PK_MemberRewardsProgramLevel] PRIMARY KEY CLUSTERED 
(
	[MemberRewardsProgramLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory] ADD  DEFAULT ((0)) FOR [IsRedeem]
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgramLevelHistory_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory] CHECK CONSTRAINT [FK_MemberRewardsProgramLevelHistory_Members]
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgramLevelHistory_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory] CHECK CONSTRAINT [FK_MemberRewardsProgramLevelHistory_RewardsProgram]
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberRewardsProgramLevelHistory_RewardsProgramPointLevel] FOREIGN KEY([RewardsProgramPointLevelId])
REFERENCES [dbo].[RewardsProgramPointLevel] ([RewardsProgramPointLevelId])
GO
ALTER TABLE [dbo].[MemberRewardsProgramLevelHistory] CHECK CONSTRAINT [FK_MemberRewardsProgramLevelHistory_RewardsProgramPointLevel]
GO
