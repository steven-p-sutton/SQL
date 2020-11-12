USE [Laptop2019]
GO

-- Setup the unique Identifiers

DECLARE @APPLICANT_ID UNIQUEIDENTIFIER
SET @APPLICANT_ID = NEWID();
DECLARE @APPLICATION_ID UNIQUEIDENTIFIER
SET @APPLICATION_ID = NEWID();
DECLARE @ADDRESS_ID UNIQUEIDENTIFIER
SET @ADDRESS_ID = NEWID();
DECLARE @OWNER_ID UNIQUEIDENTIFIER
SET @OWNER_ID = NEWID();
DECLARE @TYPE_ID UNIQUEIDENTIFIER
SET @TYPE_ID = NEWID();
DECLARE @ORG_ID UNIQUEIDENTIFIER
SET @ORG_ID = NEWID();
DECLARE @OTHER_ID UNIQUEIDENTIFIER
SET @OTHER_ID = NEWID();

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
           ,'Steve'
           ,'Sutton'
           ,'Philip'
           ,convert(date,'17-03-17',5)
           ,@ADDRESS_ID
           ,@OTHER_ID
           ,convert(datetime,'18-06-12 10:34:09 PM',5)
           ,GETDATE()
           ,'a note')

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
           ,12345
           ,CONVERT(datetimeoffset, GETDATE())
           ,1.234
           ,@TYPE_ID
           ,@OWNER_ID
           ,@ORG_ID
           ,@OTHER_ID
           ,convert(datetime,'18-06-12 10:34:09 PM',5)
           ,GETDATE()
           ,'a note')

-- Insert an ApplicatioApplicant row

INSERT INTO [dbo].[ApplicationApplicant]
           ([applicationID]
           ,[applicantID]
           ,[notes])
     VALUES
           (@APPLICATION_ID
           ,@APPLICANT_ID 
           ,'a note')
GO