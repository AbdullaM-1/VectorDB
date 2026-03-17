USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimClassScheduleTerm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[TermId] [bigint] NOT NULL,
	[LinkSwimScheduleIds] [nvarchar](100) NULL,
 CONSTRAINT [PK_SwimClassScheduleTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimClassScheduleTerm]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleTerm_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[SwimClassScheduleTerm] CHECK CONSTRAINT [FK_SwimClassScheduleTerm_SwimClassSchedule]
GO
ALTER TABLE [dbo].[SwimClassScheduleTerm]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleTerm_SwimTerm] FOREIGN KEY([TermId])
REFERENCES [dbo].[SwimTerm] ([TermId])
GO
ALTER TABLE [dbo].[SwimClassScheduleTerm] CHECK CONSTRAINT [FK_SwimClassScheduleTerm_SwimTerm]
GO
