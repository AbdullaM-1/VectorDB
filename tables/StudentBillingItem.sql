USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBillingItem](
	[StudentBillingItemId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[BillingReason] [int] NOT NULL,
	[BillingAmount] [decimal](18, 2) NOT NULL,
	[BillingReference] [varchar](100) NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
	[MessageId] [varchar](50) NULL,
 CONSTRAINT [PK_StudentBillingItem] PRIMARY KEY CLUSTERED 
(
	[StudentBillingItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentBillingItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentBillingItem_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentBillingItem] CHECK CONSTRAINT [FK_StudentBillingItem_Students]
GO
