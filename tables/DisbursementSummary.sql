USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisbursementSummary](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Reference] [nvarchar](200) NULL,
	[AccountTitle] [nvarchar](200) NULL,
	[BsbNumber] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CsvReportFileName] [nvarchar](100) NULL,
	[Provider] [varchar](20) NULL,
	[AccountId] [int] NOT NULL,
	[Department] [int] NOT NULL,
 CONSTRAINT [PK_DisbursementSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DisbursementSummary] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[DisbursementSummary] ADD  DEFAULT ((1)) FOR [Department]
GO
