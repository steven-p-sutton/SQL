USE [Laptop2019]
GO

/****** Object:  View [dbo].[No3_View]    Script Date: 12/11/2020 10:24:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER       VIEW [dbo].[No3_View]
AS

SELECT 
count(AA.applicantID) as 'Applicants'
,AA.applicationID

FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID
GROUP BY
	AA.applicationID

GO


