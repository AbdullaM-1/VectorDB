USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gateway_Audit](
	[audit_id] [bigint] IDENTITY(1,1) NOT NULL,
	[utc_date_time] [datetime] NOT NULL,
	[message_id] [varchar](50) NOT NULL,
	[raw_message] [varchar](max) NULL,
	[amount] [int] NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[message_type] [varchar](50) NOT NULL,
	[is_request] [bit] NOT NULL,
	[error_message] [text] NULL,
	[response_code] [varchar](5) NULL,
	[response_text] [varchar](150) NULL,
	[status_code] [varchar](5) NULL,
	[status_text] [varchar](150) NULL,
	[GatewayName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Gateway_Audit] PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gateway_Audit]  WITH CHECK ADD  CONSTRAINT [FK_Gateway_Audit_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[Gateway_Audit] CHECK CONSTRAINT [FK_Gateway_Audit_Members]
GO
