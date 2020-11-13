USE [Laptop2019]
GO

/****** Object:  View [dbo].[No6_View]    Script Date: 12/11/2020 23:14:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--6. In one SQL query, list all data. In other words, all mortgage applications data (whether or not they have
-- applicants), their related applicants’ data, and the date each applicant was added to the mortgage

CREATE OR ALTER   VIEW [dbo].[No6_View]
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

UNION

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
LEFT OUTER JOIN 
	[dbo].[Applicant] AP ON AC.ID = AP.ID

GO


