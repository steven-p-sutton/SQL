USE [Laptop2019]
GO

/****** Object:  View [dbo].[No4_View]    Script Date: 12/11/2020 10:24:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER     VIEW [dbo].[No4_View]
AS

SELECT 
	AA.applicationID

FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

AND AA.applicantID IS NULL


GO


