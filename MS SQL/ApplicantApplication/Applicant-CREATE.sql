USE [Laptop2019]
GO

/****** Object:  Table [dbo].[Applicant]    Script Date: 12/11/2020 22:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applicant]') AND type in (N'U'))
DROP TABLE [dbo].[Applicant]
GO

/****** Object:  Table [dbo].[Applicant]    Script Date: 12/11/2020 22:19:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Applicant](
	[ID] [uniqueidentifier] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[middleName] [nvarchar](50) NULL,
	[dateOfBirth] [date] NOT NULL,
	[addressID] [uniqueidentifier] NULL,
	[otherID] [uniqueidentifier] NULL,
	[createTime] [datetime] NOT NULL,
	[updateTime] [datetime] NOT NULL,
	[notes] [nvarchar](2000) NULL,
	[applicationID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Applicant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


