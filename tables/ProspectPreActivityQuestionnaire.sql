USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPreActivityQuestionnaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[PreActivityQuestionaireGroupId] [int] NOT NULL,
	[PreActivityQuestionaireId] [int] NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ProspectPreActivityQuestionnaire] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire] ADD  DEFAULT (getutcdate()) FOR [CreatedDateTimeUtc]
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPreActivityQuestionnaire_PreActivityQuestionaire_PreActivityQuestionaireId] FOREIGN KEY([PreActivityQuestionaireId])
REFERENCES [dbo].[PreActivityQuestionaire] ([Id])
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire] CHECK CONSTRAINT [FK_ProspectPreActivityQuestionnaire_PreActivityQuestionaire_PreActivityQuestionaireId]
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPreActivityQuestionnaire_PreActivityQuestionaireGroup_PreActivityQuestionaireGroupId] FOREIGN KEY([PreActivityQuestionaireGroupId])
REFERENCES [dbo].[PreActivityQuestionaireGroup] ([Id])
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire] CHECK CONSTRAINT [FK_ProspectPreActivityQuestionnaire_PreActivityQuestionaireGroup_PreActivityQuestionaireGroupId]
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPreActivityQuestionnaireGroup_Prospects_ProspectNumber] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectPreActivityQuestionnaire] CHECK CONSTRAINT [FK_ProspectPreActivityQuestionnaireGroup_Prospects_ProspectNumber]
GO
