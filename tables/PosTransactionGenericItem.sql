USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosTransactionGenericItem](
	[PosTransactionId] [bigint] NOT NULL,
	[ItemDescription] [nvarchar](500) NOT NULL,
	[ItemAmount] [decimal](18, 2) NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[MembershipTypeId] [int] NULL,
	[PosTransactionGenericItemId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[DiscountType] [smallint] NOT NULL,
 CONSTRAINT [PK_PosTransactionGenericItem] PRIMARY KEY CLUSTERED 
(
	[PosTransactionGenericItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosTransactionGenericItem] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[PosTransactionGenericItem] ADD  DEFAULT ((2)) FOR [DiscountType]
GO
ALTER TABLE [dbo].[PosTransactionGenericItem]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionGenericItem_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[PosTransactionGenericItem] CHECK CONSTRAINT [FK_PosTransactionGenericItem_MembershipTypes]
GO
ALTER TABLE [dbo].[PosTransactionGenericItem]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionGenericItem_PosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[PosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[PosTransactionGenericItem] CHECK CONSTRAINT [FK_PosTransactionGenericItem_PosTransaction]
GO
