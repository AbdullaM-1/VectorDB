USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttachment](
	[StudentAttachmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[AttachmentName] [nvarchar](250) NULL,
	[AwsAttachmentName] [nvarchar](250) NULL,
	[AttachmentType] [nvarchar](250) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedUtc] [datetime] NULL,
 CONSTRAINT [PK_StudentAttachment] PRIMARY KEY CLUSTERED 
(
	[StudentAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentAttachment]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttachment_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentAttachment] CHECK CONSTRAINT [FK_StudentAttachment_Students]
GO
