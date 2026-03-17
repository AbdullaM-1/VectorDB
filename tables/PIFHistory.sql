USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIFHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[MembershipType] [nvarchar](150) NOT NULL,
	[MembershipStartDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NULL,
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
	[OtherMembershipId] [int] NULL,
	[CardSurchargeFee] [money] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[DiscountType] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PIFHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT (getutcdate()) FOR [CreatedUTCDateTime]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ('default') FOR [RequestedBy]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ((0)) FOR [CardSurchargeFee]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ((2)) FOR [DiscountType]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  CONSTRAINT [DF_PIFHistory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PIFHistory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
