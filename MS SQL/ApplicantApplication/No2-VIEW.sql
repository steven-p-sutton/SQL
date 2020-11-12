USE [Laptop2019]
GO

/****** Object:  View [dbo].[No2_View]    Script Date: 12/11/2020 22:12:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- 2. List the 10 applicants who were most recently added to mortgage applications.

CREATE OR ALTER       VIEW [dbo].[No2_View]
AS

SELECT TOP 10
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
ORDER BY 
	AP.[createTime] DESC

GO


