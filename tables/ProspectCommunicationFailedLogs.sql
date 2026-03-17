USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectCommunicationFailedLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[CommunicationType] [int] NOT NULL,
	[DateTimeUtcFailed] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[MobileOrEmail] [varchar](50) NULL,
 CONSTRAINT [PK_ProspectCommunicationFailedLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectCommunicationFailedLogs] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProspectCommunicationFailedLogs]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCommunicationFailedLogs_Prospect_ProspectNumber] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectCommunicationFailedLogs] CHECK CONSTRAINT [FK_ProspectCommunicationFailedLogs_Prospect_ProspectNumber]
GO
