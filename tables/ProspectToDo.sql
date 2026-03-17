USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectToDo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[Summary] [nvarchar](100) NOT NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NULL,
	[LastUpdatedBy] [int] NOT NULL,
	[LastUpdatedUtc] [datetime] NULL,
 CONSTRAINT [PK_ProspectToDo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectToDo] ADD  CONSTRAINT [DF_ProspectToDo_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[ProspectToDo]  WITH CHECK ADD  CONSTRAINT [FK_ProspectToDo_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectToDo] CHECK CONSTRAINT [FK_ProspectToDo_Prospects]
GO
ALTER TABLE [dbo].[ProspectToDo]  WITH CHECK ADD  CONSTRAINT [FK_ProspectToDo_staffs] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectToDo] CHECK CONSTRAINT [FK_ProspectToDo_staffs]
GO
