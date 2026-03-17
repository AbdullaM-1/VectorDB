USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffShift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[UpdatedByUsername] [varchar](50) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_StaffShift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffShift]  WITH CHECK ADD  CONSTRAINT [FK_StaffShift_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffShift] CHECK CONSTRAINT [FK_StaffShift_Staff]
GO
