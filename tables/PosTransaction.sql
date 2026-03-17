USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosTransaction](
	[PosTransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionUtcDateTime] [datetime] NOT NULL,
	[PosTransactionLocalDateTime] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[PosTransactionTotalIncTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalExTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalTax] [decimal](18, 2) NOT NULL,
	[StaffMemberId] [int] NOT NULL,
	[PrintFlag] [int] NULL,
	[Till] [nvarchar](max) NULL,
	[PosTransactionRefId] [bigint] NULL,
	[TransactionType] [nvarchar](50) NULL,
	[RefundType] [varchar](10) NULL,
	[OutstandingBalance] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DateTimeUtcDeleted] [datetime] NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_PosTransaction] PRIMARY KEY CLUSTERED 
(
	[PosTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosTransaction] ADD  DEFAULT ('Sale') FOR [TransactionType]
GO
ALTER TABLE [dbo].[PosTransaction] ADD  DEFAULT ((0)) FOR [OutstandingBalance]
GO
ALTER TABLE [dbo].[PosTransaction] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PosTransaction_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[PosTransaction] CHECK CONSTRAINT [FK_PosTransaction_Accounts_AccountId]
GO
ALTER TABLE [dbo].[PosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PosTransaction_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PosTransaction] CHECK CONSTRAINT [FK_PosTransaction_DeletedBy]
GO
ALTER TABLE [dbo].[PosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PosTransaction_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[PosTransaction] CHECK CONSTRAINT [FK_PosTransaction_Members]
GO
ALTER TABLE [dbo].[PosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PosTransaction_Staff] FOREIGN KEY([StaffMemberId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PosTransaction] CHECK CONSTRAINT [FK_PosTransaction_Staff]
GO
