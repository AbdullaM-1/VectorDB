USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPosTransaction](
	[PosTransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionUtcDateTime] [datetime] NOT NULL,
	[PosTransactionLocalDateTime] [datetime] NOT NULL,
	[ProspectNumber] [varchar](10) NULL,
	[PosTransactionTotalIncTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalExTax] [decimal](18, 2) NOT NULL,
	[PosTransactionTotalTax] [decimal](18, 2) NOT NULL,
	[StaffMemberId] [int] NOT NULL,
	[PrintFlag] [int] NULL,
	[Till] [nvarchar](500) NULL,
	[PosTransactionRefId] [bigint] NULL,
	[TransactionType] [nvarchar](50) NULL,
	[RefundType] [varchar](10) NULL,
	[OutstandingBalance] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DateTimeUtcDeleted] [datetime] NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_ProspectPosTransaction] PRIMARY KEY CLUSTERED 
(
	[PosTransactionId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPosTransaction_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[ProspectPosTransaction] CHECK CONSTRAINT [FK_ProspectPosTransaction_Accounts_AccountId]
GO
ALTER TABLE [dbo].[ProspectPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPosTransaction_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectPosTransaction] CHECK CONSTRAINT [FK_ProspectPosTransaction_DeletedBy]
GO
ALTER TABLE [dbo].[ProspectPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPosTransaction_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectPosTransaction] CHECK CONSTRAINT [FK_ProspectPosTransaction_Prospects]
GO
ALTER TABLE [dbo].[ProspectPosTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPosTransaction_Staff] FOREIGN KEY([StaffMemberId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectPosTransaction] CHECK CONSTRAINT [FK_ProspectPosTransaction_Staff]
GO
