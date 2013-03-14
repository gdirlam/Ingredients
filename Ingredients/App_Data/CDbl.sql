USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[CDbl]    Script Date: 06/15/2012 17:26:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [fn].[CDbl](	
	@var VARCHAR(MAX)
)
RETURNS FLOAT
AS
BEGIN

	DECLARE @retval AS VARCHAR(MAX)
	SET @retval =''

	DECLARE @i int,  @iLast int, @char VARCHAR(1), @dec BIT
	SET @dec = 0
	SET @i = 1
	SET @iLast = 0
	
	WHILE @i < LEN(@var)+1
		BEGIN
			SET @char = SUBSTRING( @var, @i, 1 )
			IF ASCII ( @char ) >=48 AND ASCII ( @char ) <= 57  
			SET @retval = @retval + @char 

			IF  ASCII ( @char ) = 46 AND @dec = 0
			BEGIN
				SET @retval = @retval + @char 
				SET @dec =1
			END 

			SET @i = @i + 1
		END 


	RETURN CONVERT( FLOAT, @retval ) 

END





GO

