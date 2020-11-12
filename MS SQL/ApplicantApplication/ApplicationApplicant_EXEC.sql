USE [Laptop2019]
GO

DECLARE @RC int
--DECLARE @firstName nvarchar(50)
--DECLARE @lastName nvarchar(50)
--DECLARE @middleName nvarchar(50)
--DECLARE @dateOfBirth nvarchar(50)
--DECLARE @notesApplicant nvarchar(50)
--DECLARE @amount numeric(15,5)
--DECLARE @term int
--DECLARE @rate numeric(10,7)
--DECLARE @notesApplication nvarchar(50)
--DECLARE @notesApplicationApplicant nvarchar(50)
--DECLARE @dateTime nvarchar(50)

EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve01'
  ,'Philip'
  ,'Sutton01'
  ,'01-03-1963'
  ,'Applicant notes'
  ,10000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'01-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve02'
  ,'Philip'
  ,'Sutton02'
  ,'02-03-1963'
  ,'Applicant notes'
  ,20000
  ,25
  ,1.234
  ,'Application notes'
  ,'Applicant notes'
  ,'02-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve03'
  ,'Philip'
  ,'Sutton03'
  ,'03-03-1963'
  ,'Applicant notes'
  ,300000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'03-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve04'
  ,'Philip'
  ,'Sutton04'
  ,'04-03-1963'
  ,'Applicant notes '
  ,400000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'04-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve05'
  ,'Philip'
  ,'Sutton05'
  ,'05-03-1963'
  ,'Applicant notes'
  ,500000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'05-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve06'
  ,'Philip'
  ,'Sutton06'
  ,'06-03-1963'
  ,'Applicant notes'
  ,600000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'06-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve07'
  ,'Philip'
  ,'Sutton07'
  ,'07-03-1963'
  ,'Applicant notes'
  ,700000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'07-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve08'
  ,'Philip'
  ,'Sutton08'
  ,'08-03-1963'
  ,'Applicant notes'
  ,800000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'08-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve09'
  ,'Philip'
  ,'Sutton09'
  ,'09-03-1963'
  ,'Applicant notes'
  ,900000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'09-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve10'
  ,'Philip'
  ,'Sutton10'
  ,'10-03-1963'
  ,'Applicant notes'
  ,1000000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'10-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve11'
  ,'Philip'
  ,'Sutton11'
  ,'11-03-1963'
  ,'Applicant notes'
  ,1100000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'11-11-2020'
EXECUTE @RC = [dbo].[ApplicationApplicant_PROC] 
   'Steve12'
  ,'Philip'
  ,'Sutton12'
  ,'12-03-1963'
  ,'Applicant notes'
  ,1200000
  ,25
  ,1.234
  ,'Application notes'
  ,'ApplicationApplicant notes'
  ,'12-11-2020'
GO

