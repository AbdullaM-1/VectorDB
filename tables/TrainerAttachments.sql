USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[AttachmentName] [nvarchar](250) NULL,
	[AwsAttachmentName] [nvarchar](250) NULL,
	[AttachmentType] [nvarchar](250) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedUtc] [datetime] NULL,
 CONSTRAINT [PK_TrainerAttachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerAttachments]  WITH CHECK ADD  CONSTRAINT [FK_TrainerAttachments_Trainers] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerAttachments] CHECK CONSTRAINT [FK_TrainerAttachments_Trainers]
GO
