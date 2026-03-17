USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenizerProxyCall](
	[Id] [bigint] IDENTITY(10000,1) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ClubfitReference] [varchar](50) NOT NULL,
	[PaymentToken] [varchar](50) NOT NULL,
	[Body] [varchar](500) NOT NULL,
	[ProxyRequestId] [varchar](50) NOT NULL,
	[ApiRequestUrl] [varchar](200) NOT NULL,
	[WebhookResponseDateTime] [datetime] NULL,
	[WebhookResponseText] [varchar](300) NULL,
	[TransactionResponseCode] [varchar](10) NULL,
	[TransactionResponseMessage] [varchar](100) NULL,
	[WebhookId] [varchar](50) NULL,
 CONSTRAINT [PK_TokenizerProxyCall] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
