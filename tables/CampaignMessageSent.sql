USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignMessageSent](
	[CampaignMessageSentId] [bigint] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[SendDateTimeUtc] [datetime] NOT NULL,
	[RecipientNumber] [varchar](10) NOT NULL,
	[SentTo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CampaignMessageSent] PRIMARY KEY CLUSTERED 
(
	[CampaignMessageSentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CampaignMessageSent]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMessageSent_Campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[CampaignMessageSent] CHECK CONSTRAINT [FK_CampaignMessageSent_Campaign]
GO
