USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberChangeAudit](
	[MemberChangeAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[ChangeDescription] [varchar](300) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[ChangeRequestedByName] [varchar](200) NOT NULL,
	[ChangeUTCDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberChangeAudit] PRIMARY KEY CLUSTERED 
(
	[MemberChangeAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberChangeAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberChangeAudit_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberChangeAudit] CHECK CONSTRAINT [FK_MemberChangeAudit_Members]
GO
