USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club_Number_Audit](
	[membernumber_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[last_membernumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Club_Number_Audit] PRIMARY KEY CLUSTERED 
(
	[membernumber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Club_Number_Audit]  WITH CHECK ADD  CONSTRAINT [FK_Club_Number_Audit_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Club_Number_Audit] CHECK CONSTRAINT [FK_Club_Number_Audit_Accounts]
GO
