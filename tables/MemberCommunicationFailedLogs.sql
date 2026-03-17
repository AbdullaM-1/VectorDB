USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCommunicationFailedLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[CommunicationType] [int] NOT NULL,
	[DateTimeUtcFailed] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[MobileOrEmail] [varchar](50) NULL,
 CONSTRAINT [PK_MemberCommunicationFailedLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberCommunicationFailedLogs] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberCommunicationFailedLogs]  WITH CHECK ADD  CONSTRAINT [FK_MemberCommunicationFailedLogs_Member_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberCommunicationFailedLogs] CHECK CONSTRAINT [FK_MemberCommunicationFailedLogs_Member_MemberNumber]
GO
