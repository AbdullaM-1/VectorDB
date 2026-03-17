USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroupClassSubscription](
	[MemberGroupClassSubscriptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[MaxNumberOfBookedClasses] [int] NOT NULL,
	[RemainingNumberofClasses] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[ClassDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberGroupClassSubscription] PRIMARY KEY CLUSTERED 
(
	[MemberGroupClassSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberGroupClassSubscription]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroupClassSubscription_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberGroupClassSubscription] CHECK CONSTRAINT [FK_MemberGroupClassSubscription_Members]
GO
