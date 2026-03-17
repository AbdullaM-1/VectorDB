USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePageAction](
	[RolePageActionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[PageActionId] [int] NOT NULL,
 CONSTRAINT [PK_RolePageAction] PRIMARY KEY CLUSTERED 
(
	[RolePageActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolePageAction]  WITH CHECK ADD  CONSTRAINT [FK_RolePageAction_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolePageAction] CHECK CONSTRAINT [FK_RolePageAction_aspnet_Roles]
GO
ALTER TABLE [dbo].[RolePageAction]  WITH CHECK ADD  CONSTRAINT [FK_RolePageAction_PageAction] FOREIGN KEY([PageActionId])
REFERENCES [dbo].[PageAction] ([PageActionId])
GO
ALTER TABLE [dbo].[RolePageAction] CHECK CONSTRAINT [FK_RolePageAction_PageAction]
GO
