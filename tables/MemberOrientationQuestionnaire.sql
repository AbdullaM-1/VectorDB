USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOrientationQuestionnaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[OrientationQuestionnaireGroupId] [int] NOT NULL,
	[OrientationQuestionnaireId] [int] NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberOrientationQuestionnaire] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire] ADD  DEFAULT (getutcdate()) FOR [CreatedDateTimeUtc]
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberOrientationQuestionnaire_OrientationQuestionnaire_OrientationQuestionnaireId] FOREIGN KEY([OrientationQuestionnaireId])
REFERENCES [dbo].[OrientationQuestionnaire] ([Id])
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire] CHECK CONSTRAINT [FK_MemberOrientationQuestionnaire_OrientationQuestionnaire_OrientationQuestionnaireId]
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberOrientationQuestionnaire_OrientationQuestionnaireGroup_OrientationQuestionnaireGroupId] FOREIGN KEY([OrientationQuestionnaireGroupId])
REFERENCES [dbo].[OrientationQuestionnaireGroup] ([Id])
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire] CHECK CONSTRAINT [FK_MemberOrientationQuestionnaire_OrientationQuestionnaireGroup_OrientationQuestionnaireGroupId]
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_MemberOrientationQuestionnaireGroup_Members_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberOrientationQuestionnaire] CHECK CONSTRAINT [FK_MemberOrientationQuestionnaireGroup_Members_MemberNumber]
GO
