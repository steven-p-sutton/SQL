/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Applicant]
      ,[firstName]
      ,[lastName]
      ,[middleName]
      ,[dateOfBirth]
      ,[AP CreateTime]
      ,[AP UpdateTime]
      ,[AP Notes]
      ,[Application]
      ,[amount]
      ,[term]
      ,[rate]
      ,[AC CreateDate]
      ,[AC UpdateDate]
      ,[AC Notes]
  FROM [Laptop2019].[dbo].[ApplicationApplicantView]
  ORDER BY
	[AC CreateDate] DESC