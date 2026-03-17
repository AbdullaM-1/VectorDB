USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreActivityQuestionaireGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[RowLine] [nvarchar](100) NOT NULL,
	[AccountId] [int] NULL,
	[WayToAnswerGroup] [nvarchar](100) NULL,
	[IsRequired] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangedBy] [int] NULL,
	[SortOrder] [int] NOT NULL,
	[PreActivityQuestionaireParentId] [int] NULL,
	[Position] [nvarchar](10) NULL,
	[DateTimeUtcDeleted] [datetime] NULL,
	[IsRequiredSectionYn] [bit] NOT NULL,
 CONSTRAINT [PK_PreActivityQuestionaireGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup] ADD  DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup] ADD  CONSTRAINT [DF_PreActivityQuestionaireGroup_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup] ADD  DEFAULT ((0)) FOR [IsRequiredSectionYn]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup]  WITH CHECK ADD  CONSTRAINT [FK_PreActivityQuestionaireGroup_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[PreActivityQuestionaireGroup] CHECK CONSTRAINT [FK_PreActivityQuestionaireGroup_Account_AccountId]
GO
