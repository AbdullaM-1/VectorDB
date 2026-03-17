USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[AccountId] [int] NULL,
	[ReportId] [uniqueidentifier] NOT NULL,
	[CreatedOnUtc] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_StaffReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffReports] ADD  DEFAULT (getutcdate()) FOR [CreatedOnUtc]
GO
ALTER TABLE [dbo].[StaffReports]  WITH CHECK ADD  CONSTRAINT [FK_StaffReports_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StaffReports] CHECK CONSTRAINT [FK_StaffReports_Account_AccountId]
GO
ALTER TABLE [dbo].[StaffReports]  WITH CHECK ADD  CONSTRAINT [FK_StaffReports_Staff_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffReports] CHECK CONSTRAINT [FK_StaffReports_Staff_StaffId]
GO
