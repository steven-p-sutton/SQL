USE [Laptop2019]
GO
/****** Object:  User [login1]    Script Date: 12/11/2020 10:33:44 ******/
CREATE USER [login1] FOR LOGIN [login1] WITH DEFAULT_SCHEMA=[login1]
GO
ALTER ROLE [db_Login1] ADD MEMBER [login1]
GO
