USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTasks](
	[StudentTaskId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[StudentTaskDateUTC] [smalldatetime] NULL,
	[StudentTaskDetail] [nvarchar](max) NULL,
	[StudentTasksAccountId] [int] NULL,
	[Status] [smallint] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CompletedBy] [int] NULL,
	[DueDateLocal] [datetime] NULL,
 CONSTRAINT [PK_StudentTasks] PRIMARY KEY CLUSTERED 
(
	[StudentTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentTasks]  WITH CHECK ADD  CONSTRAINT [FK_StudentTasks_Accounts] FOREIGN KEY([StudentTasksAccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StudentTasks] CHECK CONSTRAINT [FK_StudentTasks_Accounts]
GO
ALTER TABLE [dbo].[StudentTasks]  WITH CHECK ADD  CONSTRAINT [FK_StudentTasks_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentTasks] CHECK CONSTRAINT [FK_StudentTasks_Students]
GO
