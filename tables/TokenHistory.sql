USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClubfitReference] [varchar](20) NOT NULL,
	[TokenProviderId] [int] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[Token] [varchar](100) NOT NULL,
	[Reference] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[BsbNumber1] [varchar](5) NULL,
	[BsbNumber2] [varchar](5) NULL,
	[AccountName] [varchar](150) NULL,
	[AccountNumber] [varchar](50) NULL,
	[CcNumber] [varchar](20) NULL,
	[CcNameOnCard] [varchar](150) NULL,
	[CcExpiryMonth] [int] NULL,
	[CcExpiryYear] [int] NULL,
	[EntityType] [int] NOT NULL,
 CONSTRAINT [PK_TokenHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TokenHistory] ADD  CONSTRAINT [DF_TokenHistory_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
