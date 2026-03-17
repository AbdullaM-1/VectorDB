USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConnections](
	[AppConnectionId] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[ConnectionId] [nvarchar](250) NOT NULL,
	[AppType] [nvarchar](50) NULL,
	[Data] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_AppConnections] PRIMARY KEY CLUSTERED 
(
	[AppConnectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppConnections] ADD  CONSTRAINT [DF_AppConnections_IsAppController]  DEFAULT ((0)) FOR [AppType]
GO
ALTER TABLE [dbo].[AppConnections] ADD  CONSTRAINT [DF_AppConnections_Created]  DEFAULT (getdate()) FOR [Created]
GO
