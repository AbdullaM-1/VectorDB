USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountBillingItem](
	[AccountBillingItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[BillingReason] [int] NOT NULL,
	[BillingAmount] [money] NOT NULL,
	[BillingReference] [varchar](100) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
	[MessageId] [varchar](50) NULL,
	[PaymentType] [int] NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_AccountBillingItem] PRIMARY KEY CLUSTERED 
(
	[AccountBillingItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountBillingItem] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[AccountBillingItem]  WITH CHECK ADD  CONSTRAINT [FK_AccountBillingItem_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountBillingItem] CHECK CONSTRAINT [FK_AccountBillingItem_Accounts]
GO
