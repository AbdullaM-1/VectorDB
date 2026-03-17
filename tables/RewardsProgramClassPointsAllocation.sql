USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardsProgramClassPointsAllocation](
	[RewardsProgramClassPointsAllocationId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[RewardsProgramId] [int] NOT NULL,
	[PointsPerClass] [int] NOT NULL,
 CONSTRAINT [PK_RewardsProgramClassPointsAllocation] PRIMARY KEY CLUSTERED 
(
	[RewardsProgramClassPointsAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RewardsProgramClassPointsAllocation]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramClassPointsAllocation_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[RewardsProgramClassPointsAllocation] CHECK CONSTRAINT [FK_RewardsProgramClassPointsAllocation_Class]
GO
ALTER TABLE [dbo].[RewardsProgramClassPointsAllocation]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgramClassPointsAllocation_RewardsProgram] FOREIGN KEY([RewardsProgramId])
REFERENCES [dbo].[RewardsProgram] ([RewardsProgramId])
GO
ALTER TABLE [dbo].[RewardsProgramClassPointsAllocation] CHECK CONSTRAINT [FK_RewardsProgramClassPointsAllocation_RewardsProgram]
GO
