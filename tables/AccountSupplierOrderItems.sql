USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSupplierOrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountProductId] [bigint] NOT NULL,
	[AccountSupplierOrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_AccountSupplierOrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountSupplierOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_AccountProduct_AccountSupplierOrderItems_AccountProductId] FOREIGN KEY([AccountProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
GO
ALTER TABLE [dbo].[AccountSupplierOrderItems] CHECK CONSTRAINT [FK_AccountProduct_AccountSupplierOrderItems_AccountProductId]
GO
ALTER TABLE [dbo].[AccountSupplierOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_AccountSupplierOrderItems_AccountSupplierOrder_AccountSupplierOrderId] FOREIGN KEY([AccountSupplierOrderId])
REFERENCES [dbo].[AccountSupplierOrders] ([Id])
GO
ALTER TABLE [dbo].[AccountSupplierOrderItems] CHECK CONSTRAINT [FK_AccountSupplierOrderItems_AccountSupplierOrder_AccountSupplierOrderId]
GO
