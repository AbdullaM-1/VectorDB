USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTaskAttachment](
	[StaffTaskAttachmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Filename] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[TaskId] [bigint] NOT NULL,
	[UploaderId] [uniqueidentifier] NOT NULL,
	[UtcDateTimeUploaded] [datetime] NOT NULL,
 CONSTRAINT [PK_StaffTaskAttachment] PRIMARY KEY CLUSTERED 
(
	[StaffTaskAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffTaskAttachment]  WITH CHECK ADD  CONSTRAINT [FK_Users_StaffTaskAttachment_Uploader] FOREIGN KEY([UploaderId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[StaffTaskAttachment] CHECK CONSTRAINT [FK_Users_StaffTaskAttachment_Uploader]
GO
