USE [Laptop2019]
GO

/****** Object:  View [dbo].[No1_View]    Script Date: 12/11/2020 22:13:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- 1. Create normalized tables to contain the data and the relationship between applications and applicants.

CREATE OR ALTER     VIEW [dbo].[No1_View]
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


