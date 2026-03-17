USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSubscriptionAudit](
	[MemberSubscriptionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[MemberSubscriptionId] [bigint] NULL,
	[MemberSubscriptionAuditStatus] [smallint] NOT NULL,
	[TrainerBookingId] [int] NOT NULL,
	[PaymentVoid] [bit] NOT NULL,
	[NotCompeletedReason] [nvarchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedUtcDateTime] [datetime] NULL,
	[IsSubscriptionRenewed] [bit] NOT NULL,
	[DateRenewedUtc] [datetime] NULL,
	[ClassScheduleMobileAccountId] [int] NOT NULL,
 CONSTRAINT [PK_MemberSubscriptionAudit] PRIMARY KEY CLUSTERED 
(
	[MemberSubscriptionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] ADD  CONSTRAINT [DF_MemberSubscriptionAudit_IsCompleted]  DEFAULT ((0)) FOR [MemberSubscriptionAuditStatus]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] ADD  CONSTRAINT [DF_MemberSubscriptionAudit_PaymentVoid]  DEFAULT ((0)) FOR [PaymentVoid]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] ADD  CONSTRAINT [DF_MemberSubscriptionAudit_CreatedUtcDateTime]  DEFAULT (getdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] ADD  DEFAULT ((0)) FOR [IsSubscriptionRenewed]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] ADD  DEFAULT ((0)) FOR [ClassScheduleMobileAccountId]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscriptionAudit_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] CHECK CONSTRAINT [FK_MemberSubscriptionAudit_Members]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscriptionAudit_MemberSubscription] FOREIGN KEY([MemberSubscriptionId])
REFERENCES [dbo].[MemberSubscription] ([MemberSubscriptionId])
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] CHECK CONSTRAINT [FK_MemberSubscriptionAudit_MemberSubscription]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscriptionAudit_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] CHECK CONSTRAINT [FK_MemberSubscriptionAudit_Staff]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscriptionAudit_Staff1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] CHECK CONSTRAINT [FK_MemberSubscriptionAudit_Staff1]
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscriptionAudit_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[MemberSubscriptionAudit] CHECK CONSTRAINT [FK_MemberSubscriptionAudit_Trainer]
GO
