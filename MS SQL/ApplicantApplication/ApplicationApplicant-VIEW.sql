USE [Laptop2019]
GO

/****** Object:  View [dbo].[ApplicationApplicantView]    Script Date: 12/11/2020 10:23:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER     VIEW [dbo].[ApplicationApplicantView]
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


