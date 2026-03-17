USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTimesheet](
	[StaffTimesheetId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[ShiftStartDateTime] [datetime] NOT NULL,
	[ShiftEndDateTime] [datetime] NOT NULL,
	[ApprovedByStaffId] [int] NULL,
	[ApprovedDateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_StaffTimesheet] PRIMARY KEY CLUSTERED 
(
	[StaffTimesheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffTimesheet] ADD  CONSTRAINT [DF_StaffTimesheet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StaffTimesheet]  WITH CHECK ADD  CONSTRAINT [FK_StaffTimesheet_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffTimesheet] CHECK CONSTRAINT [FK_StaffTimesheet_Staff]
GO
ALTER TABLE [dbo].[StaffTimesheet]  WITH CHECK ADD  CONSTRAINT [FK_StaffTimesheet_Staff1] FOREIGN KEY([ApprovedByStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffTimesheet] CHECK CONSTRAINT [FK_StaffTimesheet_Staff1]
GO
