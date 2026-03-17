USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFitnessTesting](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[FitnessTestingTypeId] [int] NOT NULL,
	[TestingDateUtc] [datetime] NOT NULL,
	[ResultValue] [decimal](9, 2) NOT NULL,
	[Metric] [varchar](50) NULL,
 CONSTRAINT [PK_MemberFitnessTesting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberFitnessTesting]  WITH CHECK ADD  CONSTRAINT [FK_MemberFitnessTesting_FitnessTestingType] FOREIGN KEY([FitnessTestingTypeId])
REFERENCES [dbo].[FitnessTestingType] ([Id])
GO
ALTER TABLE [dbo].[MemberFitnessTesting] CHECK CONSTRAINT [FK_MemberFitnessTesting_FitnessTestingType]
GO
ALTER TABLE [dbo].[MemberFitnessTesting]  WITH CHECK ADD  CONSTRAINT [FK_MemberFitnessTesting_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFitnessTesting] CHECK CONSTRAINT [FK_MemberFitnessTesting_Members]
GO
