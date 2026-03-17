USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFamilyLink](
	[MemberFamilyLinkId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[LinkedMemberNumber] [varchar](20) NULL,
	[MemberRelation] [nvarchar](50) NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[PayerMemberNumber] [varchar](20) NULL,
	[AmountAddedToPayer] [decimal](9, 2) NULL,
	[AdjustmentAmount] [decimal](9, 2) NULL,
	[AdjustmentReason] [varchar](500) NULL,
 CONSTRAINT [PK_MemberFamilyLink] PRIMARY KEY CLUSTERED 
(
	[MemberFamilyLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberFamilyLink]  WITH CHECK ADD  CONSTRAINT [FK_MemberFamilyLink_Member_LinkedMemberNumber] FOREIGN KEY([LinkedMemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFamilyLink] CHECK CONSTRAINT [FK_MemberFamilyLink_Member_LinkedMemberNumber]
GO
ALTER TABLE [dbo].[MemberFamilyLink]  WITH CHECK ADD  CONSTRAINT [FK_MemberFamilyLink_Member_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFamilyLink] CHECK CONSTRAINT [FK_MemberFamilyLink_Member_MemberNumber]
GO
ALTER TABLE [dbo].[MemberFamilyLink]  WITH CHECK ADD  CONSTRAINT [FK_MemberFamilyLink_PayerMemberNumber_Members_member_number] FOREIGN KEY([PayerMemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFamilyLink] CHECK CONSTRAINT [FK_MemberFamilyLink_PayerMemberNumber_Members_member_number]
GO
