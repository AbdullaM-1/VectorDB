USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookupMasters](
	[lookup_id] [int] IDENTITY(1,1) NOT NULL,
	[lookup_code] [nvarchar](50) NULL,
	[lookup_name] [nvarchar](50) NOT NULL,
	[lookup_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lookup_Masters] PRIMARY KEY CLUSTERED 
(
	[lookup_name] ASC,
	[lookup_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
