USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplateAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateId] [int] NOT NULL,
	[AttachmentPath] [varchar](1000) NOT NULL,
	[DateTimeCreatedUtc] [datetime] NOT NULL,
	[AttachmentFilename] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EmailTemplateAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplateAttachments]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateAttachments_MarketingEmailTemplate] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[MarketingEmailTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[EmailTemplateAttachments] CHECK CONSTRAINT [FK_EmailTemplateAttachments_MarketingEmailTemplate]
GO
