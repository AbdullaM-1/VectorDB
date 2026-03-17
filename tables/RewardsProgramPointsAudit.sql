USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardsProgramPointsAudit](
	[RewardsProgramPointsAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[PointsAwarded] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedLocalDateTime] [datetime] NOT NULL,
	[ReasonId] [int] NOT NULL,
	[ClassId] [int] NULL,
	[RewardsProgramId] [int] NOT NULL,
 CONSTRAINT [PK_RewardsProgramPointsAudit] PRIMARY KEY CLUSTERED 
(
	[RewardsProgramPointsAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramPointsAudit_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit] CHECK CONSTRAINT [FK_RewardsProgramPointsAudit_Class]
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramPointsAudit_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit] CHECK CONSTRAINT [FK_RewardsProgramPointsAudit_Members]
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramPointsAudit_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[RewardsProgramPointsAudit] CHECK CONSTRAINT [FK_RewardsProgramPointsAudit_RewardsProgram]
GO
