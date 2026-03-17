USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTypeAccount](
	[MembershipTypeAccountId] [int] IDENTITY(1,1) NOT NULL,
	[MembershipTypeId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[InClubOnlineSortOrder] [int] NOT NULL,
	[OnlineSortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MembershipTypeAccount] PRIMARY KEY CLUSTERED 
(
	[MembershipTypeAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MembershipTypeAccount] ADD  DEFAULT ((0)) FOR [InClubOnlineSortOrder]
GO
ALTER TABLE [dbo].[MembershipTypeAccount] ADD  DEFAULT ((0)) FOR [OnlineSortOrder]
GO
ALTER TABLE [dbo].[MembershipTypeAccount]  WITH CHECK ADD  CONSTRAINT [FK_MembershipTypeAccount_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MembershipTypeAccount] CHECK CONSTRAINT [FK_MembershipTypeAccount_Accounts]
GO
ALTER TABLE [dbo].[MembershipTypeAccount]  WITH CHECK ADD  CONSTRAINT [FK_MembershipTypeAccount_MembershipTypeAccount] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[MembershipTypeAccount] CHECK CONSTRAINT [FK_MembershipTypeAccount_MembershipTypeAccount]
GO
