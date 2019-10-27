CREATE VIEW [dbo].[IssuedBooks]
	AS SELECT [dbo].[Books].[BookId], [dbo].[Books].[Title], [dbo].[Books].[AuthorFirstName], 
			[dbo].[Books].[AuthorLastName], [dbo].[Readers].[FirstName], 
			[dbo].[Readers].[LastName], [dbo].[Transactions].[IssueDate], [dbo].[Transactions].[RequiredReturnDate]
		FROM [dbo].[Books] 
INNER JOIN
	[dbo].[Transactions] ON [dbo].[Books].[BookId] = [dbo].[Transactions].[BookId] 
INNER JOIN
	[dbo].[Readers] ON [dbo].[Transactions].[ReaderId] = [dbo].[Readers].[ReaderId]
WHERE [dbo].[Transactions].[ActualReturnDate] IS NULL
