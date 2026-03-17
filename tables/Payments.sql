USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [int] NOT NULL,
	[payment_date] [smalldatetime] NOT NULL,
	[payment_amount] [decimal](18, 0) NOT NULL,
	[payment_card] [nvarchar](50) NOT NULL,
	[payment_account] [nvarchar](50) NOT NULL,
	[payment_card_expiry] [smalldatetime] NOT NULL,
	[payment_name] [nvarchar](50) NOT NULL,
	[payment_how_paid] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
