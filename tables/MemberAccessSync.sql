USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAccessSync](
	[MemberAccessSyncId] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_MemberAccessSync] PRIMARY KEY CLUSTERED 
(
	[MemberAccessSyncId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberAccessSync]  WITH CHECK ADD  CONSTRAINT [FK_MemberAccessSync_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MemberAccessSync] CHECK CONSTRAINT [FK_MemberAccessSync_Accounts]
GO
ALTER TABLE [dbo].[MemberAccessSync]  WITH CHECK ADD  CONSTRAINT [FK_MemberAccessSync_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberAccessSync] CHECK CONSTRAINT [FK_MemberAccessSync_Members]
GO
