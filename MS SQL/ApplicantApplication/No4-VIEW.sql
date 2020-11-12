USE [Laptop2019]
GO

/****** Object:  View [dbo].[No4_View]    Script Date: 12/11/2020 18:39:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--4. List mortgage application numbers for applications without associated applicants.

CREATE OR ALTER     VIEW [dbo].[No4_View]
AS

SELECT 
	AC.ID as 'ApplicationID'
	,AP.ID as 'ApplicantID'
FROM 
	[dbo].[Application] AC 
LEFT OUTER JOIN 
	[dbo].[Applicant] AP ON AC.ID = AP.ID

GO


