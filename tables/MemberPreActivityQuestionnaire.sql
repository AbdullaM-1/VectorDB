USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPreActivityQuestionnaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[PreActivityQuestionaireGroupId] [int] NOT NULL,
	[PreActivityQuestionaireId] [int] NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberPreActivityQuestionnaire] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire] ADD  DEFAULT (getutcdate()) FOR [CreatedDateTimeUtc]
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberPreActivityQuestionnaire_PreActivityQuestionaire_PreActivityQuestionaireId] FOREIGN KEY([PreActivityQuestionaireId])
REFERENCES [dbo].[PreActivityQuestionaire] ([Id])
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire] CHECK CONSTRAINT [FK_MemberPreActivityQuestionnaire_PreActivityQuestionaire_PreActivityQuestionaireId]
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberPreActivityQuestionnaire_PreActivityQuestionaireGroup_PreActivityQuestionaireGroupId] FOREIGN KEY([PreActivityQuestionaireGroupId])
REFERENCES [dbo].[PreActivityQuestionaireGroup] ([Id])
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire] CHECK CONSTRAINT [FK_MemberPreActivityQuestionnaire_PreActivityQuestionaireGroup_PreActivityQuestionaireGroupId]
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberPreActivityQuestionnaireGroup_Members_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberPreActivityQuestionnaire] CHECK CONSTRAINT [FK_MemberPreActivityQuestionnaireGroup_Members_MemberNumber]
GO
