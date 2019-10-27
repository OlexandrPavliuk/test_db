CREATE PROCEDURE [dbo].[IssueBook](@TransactionId INT, @ReaderId INT, @BookId INT, @IssueDate DATE, @RequiredReturnDate DATE)
AS 
BEGIN
	BEGIN TRY
		MERGE dbo.Transactions AS T
		USING (VALUES (@ReaderId, @BookId, @IssueDate, @RequiredReturnDate)) AS S(ReaderId, BookId, IssueDate, RequiredReturnDate)
         ON (T.ReaderId = S.ReaderId) AND 
		    (T.BookId = S.BookId) AND 
			(T.IssueDate = S.IssueDate) AND 
			(T.RequiredReturnDate = S.RequiredReturnDate)
     WHEN NOT MATCHED THEN
        INSERT (TransactionId, ReaderId, BookId, IssueDate, RequiredReturnDate, ActualReturnDate)
        VALUES (@TransactionId, S.ReaderId, S.BookId, S.IssueDate, S.RequiredReturnDate, NULL);
	END TRY

	BEGIN CATCH
		INSERT INTO dbo.DB_Errors
		VALUES
			(SUSER_SNAME(),
			 ERROR_NUMBER(),
			 ERROR_STATE(),
			 ERROR_SEVERITY(),
			 ERROR_LINE(),
			 ERROR_PROCEDURE(),
			 ERROR_MESSAGE(),
			 GETDATE());
	END CATCH	
END;
