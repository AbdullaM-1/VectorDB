USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardsProgram](
	[RewardsProgramId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [varchar](200) NOT NULL,
	[GymUsagePoints] [int] NOT NULL,
	[PersonalTrainingPoints] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[AdministratorUserId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RewardsProgram] PRIMARY KEY CLUSTERED 
(
	[RewardsProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RewardsProgram]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgram_aspnet_Users] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[RewardsProgram] CHECK CONSTRAINT [FK_RewardsProgram_aspnet_Users]
GO
ALTER TABLE [dbo].[RewardsProgram]  WITH CHECK ADD  CONSTRAINT [FK_RewardsProgram_aspnet_Users1] FOREIGN KEY([AdministratorUserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[RewardsProgram] CHECK CONSTRAINT [FK_RewardsProgram_aspnet_Users1]
GO
