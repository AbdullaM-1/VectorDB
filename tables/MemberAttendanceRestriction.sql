USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAttendanceRestriction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceRestrictionDays] [nvarchar](50) NULL,
	[AttendanceRestrictionZone] [int] NULL,
	[AttendanceRestrictionClub] [nvarchar](50) NULL,
	[AttendanceRestrictionName] [varchar](150) NULL,
	[AttendanceRestrictionDoors] [nvarchar](300) NULL,
 CONSTRAINT [PK_MemberAttendanceRestriction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
