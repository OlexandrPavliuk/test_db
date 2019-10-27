USE Library;

DROP SEQUENCE IF EXISTS dbo.BooksNumberSeq;

CREATE SEQUENCE dbo.BooksNumberSeq START WITH 1;
GO

declare @NextBookId INT = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'The seats of the mighty', N'Gilbert', N'Parker', N'Wilfrid Laurier University Press', 2015;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'Trust exercise', N'Susan', N'Choi', N'Wilfrid Laurier University Press', 2019;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'A Christmas carol', N'Charles', N'Dickens', N'HarperCollins Children''s Books', 2009;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'Great expectations', N'Charles', N'Dickens', N'Alfred A. Knopf', 1992;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId,  N'Far From the Madding Crowd', N'Thomas', N'Hardy', N'Penguin Classics', 2003;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'For whom the bell tolls', N'Ernest', N'Hemingway', N'Vintage', 2014;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'The seats of the mighty', N'Gilbert', N'Parker', N'Wilfrid Laurier University Press', 2015;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'Gone with the wind', N'Margaret', N'Mitchell', N'The Macmillan Company', 1936;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'A journey to the centre of the earth', N'Jules', N'Verne', N'Dodd, Mead', 1959;

SET @NextBookId = NEXT VALUE FOR dbo.BooksNumberSeq;
EXECUTE dbo.InsertBook @NextBookId, N'Vanity fair', N'William', N'Thackeray', N'Knopf', 1991;

GO

DROP SEQUENCE IF EXISTS dbo.ReaderNumberSeq;

CREATE SEQUENCE dbo.ReaderNumberSeq START WITH 1;

declare @ReaderId INT = NEXT VALUE FOR dbo.ReaderNumberSeq;
EXECUTE dbo.InsertReader @ReaderId, N'Cindy', N'Johnson', N'2388  Honeysuckle Lane', '360-601-0249';

SET @ReaderId = NEXT VALUE FOR dbo.ReaderNumberSeq;
EXECUTE dbo.InsertReader @ReaderId, N'Monika', N'Johnson', N'2136  Eagle Lane', NULL;

SET @ReaderId = NEXT VALUE FOR dbo.ReaderNumberSeq;
EXECUTE dbo.InsertReader @ReaderId, N'Justine', N'Fox', N'3504  Tori Lane', '801-514-1665';

SET @ReaderId = NEXT VALUE FOR dbo.ReaderNumberSeq;
EXECUTE dbo.InsertReader @ReaderId, N'Monika', N'Johnson', N'2136  Eagle Lane', NULL;

SET @ReaderId = NEXT VALUE FOR dbo.ReaderNumberSeq;
EXECUTE dbo.InsertReader @ReaderId, N'Pauline', N'Ramirez', N'4631  Hardman Road', '802-585-7512';

GO

DROP SEQUENCE IF EXISTS dbo.TransactionNumberSeq;

CREATE SEQUENCE dbo.TransactionNumberSeq START WITH 1;

DELETE FROM Transactions;

DECLARE @id1 INT = NEXT VALUE FOR dbo.TransactionNumberSeq;
DECLARE @IssueDate DATE = CONVERT(DATE, '01.09.2019', 104);
DECLARE @RequiredReturnDate DATE = CONVERT(DATE, '19.09.2019', 104);

EXECUTE dbo.IssueBook @id1, 1, 1, @IssueDate, @RequiredReturnDate;

DECLARE @id2 INT = NEXT VALUE FOR dbo.TransactionNumberSeq;
EXECUTE dbo.IssueBook @id2, 1, 3, @IssueDate, @RequiredReturnDate;

DECLARE @nextId INT = NEXT VALUE FOR dbo.TransactionNumberSeq;
SET @IssueDate = CONVERT(DATE, '05.09.2019', 104);
SET @RequiredReturnDate = CONVERT(DATE, '12.09.2019', 104);

EXECUTE dbo.IssueBook @nextId, 2, 4, @IssueDate, @RequiredReturnDate;

SET @nextId = NEXT VALUE FOR dbo.TransactionNumberSeq;
EXECUTE dbo.IssueBook @nextId, 2, 5, @IssueDate, @RequiredReturnDate;

DECLARE @ActualReturnDate DATE = CONVERT(DATE, '19.09.2019', 104);
EXECUTE dbo.ReturnBook @id1, @ActualReturnDate

SET @ActualReturnDate = CONVERT(DATE, '22.09.2019', 104);
EXECUTE dbo.ReturnBook @id2, @ActualReturnDate

GO
