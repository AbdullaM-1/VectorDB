USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignJobs](
	[CampaignJobId] [uniqueidentifier] NOT NULL,
	[CampaignId] [int] NOT NULL,
	[CampaignScheduleId] [int] NOT NULL,
	[MemberId] [varchar](50) NULL,
	[ProspectId] [varchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[DateFromUtc] [datetime] NOT NULL,
	[DateToUtc] [datetime] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[MediaType] [int] NOT NULL,
	[DateSentUtc] [datetime] NULL,
	[StatusMessage] [nvarchar](max) NULL,
	[IsSend] [bit] NULL,
 CONSTRAINT [PK_CampaignJobs] PRIMARY KEY CLUSTERED 
(
	[CampaignJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CampaignJobs] ADD  CONSTRAINT [DF_CampaignJobs_CampaignJobId]  DEFAULT (newid()) FOR [CampaignJobId]
GO
ALTER TABLE [dbo].[CampaignJobs] ADD  CONSTRAINT [DF_CampaignJobs_MessageType]  DEFAULT ((0)) FOR [MediaType]
GO
