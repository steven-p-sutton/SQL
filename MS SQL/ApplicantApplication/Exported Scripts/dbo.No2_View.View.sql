USE [Laptop2019]
GO
/****** Object:  View [dbo].[No2_View]    Script Date: 12/11/2020 10:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [dbo].[No2_View]
AS

SELECT TOP 10
	 AP.lastName,
	 AC.createDate
FROM 
	 [dbo].[Applicant] AP
	,[dbo].[Application] AC
	,[dbo].[ApplicationApplicant] AA
WHERE
	AP.ID = AA.applicantID
AND AA.applicationID = AC.ID
ORDER BY 
	 AC.createDate DESC
GO
