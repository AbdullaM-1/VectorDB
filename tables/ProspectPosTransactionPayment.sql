USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPosTransactionPayment](
	[PosTransactionPaymentId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CCNumber] [varchar](25) NULL,
	[TransactionDateUtc] [datetime] NULL,
	[ProviderReference] [varchar](128) NULL,
	[SurchargeFee] [decimal](9, 2) NULL,
 CONSTRAINT [PK_ProspectPosTransactionPayment] PRIMARY KEY CLUSTERED 
(
	[PosTransactionPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectPosTransactionPayment]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPosTransactionPayment_PosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[ProspectPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[ProspectPosTransactionPayment] CHECK CONSTRAINT [FK_ProspectPosTransactionPayment_PosTransaction]
GO
