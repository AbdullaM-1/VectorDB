USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMembershipTypeChangeHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChangeUtcDateTime] [datetime] NOT NULL,
	[ChangeLocalDateTime] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[FromMembershipTypeId] [int] NOT NULL,
	[ToMembershipTypeId] [int] NOT NULL,
	[MinimumTermDate] [datetime] NULL,
	[ActionedBy] [int] NULL,
	[ExpiryDate] [datetime] NULL,
 CONSTRAINT [PK_MemberMembershipTypeChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberMembershipTypeChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberMembershipTypeChangeHistory_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberMembershipTypeChangeHistory] CHECK CONSTRAINT [FK_MemberMembershipTypeChangeHistory_Members]
GO
ALTER TABLE [dbo].[MemberMembershipTypeChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberMembershipTypeChangeHistory_Staff] FOREIGN KEY([ActionedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberMembershipTypeChangeHistory] CHECK CONSTRAINT [FK_MemberMembershipTypeChangeHistory_Staff]
GO
