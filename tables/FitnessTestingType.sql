USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FitnessTestingType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryLookUpItemId] [int] NOT NULL,
	[TypeName] [varchar](100) NOT NULL,
	[Metric] [varchar](50) NULL,
 CONSTRAINT [PK_FitnessTestingType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FitnessTestingType]  WITH CHECK ADD  CONSTRAINT [FK_FitnessTestingType_LookupTypeItem] FOREIGN KEY([CategoryLookUpItemId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[FitnessTestingType] CHECK CONSTRAINT [FK_FitnessTestingType_LookupTypeItem]
GO
