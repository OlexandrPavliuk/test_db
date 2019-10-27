CREATE PROCEDURE dbo.InsertReader(@ReaderId INT, @FirstName NVARCHAR(50), @LastName NVARCHAR(50), @Address NVARCHAR(50), @Phone NVARCHAR(50))
AS
BEGIN
	BEGIN TRY
		MERGE dbo.Readers AS T
		USING (VALUES (@FirstName, @LastName, @Address, @Phone)) AS S(FirstName, LastName, Address, Phone)
			 ON (T.FirstName = S.FirstName) AND 
				(T.LastName = S.LastName) AND 
				(T.Address = S.Address) AND 
				((T.Phone = S.Phone) OR ((T.Phone IS NULL) AND (S.Phone IS NULL)))
		 WHEN NOT MATCHED THEN
			INSERT (ReaderId, FirstName, LastName, Address, Phone)
			VALUES (@ReaderId, S.FirstName, S.LastName, S.Address, S.Phone);
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