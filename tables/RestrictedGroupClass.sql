USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestrictedGroupClass](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MembershipTypeId] [int] NOT NULL,
	[ClassId] [int] NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[RestrictionType] [varchar](15) NOT NULL,
	[FrequencyType] [varchar](15) NULL,
	[NumberOfSession] [int] NULL,
	[ClassCategory] [int] NOT NULL,
 CONSTRAINT [PK_RestrictedGroupClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RestrictedGroupClass] ADD  DEFAULT ('Full') FOR [RestrictionType]
GO
ALTER TABLE [dbo].[RestrictedGroupClass] ADD  DEFAULT ((0)) FOR [ClassCategory]
GO
ALTER TABLE [dbo].[RestrictedGroupClass]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedGroupClasses_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[RestrictedGroupClass] CHECK CONSTRAINT [FK_RestrictedGroupClasses_Class]
GO
ALTER TABLE [dbo].[RestrictedGroupClass]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedGroupClasses_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[RestrictedGroupClass] CHECK CONSTRAINT [FK_RestrictedGroupClasses_MembershipTypes]
GO
