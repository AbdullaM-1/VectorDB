USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenProvider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[UserKey] [varchar](100) NOT NULL,
	[PassPhrase] [varchar](100) NOT NULL,
	[EncryptionKeyCreatedUtcDateTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[EndpointSecret] [varchar](100) NULL,
	[EndpointUrl] [varchar](100) NULL,
	[EndpointKey] [varchar](50) NULL,
 CONSTRAINT [PK_TokenProvider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
