USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectAttachment](
	[ProspectAttachmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[AttachmentName] [nvarchar](250) NULL,
	[AwsAttachmentName] [nvarchar](250) NULL,
	[AttachmentType] [nvarchar](250) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedUtc] [datetime] NULL,
 CONSTRAINT [PK_ProspectAttachment] PRIMARY KEY CLUSTERED 
(
	[ProspectAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectAttachment]  WITH CHECK ADD  CONSTRAINT [FK_ProspectAttachment_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProspectAttachment] CHECK CONSTRAINT [FK_ProspectAttachment_Prospects]
GO
