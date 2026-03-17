USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectAppointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[Summary] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[OutCome] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NULL,
	[LastUpdatedBy] [int] NOT NULL,
	[LastUpdatedUtc] [datetime] NULL,
	[IsConfirmed] [bit] NOT NULL,
	[LinkProspectCallId] [int] NULL,
	[IsTour] [bit] NOT NULL,
	[StaffId] [int] NULL,
 CONSTRAINT [PK_ProspectAppointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectAppointment] ADD  CONSTRAINT [DF_ProspectAppointment_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[ProspectAppointment] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[ProspectAppointment] ADD  DEFAULT ((1)) FOR [IsTour]
GO
ALTER TABLE [dbo].[ProspectAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ProspectAppointment_AssignedStaff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectAppointment] CHECK CONSTRAINT [FK_ProspectAppointment_AssignedStaff]
GO
ALTER TABLE [dbo].[ProspectAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ProspectAppointment_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectAppointment] CHECK CONSTRAINT [FK_ProspectAppointment_Prospects]
GO
ALTER TABLE [dbo].[ProspectAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ProspectAppointment_Staff] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectAppointment] CHECK CONSTRAINT [FK_ProspectAppointment_Staff]
GO
