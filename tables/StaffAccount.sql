USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAccount](
	[StaffAccountId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_StaffAccount] PRIMARY KEY CLUSTERED 
(
	[StaffAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffAccount]  WITH CHECK ADD  CONSTRAINT [FK_StaffAccount_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StaffAccount] CHECK CONSTRAINT [FK_StaffAccount_Accounts]
GO
ALTER TABLE [dbo].[StaffAccount]  WITH CHECK ADD  CONSTRAINT [FK_StaffAccount_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffAccount] CHECK CONSTRAINT [FK_StaffAccount_Staff]
GO
