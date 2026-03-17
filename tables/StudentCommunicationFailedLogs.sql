USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCommunicationFailedLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[CommunicationType] [int] NOT NULL,
	[DateTimeUtcFailed] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[MobileOrEmail] [varchar](50) NULL,
 CONSTRAINT [PK_StudentCommunicationFailedLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCommunicationFailedLogs] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentCommunicationFailedLogs]  WITH CHECK ADD  CONSTRAINT [FK_StudentCommunicationFailedLogs_Student_StudentNumber] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentCommunicationFailedLogs] CHECK CONSTRAINT [FK_StudentCommunicationFailedLogs_Student_StudentNumber]
GO
