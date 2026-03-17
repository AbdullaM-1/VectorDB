USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFullClassSchedule](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
	[DateFull] [datetime] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentFullClassSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentFullClassSchedule] ADD  DEFAULT (getutcdate()) FOR [CreatedDateTimeUtc]
GO
ALTER TABLE [dbo].[StudentFullClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_StudentFullClassSchedule_StudentSwimClassBookingDetailId] FOREIGN KEY([StudentSwimClassBookingDetailId])
REFERENCES [dbo].[StudentSwimClassBookingDetail] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentFullClassSchedule] CHECK CONSTRAINT [FK_StudentFullClassSchedule_StudentSwimClassBookingDetailId]
GO
