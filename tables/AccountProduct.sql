USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountProduct](
	[AccountProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[AccountSupplierId] [bigint] NOT NULL,
	[AccountProductCategoryId] [bigint] NOT NULL,
	[AccountProductSubCategoryId] [bigint] NOT NULL,
	[ManufacturerProductNumber] [varchar](40) NULL,
	[MinimumLevelQuantity] [decimal](16, 3) NULL,
	[WarnLevelQuantity] [decimal](16, 3) NULL,
	[MaximumLevelQuantity] [decimal](16, 3) NULL,
	[OnHandQuantity] [decimal](16, 3) NOT NULL,
	[OnHandValue] [money] NULL,
	[OnHandAverageValue] [decimal](19, 6) NULL,
	[CannotOrderAfterDate] [date] NULL,
	[StoreUnitOfMeasureCode] [int] NULL,
	[DefaultPurchaseUnitOfMeasureCode] [int] NULL,
	[DefaultPurchaseToStoreConversionQuantity] [decimal](19, 6) NULL,
	[DefaultSupplierNumber] [int] NULL,
	[DisplayImagePath] [nvarchar](255) NULL,
	[ProductName] [varchar](200) NULL,
	[SellExTaxPrice] [money] NULL,
	[SellIncTaxPrice] [money] NULL,
	[ProductStockLowLevel] [int] NULL,
	[ProductStockLevel] [int] NULL,
	[ProductDiscount] [decimal](18, 0) NULL,
	[SellOnlineEnabled] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DepartmentType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsCasualEntry] [bit] NOT NULL,
	[IsPosItem] [bit] NOT NULL,
	[IsStockTakeRequired] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[GstRequired] [bit] NOT NULL,
	[ExpiryDate] [date] NULL,
	[IsCommissionable] [bit] NOT NULL,
	[CommissionAmount] [decimal](19, 6) NULL,
	[DiscountCouponId] [bigint] NULL,
	[IsSystem] [bit] NOT NULL,
	[CreatedUtcDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AccountProduct] PRIMARY KEY CLUSTERED 
(
	[AccountProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_OnHandQuantity]  DEFAULT ((0)) FOR [OnHandQuantity]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_OnHandValue]  DEFAULT ((0)) FOR [OnHandValue]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_OnHandAverageValue]  DEFAULT ((0)) FOR [OnHandAverageValue]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_StoreUnitOfMeasureCode]  DEFAULT ((0)) FOR [StoreUnitOfMeasureCode]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_DefaultPurchaseUnitOfMeasureCode]  DEFAULT ((0)) FOR [DefaultPurchaseUnitOfMeasureCode]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_DefaultPurchaseToStoreConversionQuantity]  DEFAULT ((1)) FOR [DefaultPurchaseToStoreConversionQuantity]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_DefaultSupplierNumber]  DEFAULT ((0)) FOR [DefaultSupplierNumber]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_SellOnlineEnabled]  DEFAULT ((0)) FOR [SellOnlineEnabled]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((0)) FOR [DepartmentType]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF__AccountPr__IsAct__5DF5D7ED]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((0)) FOR [IsCasualEntry]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((0)) FOR [IsPosItem]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((1)) FOR [IsStockTakeRequired]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_GstRequired]  DEFAULT ((1)) FOR [GstRequired]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_IsCommissionable]  DEFAULT ((0)) FOR [IsCommissionable]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[AccountProduct] ADD  CONSTRAINT [DF_AccountProduct_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProduct]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_AccountProductCategory] FOREIGN KEY([AccountProductCategoryId])
REFERENCES [dbo].[AccountProductCategory] ([AccountProductCategoryId])
GO
ALTER TABLE [dbo].[AccountProduct] CHECK CONSTRAINT [FK_AccountProduct_AccountProductCategory]
GO
ALTER TABLE [dbo].[AccountProduct]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_AccountProductSubCategory] FOREIGN KEY([AccountProductSubCategoryId])
REFERENCES [dbo].[AccountProductSubCategory] ([AccountProductSubCategoryId])
GO
ALTER TABLE [dbo].[AccountProduct] CHECK CONSTRAINT [FK_AccountProduct_AccountProductSubCategory]
GO
ALTER TABLE [dbo].[AccountProduct]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountProduct] CHECK CONSTRAINT [FK_AccountProduct_Accounts]
GO
ALTER TABLE [dbo].[AccountProduct]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_AccountSupplier] FOREIGN KEY([AccountSupplierId])
REFERENCES [dbo].[AccountSupplier] ([AccountSupplierId])
GO
ALTER TABLE [dbo].[AccountProduct] CHECK CONSTRAINT [FK_AccountProduct_AccountSupplier]
GO
ALTER TABLE [dbo].[AccountProduct]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_DiscountCoupon_DiscountCouponId] FOREIGN KEY([DiscountCouponId])
REFERENCES [dbo].[DiscountCoupons] ([Id])
GO
ALTER TABLE [dbo].[AccountProduct] CHECK CONSTRAINT [FK_AccountProduct_DiscountCoupon_DiscountCouponId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account product internal identifier (primary key)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'AccountProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the preferred supplier for the product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'AccountSupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the product category to which the product belongs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'AccountProductCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the product sub-category to which the product belongs (optional)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'AccountProductSubCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The manufacturer''s item number (or part number) for this product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'ManufacturerProductNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum on-hand quantity, below which the product will be triggered for reorder.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'MinimumLevelQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum on-hand quantity below which the system will visually alert the operator.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'WarnLevelQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The on-hand level up to which the reordering system will order additional stock.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'MaximumLevelQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The quantity of stock physically held at this Account.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'OnHandQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The monetary value of stock on hand at this Account.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'OnHandValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The monetary value of each item of the product that is currently on hand.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'OnHandAverageValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the product can no longer be replenished from the supplier after this date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'CannotOrderAfterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'As defined by system code type ''UnitOfMeasure'': 0 - Each, 1 - Pack, 2 - Carton, 3 - Pallet, 4 - Millilitre, 5 - Litre, 4 - Kilogram, 5 - Tonne' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'StoreUnitOfMeasureCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'As defined by system code type ''UnitOfMeasure'': 0 - Each, 1 - Pack, 2 - Carton, 3 - Pallet, 4 - Millilitre, 5 - Litre, 4 - Kilogram, 5 - Tonne' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'DefaultPurchaseUnitOfMeasureCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of stored units created when a single purchase unit is received. This can differ by supplier.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProduct', @level2type=N'COLUMN',@level2name=N'DefaultPurchaseToStoreConversionQuantity'
GO
