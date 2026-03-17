USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketingBirthdayCampaign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Tab] [varchar](50) NOT NULL,
	[IsSendSms] [bit] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[IsSendEmail] [bit] NOT NULL,
	[Subject] [varchar](100) NULL,
	[EmailBody] [nvarchar](max) NULL,
	[Json] [nvarchar](max) NULL,
 CONSTRAINT [PK_MarketingBirthdayCampaign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
