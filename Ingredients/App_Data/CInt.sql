USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[CInt]    Script Date: 06/15/2012 15:33:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [fn].[CInt](	
	@var VARCHAR(MAX)
)
RETURNS INT
AS
BEGIN

	DECLARE @retval AS VARCHAR(MAX)
	SET @retval =''

	DECLARE @i int,  @iLast int, @char VARCHAR(1)
	SET @i = 1
	SET @iLast = 0

	WHILE @i < LEN(@var)+1
		BEGIN
			SET @char = SUBSTRING( @var, @i, 1 )
			IF ASCII ( @char ) >=48 AND ASCII ( @char ) <= 57  
			SET @retval = @retval + @char 

			SET @i = @i + 1
		END 


	RETURN CONVERT( INT, @retval ) 

END




GO

