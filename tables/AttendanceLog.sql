/*
================================================================================
SCHEMA SEMANTICS (indexed with this file for vector search — same text as the DDL below)
================================================================================
Table: dbo.AttendanceLog

SUMMARY FOR SEARCH AND DOCUMENTATION
The AttendanceLog table records each member attendance event at a club or account:
who (member number), where (account), how the swipe or check-in was sourced, door and
network context, and the member’s status at the time of the attempt.

COLUMN REFERENCE
sr_no is the table’s identity primary key (unique row for each attendance row).
enroll_number is the member number (links to Members.member_number).
verify_mode is technical access hardware metadata; ignore for high-level semantic Q&A.
in_out_mode is technical direction metadata; ignore for high-level semantic Q&A.
in_out_date is the date and time of the attendance event (when the visit was recorded).
work_code is operational metadata for access devices; ignore for semantic Q&A.
insert_status is ingest bookkeeping; ignore for semantic Q&A.
account_id is the foreign key to Accounts for the site or account where attendance occurred.
EventSource encodes how attendance was captured—for example: 99 Access denied;
-1 Unknown; 0 None; 1 Normal; 2 Fingerprint; 3 Barcode scanner; 4 Web; 5 Paxton;
6 Evolution; 7 Double scan; 8 MyClub app; 9 Mobile access; 10 Inception; 11 Integriti;
12 Prospect mobile access; 13 Duplicate scan; 14 Mobile access error; 20 OpenPath;
15 Facial recognition.
MemberStatus is the member’s status at the time of the attendance attempt.
Door is the name of the door or reader used for the event.
RequestIpAddress is the IP address that recorded the attendance (e.g. integrator or kiosk).
================================================================================
*/

USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceLog](
	[sr_no] [int] IDENTITY(1,1) NOT NULL,
	[enroll_number] [varchar](20) NOT NULL,
	[verify_mode] [int] NULL,
	[in_out_mode] [int] NULL,
	[in_out_date] [datetime] NOT NULL,
	[work_code] [int] NULL,
	[insert_status] [bit] NULL,
	[account_id] [int] NULL,
	[EventSource] [int] NULL,
	[MemberStatus] [nvarchar](50) NULL,
	[Door] [nvarchar](255) NULL,
	[RequestIpAddress] [varchar](50) NULL,
 CONSTRAINT [PK_AttendanceLog] PRIMARY KEY CLUSTERED 
(
	[sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLog_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AttendanceLog] CHECK CONSTRAINT [FK_AttendanceLog_Accounts]
GO
ALTER TABLE [dbo].[AttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLog_Members_MemberNumber] FOREIGN KEY([enroll_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[AttendanceLog] CHECK CONSTRAINT [FK_AttendanceLog_Members_MemberNumber]
GO
