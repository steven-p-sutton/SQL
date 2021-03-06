USE [Laptop2019]
GO
/****** Object:  View [dbo].[No4_View]    Script Date: 12/11/2020 22:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--4. List mortgage application numbers for applications without associated applicants.

CREATE       VIEW [dbo].[No4_View]
AS

SELECT 
	AP.ID as 'ApplicationID'
	,AC.ID as 'ApplicantID'
FROM 
	[dbo].[Application] AP 
LEFT OUTER JOIN 
	[dbo].[Applicant] AC ON AP.ID = AC.ID

GO
