USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignFilterOptions](
	[FilterOptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptionName] [nvarchar](50) NOT NULL,
	[FilterId] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CampaignFilterOptions] PRIMARY KEY CLUSTERED 
(
	[FilterOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CampaignFilterOptions]  WITH CHECK ADD  CONSTRAINT [FK_CampaignFilters_CampaignFilterOptions] FOREIGN KEY([FilterId])
REFERENCES [dbo].[CampaignFilters] ([FilterId])
GO
ALTER TABLE [dbo].[CampaignFilterOptions] CHECK CONSTRAINT [FK_CampaignFilters_CampaignFilterOptions]
GO
