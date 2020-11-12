USE [Laptop2019]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 12/11/2020 10:31:35 ******/
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
/****** Object:  Table [dbo].[Applicant]    Script Date: 12/11/2020 10:31:35 ******/
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
 CONSTRAINT [PK_Applicant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationApplicant]    Script Date: 12/11/2020 10:31:35 ******/
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
/****** Object:  View [dbo].[ApplicationApplicantView]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [dbo].[ApplicationApplicantView]
AS

SELECT '***' as 'Applicant'
      ,AP.[firstName]
      ,AP.[lastName]
      ,AP.[middleName]
      ,AP.[dateOfBirth]
      ,AP.[createTime] as 'AP CreateTime'
	  ,AP.[updateTime] as 'AP UpdateTime'
	  ,AP.[notes] as 'AP Notes'
	  ,'***' as 'Application'
	  ,AC.[amount]
	  ,AC.[term]
      ,AC.[rate]
      --,AC.[type]
      --,AC.[ownerID]
      --,AC.[orgID]
      --,AC.[otherID]
      ,AC.[createDate] as 'AC CreateDate'
      ,AC.[updateDate] as 'AC UpdateDate'
      ,AC.[notes] as 'AC Notes'
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

GO
/****** Object:  View [dbo].[No1_View]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[No1_View]
AS

SELECT 
	 AP.lastName
	,AP.firstName
	,AC.orgID
	,AC.ownerID
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

GO
/****** Object:  View [dbo].[No2_View]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [dbo].[No2_View]
AS

SELECT TOP 10
	 AP.lastName,
	 AC.createDate
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID
ORDER BY 
	 AC.createDate DESC
GO
/****** Object:  View [dbo].[No3_View]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       VIEW [dbo].[No3_View]
AS

SELECT 
count(AA.applicantID) as 'Applicants'
,AA.applicationID

FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID
GROUP BY
	AA.applicationID

GO
/****** Object:  View [dbo].[No4_View]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [dbo].[No4_View]
AS

SELECT 
	AA.applicationID

FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

AND AA.applicantID IS NULL


GO
/****** Object:  View [dbo].[No5_View]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[No5_View]
AS

SELECT 
	 AP.lastName
	,AP.firstName
	,AC.orgID
	,AC.ownerID
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

GO
/****** Object:  Table [dbo].[DataTypes]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataTypes](
	[id] [uniqueidentifier] NOT NULL,
	[i] [int] NULL,
	[d] [date] NULL,
 CONSTRAINT [PK_DataTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ApplicationApplicant_PROC]    Script Date: 12/11/2020 10:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE      PROCEDURE [dbo].[ApplicationApplicant_PROC] 
    @firstName nvarchar(50),   
    @middleName nvarchar(50), 
	@lastName nvarchar(50),  
	@dateOfBirth nvarchar(50) NULL,
	@notesApplicant nvarchar(50) NULL,
	@amount numeric(15, 5) NULL,
	@term int NULL,
	@rate numeric(10, 7) NULL,
	@notesApplication nvarchar(50) null,
	@notesApplicationApplicant nvarchar(50) null,
	@dateTime nvarchar(50)
AS 
DECLARE @APPLICANT_ID UNIQUEIDENTIFIER
SET @APPLICANT_ID = NEWID();
DECLARE @APPLICANTX_ID UNIQUEIDENTIFIER
SET @APPLICANTX_ID = NEWID();
DECLARE @APPLICATION_ID UNIQUEIDENTIFIER
SET @APPLICATION_ID = NEWID();
DECLARE @OTHER_ID UNIQUEIDENTIFIER
SET @OTHER_ID = NEWID();
DECLARE @ADDRESS_ID UNIQUEIDENTIFIER
SET @ADDRESS_ID = NEWID();
DECLARE @OWNER_ID UNIQUEIDENTIFIER
SET @OWNER_ID = NEWID();
DECLARE @TYPE_ID UNIQUEIDENTIFIER
SET @TYPE_ID = NEWID();
DECLARE @ORG_ID UNIQUEIDENTIFIER
SET @ORG_ID = NEWID();

-- Insert an Applicant row

INSERT INTO [dbo].[Applicant]
           ([ID]
           ,[firstName]
           ,[lastName]
           ,[middleName]
           ,[dateOfBirth]
           ,[addressID]
           ,[otherID]
           ,[createTime]
           ,[updateTime]
           ,[notes])
     VALUES
           (@APPLICANT_ID
           ,@firstName
           ,@lastName
           ,@middleName
           ,convert(date,@dateOfBirth,105)
           ,@ADDRESS_ID
           ,@OTHER_ID
           ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105)
           ,@notesApplicant)

INSERT INTO [dbo].[Applicant]
           ([ID]
           ,[firstName]
           ,[lastName]
           ,[middleName]
           ,[dateOfBirth]
           ,[addressID]
           ,[otherID]
           ,[createTime]
           ,[updateTime]
           ,[notes])
     VALUES
           (@APPLICANTX_ID
           ,@firstName+'X'
           ,@lastName+'X'
           ,@middleName
           ,convert(date,@dateOfBirth,105)
           ,@ADDRESS_ID
           ,@OTHER_ID
           ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105)
           ,@notesApplicant)

-- Insert an Application row

INSERT INTO [dbo].[Application]
           ([ID]
           ,[amount]
           ,[term]
           ,[rate]
           ,[type]
           ,[ownerID]
           ,[orgID]
           ,[otherID]
           ,[createDate]
           ,[updateDate]
           ,[notes])
     VALUES
           (@APPLICATION_ID
           ,@amount
           ,@term
           ,@rate
           ,@TYPE_ID
           ,@OWNER_ID
           ,@ORG_ID
           ,@OTHER_ID
           ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105)
           ,@notesApplication)

-- Insert an ApplicatioApplicant row

INSERT INTO [dbo].[ApplicationApplicant]
           (
		   [applicationID]
           ,[applicantID]
           ,[notes]
		   ,[createDate]
		   ,[updateDate])
     VALUES
           (
		   @APPLICATION_ID
           ,@APPLICANT_ID 
           ,@notesApplicationApplicant
		   ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105))

INSERT INTO [dbo].[ApplicationApplicant]
           (
		   [applicationID]
           ,[applicantID]
           ,[notes]
		   ,[createDate]
		   ,[updateDate])
     VALUES
           (
		   @APPLICATION_ID
           ,@APPLICANTX_ID 
           ,@notesApplicationApplicant+'X'
		   ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105))
GO
