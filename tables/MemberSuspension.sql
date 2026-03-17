USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSuspension](
	[member_suspension_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[suspend_from_date] [smalldatetime] NOT NULL,
	[suspend_until_date] [smalldatetime] NULL,
	[suspension_reason_id] [int] NOT NULL,
	[UFN] [bit] NOT NULL,
	[DateCreatedUTCDateTime] [datetime] NULL,
	[OriginalNextInstallmentDate] [datetime] NULL,
	[SuspensionFee] [money] NULL,
	[PerformedBy] [nvarchar](100) NULL,
	[PreviousMemberStatus] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedUtcDateTime] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[IsMemberRequest] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDateTimeUtc] [datetime] NULL,
	[IsCancelled] [bit] NOT NULL,
	[CancelledBy] [nvarchar](50) NULL,
	[CancelledDateTimeUtc] [datetime] NULL,
	[CreatedDateUtc] [datetime] NULL,
	[SuspensionPaymentType] [int] NOT NULL,
	[OriginalMinTermDate] [datetime] NULL,
	[ModifiedDateUtc] [datetime] NULL,
 CONSTRAINT [PK_MemberSuspension] PRIMARY KEY CLUSTERED 
(
	[member_suspension_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  CONSTRAINT [DF_MemberSuspension_UFN]  DEFAULT ((0)) FOR [UFN]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  DEFAULT ((0)) FOR [IsMemberRequest]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[MemberSuspension] ADD  DEFAULT ((0)) FOR [SuspensionPaymentType]
GO
ALTER TABLE [dbo].[MemberSuspension]  WITH CHECK ADD  CONSTRAINT [FK_MemberSuspension_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberSuspension] CHECK CONSTRAINT [FK_MemberSuspension_Members]
GO
