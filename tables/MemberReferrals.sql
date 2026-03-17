USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberReferrals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferredByMemberNumber] [varchar](20) NOT NULL,
	[CreatedReferralProspectNumber] [varchar](10) NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberReferrals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberReferrals] ADD  CONSTRAINT [DF_MemberReferrals_CreatedDateUtc]  DEFAULT (getutcdate()) FOR [CreatedDateUtc]
GO
ALTER TABLE [dbo].[MemberReferrals]  WITH CHECK ADD  CONSTRAINT [FK_MemberReferrals_Prospects_ProspectNumber] FOREIGN KEY([CreatedReferralProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[MemberReferrals] CHECK CONSTRAINT [FK_MemberReferrals_Prospects_ProspectNumber]
GO
