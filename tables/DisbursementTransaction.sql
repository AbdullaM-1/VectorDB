USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisbursementTransaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CsvReportFileName] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Reference] [nvarchar](200) NULL,
	[ResponseText] [nvarchar](1000) NULL,
	[Comment] [nvarchar](1000) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[DisbursementDate] [datetime] NULL,
	[Provider] [varchar](20) NULL,
	[AccountId] [int] NOT NULL,
	[Department] [int] NOT NULL,
	[SplitBillingProcessedDateUtc] [datetime] NULL,
	[SplitBillingPaymentReference] [varchar](50) NULL,
	[SplitBillingPaymentPercentage] [decimal](9, 2) NOT NULL,
	[GatewayStatus] [varchar](50) NULL,
	[SettlementId] [bigint] NULL,
 CONSTRAINT [PK_DisbursementTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DisbursementTransaction] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[DisbursementTransaction] ADD  DEFAULT ((1)) FOR [Department]
GO
ALTER TABLE [dbo].[DisbursementTransaction] ADD  DEFAULT ((0)) FOR [SplitBillingPaymentPercentage]
GO
