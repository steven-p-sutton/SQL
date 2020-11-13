USE [Laptop2019]
GO

/****** Object:  View [dbo].[ApplicationApplicantView]    Script Date: 12/11/2020 22:14:39 ******/
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

CREATE OR ALTER       VIEW [dbo].[ApplicationApplicantView]
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


