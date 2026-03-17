USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosTransactionAudit](
	[PosTransactionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[PosTransactionUtcDateTime] [datetime] NOT NULL,
	[PosTransactionLocalDateTime] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[PosTransactionTotalIncTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalExTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalTax] [decimal](18, 2) NOT NULL,
	[StaffMemberId] [int] NOT NULL,
	[PrintFlag] [int] NULL,
	[ProductId] [bigint] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemTaxAmount] [decimal](18, 2) NOT NULL,
	[ItemPriceExTax] [decimal](18, 2) NOT NULL,
	[ItemPriceIncTax] [decimal](18, 2) NOT NULL,
	[PaymentType] [varchar](100) NULL,
	[CCNumber] [varchar](25) NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[ReasonForDiscount] [nvarchar](1000) NULL,
	[ItemType] [int] NOT NULL,
	[PosTransactionItemId] [bigint] NOT NULL,
	[AuditPosType] [int] NOT NULL,
	[SalesPersonStaffId] [int] NULL,
 CONSTRAINT [PK_PosTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[PosTransactionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosTransactionAudit] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[PosTransactionAudit] ADD  CONSTRAINT [DF_PosTransactionAudit_ItemType]  DEFAULT ((0)) FOR [ItemType]
GO
ALTER TABLE [dbo].[PosTransactionAudit] ADD  DEFAULT ((0)) FOR [PosTransactionItemId]
GO
ALTER TABLE [dbo].[PosTransactionAudit] ADD  DEFAULT ((0)) FOR [AuditPosType]
GO
ALTER TABLE [dbo].[PosTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionAudit_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[PosTransactionAudit] CHECK CONSTRAINT [FK_PosTransactionAudit_Members]
GO
ALTER TABLE [dbo].[PosTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionAudit_POSTransactionId] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[PosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[PosTransactionAudit] CHECK CONSTRAINT [FK_PosTransactionAudit_POSTransactionId]
GO
ALTER TABLE [dbo].[PosTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionAudit_Staff] FOREIGN KEY([StaffMemberId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PosTransactionAudit] CHECK CONSTRAINT [FK_PosTransactionAudit_Staff]
GO
ALTER TABLE [dbo].[PosTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersonStaff_PosTransactionAudits_SalesPersonStaffId] FOREIGN KEY([SalesPersonStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PosTransactionAudit] CHECK CONSTRAINT [FK_SalesPersonStaff_PosTransactionAudits_SalesPersonStaffId]
GO
