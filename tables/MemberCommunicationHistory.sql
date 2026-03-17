USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCommunicationHistory](
	[MemberCommunicationHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[CommunicationUTCDateTime] [datetime] NULL,
	[CommunicationType] [int] NULL,
	[CommunicationSentTo] [varchar](100) NULL,
	[RequestedBy] [varchar](200) NULL,
	[IsSuccessfullySent] [bit] NULL,
	[BatchID] [varchar](50) NULL,
	[MessageId] [varchar](50) NULL,
	[HasRead] [bit] NOT NULL,
	[AttachmentFileName] [varchar](500) NULL,
	[ContentType] [varchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[GatewayMessageId] [uniqueidentifier] NULL,
	[DeliveryUtcDateTime] [datetime] NULL,
	[BounceUtcDateTime] [datetime] NULL,
	[InitialOpenUtcDateTime] [datetime] NULL,
	[BounceReason] [varchar](200) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedOnUtc] [datetime] NULL,
	[SourceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberCommunicationHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberCommunicationHistory] ADD  DEFAULT ((1)) FOR [HasRead]
GO
ALTER TABLE [dbo].[MemberCommunicationHistory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
