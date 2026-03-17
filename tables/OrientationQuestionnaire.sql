USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrientationQuestionnaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[WayToAnswer] [nvarchar](100) NOT NULL,
	[Column] [int] NOT NULL,
	[OrientationQuestionnaireGroupId] [int] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangedBy] [int] NULL,
	[Position] [nvarchar](10) NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_OrientationQuestionnaire] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrientationQuestionnaire] ADD  DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[OrientationQuestionnaire] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrientationQuestionnaire]  WITH CHECK ADD  CONSTRAINT [FK_OrientationQuestionnaireGroup_OrientationQuestionnaire_OrientationQuestionnaireGroupId] FOREIGN KEY([OrientationQuestionnaireGroupId])
REFERENCES [dbo].[OrientationQuestionnaireGroup] ([Id])
GO
ALTER TABLE [dbo].[OrientationQuestionnaire] CHECK CONSTRAINT [FK_OrientationQuestionnaireGroup_OrientationQuestionnaire_OrientationQuestionnaireGroupId]
GO
