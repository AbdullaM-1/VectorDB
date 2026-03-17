USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosTransactionPayment](
	[PosTransactionPaymentId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CCNumber] [varchar](25) NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentPosTransactionPayment] PRIMARY KEY CLUSTERED 
(
	[PosTransactionPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPosTransactionPayment] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[StudentPosTransactionPayment]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransactionPayment_StudentPosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentPosTransactionPayment] CHECK CONSTRAINT [FK_StudentPosTransactionPayment_StudentPosTransaction]
GO
