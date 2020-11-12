USE [Laptop2019]
GO

DECLARE @APPLICANT_ID UNIQUEIDENTIFIER
SET @APPLICANT_ID = NEWID();
DECLARE @APPLICATION_ID UNIQUEIDENTIFIER
SET @APPLICATION_ID = NEWID();

INSERT INTO [dbo].[ApplicationApplicant]
           ([applicationID]
           ,[applicantID]
           ,[notes])
     VALUES
           (@APPLICATION_ID
           ,@APPLICANT_ID 
           ,'a note')
GO

select * from [dbo].[ApplicationApplicant]


