USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountProductSupplier](
	[AccountProductSupplierId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[AccountProductId] [bigint] NOT NULL,
	[AccountSupplierId] [bigint] NOT NULL,
	[EffectiveFromDate] [date] NOT NULL,
	[EffectiveToDate] [date] NOT NULL,
	[BuyIncTaxPrice] [money] NULL,
	[BuyExTaxPrice] [money] NULL,
	[SupplierProductNumber] [nvarchar](40) NULL,
	[PurchaseUnitOfMeasureCode] [int] NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedUserName] [nvarchar](50) NOT NULL,
	[UpdatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedUserName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountProductSupplier] PRIMARY KEY CLUSTERED 
(
	[AccountProductSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  CONSTRAINT [DF_AccountProductSupplier_EffectiveFromDate]  DEFAULT ('1900-01-01') FOR [EffectiveFromDate]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  CONSTRAINT [DF_AccountProductSupplier_EffectiveToDate]  DEFAULT ('9999-12-31') FOR [EffectiveToDate]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  CONSTRAINT [DF_AccountProductSupplier_PurchaseUnitOfMeasureCode]  DEFAULT ((0)) FOR [PurchaseUnitOfMeasureCode]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  CONSTRAINT [DF_AccountProductSupplier_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  CONSTRAINT [DF_AccountProductSupplier_UpdatedUtcDateTime]  DEFAULT (getutcdate()) FOR [UpdatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductSupplier] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountProductSupplier]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductSupplier_AccountProduct] FOREIGN KEY([AccountProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
GO
ALTER TABLE [dbo].[AccountProductSupplier] CHECK CONSTRAINT [FK_AccountProductSupplier_AccountProduct]
GO
ALTER TABLE [dbo].[AccountProductSupplier]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductSupplier_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountProductSupplier] CHECK CONSTRAINT [FK_AccountProductSupplier_Accounts]
GO
ALTER TABLE [dbo].[AccountProductSupplier]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductSupplier_AccountSupplier] FOREIGN KEY([AccountSupplierId])
REFERENCES [dbo].[AccountSupplier] ([AccountSupplierId])
GO
ALTER TABLE [dbo].[AccountProductSupplier] CHECK CONSTRAINT [FK_AccountProductSupplier_AccountSupplier]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Supplier internal identifier (primary key)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'AccountProductSupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account identifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product identifier (logical key)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'AccountProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supplier identifier indicating a valid supplier from whom the product may be purchased.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'AccountSupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date from which the current record (including pricing and tax) takes effect' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'EffectiveFromDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date until which the current record (including pricing and tax) takes effect, inclusive, up to but excluding midnight.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'EffectiveToDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The buy price inclusive of tax. NULL if buy prices are recorded exclusive of tax.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'BuyIncTaxPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The buy price excluding tax. NULL if buy prices are recorded inclusive of tax.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'BuyExTaxPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The supplier''s catalogue number for the product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'SupplierProductNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defined by system code type ''UnitOfMeasure'': 0 - Each, 1 - Pack, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSupplier', @level2type=N'COLUMN',@level2name=N'PurchaseUnitOfMeasureCode'
GO
