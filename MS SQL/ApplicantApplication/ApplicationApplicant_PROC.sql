USE [Laptop2019]
GO

/****** Object:  StoredProcedure [dbo].[ApplicationApplicant_PROC]    Script Date: 12/11/2020 10:25:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER      PROCEDURE [dbo].[ApplicationApplicant_PROC] 
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


