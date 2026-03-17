USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPIFHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[MembershipStartDateTimeLocal] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[JoiningFee] [money] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[Duration] [int] NOT NULL,
	[NumberOfPayments] [int] NOT NULL,
	[PaymentFrequency] [nvarchar](50) NOT NULL,
	[IndividualPaymentPrice] [money] NOT NULL,
	[HowPaid] [nvarchar](50) NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[RequestedBy] [nvarchar](50) NOT NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[ActualAmountPaid] [money] NULL,
	[PosTransactionId] [bigint] NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
	[IsClearOutstandingBalance] [bit] NOT NULL,
	[CardSurchargeFee] [money] NOT NULL,
 CONSTRAINT [PK_StudentPIFHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPIFHistory] ADD  DEFAULT ((0)) FOR [StudentSwimClassBookingDetailId]
GO
ALTER TABLE [dbo].[StudentPIFHistory] ADD  DEFAULT ((0)) FOR [IsClearOutstandingBalance]
GO
ALTER TABLE [dbo].[StudentPIFHistory] ADD  DEFAULT ((0)) FOR [CardSurchargeFee]
GO
ALTER TABLE [dbo].[StudentPIFHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentPIFHistory_StudentPosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentPIFHistory] CHECK CONSTRAINT [FK_StudentPIFHistory_StudentPosTransaction]
GO
