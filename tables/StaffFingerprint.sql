USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffFingerprint](
	[StaffId] [int] NOT NULL,
	[EnrollName] [varchar](100) NULL,
	[FingerIndex] [smallint] NOT NULL,
	[TmpData] [varchar](max) NULL,
	[Privilege] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Enabled] [varchar](50) NOT NULL,
	[Flag] [varchar](50) NULL,
 CONSTRAINT [PK_StaffFingerprint_1] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC,
	[FingerIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffFingerprint]  WITH CHECK ADD  CONSTRAINT [FK_StaffFingerprint_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffFingerprint] CHECK CONSTRAINT [FK_StaffFingerprint_Staff]
GO
