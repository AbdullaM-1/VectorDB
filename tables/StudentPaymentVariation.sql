USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentVariation](
	[StudentPaymentVarianceId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [varchar](10) NOT NULL,
	[StudentPaymentTemplateId] [int] NOT NULL,
	[StartDateLocal] [datetime] NOT NULL,
	[EndDateLocal] [datetime] NULL,
	[VaryAmountTo] [money] NOT NULL,
	[VaryAmountFrom] [decimal](18, 2) NOT NULL,
	[IsUfn] [bit] NOT NULL,
	[IsOverride] [bit] NULL,
	[Reasons] [nvarchar](200) NULL,
 CONSTRAINT [PK_StudentPaymentVariation] PRIMARY KEY CLUSTERED 
(
	[StudentPaymentVarianceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentVariation]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentVariation_StudentPaymentTemplates] FOREIGN KEY([StudentPaymentTemplateId])
REFERENCES [dbo].[StudentPaymentTemplates] ([Id])
GO
ALTER TABLE [dbo].[StudentPaymentVariation] CHECK CONSTRAINT [FK_StudentPaymentVariation_StudentPaymentTemplates]
GO
