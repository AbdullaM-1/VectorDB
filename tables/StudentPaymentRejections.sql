USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentRejections](
	[PaymentRejectionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionReference] [varchar](50) NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[TransactionType] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[AmountInCents] [int] NOT NULL,
	[TxnId] [int] NOT NULL,
	[ResponseCode] [varchar](10) NOT NULL,
	[ResponseText] [varchar](200) NOT NULL,
	[CardNumber] [varchar](50) NOT NULL,
	[CardType] [int] NOT NULL,
	[SettlementDate] [date] NOT NULL,
	[MerchantId] [varchar](50) NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[IsProcessed] [bit] NOT NULL,
 CONSTRAINT [PK_StudentPaymentRejection] PRIMARY KEY CLUSTERED 
(
	[PaymentRejectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
