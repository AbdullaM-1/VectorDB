USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[FrequencyId] [int] NOT NULL,
	[DateFrom] [datetime] NULL,
	[DateUntil] [datetime] NULL,
	[IsUntilFurtherNotice] [bit] NULL,
	[ScheduleDate] [datetime] NULL,
	[IsSendOnlyRecipient] [bit] NULL,
 CONSTRAINT [PK_CampaignSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
