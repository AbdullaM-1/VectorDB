USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[AttachmentName] [nvarchar](250) NULL,
	[AwsAttachmentName] [nvarchar](250) NULL,
	[AttachmentType] [nvarchar](250) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedUtc] [datetime] NULL,
 CONSTRAINT [PK_StaffAttachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffAttachments]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttachments_Staffs] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffAttachments] CHECK CONSTRAINT [FK_StaffAttachments_Staffs]
GO
