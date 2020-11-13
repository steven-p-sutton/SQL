USE [Laptop2019]
GO

/****** Object:  View [dbo].[No3_View]    Script Date: 12/11/2020 22:11:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--3. List the number of applicants per mortgage application.

CREATE OR ALTER         VIEW [dbo].[No3_View]
AS

SELECT 
count(AP.ID) as 'Applicants'
,AP.applicationID

FROM 
	  [dbo].[Application] AC
	  ,[dbo].[Applicant] AP
WHERE
	AC.ID = AP.applicationID
GROUP BY
	AP.applicationID

GO


