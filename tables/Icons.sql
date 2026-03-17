USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icons](
	[IconId] [int] IDENTITY(1,1) NOT NULL,
	[IconName] [nvarchar](255) NOT NULL,
	[FileStore] [nvarchar](max) NOT NULL,
	[FileType] [nvarchar](50) NOT NULL,
	[FileSize] [int] NOT NULL,
	[UploadedBy] [int] NOT NULL,
	[UploadedDate] [datetime] NULL,
	[SystemPart] [nvarchar](100) NULL,
	[ReferenceId] [int] NULL,
	[AccountId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Icons] PRIMARY KEY CLUSTERED 
(
	[IconId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Icons] ADD  DEFAULT (getdate()) FOR [UploadedDate]
GO
ALTER TABLE [dbo].[Icons] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_AccountId]
GO
ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_StaffId] FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_StaffId]
GO
