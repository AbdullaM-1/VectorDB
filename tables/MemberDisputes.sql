USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberDisputes](
	[DisputeId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[NotificationUtcDateTime] [datetime] NULL,
	[NotificationEmail] [varchar](300) NULL,
	[ResponseUtcDateTime] [datetime] NULL,
	[SentToPaymentProviderUtcDateTime] [datetime] NULL,
	[MemberNumber] [varchar](20) NULL,
	[DisputeReason] [varchar](300) NULL,
	[DisputeBankBsb] [varchar](10) NULL,
	[DisputeBankAccountNumber] [varchar](20) NULL,
	[TransactionAmount] [decimal](18, 2) NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionRef] [varchar](200) NULL,
	[TransactionDescription] [varchar](200) NULL,
	[AddedToGymBillingUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_MemberDisputes] PRIMARY KEY CLUSTERED 
(
	[DisputeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberDisputes]  WITH CHECK ADD  CONSTRAINT [FK_MemberDisputes_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberDisputes] CHECK CONSTRAINT [FK_MemberDisputes_Members]
GO
