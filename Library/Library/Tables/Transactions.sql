CREATE TABLE [dbo].[Transactions]
(
	[TransactionId] INT NOT NULL PRIMARY KEY, 
	[ReaderId] INT NOT NULL, 
	[BookId] INT NOT NULL, 
	[IssueDate] DATE NOT NULL, 
	[RequiredReturnDate] DATE NOT NULL, 
	[ActualReturnDate] DATE NULL,
	CONSTRAINT FK_READER FOREIGN KEY ([ReaderId]) REFERENCES  [dbo].[Readers]([ReaderId]),
	CONSTRAINT FK_BOOK FOREIGN KEY ([BookId]) REFERENCES  [dbo].[Books]([BookId])
);
