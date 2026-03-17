USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentGatewayBatch](
	[PaymentGatewayBatchId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[PaymentGatewayId] [int] NOT NULL,
	[BatchStatus] [int] NOT NULL,
	[PaymentGatewayBatchGroupId] [int] NULL,
 CONSTRAINT [PK_StudentPaymentGatewayBatch] PRIMARY KEY CLUSTERED 
(
	[PaymentGatewayBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatch] ADD  CONSTRAINT [DF_StudentPaymentGatewayBatch_BatchStatus]  DEFAULT ((0)) FOR [BatchStatus]
GO
