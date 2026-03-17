USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosTransaction](
	[PosTransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionUtcDateTime] [datetime] NOT NULL,
	[PosTransactionLocalDateTime] [datetime] NOT NULL,
	[StudentNumber] [nvarchar](50) NULL,
	[PosTransactionTotalIncTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalExTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalTax] [decimal](18, 2) NOT NULL,
	[StaffMemberId] [int] NOT NULL,
	[PrintFlag] [int] NOT NULL,
	[Till] [nvarchar](max) NULL,
	[PosTransactionRefId] [bigint] NULL,
	[TransactionType] [nvarchar](50) NULL,
	[RefundType] [varchar](10) NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[OutstandingBalance] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_StudentPosTransaction] PRIMARY KEY CLUSTERED 
(
	[PosTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPosTransaction] ADD  DEFAULT ('Sale') FOR [TransactionType]
GO
ALTER TABLE [dbo].[StudentPosTransaction] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[StudentPosTransaction] ADD  DEFAULT ((0)) FOR [OutstandingBalance]
GO
ALTER TABLE [dbo].[StudentPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransaction_Staff] FOREIGN KEY([StaffMemberId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentPosTransaction] CHECK CONSTRAINT [FK_StudentPosTransaction_Staff]
GO
ALTER TABLE [dbo].[StudentPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransaction_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentPosTransaction] CHECK CONSTRAINT [FK_StudentPosTransaction_Students]
GO
