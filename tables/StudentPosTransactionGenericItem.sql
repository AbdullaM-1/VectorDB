USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosTransactionGenericItem](
	[PosTransactionId] [bigint] NOT NULL,
	[ItemDescription] [nvarchar](500) NOT NULL,
	[ItemAmount] [decimal](18, 2) NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[MembershipTypeId] [int] NULL,
	[StudentPosTransactionGenericItemId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_StudentPosTransactionGenericItem] PRIMARY KEY CLUSTERED 
(
	[StudentPosTransactionGenericItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPosTransactionGenericItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransactionGenericItem_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[StudentPosTransactionGenericItem] CHECK CONSTRAINT [FK_StudentPosTransactionGenericItem_MembershipTypes]
GO
ALTER TABLE [dbo].[StudentPosTransactionGenericItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransactionGenericItem_PosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentPosTransactionGenericItem] CHECK CONSTRAINT [FK_StudentPosTransactionGenericItem_PosTransaction]
GO
