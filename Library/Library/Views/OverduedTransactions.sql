CREATE VIEW [dbo].[OverduedTransactions]
AS
SELECT [dbo].[Readers].[FirstName], [dbo].[Readers].[LastName], [dbo].[Transactions].[RequiredReturnDate], [dbo].[Transactions].[ActualReturnDate] 
FROM [dbo].[Readers] 
INNER JOIN [dbo].[Transactions]
	ON [dbo].[Readers].ReaderId = [dbo].[Transactions].ReaderId 
WHERE
	[dbo].[Transactions].[ActualReturnDate] > [dbo].[Transactions].[RequiredReturnDate] 