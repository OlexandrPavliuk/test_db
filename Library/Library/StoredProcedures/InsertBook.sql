CREATE PROCEDURE dbo.InsertBook(@BookId INT, @Title NVARCHAR(50), @AuthorFirstName NVARCHAR(50), @AuthorLastName NVARCHAR(50), @Publisher NVARCHAR(50), @PublishingYear INT)
AS
BEGIN
	BEGIN TRY
		MERGE dbo.Books AS T
		USING (VALUES (@Title, @AuthorFirstName, @AuthorLastName, @Publisher, @PublishingYear)) AS S(Title, AuthorFirstName, AuthorLastName, Publisher, PublishingYear)
			 ON (T.Title = S.Title) AND (T.AuthorFirstName = S.AuthorFirstName) 
			   AND (T.AuthorLastName = S.AuthorLastName) AND (T.Publisher = S.Publisher) AND (T.PublishingYear = S.PublishingYear)
		 WHEN NOT MATCHED THEN
			INSERT (BookId, Title, AuthorFirstName, AuthorLastName, Publisher, PublishingYear)
			VALUES (@BookId, S.Title, S.AuthorFirstName, S.AuthorLastName, S.Publisher, S.PublishingYear);
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
GO
