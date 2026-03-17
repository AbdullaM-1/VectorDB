USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsFeed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsPublish] [bit] NOT NULL,
	[Messages] [nvarchar](max) NOT NULL,
	[AccountId] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[LastUpdatedUtcDateTime] [datetime] NULL,
	[Title] [nvarchar](500) NULL,
 CONSTRAINT [PK_NewsFeed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_Account_AccountId]
GO
ALTER TABLE [dbo].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_aspnet_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_aspnet_Users_CreatedBy]
GO
ALTER TABLE [dbo].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_aspnet_Users_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_aspnet_Users_LastUpdatedBy]
GO
