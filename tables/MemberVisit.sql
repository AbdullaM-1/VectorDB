USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberVisit](
	[MemberVisitId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[MembershipTypeId] [bigint] NULL,
	[NoOfVisit] [int] NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[UpdatedUTCDateTime] [datetime] NULL,
	[IsNotifiedSms] [bit] NOT NULL,
	[LastDateTimeUtcNotifiedSms] [datetime] NULL,
	[IsNotifiedEmail] [bit] NOT NULL,
	[LastDateTimeUtcNotifiedEmail] [datetime] NULL,
	[UpdatedById] [int] NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_MemberVisit] PRIMARY KEY CLUSTERED 
(
	[MemberVisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberVisit] ADD  DEFAULT ((0)) FOR [IsNotifiedSms]
GO
ALTER TABLE [dbo].[MemberVisit] ADD  DEFAULT ((0)) FOR [IsNotifiedEmail]
GO
ALTER TABLE [dbo].[MemberVisit]  WITH CHECK ADD  CONSTRAINT [FK_MemberVisit_Staff] FOREIGN KEY([UpdatedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberVisit] CHECK CONSTRAINT [FK_MemberVisit_Staff]
GO
