USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup_Type_Items](
	[Lookup_Type_ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Lookup_TypeId] [int] NULL,
	[Lookup_Type_ItemDesc] [nvarchar](100) NULL,
	[Lookup_Type_ItemIsActive] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[IsShowOnline] [bit] NOT NULL,
 CONSTRAINT [PK_Lookup_Type_Items] PRIMARY KEY CLUSTERED 
(
	[Lookup_Type_ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lookup_Type_Items] ADD  DEFAULT ((1)) FOR [Lookup_Type_ItemIsActive]
GO
ALTER TABLE [dbo].[Lookup_Type_Items] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[Lookup_Type_Items] ADD  DEFAULT ((1)) FOR [IsShowOnline]
GO
ALTER TABLE [dbo].[Lookup_Type_Items]  WITH CHECK ADD  CONSTRAINT [FK_Lookup_Type_Items_Lookup_Types] FOREIGN KEY([Lookup_TypeId])
REFERENCES [dbo].[Lookup_Types] ([Lookup_TypeId])
GO
ALTER TABLE [dbo].[Lookup_Type_Items] CHECK CONSTRAINT [FK_Lookup_Type_Items_Lookup_Types]
GO
