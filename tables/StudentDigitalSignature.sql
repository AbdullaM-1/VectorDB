USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDigitalSignature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[Signature] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StudentDigitalSignature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentDigitalSignature]  WITH CHECK ADD  CONSTRAINT [FK_StudentDigitalSignature_StudentDigitalSignature] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentDigitalSignature] CHECK CONSTRAINT [FK_StudentDigitalSignature_StudentDigitalSignature]
GO
