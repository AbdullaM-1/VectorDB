USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSupplierOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountSupplierId] [bigint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[PurchaseOrderNo] [nvarchar](100) NULL,
	[ReceivedDateUtc] [datetime] NULL,
	[ReceivedByStaffId] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_AccountSupplierOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountSupplierOrders] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[AccountSupplierOrders]  WITH CHECK ADD  CONSTRAINT [FK_AccountSupplierOrders_AccountSupplier_AccountSupplierId] FOREIGN KEY([AccountSupplierId])
REFERENCES [dbo].[AccountSupplier] ([AccountSupplierId])
GO
ALTER TABLE [dbo].[AccountSupplierOrders] CHECK CONSTRAINT [FK_AccountSupplierOrders_AccountSupplier_AccountSupplierId]
GO
ALTER TABLE [dbo].[AccountSupplierOrders]  WITH CHECK ADD  CONSTRAINT [FK_AccountSupplierOrders_Staff_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[AccountSupplierOrders] CHECK CONSTRAINT [FK_AccountSupplierOrders_Staff_CreatedBy]
GO
ALTER TABLE [dbo].[AccountSupplierOrders]  WITH CHECK ADD  CONSTRAINT [FK_AccountSupplierOrders_Staff_ReceivedBy] FOREIGN KEY([ReceivedByStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[AccountSupplierOrders] CHECK CONSTRAINT [FK_AccountSupplierOrders_Staff_ReceivedBy]
GO
