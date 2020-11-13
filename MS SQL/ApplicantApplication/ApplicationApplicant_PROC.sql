USE [Laptop2019]
GO

/****** Object:  StoredProcedure [dbo].[ApplicationApplicant_PROC]    Script Date: 12/11/2020 22:15:54 ******/
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

CREATE OR ALTER          PROCEDURE [dbo].[ApplicationApplicant_PROC] 
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
DECLARE @APPLICANT1_ID UNIQUEIDENTIFIER
SET @APPLICANT1_ID = NEWID();
DECLARE @APPLICANT2_ID UNIQUEIDENTIFIER
SET @APPLICANT2_ID = NEWID();
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

-- Insert an Applicant row with the application

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
           (@APPLICANT1_ID
           ,@firstName+'_01'
           ,@lastName+'_01'
           ,@middleName
           ,convert(date,@dateOfBirth,105)
           ,@ADDRESS_ID
           ,@OTHER_ID
           ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105)
           ,@notesApplicant
		   ,@APPLICATION_ID)

-- Insert another Applicant row with the application

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
           (@APPLICANT2_ID
           ,@firstName+'_02'
           ,@lastName+'_02'
           ,@middleName
           ,convert(date,@dateOfBirth,105)
           ,@ADDRESS_ID
           ,@OTHER_ID
           ,convert(datetime,@dateTime,105)
           ,convert(datetime,@dateTime,105)
           ,@notesApplicant
		   ,@APPLICATION_ID)

-- Insert an Applicant row without the application

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
           ,@firstName+'_X'
           ,@lastName+'_X'
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


