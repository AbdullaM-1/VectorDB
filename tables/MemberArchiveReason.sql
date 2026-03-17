USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberArchiveReason](
	[MemberArchiveReasonId] [int] IDENTITY(1,1) NOT NULL,
	[archive_reason_id] [int] NOT NULL,
	[member_number] [varchar](20) NULL,
	[archive_reason_date] [smalldatetime] NOT NULL,
	[clear_overdues] [bit] NULL,
	[clear_payment_history] [bit] NULL,
	[clear_member_notes] [bit] NULL,
	[is_archived] [bit] NOT NULL,
	[AuthorizedBy] [nvarchar](50) NULL,
	[recent_status] [nvarchar](50) NULL,
	[Comments] [varchar](200) NULL,
	[ArchiveOnUtcDateTime] [datetime] NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsMemberRequest] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDateTimeUtc] [datetime] NULL,
	[IsCancelled] [bit] NOT NULL,
	[CancelledBy] [nvarchar](50) NULL,
	[CancelledDateTimeUtc] [datetime] NULL,
	[CreatedDateUtc] [datetime] NULL,
	[PerformedBy] [nvarchar](50) NULL,
	[CancelRevertReasonLookupId] [int] NULL,
 CONSTRAINT [PK_MemberArchiveReason_1] PRIMARY KEY CLUSTERED 
(
	[MemberArchiveReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberArchiveReason] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberArchiveReason] ADD  DEFAULT ((0)) FOR [IsMemberRequest]
GO
ALTER TABLE [dbo].[MemberArchiveReason] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[MemberArchiveReason] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[MemberArchiveReason]  WITH CHECK ADD  CONSTRAINT [FK_MemberArchiveReason_Lookup_Type_Items_CancelRevertReasonLookupId] FOREIGN KEY([CancelRevertReasonLookupId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[MemberArchiveReason] CHECK CONSTRAINT [FK_MemberArchiveReason_Lookup_Type_Items_CancelRevertReasonLookupId]
GO
ALTER TABLE [dbo].[MemberArchiveReason]  WITH CHECK ADD  CONSTRAINT [FK_MemberArchiveReason_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberArchiveReason] CHECK CONSTRAINT [FK_MemberArchiveReason_Members]
GO
