CREATE TABLE [dbo].[Readers]
(	
	[ReaderId] INT NOT NULL PRIMARY KEY, 
	[FirstName] NVARCHAR(50) NOT NULL, 
	[LastName] NVARCHAR(50) NOT NULL, 
	[Address] NVARCHAR(50) NOT NULL, 
	[Phone] NVARCHAR(50) NULL,	
)
