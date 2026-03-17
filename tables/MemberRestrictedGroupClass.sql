USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRestrictedGroupClass](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[ClassId] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[RestrictionType] [varchar](15) NOT NULL,
	[FrequencyType] [varchar](15) NULL,
	[NumberOfSession] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_MemberRestrictedGroupClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberRestrictedGroupClass] ADD  DEFAULT ('unlimited') FOR [RestrictionType]
GO
ALTER TABLE [dbo].[MemberRestrictedGroupClass]  WITH CHECK ADD  CONSTRAINT [FK_MemberRestrictedGroupClass_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberRestrictedGroupClass] CHECK CONSTRAINT [FK_MemberRestrictedGroupClass_Members]
GO
ALTER TABLE [dbo].[MemberRestrictedGroupClass]  WITH CHECK ADD  CONSTRAINT [FK_MemberRestrictedGroupClasses_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[MemberRestrictedGroupClass] CHECK CONSTRAINT [FK_MemberRestrictedGroupClasses_Class]
GO
