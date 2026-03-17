USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectCreditCard](
	[ProspectCardId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[CCNameOnCard] [varchar](200) NOT NULL,
	[CCNumber] [varchar](20) NOT NULL,
	[CCExpiryMonth] [int] NULL,
	[CCExpiryYear] [int] NULL,
	[CCCardType] [varchar](20) NULL,
	[CCCVV] [varchar](5) NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[IsPaymentInfoRegistered] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[LastUpdatedOnUtc] [datetime] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[PaymentGatewayRefId] [varchar](50) NULL,
	[TokenProviderId] [int] NULL,
	[TokenReference] [varchar](100) NULL,
	[NetworkToken] [varchar](30) NULL,
 CONSTRAINT [PK_ProspectCreditCard] PRIMARY KEY CLUSTERED 
(
	[ProspectCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectCreditCard] ADD  CONSTRAINT [DF_ProspectCreditCard_IsPaymentInfoRegistered]  DEFAULT ((0)) FOR [IsPaymentInfoRegistered]
GO
ALTER TABLE [dbo].[ProspectCreditCard] ADD  CONSTRAINT [DF_ProspectCreditCard_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProspectCreditCard] ADD  CONSTRAINT [DF_ProspectCreditCard_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[ProspectCreditCard] ADD  DEFAULT (NULL) FOR [NetworkToken]
GO
ALTER TABLE [dbo].[ProspectCreditCard]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCreditCard_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectCreditCard] CHECK CONSTRAINT [FK_ProspectCreditCard_Prospects]
GO
