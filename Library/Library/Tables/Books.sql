CREATE TABLE [dbo].[Books]
(
	[BookId] INT NOT NULL PRIMARY KEY, 
	[Title] NVARCHAR(50) NOT NULL, 
	[AuthorFirstName] NVARCHAR(50) NOT NULL, 
	[AuthorLastName] NVARCHAR(50) NOT NULL, 
	[Publisher] NVARCHAR(50) NOT NULL, 
	[PublishingYear] INT NOT NULL
)
