USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SplitPaymentGatewayTransactionAudit](
	[SplitPaymentGatewayTransactionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageId] [varchar](50) NOT NULL,
	[PaymentGatewayId] [int] NOT NULL,
	[RequestUTCDateTime] [datetime] NOT NULL,
	[ResponseUTCDateTime] [datetime] NULL,
	[RequestRawData] [nvarchar](max) NOT NULL,
	[ResponseRawData] [nvarchar](max) NULL,
	[BilledTotalAmount] [money] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ResponseCode] [varchar](5) NULL,
	[ResponseText] [varchar](max) NULL,
	[PaymentType] [varchar](20) NULL,
	[CreditRef] [nvarchar](20) NULL,
	[IdempotencyKey] [varchar](50) NULL,
	[TransactionStatus] [varchar](200) NULL,
	[AccountId] [int] NULL,
	[FailureReason] [nvarchar](200) NULL,
	[TransactionType] [nvarchar](200) NULL,
 CONSTRAINT [PK_SplitPaymentGatewayTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[SplitPaymentGatewayTransactionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
