USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialTagMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [bigint] NOT NULL,
	[TagName] [varchar](200) NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SocialTagMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SocialTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_SocialTagMapping_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[SocialTagMapping] CHECK CONSTRAINT [FK_SocialTagMapping_Accounts]
GO
