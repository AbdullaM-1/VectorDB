USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorMemberSetting](
	[VendorMemberSettingId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[VendorCode] [varchar](50) NOT NULL,
	[SettingName] [varchar](100) NOT NULL,
	[SettingValue] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_VendorMemberSetting] PRIMARY KEY CLUSTERED 
(
	[VendorMemberSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[VendorMemberSetting]  WITH CHECK ADD  CONSTRAINT [FK_VendorMemberSetting_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[VendorMemberSetting] CHECK CONSTRAINT [FK_VendorMemberSetting_Members]
GO
