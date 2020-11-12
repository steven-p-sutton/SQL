USE [Laptop2019]
GO

/****** Object:  Table [dbo].[ApplicationApplicant]    Script Date: 12/11/2020 10:21:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationApplicant]') AND type in (N'U'))
DROP TABLE [dbo].[ApplicationApplicant]
GO

/****** Object:  Table [dbo].[ApplicationApplicant]    Script Date: 12/11/2020 10:21:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationApplicant](
	[applicationID] [uniqueidentifier] NULL,
	[applicantID] [uniqueidentifier] NULL,
	[notes] [nvarchar](max) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


