USE [Laptop2019]
GO
/****** Object:  Table [dbo].[ApplicationApplicant]    Script Date: 12/11/2020 22:25:35 ******/
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
