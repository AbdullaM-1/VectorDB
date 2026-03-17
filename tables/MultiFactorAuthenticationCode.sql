USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiFactorAuthenticationCode](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NOT NULL,
	[MfaProvider] [int] NOT NULL,
	[UserReference] [varchar](100) NOT NULL,
	[MfaCode] [varchar](50) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[ExpiredOnUtc] [datetime] NOT NULL,
	[Xoken] [varchar](200) NULL,
 CONSTRAINT [PK_MultiFactorAuthenticationCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
