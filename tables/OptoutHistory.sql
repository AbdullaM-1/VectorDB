USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptoutHistory](
	[OptoutHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[StaffId] [int] NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ProspectNumber] [varchar](10) NULL,
	[PerformedByTypeId] [int] NOT NULL,
	[OptoutType] [int] NOT NULL,
	[StudentNumber] [nvarchar](50) NULL,
	[MessageId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OptoutHistory] PRIMARY KEY CLUSTERED 
(
	[OptoutHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OptoutHistory] ADD  DEFAULT ((0)) FOR [OptoutType]
GO
ALTER TABLE [dbo].[OptoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_OptoutHistory_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[OptoutHistory] CHECK CONSTRAINT [FK_OptoutHistory_Members]
GO
ALTER TABLE [dbo].[OptoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_OptoutHistory_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[OptoutHistory] CHECK CONSTRAINT [FK_OptoutHistory_Prospects]
GO
ALTER TABLE [dbo].[OptoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_OptoutHistory_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[OptoutHistory] CHECK CONSTRAINT [FK_OptoutHistory_Staff]
GO
ALTER TABLE [dbo].[OptoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_OptoutHistory_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[OptoutHistory] CHECK CONSTRAINT [FK_OptoutHistory_Students]
GO
