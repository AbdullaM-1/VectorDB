USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectMedicalConditions](
	[ProspectConditionId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[ConditionDate] [smalldatetime] NULL,
	[Condition] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProspectMedicalConditions] PRIMARY KEY CLUSTERED 
(
	[ProspectConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectMedicalConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProspectMedicalConditions_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectMedicalConditions] CHECK CONSTRAINT [FK_ProspectMedicalConditions_Prospects]
GO
