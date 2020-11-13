USE [Laptop2019]
GO

/****** Object:  View [dbo].[No5_View]    Script Date: 12/11/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--5. List mortgage application numbers for applications with 2 applicants.

CREATE OR ALTER     VIEW [dbo].[No5_View]
AS

SELECT 
	AC.ID
	,count(AP.ID) as 'Applicants'
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
WHERE
	AC.ID = AP.applicationID
GROUP BY
	AC.ID
HAVING 
	count(AP.ID) = 2

GO


