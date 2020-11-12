USE [Laptop2019]
GO

/****** Object:  View [dbo].[No5_View]    Script Date: 12/11/2020 10:25:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   VIEW [dbo].[No5_View]
AS

SELECT 
	 AP.lastName
	,AP.firstName
	,AC.orgID
	,AC.ownerID
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID

GO

