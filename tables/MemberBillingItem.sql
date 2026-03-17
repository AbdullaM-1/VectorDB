USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberBillingItem](
	[MemberBillingItemId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[BillingReason] [int] NOT NULL,
	[BillingAmount] [decimal](18, 2) NOT NULL,
	[BillingReference] [varchar](100) NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
	[MessageId] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[MemberKidId] [int] NULL,
 CONSTRAINT [PK_MemberBillingItem] PRIMARY KEY CLUSTERED 
(
	[MemberBillingItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberBillingItem] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberBillingItem]  WITH CHECK ADD  CONSTRAINT [FK_MemberBillingItem__MemberKid_MemberKidId] FOREIGN KEY([MemberKidId])
REFERENCES [dbo].[MemberKid] ([MemberKidId])
GO
ALTER TABLE [dbo].[MemberBillingItem] CHECK CONSTRAINT [FK_MemberBillingItem__MemberKid_MemberKidId]
GO
ALTER TABLE [dbo].[MemberBillingItem]  WITH CHECK ADD  CONSTRAINT [FK_MemberBillingItem_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberBillingItem] CHECK CONSTRAINT [FK_MemberBillingItem_Members]
GO
