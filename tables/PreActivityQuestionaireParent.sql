USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreActivityQuestionaireParent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_PreActivityQuestionaireParent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PreActivityQuestionaireParent]  WITH CHECK ADD  CONSTRAINT [FK_PreActivityQuestionaireParent_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[PreActivityQuestionaireParent] CHECK CONSTRAINT [FK_PreActivityQuestionaireParent_Accounts]
GO
