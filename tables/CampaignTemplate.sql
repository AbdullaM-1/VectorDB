USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignTemplate](
	[CampaignTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[MediaTypeId] [smallint] NOT NULL,
	[TemplateId] [int] NOT NULL,
 CONSTRAINT [PK_CampaignTemplate] PRIMARY KEY CLUSTERED 
(
	[CampaignTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CampaignTemplate]  WITH CHECK ADD  CONSTRAINT [FK_MarketingEmailTemplate_CampaignTemplate] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[MarketingEmailTemplate] ([TemplateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampaignTemplate] CHECK CONSTRAINT [FK_MarketingEmailTemplate_CampaignTemplate]
GO
