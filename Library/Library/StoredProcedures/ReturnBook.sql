CREATE PROCEDURE [dbo].[ReturnBook](@TransactionId INT, @ActualReturnDate DATE)
AS 
BEGIN
	BEGIN TRY
		UPDATE dbo.Transactions
			SET ActualReturnDate = @ActualReturnDate
			WHERE TransactionId = @TransactionId
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