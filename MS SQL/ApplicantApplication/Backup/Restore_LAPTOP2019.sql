USE [master]
BACKUP LOG [Laptop2019] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Laptop2019_LogBackup_2020-11-13_09-37-29.bak' WITH NOFORMAT, NOINIT,  NAME = N'Laptop2019_LogBackup_2020-11-13_09-37-29', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Laptop2019] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Laptop2019.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO


