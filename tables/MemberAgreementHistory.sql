USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAgreementHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[AwsFileKey] [nvarchar](250) NOT NULL,
	[DateTimeCreatedUtc] [datetime] NOT NULL,
	[MembershipTypeName] [varchar](100) NOT NULL,
	[MembershipTypeId] [int] NOT NULL,
 CONSTRAINT [PK_MemberAgreementHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberAgreementHistory] ADD  DEFAULT ('') FOR [MembershipTypeName]
GO
ALTER TABLE [dbo].[MemberAgreementHistory]  WITH CHECK ADD  CONSTRAINT [FK_MemberAgreementHistory_Members_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MemberAgreementHistory] CHECK CONSTRAINT [FK_MemberAgreementHistory_Members_MemberNumber]
GO
