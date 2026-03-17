USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignAudienceStatus](
	[AudienceStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[AudienceLookupItemId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[StatusLabel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CampaignAudienceStatus] PRIMARY KEY CLUSTERED 
(
	[AudienceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CampaignAudienceStatus] ADD  DEFAULT ('') FOR [StatusLabel]
GO
