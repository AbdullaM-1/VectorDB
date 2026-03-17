USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirthdayEmailAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarketingBirthdayCampaignId] [int] NOT NULL,
	[AttachmentPath] [varchar](1000) NOT NULL,
	[AttachmentFilename] [varchar](255) NOT NULL,
	[DateTimeCreatedUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_BirthdayEmailAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BirthdayEmailAttachments]  WITH CHECK ADD  CONSTRAINT [FK_BirthdayEmailAttachments_MarketingBirthdayCampaign] FOREIGN KEY([MarketingBirthdayCampaignId])
REFERENCES [dbo].[MarketingBirthdayCampaign] ([Id])
GO
ALTER TABLE [dbo].[BirthdayEmailAttachments] CHECK CONSTRAINT [FK_BirthdayEmailAttachments_MarketingBirthdayCampaign]
GO
