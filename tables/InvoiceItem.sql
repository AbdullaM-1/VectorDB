USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceItem](
	[InvoiceItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[ItemCode] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Discount] [decimal](18, 0) NULL,
	[AccountType] [smallint] NOT NULL,
	[Amount] [money] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_InvoiceItem] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoiceItem] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_Invoice]
GO
