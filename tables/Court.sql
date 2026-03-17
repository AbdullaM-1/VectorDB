USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[CourtID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Schedule] [nvarchar](max) NULL,
	[Location] [nvarchar](50) NULL,
	[AccountId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Court] PRIMARY KEY CLUSTERED 
(
	[CourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Court] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FK_Court_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FK_Court_Accounts_AccountId]
GO
