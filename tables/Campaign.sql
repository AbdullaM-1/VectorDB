USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[CampaignId] [int] IDENTITY(1,1) NOT NULL,
	[CampaignTypeId] [int] NULL,
	[CampaignName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CampaignSubject] [nvarchar](50) NULL,
	[TemplateId] [int] NULL,
	[CampaignFilter] [int] NULL,
	[CampaignStatusId] [int] NOT NULL,
	[LastUpdatedUtcDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
	[LocationId] [int] NULL,
	[AudienceTypeId] [int] NULL,
	[SentRecipientCount] [int] NOT NULL,
	[IsAdvanced] [bit] NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Campaign] ADD  DEFAULT ((0)) FOR [SentRecipientCount]
GO
ALTER TABLE [dbo].[Campaign] ADD  DEFAULT ((0)) FOR [IsAdvanced]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Accounts] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_Accounts]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_CampaignType] FOREIGN KEY([CampaignTypeId])
REFERENCES [dbo].[CampaignType] ([CampaignTypeId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_CampaignType]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Group] FOREIGN KEY([CampaignFilter])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_Group]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_MarketingEmailTemplate] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[MarketingEmailTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_MarketingEmailTemplate]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_CampaignCreatedBy_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_CampaignCreatedBy_Users]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_CampaignLastUpdatedBy_Users] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_CampaignLastUpdatedBy_Users]
GO
