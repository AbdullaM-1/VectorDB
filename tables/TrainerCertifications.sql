USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerCertifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[CertificationId] [int] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[AttachmentName] [nvarchar](250) NULL,
	[AwsAttachmentName] [nvarchar](250) NULL,
	[AttachmentType] [nvarchar](250) NULL,
 CONSTRAINT [PK_TrainerCertifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerCertifications]  WITH CHECK ADD  CONSTRAINT [FK_TrainerCertifications_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerCertifications] CHECK CONSTRAINT [FK_TrainerCertifications_Trainer]
GO
