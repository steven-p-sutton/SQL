USE [Laptop2019]
GO

/****** Object:  Table [dbo].[Application]    Script Date: 12/11/2020 10:21:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Application]') AND type in (N'U'))
DROP TABLE [dbo].[Application]
GO

/****** Object:  Table [dbo].[Application]    Script Date: 12/11/2020 10:21:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Application](
	[ID] [uniqueidentifier] NOT NULL,
	[amount] [numeric](15, 5) NOT NULL,
	[term] [int] NOT NULL,
	[rate] [numeric](10, 7) NOT NULL,
	[type] [uniqueidentifier] NULL,
	[ownerID] [uniqueidentifier] NULL,
	[orgID] [uniqueidentifier] NULL,
	[otherID] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[notes] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


