USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAttendanceRestrictionMultiple](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberAttendanceRestrictionId] [int] NOT NULL,
	[AttendanceRestrictionTimeFrom] [time](7) NULL,
	[AttendanceRestrictionTimeUntil] [time](7) NULL,
	[AttendanceRestrictionDays] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedUtcDateTime] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MemberAttendanceRestrictionMultiple] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberAttendanceRestrictionMultiple] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberAttendanceRestrictionMultiple]  WITH CHECK ADD  CONSTRAINT [FK_MemberAttendanceRestrictionMultiple__MemberAttendanceRestriction_MemberAttendanceRestrictionId] FOREIGN KEY([MemberAttendanceRestrictionId])
REFERENCES [dbo].[MemberAttendanceRestriction] ([Id])
GO
ALTER TABLE [dbo].[MemberAttendanceRestrictionMultiple] CHECK CONSTRAINT [FK_MemberAttendanceRestrictionMultiple__MemberAttendanceRestriction_MemberAttendanceRestrictionId]
GO
