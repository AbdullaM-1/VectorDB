USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EftposPaymentTransactionAudit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Provider] [varchar](20) NOT NULL,
	[TransactionId] [varchar](128) NOT NULL,
	[TransactionType] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[RequestDateTimeUtc] [datetime] NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[ResponseMessage] [varchar](500) NULL,
	[ResponseDateTimeUtc] [datetime] NULL,
	[IntegrationAppLogging] [varchar](max) NULL,
	[RequestPayload] [varchar](max) NULL,
	[AccountId] [int] NULL,
	[AuthCode] [varchar](25) NULL,
 CONSTRAINT [PK_EftposPaymentTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
