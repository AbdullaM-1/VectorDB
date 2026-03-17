USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineShopTransaction](
	[OnlineShopTransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionUtcDateTime] [datetime] NOT NULL,
	[TransactionLocalDateTime] [datetime] NOT NULL,
	[TenantNumber] [varchar](20) NULL,
	[TenantType] [varchar](5) NULL,
	[TransactionTotalIncTax] [decimal](18, 2) NOT NULL,
	[TransactionTotalExTax] [decimal](18, 2) NOT NULL,
	[TransactionTotalTax] [decimal](18, 2) NOT NULL,
	[TransactionType] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeletedOnUtc] [datetime] NULL,
	[AccountId] [int] NULL,
	[PaymentGatewayRefId] [varchar](50) NULL,
	[TagCollectedByStaffId] [int] NULL,
	[CouponCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_OnlineShopTransaction] PRIMARY KEY CLUSTERED 
(
	[OnlineShopTransactionId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineShopTransaction] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OnlineShopTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OnlineShopTransaction_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[OnlineShopTransaction] CHECK CONSTRAINT [FK_OnlineShopTransaction_Accounts_AccountId]
GO
ALTER TABLE [dbo].[OnlineShopTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OnlineShopTransaction_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[OnlineShopTransaction] CHECK CONSTRAINT [FK_OnlineShopTransaction_DeletedBy]
GO
