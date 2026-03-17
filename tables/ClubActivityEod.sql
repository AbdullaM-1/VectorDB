USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClubActivityEod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ActivityLocalDateTime] [datetime] NOT NULL,
	[MembersArchived] [int] NOT NULL,
	[MembersSuspended] [int] NOT NULL,
	[ActiveMemberCount] [int] NOT NULL,
	[MemberRenewals] [int] NOT NULL,
	[POSTakings] [decimal](18, 0) NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDateUtc] [datetime] NOT NULL,
	[POSReferral] [int] NOT NULL,
	[PossiblePifRenewals] [int] NOT NULL,
	[ActualPifRenewalsSold] [int] NOT NULL,
	[ActualDbMembers] [int] NOT NULL,
 CONSTRAINT [PK_ClubActivityEod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClubActivityEod] ADD  DEFAULT ((0)) FOR [POSReferral]
GO
ALTER TABLE [dbo].[ClubActivityEod] ADD  DEFAULT ((0)) FOR [PossiblePifRenewals]
GO
ALTER TABLE [dbo].[ClubActivityEod] ADD  DEFAULT ((0)) FOR [ActualPifRenewalsSold]
GO
ALTER TABLE [dbo].[ClubActivityEod] ADD  DEFAULT ((0)) FOR [ActualDbMembers]
GO
ALTER TABLE [dbo].[ClubActivityEod]  WITH CHECK ADD  CONSTRAINT [FK_ClubActivityEod_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[ClubActivityEod] CHECK CONSTRAINT [FK_ClubActivityEod_Accounts]
GO
ALTER TABLE [dbo].[ClubActivityEod]  WITH CHECK ADD  CONSTRAINT [FK_ClubActivityEod_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ClubActivityEod] CHECK CONSTRAINT [FK_ClubActivityEod_Staff]
GO
