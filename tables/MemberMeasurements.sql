USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMeasurements](
	[MemberMeasurementsId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[DateMeasuredLocal] [datetime] NOT NULL,
	[Weight] [decimal](18, 6) NOT NULL,
	[LeftChest] [decimal](18, 0) NULL,
	[LeftArm] [decimal](18, 0) NULL,
	[LeftWaist] [decimal](18, 0) NULL,
	[LeftHips] [decimal](18, 0) NULL,
	[LeftThigh] [decimal](18, 0) NULL,
	[LeftCalf] [decimal](18, 0) NULL,
	[RightSubscalpular] [decimal](18, 0) NULL,
	[RightTriCheps] [decimal](18, 0) NULL,
	[RightBiceps] [decimal](18, 0) NULL,
	[RightChest] [decimal](18, 0) NULL,
	[RightMidaxilary] [decimal](18, 0) NULL,
	[RightSuprailiac] [decimal](18, 0) NULL,
	[RightAbdominal] [decimal](18, 0) NULL,
	[RightThigh] [decimal](18, 0) NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDateUTC] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Height] [decimal](18, 6) NOT NULL,
	[Bmr] [float] NOT NULL,
	[Bmi] [float] NOT NULL,
	[BodyFatPercentage] [float] NOT NULL,
	[IsGenerated] [bit] NOT NULL,
 CONSTRAINT [PK_MemberMeasurements] PRIMARY KEY CLUSTERED 
(
	[MemberMeasurementsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberMeasurements] ADD  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[MemberMeasurements] ADD  DEFAULT ((0)) FOR [Bmr]
GO
ALTER TABLE [dbo].[MemberMeasurements] ADD  DEFAULT ((0)) FOR [Bmi]
GO
ALTER TABLE [dbo].[MemberMeasurements] ADD  DEFAULT ((0)) FOR [BodyFatPercentage]
GO
ALTER TABLE [dbo].[MemberMeasurements] ADD  DEFAULT ((0)) FOR [IsGenerated]
GO
ALTER TABLE [dbo].[MemberMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_MemberMeasurements_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberMeasurements] CHECK CONSTRAINT [FK_MemberMeasurements_Members]
GO
ALTER TABLE [dbo].[MemberMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_MemberMeasurements_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberMeasurements] CHECK CONSTRAINT [FK_MemberMeasurements_Staff]
GO
ALTER TABLE [dbo].[MemberMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_MemberMeasurements_Staff1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberMeasurements] CHECK CONSTRAINT [FK_MemberMeasurements_Staff1]
GO
