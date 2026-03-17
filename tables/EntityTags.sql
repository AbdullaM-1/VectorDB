USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTags](
	[EntityTagId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[EntityNumber] [varchar](20) NOT NULL,
	[TagName] [varchar](100) NOT NULL,
	[EntityType] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[DeletedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_EntityTag] PRIMARY KEY CLUSTERED 
(
	[EntityTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntityTags] ADD  CONSTRAINT [DF_EntityTags_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EntityTags]  WITH CHECK ADD  CONSTRAINT [FK_EntityTags_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[EntityTags] CHECK CONSTRAINT [FK_EntityTags_Accounts_AccountId]
GO
