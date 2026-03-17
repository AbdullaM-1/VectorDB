USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectVerificationCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[VerificationType] [varchar](50) NOT NULL,
	[VerificationCode] [nvarchar](500) NOT NULL,
	[ExpireOnUtc] [datetime] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ProspectVerificationCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectVerificationCode]  WITH CHECK ADD  CONSTRAINT [FK_ProspectVerificationCode_Prospect] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectVerificationCode] CHECK CONSTRAINT [FK_ProspectVerificationCode_Prospect]
GO
