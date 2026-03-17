USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentArrears](
	[StudentArrearsId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[TransactionFailedUtcDateTime] [datetime] NOT NULL,
	[ArrearsAmount] [money] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_StudentArrears] PRIMARY KEY CLUSTERED 
(
	[StudentArrearsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentArrears]  WITH CHECK ADD  CONSTRAINT [FK_StudentArrears_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentArrears] CHECK CONSTRAINT [FK_StudentArrears_Students]
GO
