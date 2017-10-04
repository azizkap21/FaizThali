USE [FMBThaliGroup]
GO

/****** Object:  Table [dbo].[ThaliGroups]    Script Date: 18/09/2017 18:53:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ThaliGroups](
	[GroupId] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[GroupNameHash] [bigint] NOT NULL,
	[AdditionalInfo] [nvarchar](max) NULL,
	[MemberCount] [int] NULL,
	[WhatsappNo] [varchar](20) NULL,
	[Town] [nvarchar](100) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[GroupNameHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ThaliGroups] ADD  CONSTRAINT [DF_ThaliGroups_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[ThaliGroups] ADD  CONSTRAINT [DF_ThaliGroups_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO

/*==============================================================================================================================================================*/

/****** Object:  Table [dbo].[UserAccountStatuses]    Script Date: 18/09/2017 18:55:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserAccountStatuses](
	[UserStatusId] [int] NOT NULL,
	[StatusDisplay] [varchar](50) NOT NULL,
	[StatusCode] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StatusDisplay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*===============================================================================================================================================*/
/****** Object:  Table [dbo].[GroupMembers]    Script Date: 18/09/2017 18:51:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GroupMembers](
	[MemberId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[NameHash] [bigint] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Town] [varchar](100) NOT NULL,
	[PostCode] [varchar](12) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NameHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[GroupMembers] ADD  CONSTRAINT [DF_GroupMembers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[GroupMembers] ADD  CONSTRAINT [DF_GroupMembers_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO

ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD  CONSTRAINT [FK_ThaliGroups_GroupMembers] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ThaliGroups] ([GroupId])
GO

ALTER TABLE [dbo].[GroupMembers] CHECK CONSTRAINT [FK_ThaliGroups_GroupMembers]
GO

USE [FMBThaliGroup]
GO

/****** Object:  Table [dbo].[ThaliBookings]    Script Date: 18/09/2017 18:51:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*===============================================================================================================================================*/

CREATE TABLE [dbo].[ThaliBookings](
	[ThaliBookingId] [uniqueidentifier] NOT NULL,
	[ThaliId] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[NumberOfThalis] [tinyint] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThaliBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ThaliBookings] ADD  CONSTRAINT [DF_ThaliBookings_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[ThaliBookings] ADD  CONSTRAINT [DF_ThaliBookings_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO

ALTER TABLE [dbo].[ThaliBookings]  WITH CHECK ADD  CONSTRAINT [FK_GroupMembers_ThaliBookings] FOREIGN KEY([MemberId])
REFERENCES [dbo].[GroupMembers] ([MemberId])
GO

ALTER TABLE [dbo].[ThaliBookings] CHECK CONSTRAINT [FK_GroupMembers_ThaliBookings]
GO

/*===============================================================================================================================================*/

/****** Object:  Table [dbo].[ThaliMemberPreferredDays]    Script Date: 18/09/2017 18:54:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ThaliMemberPreferredDays](
	[ThaliMemberPreferredDayId] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[PreferredDay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThaliMemberPreferredDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ThaliMemberPreferredDays]  WITH CHECK ADD  CONSTRAINT [FK_GroupMembers_ThaliMemberPreferredDays] FOREIGN KEY([MemberId])
REFERENCES [dbo].[GroupMembers] ([MemberId])
GO

ALTER TABLE [dbo].[ThaliMemberPreferredDays] CHECK CONSTRAINT [FK_GroupMembers_ThaliMemberPreferredDays]
GO

/*===============================================================================================================================================*/
/****** Object:  Table [dbo].[ThaliTurns]    Script Date: 18/09/2017 18:55:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ThaliTurns](
	[ThaliId] [uniqueidentifier] NOT NULL,
	[ThaliDate] [datetime] NOT NULL,
	[Menu] [nvarchar](500) NULL,
	[MemberId] [uniqueidentifier] NULL,
	[Taken] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ThaliId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ThaliTurns]  WITH CHECK ADD  CONSTRAINT [FK_GroupMembers_ThaliTurns] FOREIGN KEY([MemberId])
REFERENCES [dbo].[GroupMembers] ([MemberId])
GO

ALTER TABLE [dbo].[ThaliTurns] CHECK CONSTRAINT [FK_GroupMembers_ThaliTurns]
GO



/*===============================================================================================================================================*/

/****** Object:  Table [dbo].[UserAccounts]    Script Date: 18/09/2017 18:56:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserAccounts](
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserNameHash] [bigint] NOT NULL,
	[MemberId] [uniqueidentifier] NULL,
	[Password] [nvarchar](20) NOT NULL,
	[LastAccessedOn] [datetime] NULL,
	[AccountStatus] [int] NOT NULL,
	[PhoneNo] [varchar](30) NOT NULL,
	[EmailId] [varchar](300) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK__UserAcco__DA6C709AC1A71B34] PRIMARY KEY CLUSTERED 
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserNameHash] UNIQUE NONCLUSTERED 
(
	[UserNameHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[UserAccounts] ADD  CONSTRAINT [DF_UserAccounts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[UserAccounts] ADD  CONSTRAINT [DF_UserAccounts_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO

ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_GroupMembers_UserAccounts] FOREIGN KEY([MemberId])
REFERENCES [dbo].[GroupMembers] ([MemberId])
GO

ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_GroupMembers_UserAccounts]
GO

ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccountStatuses_UserAccounts] FOREIGN KEY([AccountStatus])
REFERENCES [dbo].[UserAccountStatuses] ([UserStatusId])
GO

ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccountStatuses_UserAccounts]
GO


/*===============================================================================================================================================*/