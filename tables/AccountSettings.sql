USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSettings](
	[setting_id] [int] IDENTITY(1,1) NOT NULL,
	[setting_key] [varchar](50) NOT NULL,
	[setting_value] [varchar](500) NOT NULL,
	[setting_friendly_name] [varchar](150) NULL,
	[setting_accountid] [int] NOT NULL,
	[setting_bool] [bit] NULL,
 CONSTRAINT [PK_AccountSettings] PRIMARY KEY CLUSTERED 
(
	[setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
