USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settlement](
	[SettlementID] [bigint] IDENTITY(1,1) NOT NULL,
	[SettlementUtcDateTime] [datetime] NOT NULL,
	[AmountInCents] [int] NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Remitter] [varchar](200) NOT NULL,
	[ClubfitIdentifier] [varchar](200) NOT NULL,
	[FromBankAccountId] [varchar](200) NOT NULL,
	[ToBankAccount] [varchar](200) NOT NULL,
	[RecipientContactId] [varchar](100) NOT NULL,
	[TransactionStatus] [varchar](200) NULL,
	[TransactionReference] [varchar](200) NULL,
	[TransactionType] [int] NOT NULL,
	[DepartmentType] [int] NOT NULL,
	[IdempotencyKey] [varchar](200) NOT NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeletedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_Settlement] PRIMARY KEY CLUSTERED 
(
	[SettlementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Settlement] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Settlement]  WITH CHECK ADD  CONSTRAINT [FK_Settlement_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Settlement] CHECK CONSTRAINT [FK_Settlement_Accounts]
GO
