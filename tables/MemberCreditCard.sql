USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCreditCard](
	[MemberCardId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[CCNameOnCard] [varchar](200) NOT NULL,
	[CCNumber] [varchar](20) NOT NULL,
	[CCExpiryMonth] [int] NULL,
	[CCExpiryYear] [int] NULL,
	[CCCardType] [varchar](20) NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[IsPaymentInfoRegistered] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[LastUpdatedOnUtc] [datetime] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[PaymentGatewayRefId] [varchar](50) NULL,
	[TokenProviderId] [int] NOT NULL,
	[TokenReference] [varchar](100) NULL,
	[NetworkToken] [varchar](30) NULL,
 CONSTRAINT [PK_MemberCreditCard] PRIMARY KEY CLUSTERED 
(
	[MemberCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberCreditCard] ADD  CONSTRAINT [DF_MemberCreditCard_IsPaymentInfoRegistered]  DEFAULT ((0)) FOR [IsPaymentInfoRegistered]
GO
ALTER TABLE [dbo].[MemberCreditCard] ADD  CONSTRAINT [DF_MemberCreditCard_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MemberCreditCard] ADD  CONSTRAINT [DF_MemberCreditCard_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[MemberCreditCard] ADD  DEFAULT ((3)) FOR [TokenProviderId]
GO
ALTER TABLE [dbo].[MemberCreditCard] ADD  DEFAULT (NULL) FOR [NetworkToken]
GO
ALTER TABLE [dbo].[MemberCreditCard]  WITH CHECK ADD  CONSTRAINT [FK_MemberCreditCard_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberCreditCard] CHECK CONSTRAINT [FK_MemberCreditCard_Members]
GO
