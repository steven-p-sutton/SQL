USE [Laptop2019]
GO

DECLARE @APPLICANT_ID UNIQUEIDENTIFIER
SET @APPLICANT_ID = NEWID();
DECLARE @ADDRESS_ID UNIQUEIDENTIFIER
SET @ADDRESS_ID = NEWID();
DECLARE @OTHER_ID UNIQUEIDENTIFIER
SET @OTHER_ID = NEWID();

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
GO

select * from [dbo].[Applicant]


