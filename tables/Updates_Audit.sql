USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Updates_Audit](
	[update_id] [int] IDENTITY(1,1) NOT NULL,
	[update_username] [varchar](150) NOT NULL,
	[update_utcdatetime] [datetime] NOT NULL,
	[update_changesmade] [nvarchar](max) NOT NULL,
	[update_object] [nvarchar](400) NOT NULL,
	[update_objectid] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[update_id] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
