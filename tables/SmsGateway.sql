USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmsGateway](
	[SmsGatewayId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](500) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[GatewayUrl] [nvarchar](1000) NULL,
	[DedicatedNumber] [varchar](20) NULL,
 CONSTRAINT [PK_SmsGateway] PRIMARY KEY CLUSTERED 
(
	[SmsGatewayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SmsGateway] ADD  CONSTRAINT [DF_SmsGateway_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
