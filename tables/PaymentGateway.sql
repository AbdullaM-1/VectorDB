USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGateway](
	[PaymentGatewayId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CustomerId] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Url] [nvarchar](200) NULL,
	[IsTest] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DeClientId] [nvarchar](100) NULL,
	[CcClientId] [nvarchar](100) NULL,
	[VaultUrl] [nvarchar](200) NULL,
	[CertPassword] [nvarchar](100) NULL,
	[Network] [nvarchar](200) NULL,
	[JSONUrl] [varchar](200) NULL,
	[AuthToken] [varchar](200) NULL,
	[HMACSecret] [nvarchar](50) NULL,
	[RefundClientId] [nvarchar](100) NULL,
	[SwimDeClientId] [nvarchar](100) NULL,
	[SwimCcClientId] [nvarchar](100) NULL,
	[SwimRefundClientId] [nvarchar](100) NULL,
	[UseJsonApi] [bit] NOT NULL,
	[CcBillingEnabled] [bit] NOT NULL,
	[DeBillingEnabled] [bit] NOT NULL,
	[IsCreditCard] [bit] NOT NULL,
	[IsDirectEntry] [bit] NOT NULL,
	[IsApplePay] [bit] NOT NULL,
	[IsGooglePay] [bit] NOT NULL,
 CONSTRAINT [PK_PaymentGateway] PRIMARY KEY CLUSTERED 
(
	[PaymentGatewayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((1)) FOR [UseJsonApi]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [CcBillingEnabled]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [DeBillingEnabled]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [IsCreditCard]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [IsDirectEntry]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [IsApplePay]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [IsGooglePay]
GO
