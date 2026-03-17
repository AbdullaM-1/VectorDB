USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardsProgramPointLevel](
	[RewardsProgramPointLevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](200) NOT NULL,
	[PointsRequired] [int] NOT NULL,
	[Reward] [varchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[RewardsProgramId] [int] NOT NULL,
	[Icon] [varchar](100) NULL,
 CONSTRAINT [PK_RewardsProgramPointLevel] PRIMARY KEY CLUSTERED 
(
	[RewardsProgramPointLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RewardsProgramPointLevel]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramPointLevel_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[RewardsProgramPointLevel] CHECK CONSTRAINT [FK_RewardsProgramPointLevel_RewardsProgram]
GO
