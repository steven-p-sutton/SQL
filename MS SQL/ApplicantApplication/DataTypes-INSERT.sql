USE [Laptop2019]
GO

INSERT INTO [dbo].[DataTypes]
           ([id],
           [i],
		   [d],
		   [dt])
     VALUES
           (
			   NEWID(),
			   99,
			   convert(date,'18-06-12',5),
			   convert(datetime,'18-06-12 10:34:09 PM',5)
		   )
GO

select * from [dbo].[DataTypes]

