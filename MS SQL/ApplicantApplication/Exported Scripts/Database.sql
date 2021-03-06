USE [master]
GO
/****** Object:  Database [Laptop2019]    Script Date: 12/11/2020 22:24:04 ******/

CREATE DATABASE [Laptop2019]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Laptop2019', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Laptop2019.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Laptop2019_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Laptop2019_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Laptop2019] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laptop2019].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laptop2019] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laptop2019] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laptop2019] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laptop2019] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laptop2019] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laptop2019] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laptop2019] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laptop2019] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laptop2019] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laptop2019] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laptop2019] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laptop2019] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laptop2019] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laptop2019] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laptop2019] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Laptop2019] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laptop2019] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laptop2019] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laptop2019] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laptop2019] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laptop2019] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laptop2019] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laptop2019] SET RECOVERY FULL 
GO
ALTER DATABASE [Laptop2019] SET  MULTI_USER 
GO
ALTER DATABASE [Laptop2019] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laptop2019] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laptop2019] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laptop2019] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Laptop2019] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Laptop2019] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laptop2019', N'ON'
GO
ALTER DATABASE [Laptop2019] SET QUERY_STORE = OFF
GO
USE [Laptop2019]
GO
/****** Object:  User [login1]    Script Date: 12/11/2020 22:24:05 ******/
CREATE USER [login1] FOR LOGIN [login1] WITH DEFAULT_SCHEMA=[login1]
GO
/****** Object:  DatabaseRole [db_Login1]    Script Date: 12/11/2020 22:24:05 ******/
CREATE ROLE [db_Login1]
GO
ALTER ROLE [db_Login1] ADD MEMBER [login1]
GO
/****** Object:  Schema [login1]    Script Date: 12/11/2020 22:24:05 ******/
CREATE SCHEMA [login1]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 12/11/2020 22:24:05 ******/
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
	[completed] [bit] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant]    Script Date: 12/11/2020 22:24:05 ******/
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
/****** Object:  View [dbo].[ApplicationApplicantView]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SQL Question.

--You need to store information about mortgage applications and the applicants applying for the mortgages. 
--There is a many-to-many relationship between mortgage applications and applicants. A mortgage application 
--contains a unique mortgage application number, a loan amount and a flag to determine whether the mortgage 
--application has been accepted or not. An applicant has a first name and surname. You also need to be able 
--to store the date that an applicant was added to a mortgage application. Write the SQL needed to:

CREATE         VIEW [dbo].[ApplicationApplicantView]
AS

SELECT
	  '***' as 'Application'
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
	  ,AC.[completed]
	  ,'***' as 'Applicant'
      ,AP.[firstName]
      ,AP.[lastName]
      ,AP.[middleName]
      ,AP.[dateOfBirth]
      ,AP.[createTime] as 'AP CreateTime'
	  ,AP.[updateTime] as 'AP UpdateTime'
	  ,AP.[notes] as 'AP Notes'
FROM 
	  [dbo].[Application] AC
	  ,[dbo].[Applicant] AP
	--,[dbo].[ApplicationApplicant] AA
WHERE
	AC.ID = AP.applicationID
--AND AA.applicationID = AC.ID

GO
/****** Object:  View [dbo].[No1_View]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 1. Create normalized tables to contain the data and the relationship between applications and applicants.

CREATE       VIEW [dbo].[No1_View]
AS

SELECT
	  '***' as 'Application'
	  ,AC.[amount]
	  ,AC.[term]
      ,AC.[rate]
      ,AC.[createDate] as 'AC CreateDate'
      ,AC.[updateDate] as 'AC UpdateDate'
      ,AC.[notes] as 'AC Notes'
	  ,AC.[completed]
	  ,'***' as 'Applicant'
      ,AP.[firstName]
      ,AP.[lastName]
      ,AP.[middleName]
      ,AP.[dateOfBirth]
      ,AP.[createTime] as 'AP CreateTime'
	  ,AP.[updateTime] as 'AP UpdateTime'
	  ,AP.[notes] as 'AP Notes'
FROM 
	  [dbo].[Application] AC
	  ,[dbo].[Applicant] AP
WHERE
	AC.ID = AP.applicationID
GO
/****** Object:  View [dbo].[No2_View]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2. List the 10 applicants who were most recently added to mortgage applications.

CREATE         VIEW [dbo].[No2_View]
AS

SELECT TOP 10
	  '***' as 'Application'
	  ,AC.[amount]
	  ,AC.[term]
      ,AC.[rate]
      ,AC.[createDate] as 'AC CreateDate'
      ,AC.[updateDate] as 'AC UpdateDate'
      ,AC.[notes] as 'AC Notes'
	  ,AC.[completed]
	  ,'***' as 'Applicant'
      ,AP.[firstName]
      ,AP.[lastName]
      ,AP.[middleName]
      ,AP.[dateOfBirth]
      ,AP.[createTime] as 'AP CreateTime'
	  ,AP.[updateTime] as 'AP UpdateTime'
	  ,AP.[notes] as 'AP Notes'
FROM 
	  [dbo].[Application] AC
	  ,[dbo].[Applicant] AP
WHERE
	AC.ID = AP.applicationID
ORDER BY 
	AP.[createTime] DESC

GO
/****** Object:  View [dbo].[No3_View]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--3. List the number of applicants per mortgage application.

CREATE           VIEW [dbo].[No3_View]
AS

SELECT 
count(AP.ID) as 'Applicants'
,AP.applicationID

FROM 
	  [dbo].[Application] AC
	  ,[dbo].[Applicant] AP
WHERE
	AC.ID = AP.applicationID
GROUP BY
	AP.applicationID

GO
/****** Object:  View [dbo].[No4_View]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--4. List mortgage application numbers for applications without associated applicants.

CREATE       VIEW [dbo].[No4_View]
AS

SELECT 
	AP.ID as 'ApplicationID'
	,AC.ID as 'ApplicantID'
FROM 
	[dbo].[Application] AP 
LEFT OUTER JOIN 
	[dbo].[Applicant] AC ON AP.ID = AC.ID

GO
/****** Object:  Table [dbo].[ApplicationApplicant]    Script Date: 12/11/2020 22:24:05 ******/
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
/****** Object:  View [dbo].[No5_View]    Script Date: 12/11/2020 22:24:05 ******/
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
/****** Object:  Table [dbo].[DataTypes]    Script Date: 12/11/2020 22:24:05 ******/
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
/****** Object:  StoredProcedure [dbo].[ApplicationApplicant_PROC]    Script Date: 12/11/2020 22:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SQL Question.

--You need to store information about mortgage applications and the applicants applying for the mortgages. 
--There is a many-to-many relationship between mortgage applications and applicants. A mortgage application 
--contains a unique mortgage application number, a loan amount and a flag to determine whether the mortgage 
--application has been accepted or not. An applicant has a first name and surname. You also need to be able 
--to store the date that an applicant was added to a mortgage application. Write the SQL needed to:

--This proc currently adds an application and 2 applicants. One is linked to the application and the 
--other doesn't

CREATE            PROCEDURE [dbo].[ApplicationApplicant_PROC] 
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
           ,[notes]
		   ,[applicationID])
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
           ,@notesApplicant
		   ,@APPLICATION_ID)

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
           ,[notes]
		   ,[applicationID])
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
           ,@notesApplicant
		   --,@APPLICATION_ID)
		   ,null)

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
           ,[notes]
		   ,[completed])
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
           ,@notesApplication
		   ,0) -- not complete

-- Insert an ApplicatioApplicant row

--INSERT INTO [dbo].[ApplicationApplicant]
--           (
--		   [applicationID]
--           ,[applicantID]
--           ,[notes]
--		   ,[createDate]
--		   ,[updateDate])
--     VALUES
--           (
--		   @APPLICATION_ID
--           ,@APPLICANT_ID 
--           ,@notesApplicationApplicant
--		   ,convert(datetime,@dateTime,105)
--           ,convert(datetime,@dateTime,105))

--INSERT INTO [dbo].[ApplicationApplicant]
--           (
--		   [applicationID]
--           ,[applicantID]
--           ,[notes]
--		   ,[createDate]
--		   ,[updateDate])
--     VALUES
--           (
--		   @APPLICATION_ID
--           ,@APPLICANTX_ID 
--           ,@notesApplicationApplicant+'X'
--		   ,convert(datetime,@dateTime,105)
--           ,convert(datetime,@dateTime,105))
GO
USE [master]
GO
ALTER DATABASE [Laptop2019] SET  READ_WRITE 
GO
